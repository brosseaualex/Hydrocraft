--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-----------------------------------------------------------------------
--                          FARMING MOD                              --
--                      CODE BY ROBERT JOHNSON                       --
--                       TEXTURES BY THUZTOR                         --
-----------------------------------------------------------------------
--                          OFFICIAL TOPIC                           --
--  http://www.theindiestone.com/community/viewtopic.php?f=33&t=8675 --
--                                                                   --
-----------------------------------------------------------------------

if isClient() then return end

require "Map/SGlobalObjectSystem"

SFarmingSystem = SGlobalObjectSystem:derive("SFarmingSystem")

function SFarmingSystem:new()
	local o = SGlobalObjectSystem.new(self, "farming")

	 -- The value of this may have been read from gos_farming.bin already.
	o.hoursElapsed = o.hoursElapsed or 0

	o.hourElapsedForWater = 0
	o.previousHourHealth = 0

	local gameTime = GameTime:getInstance()
	local sec = math.floor(gameTime:getTimeOfDay() * 3600)
	o.previousHour = math.floor(sec / 3600)

	return o
end

function SFarmingSystem:initSystem()
	SGlobalObjectSystem.initSystem(self)

	-- Specify GlobalObjectSystem fields that should be saved.
	self.system:setModDataKeys({'hoursElapsed'})
	
	-- Specify GlobalObject fields that should be saved.
	self.system:setObjectModDataKeys({
		'state', 'nbOfGrow', 'typeOfSeed', 'fertilizer', 'mildewLvl',
		'aphidLvl', 'fliesLvl', 'waterLvl', 'waterNeeded', 'waterNeededMax',
		'lastWaterHour', 'nextGrowing', 'hasSeed', 'hasVegetable',
		'health', 'badCare', 'exterior', 'spriteName', 'objectName'})

	self:convertOldModData()
end

function SFarmingSystem:getInitialStateForClient()
	return { hoursElapsed = self.hoursElapsed }
end

function SFarmingSystem:newLuaObject(globalObject)
	return SPlantGlobalObject:new(self, globalObject)
end

function SFarmingSystem:isValidModData(modData)
	return modData and modData.state and modData.nbOfGrow and modData.health
end

function SFarmingSystem:isValidIsoObject(isoObject)
	return isoObject:hasModData() and self:isValidModData(isoObject:getModData())
end

-- Take plant data previously stored in GameTime.getModData() and put it into
-- the new GlobalObjectSystem.
function SFarmingSystem:convertOldModData()
	-- If the gos_xxx.bin file existed, don't touch GameTime modData in case mods are using it.
	if self.system:loadedWorldVersion() ~= -1 then return end
	
	local modData = GameTime:getInstance():getModData()
	if modData.farming and modData.farming.plants then
		self:noise('converting old-style GameTime modData')
		for _,plant in pairs(modData.farming.plants) do
			if not self.system:getObjectAt(plant.x, plant.y, plant.z) then
				local globalObject = self.system:newObject(plant.x, plant.y, plant.z)
				for k,v in pairs(plant) do
					globalObject:getModData()[k] = v
				end
			end
		end
		modData.farming.plants = nil
		for k,v in pairs(modData.farming) do
			noise("copied "..tostring(k).."="..tostring(v))
			self[k] = v
		end
		modData.farming = nil
		self:noise('converted '..self.system:getObjectCount()..' plants')
	end
end

function SFarmingSystem:OnClientCommand(command, playerObj, args)
	SFarmingSystemCommands[command](playerObj, args)
end

function SFarmingSystem:EveryTenMinutes()
	local sec = math.floor(getGameTime():getTimeOfDay() * 3600)
	local currentHour = math.floor(sec / 3600)
	local day = getGameTime():getDay()
	-- an hour has passed
	if currentHour ~= self.previousHour then
		self.hoursElapsed = self.hoursElapsed + 1
		self.previousHour = currentHour
		self.hourElapsedForWater = self.hourElapsedForWater + 1
		-- every 2 hours, we lover the water lvl of all plant by 1
		-- we also gonna up our disease lvl
		local hourForWater = 5;
		if SandboxVars.PlantResilience == 1 then -- very high
			hourForWater = 12;
		elseif SandboxVars.PlantResilience == 2 then -- high
			hourForWater = 8;
		elseif SandboxVars.PlantResilience == 4 then -- low
			hourForWater = 3;
		elseif SandboxVars.PlantResilience == 5 then -- very low
			hourForWater = 2;
		end
		if self.hourElapsedForWater >= hourForWater then
			self:lowerWaterLvlAndUpDisease()
			self.hourElapsedForWater = 0
		end
		-- change health of the plant every 3 hours
		self.previousHourHealth = self.previousHourHealth + 1
		if self.previousHourHealth == 2 then
			self:changeHealth()
			self.previousHourHealth = 0
		end
		self:sendCommand('hoursElapsed', { hoursElapsed = self.hoursElapsed })
	end
--[[
	-- a day as passed, maybe npc will water the plant for us
	if self.currentDay ~= day then
		self.currentDay = day
--		self:automateNpc()
	end
]]--
	self:checkPlant()
