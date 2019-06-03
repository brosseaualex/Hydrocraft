-----------------------------------------------------------------------
--                          FARMING MOD                              --
--                      CODE BY ROBERT JOHNSON                       --
--                       TEXTURES BY THUZTOR                         --
-----------------------------------------------------------------------
--                          OFFICIAL TOPIC                           --
--  http://www.theindiestone.com/community/viewtopic.php?f=33&t=8675 --
--                                                                   --
-----------------------------------------------------------------------

basicFarming = {}
basicFarming.previousHour = 0
basicFarming.hourElapsedForWater = 0
basicFarming.hoursElapsed = 1
basicFarming.modData = nil
basicFarming.plantings = {}
basicFarming.previousHourHealth = 0
basicFarming.npcFarmingSkill = -1

basicFarming.wantNoise = getDebug()
local noise = function(msg)
	if (basicFarming.wantNoise) then print('farming: '..msg) end
end
basicFarming.noise = noise

function basicFarming.isPlantObject(object)
	if not object then return false end
	if object:hasModData() and basicFarming.isValidModData(object:getModData()) then
		return true
	end
	return false
end

function basicFarming.findPlantObject(square)
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i)
		if basicFarming.isPlantObject(object) then
			return object
		end
	end
	return nil
end

function basicFarming.getPlantAt(x,y,z)
	if isClient() then return nil end
	for iCur,vCur in pairs(basicFarming.plantings) do
		if vCur.x == x and vCur.y == y and vCur.z == z then
			return vCur
		end
	end
	return nil
end

function basicFarming.getPlantOnSquare(square)
	if square == nil then return nil end
	return basicFarming.getPlantAt(square:getX(), square:getY(), square:getZ())
end

function basicFarming.getCurrentPlanting(square)
	if square == nil then return nil end
	if isClient() then
		local object = basicFarming.findPlantObject(square)
		if object then
			-- Client doesn't have a list of plants, just make a new one each time
			-- FIXME: FarmingInfo needs to update itself as the plant changes, this doesn't change
			local plant = ISPlant:new(square:getX(), square:getY(), square:getZ())
			plant:fromObject(object)
			return plant
		end
		return nil
	end
	return basicFarming.getPlantAt(square:getX(), square:getY(), square:getZ())
end

function basicFarming.removePlant(plant)
	if not plant then return end
	plant:removeObject()
	for i=1,#basicFarming.plantings do
		if basicFarming.plantings[i] == plant then
			table.remove(basicFarming.plantings, i)
			break
		end
	end
	for i=1,#basicFarming.modData.farming.plants do
		local data = basicFarming.modData.farming.plants[i]
		if data.x == plant.x and data.y == plant.y and data.z == plant.z then
			table.remove(basicFarming.modData.farming.plants, i)
			break
		end
	end
	noise("#plantings="..#basicFarming.plantings)
	noise("#plants="..#basicFarming.modData.farming.plants)
--	sendServerCommand('farming', 'removePlant', { x = plant.x, y = plant.y, z = plant.z })
end

-- fertilize the plant, more than 4 doses and your plant die ! (no mercy !)
function basicFarming.fertilize(fertilizer, plant)
	if plant.state ~= "plow" and plant:isAlive() then
		if plant.fertilizer < 4  then
			plant.fertilizer = plant.fertilizer + 1
			plant.nextGrowing = plant.nextGrowing - 20
			if plant.nextGrowing < 1 then
				plant.nextGrowing = 1
			end
		else -- too much fertilizer and our plant die !
			basicFarming.rottenThis(plant)
		end
		basicFarming.saveData(plant)
	end
end

-- if zombie or npc walk over your plant, you have 1 to 10 risk that your plant is destroyed
function basicFarming.destroyOnWalk(plant)
	if not plant:getSquare() then
		return
	end
	-- if zombie walk on our plant !
	for i, v in pairs(plant:getSquare():getLuaMovingObjectList()) do
		if (plant.state ~= "plow" and plant.state ~= "destroy" and (v:getObjectName() == "Zombie" or v:getObjectName() == "Survivor")) then
			-- too bad ! :)
			if(ZombRand(11) == 5) then
				basicFarming.destroyThis(plant)
			end
		end
	end
end

-- destroy the plant (someone walked on it :))
function basicFarming.destroyThis(plant)
	-- tomato has different smashed tile
	if plant.typeOfSeed == "Tomato" then
		plant:setSpriteName("vegetation_farming_01_14")
	else
		plant:setSpriteName("vegetation_farming_01_13")
	end
	plant.state = "destroy"
	plant:setObjectName(farming_vegetableconf.getObjectName(plant))
	basicFarming.deadPlant(plant)
	basicFarming.saveData(plant)
end

function basicFarming.isValidModData(modData)
	if modData.state and modData.nbOfGrow and modData.health then return true end
	return false
end

function basicFarming.removeModData(prefix, modData)
	local keys = {}
	for k,v in pairs(modData) do
		if luautils.stringStarts(k, prefix) then
			noise('removing "'..k..'" from modData')
			table.insert(keys, k)
		end
	end
	for _,k in pairs(keys) do
		modData[k] = nil
	end
end

function basicFarming.removeSquareModData(square)
	local datas = square:getModData()
	datas["state"] = nil
	datas["nbOfGrow"] = nil
	datas["typeOfSeed"] = nil
	datas["id"] = nil
	datas["waterLvl"] = nil
	datas["lastWaterHour"] = nil
	datas["waterNeeded"] = nil
	datas["waterNeededMax"] = nil
	datas["mildewLvl"] = nil
	datas["aphidLvl"] = nil
	datas["nextGrowing"] = nil
	datas["fliesLvl"] = nil
	datas["fertilizer"] = nil
	datas["hasVegetable"] = nil
	datas["hasSeed"] = nil
	datas["health"] = nil
	datas["badCare"] = nil
	datas["state"] = nil
	datas["hoursElapsed"] = nil
end

-- add some seed on our plowed land
function basicFarming.seed(typeOfSeed, planting)
	-- will set the first growing state for the type of seed
	planting.nbOfGrow = 0
	planting.state = "seeded"
	planting.typeOfSeed = typeOfSeed
	-- You have 48 hours to water your plant, if not, she will be dry
	planting.lastWaterHour = basicFarming.hoursElapsed
	planting.waterNeeded = 0
	basicFarming.growPlant(planting, nil, true)
	basicFarming.saveData(planting)
end