end

function SFarmingSystem:lowerWaterLvlAndUpDisease()
	for i=1,self:getLuaObjectCount() do
		local luaObject = self:getLuaObjectByIndex(i)
		luaObject:lowerWaterLvl()
		luaObject:upDisease()
	end
end

-- up or low the health of our plant, depending on weather, if they are well watered, etc.
function SFarmingSystem:changeHealth()
	for i=1,self:getLuaObjectCount() do
		local luaObject = self:getLuaObjectByIndex(i)
		-- change with weather
		local weather = getWorld():getWeather()
		if "sunny" == weather then -- if it's sunny
			if luaObject.exterior then
				luaObject.health = luaObject.health + 1
			else
				luaObject.health = luaObject.health + 0.25
			end
		end
		-- lower health if temperature is not high
		if season.currentTemp <= 10 then
			luaObject.health = luaObject.health - 0.25;
		end
		-- change with water
		local water = farming_vegetableconf.calcWater(luaObject.waterNeeded, luaObject.waterLvl)
		local waterMax = farming_vegetableconf.calcWater(luaObject.waterLvl, luaObject.waterNeededMax)
		if water >= 0 and waterMax >= 0 then
			luaObject.health = luaObject.health + 0.4
		elseif water == -1 then -- we low health by 0.2
			luaObject.health = luaObject.health - 0.2
		elseif water == -2 then -- low health by 0.5
			luaObject.health = luaObject.health - 0.5
		elseif waterMax == -1 and luaObject.health > 20  then
			luaObject.health = luaObject.health - 0.2
		elseif waterMax == -2 and luaObject.health > 20  then
			luaObject.health = luaObject.health - 0.5
		end
	end
end

function SFarmingSystem:checkPlant()
	for i=1,self:getLuaObjectCount() do
		local luaObject = self:getLuaObjectByIndex(i)
		local square = luaObject:getSquare()
		if square then luaObject.exterior = square:isOutside() end
		-- we may destroy our plant if someone walk onto it
		self:destroyOnWalk(luaObject)
		-- Something can grow up !
		if luaObject.nextGrowing ~= nil then
			if self.hoursElapsed >= luaObject.nextGrowing then
				self:growPlant(luaObject, nil, true)
			end
		end
		-- if the plant still alive
		if luaObject.state ~= "plow" and luaObject:isAlive() then
			-- check the last water hour of all our plant, if it's more than 76 hours the plant start to lose health
			-- if it's raining we up a little the water lvl of the plant
			if RainManager.isRaining() then
				if luaObject.exterior then
					luaObject.waterLvl = luaObject.waterLvl + 3
					if luaObject.waterLvl > 100 then
						luaObject.waterLvl = 100
					end
					luaObject.lastWaterHour = self.hoursElapsed
				end
			-- if it's sunny, we lower a bit our water lvl
			elseif season.weather == "sunny" then
				luaObject.waterLvl = luaObject.waterLvl - 0.1
				if luaObject.waterLvl < 0 then
					luaObject.waterLvl = 0
				end
			end
		end
		-- add the icon if we have the required farming xp and if we're close enough of the plant
		luaObject:addIcon()
		luaObject:checkStat()
		luaObject:saveData()
	end
end

-- grow the plant
function SFarmingSystem:growPlant(luaObject, nextGrowing, updateNbOfGrow)
	if(luaObject.state == "seeded") then
		local new = luaObject.nbOfGrow <= 0

		if(luaObject.typeOfSeed == "Carrots") then
			luaObject = farming_vegetableconf.growCarrots(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Broccoli") then
			luaObject = farming_vegetableconf.growBroccoli(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Strawberry plant") then
			luaObject = farming_vegetableconf.growStrewberries(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Radishes") then
			luaObject = farming_vegetableconf.growRedRadish(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Tomato") then
			luaObject = farming_vegetableconf.growTomato(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Potatoes") then
			luaObject = farming_vegetableconf.growPotato(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Cabbages") then
			luaObject = farming_vegetableconf.growCabbage(luaObject, nextGrowing, updateNbOfGrow)			
		-- Hydrocraft Seeds			
		elseif(luaObject.typeOfSeed == "Corn") then
			luaObject = HCfarming_vegetableconf.growCorn(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Leek") then
			luaObject = HCfarming_vegetableconf.growLeek(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Lettuce") then
			luaObject = HCfarming_vegetableconf.growLettuce(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Onion") then
			luaObject = HCfarming_vegetableconf.growOnion(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Peanut") then
			luaObject = HCfarming_vegetableconf.growPeanut(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Pumpkin") then
			luaObject = HCfarming_vegetableconf.growPumpkin(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Watermelon") then
			luaObject = HCfarming_vegetableconf.growWatermelon(luaObject, nextGrowing, updateNbOfGrow)			
		elseif(luaObject.typeOfSeed == "Zucchini") then
			luaObject = HCfarming_vegetableconf.growZucchini(luaObject, nextGrowing, updateNbOfGrow)
		end
		
		-- maybe this plant gonna be disease
		if not new and luaObject.nbOfGrow > 0 then
			self:diseaseThis(luaObject, true)
		end
		luaObject.nbOfGrow = luaObject.nbOfGrow + 1
	end
end

function SFarmingSystem:harvest(luaObject, player)
	local props = farming_vegetableconf.props[luaObject.typeOfSeed]
	local numberOfVeg = getVegetablesNumber(props.minVeg, props.maxVeg, props.minVegAutorized, props.maxVegAutorized, luaObject)
	if player then
		player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg })
	end

	if luaObject.hasSeed and player then
		player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) })
	end

	luaObject.hasVegetable = false
	luaObject.hasSeed = false

	-- the strawberrie don't disapear, it goes on phase 2 again
	if luaObject.typeOfSeed == "Strawberry plant" then
		luaObject.nbOfGrow = 1
		self:growPlant(luaObject, nil, true)
		luaObject:saveData()
	else
		self:removePlant(luaObject)
	end
end

-- test if the plant gonna be disease
function SFarmingSystem:diseaseThis(luaObject, checkClosePlant)
	-- if we don't already have mildew
	if(luaObject.mildewLvl == 0) then
		luaObject:mildew()
	end
	if(luaObject.aphidLvl == 0) then
		luaObject:aphid()
	end
	if(luaObject.fliesLvl == 0) then
		luaObject:flies()
	end
	if(checkClosePlant ==  true) then
		-- we gonna check all the plant near this one, if one is infected, maybe this one would be infected too !
		self:diseaseClosePlant(luaObject)
	end
end

-- fetch all the plant near our current disease plant, so maybe they gonna have a disease too
function SFarmingSystem:diseaseClosePlant(luaObject)
	local adjacent = self.system:getObjectsAdjacentTo(luaObject.x, luaObject.y, luaObject.z)
	for i=1,adjacent:size() do
		local luaObject2 = adjacent:get(i-1):getModData()
		-- a close plant is infected
		if luaObject2.aphidLvl > 0 or luaObject2.mildewLvl > 0 then
			-- we gonna re check if our plant can be infected
			self:diseaseThis(luaObject, false)
		end
	end
	-- This returns the ArrayList to a pool for reuse.  There's no harm if
	-- you forget to call it.
	self.system:finishedWithList(adjacent)
end

-- if zombie or npc walk over your plant, you have 1 to 10 risk that your plant is destroyed
function SFarmingSystem:destroyOnWalk(luaObject)
	local square = luaObject:getSquare()
	if not square then return end
	if luaObject.state == "plow" or luaObject.state == "destroy" then return end
	-- if zombie walk on our plant !
	for i=1,square:getMovingObjects():size() do
		local movingObject = square:getMovingObjects():get(i-1)
		if instanceof(movingObject, "IsoZombie") then
			-- too bad ! :)
			if ZombRand(11) == 5 then
				luaObject:destroyThis()
			end
		end
	end
end

-- get the health of the new plant depending on the moon
function SFarmingSystem:getHealth()
	-- it's better to plant seed during ascending phase of the moon
	if season.moonCycle >= 4 and season.moonCycle < 18 then -- ascending moon health between 47 and 53
		return ZombRand(47, 54)
	elseif season.moonCycle >= 18 and season.moonCycle <= 21 then -- full moon, the best ! health between 57 and 64
		return ZombRand(57, 64)
	else -- descending moon, the worst, health between 37 and 44
		return ZombRand(37, 44)
	end
end

-- plow the land
function SFarmingSystem:plow(square)
	self:removeTallGrass(square)
	local luaObject = self:newLuaObjectOnSquare(square)
	luaObject:initNew()
	luaObject.exterior = square:isOutside()
	luaObject:addObject()
	self:noise('plowed '..luaObject.x..','..luaObject.y)
	self:noise("#plants="..self:getLuaObjectCount())
end

function SFarmingSystem:removePlant(luaObject)
	if not luaObject or luaObject.luaSystem ~= self then return end
	-- This calls removeLuaObject(luaObject) as a side effect of the OnObjectAboutToBeRemoved event
	luaObject:removeObject()
--	FarmingSystem.instance:removeLuaObject(plant)
end

function SFarmingSystem:removeTallGrass(sq)
	-- remove vegetation
	for i=sq:getObjects():size(),1,-1 do
		o = sq:getObjects():get(i-1)
		-- FIXME: blends_grassoverlays tiles should have 'vegitation' flag
		if o:getSprite() and (
				o:getSprite():getProperties():Is(IsoFlagType.canBeRemoved) or
				(o:getSprite():getProperties():Is(IsoFlagType.vegitation) and o:getType() ~= IsoObjectType.tree) or
				(o:getSprite():getName() and luautils.stringStarts(o:getSprite():getName(), "blends_grassoverlays"))) then
			sq:transmitRemoveItemFromSquare(o)
		end
	end
end

function SFarmingSystem:receiveCommand(playerObj, command, args)
	SFarmingSystemCommands[command](playerObj, args)
end

SGlobalObjectSystem.RegisterSystemClass(SFarmingSystem)

local function EveryTenMinutes()
	SFarmingSystem.instance:EveryTenMinutes()
end

Events.EveryTenMinutes.Add(EveryTenMinutes)