-- grow the plant
function basicFarming.growPlant(planting, nextGrowing, updateNbOfGrow)
	if(planting.state == "seeded") then
		local new = planting.nbOfGrow <= 0
		if(planting.typeOfSeed == "Carrots") then
			planting = farming_vegetableconf.growCarrots(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Corn") then
			planting = farming_vegetableconf.growCorn(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Broccoli") then
			planting = farming_vegetableconf.growBroccoli(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Leek") then
			planting = farming_vegetableconf.growLeek(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Lettuce") then
			planting = farming_vegetableconf.growLettuce(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Onion") then
			planting = farming_vegetableconf.growOnion(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Peanut") then
			planting = farming_vegetableconf.growPeanut(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Strawberry plant") then
			planting = farming_vegetableconf.growStrewberries(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Radishes") then
			planting = farming_vegetableconf.growRedRadish(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Tomato") then
			planting = farming_vegetableconf.growTomato(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Potatoes") then
			planting = farming_vegetableconf.growPotato(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Cabbages") then
			planting = farming_vegetableconf.growCabbage(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Pumpkin") then
			planting = farming_vegetableconf.growPumpkin(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Watermelon") then
			planting = farming_vegetableconf.growWatermelon(planting, nextGrowing, updateNbOfGrow)
		elseif(planting.typeOfSeed == "Zucchini") then
			planting = farming_vegetableconf.growZucchini(planting, nextGrowing, updateNbOfGrow)
		end
		-- maybe this plant gonna be disease
		if not new and planting.nbOfGrow > 0 then
			basicFarming.diseaseThis(planting, true)
		end
		planting.nbOfGrow = planting.nbOfGrow + 1
--		saveData(planting)
	end
end

function basicFarming.harvest(plant, player)
	local props = farming_vegetableconf.props[plant.typeOfSeed]
	local numberOfVeg = getVegetablesNumber(props.minVeg, props.maxVeg, props.minVegAutorized, props.maxVegAutorized, plant)
	if player then
		player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg })
	end

	if plant.hasSeed and player then
		player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) })
	end

	plant.hasVegetable = false
	plant.hasSeed = false

	-- the strawberrie don't disapear, it goes on phase 2 again
	if plant.typeOfSeed == "Strawberry plant" then
		plant.nbOfGrow = 1
		basicFarming.growPlant(plant, nil, true)
	else
        basicFarming.removePlant(plant)
	end
end

-- test if the plant gonna be disease
function basicFarming.diseaseThis(plant, checkClosePlant)
	-- if we don't already have mildew
	if(plant.mildewLvl == 0) then
		basicFarming.mildew(plant)
	end
	if(plant.aphidLvl == 0) then
		basicFarming.aphid(plant)
	end
	if(plant.fliesLvl == 0) then
		basicFarming.flies(plant)
	end
	if(checkClosePlant ==  true) then
		-- we gonna check all the plant near this one, if one is infected, maybe this one would be infected too !
		basicFarming.diseaseClosePlant(plant)
	end
end

-- fetch all the plant near our current disease plant, so maybe they gonna have a disease too
function basicFarming.diseaseClosePlant(plant)
	for iDis,vDis in pairs(basicFarming.plantings) do
		local dist = IsoUtils.DistanceManhatten(vDis.x + 0.5, vDis.y + 0.5, plant.x + 0.5, plant.y + 0.5)
		-- a close plant is infected
		if(vDis.aphidLvl > 0 or vDis.mildewLvl > 0 and dist ~= 0 and dist <= 2) then
			-- we gonna re check if our plant can be infected
			basicFarming.diseaseThis(plant, false)
		end
	end
end

-- if the plant doesn't have mildew, maybe it will have it !
-- base risk for mildew is 2%, but every pt of water below the required water lvl add 1% risk
function basicFarming.mildew(plant)
	local mildewNumber = 2
	local waterBelow = plant.waterNeeded - plant.waterLvl
	-- our plant is well watered
	if(waterBelow <= 0) then
		waterBelow = 0
	end
	mildewNumber = mildewNumber + waterBelow
    if SandboxVars.PlantResilience == 1 then -- very high
        mildewNumber = mildewNumber - 8;
    elseif SandboxVars.PlantResilience == 2 then -- high
        mildewNumber = mildewNumber - 4;
    elseif SandboxVars.PlantResilience == 4 then -- low
        mildewNumber = mildewNumber + 4;
    elseif SandboxVars.PlantResilience == 5 then -- very low
        mildewNumber = mildewNumber + 8;
    end
    if mildewNumber < 0 then
        mildewNumber = 0;
    end
	-- random !
	local mildewRisk = ZombRand(mildewNumber, 101)
	-- you got mildew !
	if(mildewRisk == 99) then
		plant.mildewLvl = 1
	end
end

-- if the plant doesn't have aphid, maybe it will have it !
-- base risk for aphid is 2%, but every pt of water below the required water lvl add 1% risk
function basicFarming.aphid(plant)
	local aphidNumber = 2
	local waterBelow = plant.waterNeeded - plant.waterLvl
	-- our plant is well watered
	if(waterBelow <= 0) then
		waterBelow = 0
	end
	aphidNumber = aphidNumber + waterBelow
    if SandboxVars.PlantResilience == 1 then -- very high
        aphidNumber = aphidNumber - 8;
    elseif SandboxVars.PlantResilience == 2 then -- high
        aphidNumber = aphidNumber - 4;
    elseif SandboxVars.PlantResilience == 4 then -- low
        aphidNumber = aphidNumber + 4;
    elseif SandboxVars.PlantResilience == 5 then -- very low
        aphidNumber = aphidNumber + 8;
    end
    if aphidNumber < 0 then
        aphidNumber = 0;
    end
	-- random !
	-- I have to set 101 to the max, don't know why but the zombRand never take the last digit (ex, between 5 and 10, you'll never have 10...)
	local aphidRisk = ZombRand(aphidNumber, 101)
	-- you got aphid !
	if(aphidRisk == 99) then
		plant.aphidLvl = 1
	end
end

-- if the plant doesn't have flies, maybe it will have it !
-- base risk for flies is 2%, but every pt of water below the required water lvl add 1% risk
function basicFarming.flies(plant)
	local fliesNumber = 2
	local waterBelow = plant.waterNeeded - plant.waterLvl
	-- our plant is well watered
	if(waterBelow <= 0) then
		waterBelow = 0
	end
	fliesNumber = fliesNumber + waterBelow
    if SandboxVars.PlantResilience == 1 then -- very high
        fliesNumber = fliesNumber - 8;
    elseif SandboxVars.PlantResilience == 2 then -- high
        fliesNumber = fliesNumber - 4;
    elseif SandboxVars.PlantResilience == 4 then -- low
        fliesNumber = fliesNumber + 4;
    elseif SandboxVars.PlantResilience == 5 then -- very low
        fliesNumber = fliesNumber + 8;
    end
    if fliesNumber < 0 then
        fliesNumber = 0;
    end
	-- random !
	-- I have to set 101 to the max, don't know why but the zombRand never take the last digit (ex, between 5 and 10, you'll never have 10...)
	local fliesRisk = ZombRand(fliesNumber, 101)
	-- you got flies !
	if(fliesRisk == 99) then
		plant.fliesLvl = 1
	end
end

-- add icon on each plant so it's easy to find wich one need water, or has disease, etc.
-- you'll need to have at least 5 farmings pts to see this, and be close to the plant
function basicFarming.addIcon(plant)
end

function basicFarming.removePlantIcons(plant)
end

function basicFarming.EveryTenMinutes()
    if isClient() then return end
	local sec = math.floor(getGameTime():getTimeOfDay() * 3600)
	local currentHour = math.floor(sec / 3600)
	local day = getGameTime():getDay()
	-- an hour as passed
	if currentHour ~= basicFarming.previousHour then
		basicFarming.hoursElapsed = basicFarming.hoursElapsed + 1
		basicFarming.modData["hoursElapsed"] = basicFarming.hoursElapsed
		basicFarming.previousHour = currentHour
		basicFarming.hourElapsedForWater = basicFarming.hourElapsedForWater + 1
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

		if basicFarming.hourElapsedForWater >= hourForWater then
			basicFarming.lowerWaterLvlAndUpDisease()
			basicFarming.hourElapsedForWater = 0
		end
		-- change health of the plant every 3 hours
		basicFarming.previousHourHealth = basicFarming.previousHourHealth + 1
		if basicFarming.previousHourHealth == 2 then
			basicFarming.changeHealth()
			basicFarming.previousHourHealth = 0
		end
		sendServerCommand('farming', 'hoursElapsed', { hoursElapsed = basicFarming.hoursElapsed })
	end
	-- a day as passed, maybe npc will water the plant for us
	if basicFarming.currentDay ~= day then
		basicFarming.currentDay = day
		basicFarming.modData["currentDay"] = day
--		basicFarming.automateNpc()
	end
	basicFarming.checkPlant()
end

function basicFarming.lowerWaterLvlAndUpDisease()
	for iPlant,vPlant in pairs(basicFarming.plantings) do
		basicFarming.lowerWaterLvl(vPlant)
		basicFarming.upDisease(vPlant)
--        saveData(vPlant)
	end
end

-- up or low the health of our plant, depending on weather, if they are well watered, etc.
function basicFarming.changeHealth()
	for iPlant,vPlant in pairs(basicFarming.plantings) do
		-- change with weather
		local weather = getWorld():getWeather()
		if "sunny" == weather then -- if it's sunny
			if vPlant.exterior then
				vPlant.health = vPlant.health + 1
			else
				vPlant.health = vPlant.health + 0.25
			end
        end
        -- lower health if temperature is not high
        if season.currentTemp <= 10 then
            vPlant.health = vPlant.health - 0.25;
        end
		-- change with water
		local water = farming_vegetableconf.calcWater(vPlant.waterNeeded, vPlant.waterLvl)
		local waterMax = farming_vegetableconf.calcWater(vPlant.waterLvl, vPlant.waterNeededMax)
		if water >= 0 and waterMax >= 0 then
			vPlant.health = vPlant.health + 0.4
		elseif water == -1 then -- we low health by 0.2
			vPlant.health = vPlant.health - 0.2
		elseif water == -2 then -- low health by 0.5
			vPlant.health = vPlant.health - 0.5
		elseif waterMax == -1 and vPlant.health > 20  then
			vPlant.health = vPlant.health - 0.2
		elseif waterMax == -2 and vPlant.health > 20  then
			vPlant.health = vPlant.health - 0.5
		end
--		saveData(vPlant)
	end
end

-- up the disease by a number, it's the double if your plant is not well watered
function basicFarming.upDisease(plant)
	-- mildew lvl up by 1 or 0.5 if your plant is well watered
	if plant.mildewLvl ~= nil and plant.mildewLvl > 0 then
		local water = farming_vegetableconf.calcWater(plant.waterNeeded, plant.waterLvl)
		if(water >= 0) then
			plant.mildewLvl = plant.mildewLvl + 0.5
		else
			plant.mildewLvl = plant.mildewLvl + 1
		end
		plant.mildewLvl = math.min(plant.mildewLvl, 100)
--		basicFarming.playerData["planting:" .. plant.id .. ":mildewLvl"] = plant.mildewLvl
	end
	-- flies lvl up by 1 or 0.5 if your plant is well watered
	if plant.fliesLvl ~= nil and plant.fliesLvl > 0 then
		local water = farming_vegetableconf.calcWater(plant.waterNeeded, plant.waterLvl)
		if(water >= 0) then
			plant.fliesLvl = plant.fliesLvl + 0.5
		else
			plant.fliesLvl = plant.fliesLvl + 1
		end
		plant.fliesLvl = math.min(plant.fliesLvl, 100)
--		basicFarming.playerData["planting:" .. plant.id .. ":fliesLvl"] = plant.fliesLvl
	end
	-- aphid is different than mildew, you'll have to deshydrate your plant to lower the aphid lvl
	if plant.aphidLvl ~= nil and plant.aphidLvl > 0 then
		local water = farming_vegetableconf.calcWater(plant.waterNeeded, plant.waterLvl)
		if water == -1 or water == -2 then
			plant.aphidLvl = plant.aphidLvl - 2
			if plant.aphidLvl < 0 then
				plant.aphidLvl = 0
			end
		else
			plant.aphidLvl = plant.aphidLvl + 1
			plant.aphidLvl = math.min(plant.aphidLvl, 100)
		end
--		basicFarming.playerData["planting:" .. plant.id .. ":aphidLvl"] = plant.aphidLvl
	end
end

-- lower by 1 the waterLvl of all our plant
function basicFarming.lowerWaterLvl(plant)
	if plant.waterLvl ~= nil then
		-- flies make water dry more quickly, every 10 pts of flies, water lower by 1 more pts
		local waterFliesChanger = math.floor(plant.fliesLvl / 10)
		plant.waterLvl = plant.waterLvl - 1 - waterFliesChanger
		if plant.waterLvl < 0 then
			plant.waterLvl = 0
		end
--		basicFarming.playerData["planting:" .. plant.id .. ":waterLvl"] = plant.waterLvl
	end
end

-- if we add mildew spray
function basicFarming.cureMildew(plant, mildewCureSource, uses)
	for i=1,uses do
			if mildewCureSource then
				mildewCureSource:Use()
			end
			plant.mildewLvl = plant.mildewLvl - 5
			if plant.mildewLvl < 0 then
				plant.mildewLvl = 0
			end
	end
	basicFarming.saveData(plant)
end

-- if we add insecticide spray
function basicFarming.cureFlies(plant, fliesCureSource, uses)
	for i=1,uses do
			if fliesCureSource then
				fliesCureSource:Use()
			end
			plant.fliesLvl = plant.fliesLvl - 5
			if plant.fliesLvl < 0 then
				plant.fliesLvl = 0
			end
	end
	basicFarming.saveData(plant)
end

-- if we water our plant
-- we gonna add 5 water lvl for the plant for each use of the water source
function basicFarming.water(plant, waterSource, uses)
	for i=1,uses do
		if(plant.waterLvl < 100) then
			if waterSource then
				if waterSource:getUsedDelta() > 0 then
					waterSource:Use()
				end
			end
			plant.waterLvl = plant.waterLvl + 5
			if(plant.waterLvl > 100) then
				plant.waterLvl = 100
			end
		end
	end
	-- we notice the hour of our last water, because if we don't water the plant every 48 hours, she die
	plant.lastWaterHour = basicFarming.hoursElapsed;
	basicFarming.saveData(plant)
end

function basicFarming.checkPlant()
	for iPlant,vPlant in pairs(basicFarming.plantings) do
		local square = vPlant:getSquare()
		if square then vPlant.exterior = square:isOutside() end
--		if vPlant.waterNeededMax == 0 or (vPlant.waterNeededMax == nil and vPlant.nbOfGrow > 0 and farming_vegetableconf.props[vPlant.typeOfSeed].waterLvlMax) then
--			vPlant.waterNeededMax = farming_vegetableconf.props[vPlant.typeOfSeed].waterLvlMax -- bug fix
--			noise('RESET waterNeededMax '..vPlant.typeOfSeed..' '..tostring(vPlant.waterNeededMax))
--		end
		-- we may destroy our plant if someone walk onto it
		basicFarming.destroyOnWalk(vPlant)
		-- Something can grow up !
		if vPlant.nextGrowing ~= nil then
			if basicFarming.hoursElapsed >= vPlant.nextGrowing then
				basicFarming.growPlant(vPlant, nil, true)
			end
		end
		-- if the plant still alive
		if vPlant.state ~= "plow" and vPlant:isAlive() then
			-- check the last water hour of all our plant, if it's more than 76 hours the plant start to lose health
--			if vPlant.lastWaterHour ~= nil and basicFarming.hoursElapsed - vPlant.lastWaterHour >= 76 then
--				vPlant.health = vPlant.health - 0.2
--			end
			-- if it's raining we up a little the water lvl of the plant
			if RainManager.isRaining() then
				if vPlant.exterior then
					vPlant.waterLvl = vPlant.waterLvl + 3
					if vPlant.waterLvl > 100 then
						vPlant.waterLvl = 100
					end
					vPlant.lastWaterHour = basicFarming.hoursElapsed
				end
			-- if it's sunny, we lower a bit our water lvl
			elseif season.weather == "sunny" then
				vPlant.waterLvl = vPlant.waterLvl - 0.1
				if vPlant.waterLvl < 0 then
					vPlant.waterLvl = 0
				end
			end
		end
		-- add the icon if we have the required farming xp and if we're close enough of the plant
		basicFarming.addIcon(vPlant)
		basicFarming.checkStat(vPlant)
--        if vPlant.gridSquare then
--            vPlant.gridSquare:transmitModdata()
--        end
		basicFarming.saveData(vPlant)
	end
end

-- check the stat to make them ok (if water < 0 we set it to 0 for example)
-- if health < 0 the plant is dead (dry)
function basicFarming.checkStat(plant)
	if plant.state ~= "plow" and plant.nbOfGrow > 1 then
		if plant.waterLvl <= 0 then
			basicFarming.dryThis(plant)
		elseif plant.waterLvl > 100 then
			plant.waterLvl = 100
		end
		if plant.health <= 0 then
			basicFarming.dryThis(plant)
		end
	end
	if plant.waterLvl < 0 then
		plant.waterLvl = 0
	end
	if plant.health < 0 then
		plant.health = 0
	elseif plant.health > 100 then
		plant.health = 100
	end
end

-- make the plant dry (no more water !)
function basicFarming.dryThis(plant)
	if plant.typeOfSeed == "Tomato" then
		plant:setSpriteName("vegetation_farming_01_6")
	elseif plant.typeOfSeed == "Leek" then
		plant:setSpriteName("FarmoidTiles02_15")
	elseif plant.typeOfSeed == "Lettuce" then
		plant:setSpriteName("FarmoidTiles02_23")
	elseif plant.typeOfSeed == "Onion" then
		plant:setSpriteName("FarmoidTiles02_7")
	elseif plant.typeOfSeed == "Peanut" then
		plant:setSpriteName("FarmoidTiles02_31")
	elseif plant.typeOfSeed == "Pumpkin" then
		plant:setSpriteName("FarmoidTiles01_15")
	elseif plant.typeOfSeed == "Watermelon" then
		plant:setSpriteName("FarmoidTiles01_31")
	elseif plant.typeOfSeed == "Zucchini" then
		plant:setSpriteName("FarmoidTiles01_23")
	elseif plant.typeOfSeed == "Corn" then
		plant:setSpriteName("vegetation_farming_01_79")
	else
		plant:setSpriteName("vegetation_farming_01_5")
	end
	plant.state = "dry"
	plant:setObjectName(farming_vegetableconf.getObjectName(plant))
	basicFarming.deadPlant(plant)
end

function basicFarming.deadPlant(plant)
	plant.nextGrowing = 0
	plant.waterLvl = 0
	plant.nbOfGrow = 0
	plant.mildewLvl = 0
	plant.aphidLvl = 0
	plant.fliesLvl = 0
	plant.health = 0
end

function basicFarming.removeTallGrass(sq)
	-- remove vegetation
	for i=sq:getObjects():size(),1,-1 do
		o = sq:getObjects():get(i-1)
		-- FIXME: blends_grassoverlays tiles should have 'vegitation' flag
		if o:getSprite() and (
				o:getSprite():getProperties():Is(IsoFlagType.canBeRemoved) or
				(o:getSprite():getProperties():Is(IsoFlagType.vegitation) and o:getType() ~= IsoObjectType.tree) or
				(o:getSprite():getName() and luautils.stringStarts(o:getSprite():getName(), "blends_grassoverlays"))) then
			sq:transmitRemoveItemFromSquare(o)
			sq:RemoveTileObject(o)
		end
	end
end

-- plow the land
function basicFarming.plow(square)
	basicFarming.removeTallGrass(square)
	local plant = ISPlant:new(square:getX(), square:getY(), square:getZ())
	plant.exterior = square:isOutside()
	plant:addObject()
	table.insert(basicFarming.plantings, plant)
	local modData = {}
	plant:toModData(modData)
	modData.x = plant.x
	modData.y = plant.y
	modData.z = plant.z
	table.insert(basicFarming.modData.farming.plants, modData)
	plant.modData = modData
	noise('plowed '..plant.x..','..plant.y)
	noise("#plantings="..#basicFarming.plantings)
	noise("#plants="..#basicFarming.modData.farming.plants)
end

-- get the health of the new plant depending on the moon
function basicFarming.getHealth()
	-- it's better to plant seed during ascending phase of the moon
	if season.moonCycle >= 4 and season.moonCycle < 18 then -- ascending moon health between 47 and 53
		return ZombRand(47, 54)
	elseif season.moonCycle >= 18 and season.moonCycle <= 21 then -- full moon, the best ! health between 57 and 64
		return ZombRand(57, 64)
	else -- descending moon, the worst, health between 37 and 44
		return ZombRand(37, 44)
	end
end

function basicFarming.rottenThis(plant)
	local texture = nil
	if(plant.typeOfSeed == "Carrots") then
		texture = "vegetation_farming_01_13"
	elseif plant.typeOfSeed == "Corn" then
		texture = "vegetation_farming_01_79"
	elseif(plant.typeOfSeed == "Broccoli") then
		texture = "vegetation_farming_01_23"
	elseif(plant.typeOfSeed == "Leek") then
		texture = "FarmoidTiles02_15"
	elseif(plant.typeOfSeed == "Lettuce") then
		texture = "FarmoidTiles02_23"
	elseif(plant.typeOfSeed == "Onion") then
		texture = "FarmoidTiles02_7"
	elseif(plant.typeOfSeed == "Peanut") then
		texture = "FarmoidTiles02_31"
	elseif(plant.typeOfSeed == "Strawberry plant") then
		texture = "vegetation_farming_01_63"
	elseif(plant.typeOfSeed == "Radishes") then
		texture = "vegetation_farming_01_39"
	elseif(plant.typeOfSeed == "Tomato") then
		texture = "vegetation_farming_01_71"
	elseif(plant.typeOfSeed == "Potatoes") then
		texture = "vegetation_farming_01_47"
	elseif(plant.typeOfSeed == "Cabbages") then
		texture = "vegetation_farming_01_31"
	elseif(plant.typeOfSeed == "Pumpkin") then
		texture = "FarmoidTiles01_15"
	elseif(plant.typeOfSeed == "Watermelon") then
		texture = "FarmoidTiles01_31"
	elseif(plant.typeOfSeed == "Zuccini") then
		texture = "FarmoidTiles01_23"
	end
	plant:setSpriteName(texture)
	plant.state = "rotten"
	plant:setObjectName(farming_vegetableconf.getObjectName(plant))
	basicFarming.deadPlant(plant)
	-- FIXME: update object name
end

-- make the player more tired etc. when plowing land
function basicFarming.changePlayer(player)
	player:getStats():setFatigue(player:getStats():getFatigue() + 0.015)
	player:getStats():setEndurance(player:getStats():getEndurance() - 0.0015)
end

function basicFarming.saveData(plant)
	local object = plant:getObject()
	if object then
		plant:toModData(object:getModData())
		object:transmitModData()
	end
	if plant.modData then
		plant:toModData(plant.modData)
		return
	end
	for i=1,#basicFarming.modData.farming.plants do
		local data = basicFarming.modData.farming.plants[i]
		if plant.x == data.x and plant.y == data.y and plant.z == data.z then
			plant:toModData(data)
			break
		end
	end
end

function basicFarming.reuseGridsquare(sq)
end

function basicFarming.loadGridsquare(sq)
	if isClient() then return end
	for _,plant in pairs(basicFarming.plantings) do
		if plant.x == sq:getX() and plant.y == sq:getY() and plant.z == sq:getZ() then
			if plant:getObject() then
				-- Sync the IsoObject with the current state of the plant
				plant:loadGridSquare()
			else
				-- Fix for the object not being there anymore
				noise('removing plant-without-object '..plant.x..','..plant.y)
				basicFarming.removePlant(plant)
			end
			-- Remove old-style modData
			if sq:hasModData() and basicFarming.isValidModData(sq:getModData()) then
				basicFarming.removeSquareModData(sq)
				sq:transmitModdata()
			end
			return
		end
	end

	-- Find plant objects that aren't in the plantings[] table for some strange reason
	if isClient() then return end
	local object = basicFarming.findPlantObject(sq)
	if object then
		noise('found an unknown plant object '..sq:getX()..','..sq:getY())
		local modData = nil
		if basicFarming.isValidModData(object:getModData()) then
			modData = object:getModData()
		elseif basicFarming.isValidModData(sq:getModData()) then
			modData = sq:getModData()
		end
		if not modData then
			noise("couldn't find valid modData for the unknown plant, removing it")
			sq:RemoveTileObject(object)
			return
		end
		local plant = ISPlant:new(sq:getX(), sq:getY(), sq:getZ())
		plant:fromModData(modData)
		plant.objectName = object:getName()
		plant.spriteName = object:getSpriteName()
		if plant.lastWaterHour and plant.lastWaterHour > basicFarming.hoursElapsed then
			-- after a server soft-reset, all GameTime modData is lost
			if farming_vegetableconf.props[plant.typeOfSeed] then
				plant.nextGrowing = farming_vegetableconf.props[plant.typeOfSeed].timeToGrow
			end
			plant.lastWaterHour = basicFarming.hoursElapsed
			noise('reset lastWaterHour/nextGrowing on plant '..plant.x..','..plant.y)
		end
		table.insert(basicFarming.plantings, plant)
		modData = {}
		plant:toModData(modData)
		modData.x = plant.x
		modData.y = plant.y
		modData.z = plant.z
		table.insert(basicFarming.modData.farming.plants, modData)
		plant.modData = modData
		noise('added previously-unknown plant '..plant.x..','..plant.y)
		return
	end

	-- Remove old-style modData
	if sq:hasModData() and basicFarming.isValidModData(sq:getModData()) then
		basicFarming.removeSquareModData(sq)
		sq:transmitModdata()
	end
end

function basicFarming.loadGridsquareJavaHook(sq, plant, object)
	if isClient() then return end

	if plant then
		if object then
			-- Sync the IsoObject with the current state of the plant
			noise('loaded plant-with-object '..plant.x..','..plant.y)
			plant:loadGridSquare()
		else
			-- Fix for the object not being there anymore
			noise('removing plant-without-object '..plant.x..','..plant.y)
			basicFarming.removePlant(plant)
		end
		-- Remove old-style modData
		if sq:hasModData() and basicFarming.isValidModData(sq:getModData()) then
			basicFarming.removeSquareModData(sq)
			sq:transmitModdata()
		end
		return
	end

	-- Find plant objects that aren't in the plantings[] table for some strange reason
	if object then
		noise('found an unknown plant object '..sq:getX()..','..sq:getY())
		local modData = nil
		if basicFarming.isValidModData(object:getModData()) then
			modData = object:getModData()
		elseif basicFarming.isValidModData(sq:getModData()) then
			modData = sq:getModData()
		end
		if not modData then
			noise("couldn't find valid modData for the unknown plant, removing it")
			sq:RemoveTileObject(object)
			return
		end
		local plant = ISPlant:new(sq:getX(), sq:getY(), sq:getZ())
		plant:fromModData(modData)
		plant.objectName = object:getName()
		plant.spriteName = object:getSpriteName()
		if plant.lastWaterHour and plant.lastWaterHour > basicFarming.hoursElapsed then
			-- after a server soft-reset, all GameTime modData is lost
			if farming_vegetableconf.props[plant.typeOfSeed] then
				plant.nextGrowing = farming_vegetableconf.props[plant.typeOfSeed].timeToGrow
			end
			plant.lastWaterHour = basicFarming.hoursElapsed
			noise('reset lastWaterHour/nextGrowing on plant '..plant.x..','..plant.y)
		end
		table.insert(basicFarming.plantings, plant)
		modData = {}
		plant:toModData(modData)
		modData.x = plant.x
		modData.y = plant.y
		modData.z = plant.z
		table.insert(basicFarming.modData.farming.plants, modData)
		plant.modData = modData
		noise('added previously-unknown plant '..plant.x..','..plant.y)
		return
	end

	-- Remove old-style modData
	if sq:hasModData() and basicFarming.isValidModData(sq:getModData()) then
		basicFarming.removeSquareModData(sq)
		sq:transmitModdata()
	end
end

-- add xp, depending on the health of the plant
basicFarming.gainXp = function(player, plant)
	local xp = plant.health / 2
	if plant.badCare == true then
		xp = xp - 15
	else
		xp = xp + 25
	end
	if xp > 100 then
		xp = 100
	elseif xp < 0 then
		xp = 0
	end
	player:getXp():AddXP(Perks.Farming, xp)
end

-- get the farming xp of the player
basicFarming.getXp = function(character)
--~ 	return 5
	if not character then character = getPlayer() end
	return character:getPerkLevel(Perks.Farming)
end

basicFarming.convertOldModData = function()
	if basicFarming.modData.farming and basicFarming.modData.farming.plants then return end
	basicFarming.modData.farming = {}
	basicFarming.modData.farming.plants = {}
	noise('converting old-style GameTime modData')
	local indexes = {}
	for iPData,vPData in pairs(basicFarming.modData) do
        for index in string.gmatch(iPData, "^planting:(.+):") do
			if tonumber(index) then
print(iPData..'='..vPData)
				if indexes[tonumber(index)] == nil then
					indexes[tonumber(index)] = index
				end
			end
		end
	end
	local plants = basicFarming.modData.farming.plants
	for ind,var in pairs(indexes) do
		local x = basicFarming.modData["planting:" .. ind .. ":x"]
		if x and x > -1 then
			local plant = {}
			plant.x = x
			plant.y = basicFarming.modData["planting:" .. ind .. ":y"]
			plant.z = basicFarming.modData["planting:" .. ind .. ":z"]
			plant.nbOfGrow = basicFarming.modData["planting:" .. ind .. ":nbOfGrow"]
			plant.typeOfSeed = basicFarming.modData["planting:" .. ind .. ":typeOfSeed"]
			plant.waterNeeded = basicFarming.modData["planting:" .. ind .. ":waterNeeded"]
			plant.waterNeededMax = basicFarming.modData["planting:" .. ind .. ":waterNeededMax"]
			plant.fertilizer = basicFarming.modData["planting:" .. ind .. ":fertilizer"]
			if basicFarming.modData["planting:" .. ind .. ":hasVegetable"] == "true" then
				plant.hasVegetable = true
			else
				plant.hasVegetable = false
			end
			plant.lastWaterHour = basicFarming.modData["planting:" .. ind .. ":lastWaterHour"]
			plant.waterLvl = basicFarming.modData["planting:" .. ind .. ":waterLvl"] or 0
			plant.mildewLvl = basicFarming.modData["planting:" .. ind .. ":mildewLvl"] or 0
			plant.aphidLvl = basicFarming.modData["planting:" .. ind .. ":aphidLvl"] or 0
			plant.fliesLvl = basicFarming.modData["planting:" .. ind .. ":fliesLvl"] or 0
			plant.health = basicFarming.modData["planting:" .. ind .. ":health"] or 50
			if basicFarming.modData["planting:" .. ind .. ":badCare"] == true then
				plant.badCare = true
			else
				plant.badCare = false
			end
			plant.state = basicFarming.modData["planting:" .. ind .. ":state"]
			plant.nextGrowing = basicFarming.modData["planting:" .. ind .. ":nextGrowing"]
			basicFarming.removeModData("planting:"..ind..":", basicFarming.modData)
			table.insert(plants, plant)
		end
	end
	noise('converted '..#plants..' plants')
end

function basicFarming.loadPlanting(DoiT)
	if not DoiT then return end
	if getCore():isDedicated() then return; end
	noise('loading GameTime modData')
	local gameTime = GameTime:getInstance()
	basicFarming.modData = gameTime:getModData()
	basicFarming.hoursElapsed = basicFarming.modData["hoursElapsed"] or 0 -- FIXME: must send to client as initial world state
	local sec = math.floor(gameTime:getTimeOfDay() * 3600)
	basicFarming.previousHour = math.floor(sec / 3600)

	if basicFarming.modData.farming and #basicFarming.modData.farming.plants == 0 then
		-- FIXME: this gets called twice, once before GameTime has been loaded
		basicFarming.modData.farming.plants = nil
	end
	basicFarming.convertOldModData()

	basicFarming.plantings = {}
	for i=1,#basicFarming.modData.farming.plants do
		local data = basicFarming.modData.farming.plants[i]
		local plant = ISPlant:new(data.x, data.y, data.z)
		plant:fromModData(data)
		table.insert(basicFarming.plantings, plant)
		plant.modData = data
		noise('added plant '..plant.x..','..plant.y)
	end
end

basicFarming.loadPlantingStart = function()
	basicFarming.loadPlanting(isServer() or not isClient())
end

basicFarming.loadPlantingGametime = function()
	basicFarming.loadPlanting(not isClient())
end

basicFarming.tooltip = function(tooltip, square)
    local playerObj = getSpecificPlayer(0)
    if playerObj and basicFarming.getXp(playerObj) >= 4 then
        local farmingLevel = basicFarming.getXp(playerObj)
        local plant = basicFarming.getPlantAt(square:getX(),square:getY(),square:getZ());
        if not plant or plant.typeOfSeed == "none" then
            return
        end
        local y = 5;
        local width = 200;
        tooltip:setWidth(width);
        tooltip:DrawTextureScaled(tooltip:getTexture(), 0, 0, tooltip:getWidth(), y + 60, 0.75);
        local title_rgb = ISFarmingInfo.getTitleColor(plant);
        local water_rgb = ISFarmingInfo.getWaterLvlColor(plant, farmingLevel);

        tooltip:DrawTextCentre(plant:getObject():getObjectName(), width / 2, y, title_rgb["r"], title_rgb["g"], title_rgb["b"], 1);
        y = y + 20;

        tooltip:DrawText(getText("Farming_Water_levels"), 5, y, water_rgb["r"], water_rgb["g"], water_rgb["b"], 1);
        tooltip:DrawTextRight(ISFarmingInfo.getWaterLvl(plant, farmingLevel), width - 5, y, water_rgb["r"], water_rgb["g"], water_rgb["b"], 1);
        y = y + 20;

        local lastWatedHour = ISFarmingInfo.getLastWatedHour(plant);
        local nowateredsince_rgb = ISFarmingInfo.getNoWateredSinceColor(plant, lastWatedHour, farmingLevel);
        tooltip:DrawText(getText("Farming_Last_time_watered") .. " : ", 5, y, 1, 1, 1, 1);
        lastWatedHour = lastWatedHour .. " " .. getText("Farming_Hours");
        tooltip:DrawTextRight(lastWatedHour, width - 5, y, nowateredsince_rgb["r"], nowateredsince_rgb["g"], nowateredsince_rgb["b"], 1);
        y = y + 20;

        tooltip:setHeight(y);
    end
end

Events.EveryTenMinutes.Add(basicFarming.EveryTenMinutes)

--Events.OnGameStart.Add(basicFarming.loadPlantingStart)
-- OnGameBoot is to handle soft-reset, no effect on client/sp
Events.OnGameBoot.Add(basicFarming.loadPlantingStart)
Events.OnGameTimeLoaded.Add(basicFarming.loadPlantingGametime)

--Events.ReuseGridsquare.Add(basicFarming.reuseGridsquare)
--Events.LoadGridsquare.Add(basicFarming.loadGridsquare)
Events.DoSpecialTooltip.Add(basicFarming.tooltip)
