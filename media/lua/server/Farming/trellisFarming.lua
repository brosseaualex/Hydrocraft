-----------------------------------------------------------------------
--                        Project Farmoid                            --
--                 ORIGINAL CODE BY ROBERT JOHNSON                   --
--                       MODIFIED BY KUROGO                          --
-----------------------------------------------------------------------



trellisFarming = {}
trellisFarming.previousHour = 0
trellisFarming.hourElapsedForWater = 0
trellisFarming.hoursElapsed = 1
trellisFarming.modData = nil
trellisFarming.vineplantings = {}
trellisFarming.previousHourHealth = 0
trellisFarming.npcFarmingSkill = -1

trellisFarming.wantNoise = getDebug()
local noise = function(msg)
	if (trellisFarming.wantNoise) then print('trellis: '..msg) end
end
trellisFarming.noise = noise

-- This is the first part to creating the object. It checks to make sure that the square has a valid farming object on it
function trellisFarming.isVineObject(object)
	if not object then return false end
	if object:hasModData() and trellisFarming.isValidModData(object:getModData()) then
		return true
	end
	return false
end

-- This part calls all farming objects and makes them the active object being addressed
function trellisFarming.findVineObject(square)
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i)
		if trellisFarming.isVineObject(object) then
			return object
		end
	end
	return nil
end

-- This seems to ensure that it is the host/server that identifies the farming objects
function trellisFarming.getVineAt(x,y,z)
	if isClient() then return nil end
	for iCur,vCur in pairs(trellisFarming.vineplantings) do
		if vCur.x == x and vCur.y == y and vCur.z == z then
			return vCur
		end
	end
	return nil
end

-- This seems to be a call for selecting a vine identified in the previous function
function trellisFarming.getVineOnSquare(square)
	if square == nil then return nil end
	return trellisFarming.getVineAt(square:getX(), square:getY(), square:getZ())
end

-- This is how clients interact with farming objects identified by the host/server
function trellisFarming.getCurrentVinePlanting(square)
	if square == nil then return nil end
	if isClient() then
		local object = trellisFarming.findVineObject(square)
		if object then
			local vine = ISVine:new(square:getX(), square:getY(), square:getZ())
			vine:fromObject(object)
			return vine
		end
		return nil
	end
	return trellisFarming.getVineAt(square:getX(), square:getY(), square:getZ())
end

-- Pretty basic, this is how to remove the vine object
function trellisFarming.removeVine(vine)
	if not vine then return end
	vine:removeObject()
	for i=1,#trellisFarming.vineplantings do
		if trellisFarming.vineplantings[i] == vine then
			table.remove(trellisFarming.vineplantings, i)
			break
		end
	end
	for i=1,#trellisFarming.modData.trellis.vines do
		local data = trellisFarming.modData.trellis.vines[i]
		if data.x == vine.x and data.y == vine.y and data.z == vine.z then
			table.remove(trellisFarming.modData.trellis.vines, i)
			break
		end
	end
	noise("#vineplantings="..#trellisFarming.vineplantings)
	noise("#vines="..#trellisFarming.modData.trellis.vines)
end

-- fertilize the vine, more than 4 doses and your vine die ! (no mercy !)
function trellisFarming.fertilize(fertilizer, vine)
	if vine.state ~= "trellised" and vine:isAlive() then
		if vine.fertilizer < 4  then
			vine.fertilizer = vine.fertilizer + 1
			vine.nextGrowing = vine.nextGrowing - 20
			if vine.nextGrowing < 1 then
				vine.nextGrowing = 1
			end
		else
			trellisFarming.rottenThis(vine)
		end
		trellisFarming.saveData(vine)
	end
end

-- if zombie or npc walk over your vine, you have 1 to 10 risk that your vine is destroyed
function trellisFarming.destroyOnWalk(vine)
	if not vine:getSquare() then
		return
	end
	for i, v in pairs(vine:getSquare():getLuaMovingObjectList()) do
		if (vine.state ~= "trellised" and vine.state ~= "destroy" and (v:getObjectName() == "Zombie" or v:getObjectName() == "Survivor")) then
			if(ZombRand(11) == 5) then
				trellisFarming.destroyThis(vine)
			end
		end
	end
end

-- destroy the vine (someone walked on it :))
function trellisFarming.destroyThis(vine)
	if vine.typeOfSeed == "Tomato" then -- Make smashed versions of the trellises and call them here
		vine:setSpriteName("vegetation_farming_01_14")
	else
		vine:setSpriteName("vegetation_farming_01_13")
	end
	vine.state = "destroy"
	vine:setObjectName(trellis_vegetableconf.getObjectName(vine))
	trellisFarming.deadVine(vine)
	trellisFarming.saveData(vine)
end

-- These are the parameters that we will use
function trellisFarming.isValidModData(modData)
	if modData.state and modData.nbOfVineGrow and modData.health then return true end
	return false
end

-- and anything else can be removed
function trellisFarming.removeModData(prefix, modData)
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

-- When a plant is removed, this ensures all used data is also removed
function trellisFarming.removeSquareModData(square)
	local datas = square:getModData()
	datas["state"] = nil
	datas["nbOfVineGrow"] = nil
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
function trellisFarming.seed(typeOfSeed, vineplanting)
	-- will set the first growing state for the type of seed
	vineplanting.nbOfVineGrow = 0
	vineplanting.state = "seeded"
	vineplanting.typeOfSeed = typeOfSeed
	-- You have 48 hours to water your plant, if not, she will be dry
	vineplanting.lastWaterHour = trellisFarming.hoursElapsed
	vineplanting.waterNeeded = 0
	trellisFarming.growVine(vineplanting, nil, true)
	trellisFarming.saveData(vineplanting)
end

-- grow the plant
function trellisFarming.growVine(vineplanting, nextGrowing, updateNbOfGrow)
	if(vineplanting.state == "seeded") then
		local new = vineplanting.nbOfVineGrow <= 0
		if(vineplanting.typeOfSeed == "Bean") then
			vineplanting = trellis_vegetableconf.growBean(vineplanting, nextGrowing, updateNbOfGrow)
		elseif(vineplanting.typeOfSeed == "BellPepper") then
			vineplanting = trellis_vegetableconf.growBellPepper(vineplanting, nextGrowing, updateNbOfGrow)
		elseif(vineplanting.typeOfSeed == "Eggplant") then
			vineplanting = trellis_vegetableconf.growEggplant(vineplanting, nextGrowing, updateNbOfGrow)
		elseif(vineplanting.typeOfSeed == "Grape") then
			vineplanting = trellis_vegetableconf.growGrape(vineplanting, nextGrowing, updateNbOfGrow)
		elseif(vineplanting.typeOfSeed == "Pea") then
			vineplanting = trellis_vegetableconf.growPea(vineplanting, nextGrowing, updateNbOfGrow)
		end
		-- maybe this vine gonna be disease
		if not new and vineplanting.nbOfVineGrow > 0 then
			trellisFarming.diseaseThis(vineplanting, true)
		end
		vineplanting.nbOfVineGrow = vineplanting.nbOfVineGrow + 1
--		saveData(planting)
	end
end

function trellisFarming.vineharvest(vine, player)
	local props = trellis_vegetableconf.props[vine.typeOfSeed]
	local numberOfVeg = getVegetablesNumber(props.minVeg, props.maxVeg, props.minVegAutorized, props.maxVegAutorized, vine)
	if player then
		player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg })
	end

	if vine.hasSeed and player then
		player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) })
	end

	vine.hasVegetable = false
	vine.hasSeed = false
	vine.state = "trellised"
	vine.nbOfVineGrow = -1
	-- the vine won't disapear, it goes on phase 2 again
	--if vine.typeOfSeed == "Bean" or vine.typeOfSeed == "BellPepper" or vine.typeOfSeed == "Eggplant" or vine.typeOfSeed == "Grape" or vine.typeOfSeed == "Pea" then
	--	vine.nbOfVineGrow = 1
	--	trellisFarming.growVine(vine, nil, true)
	--else
    --    trellisFarming.removeVine(vine)
	--end
end

-- test if the vine gonna be disease
function trellisFarming.diseaseThis(vine, checkCloseVine)
	-- if we don't already have mildew
	if(vine.mildewLvl == 0) then
		trellisFarming.mildew(vine)
	end
	if(vine.aphidLvl == 0) then
		trellisFarming.aphid(vine)
	end
	if(vine.fliesLvl == 0) then
		trellisFarming.flies(vine)
	end
	if(checkCloseVine ==  true) then
		-- we gonna check all the vine near this one, if one is infected, maybe this one would be infected too !
		trellisFarming.diseaseCloseVine(vine)
	end
end

-- fetch all the vine near our current disease vine, so maybe they gonna have a disease too
function trellisFarming.diseaseCloseVine(vine)
	for iDis,vDis in pairs(trellisFarming.vineplantings) do
		local dist = IsoUtils.DistanceManhatten(vDis.x + 0.5, vDis.y + 0.5, vine.x + 0.5, vine.y + 0.5)
		-- a close vine is infected
		if(vDis.aphidLvl > 0 or vDis.mildewLvl > 0 and dist ~= 0 and dist <= 2) then
			-- we gonna re check if our vine can be infected
			trellisFarming.diseaseThis(vine, false)
		end
	end
end

-- if the vine doesn't have mildew, maybe it will have it !
-- base risk for mildew is 2%, but every pt of water below the required water lvl add 1% risk
function trellisFarming.mildew(vine)
	local mildewNumber = 2
	local waterBelow = vine.waterNeeded - vine.waterLvl
	-- our vine is well watered
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
		vine.mildewLvl = 1
	end
end

-- if the vine doesn't have aphid, maybe it will have it !
-- base risk for aphid is 2%, but every pt of water below the required water lvl add 1% risk
function trellisFarming.aphid(vine)
	local aphidNumber = 2
	local waterBelow = vine.waterNeeded - vine.waterLvl
	-- our vine is well watered
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
		vine.aphidLvl = 1
	end
end

-- if the vine doesn't have flies, maybe it will have it !
-- base risk for flies is 2%, but every pt of water below the required water lvl add 1% risk
function trellisFarming.flies(vine)
	local fliesNumber = 2
	local waterBelow = vine.waterNeeded - vine.waterLvl
	-- our vine is well watered
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
		vine.fliesLvl = 1
	end
end

-- add icon on each vine so it's easy to find wich one need water, or has disease, etc.
-- you'll need to have at least 5 farmings pts to see this, and be close to the vine
function trellisFarming.addVineIcon(vine)
end

function trellisFarming.removeVineIcons(vine)
end

function trellisFarming.EveryTenMinutes()
    if isClient() then return end
	local sec = math.floor(getGameTime():getTimeOfDay() * 3600)
	local currentHour = math.floor(sec / 3600)
	local day = getGameTime():getDay()
	-- an hour as passed
	if currentHour ~= trellisFarming.previousHour then
		trellisFarming.hoursElapsed = trellisFarming.hoursElapsed + 1
		trellisFarming.modData["hoursElapsed"] = trellisFarming.hoursElapsed
		trellisFarming.previousHour = currentHour
		trellisFarming.hourElapsedForWater = trellisFarming.hourElapsedForWater + 1
		-- every 2 hours, we lower the water lvl of all vine by 1
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

		if trellisFarming.hourElapsedForWater >= hourForWater then
			trellisFarming.lowerWaterLvlAndUpDisease()
			trellisFarming.hourElapsedForWater = 0
		end
		-- change health of the vine every 3 hours
		trellisFarming.previousHourHealth = trellisFarming.previousHourHealth + 1
		if trellisFarming.previousHourHealth == 2 then
			trellisFarming.changeHealth()
			trellisFarming.previousHourHealth = 0
		end
		sendServerCommand('trellis', 'hoursElapsed', { hoursElapsed = trellisFarming.hoursElapsed })
	end
	-- a day as passed, maybe npc will water the vine for us
	if trellisFarming.currentDay ~= day then
		trellisFarming.currentDay = day
		trellisFarming.modData["currentDay"] = day
--		trellisFarming.automateNpc()
	end
	trellisFarming.checkVine()
end

function trellisFarming.lowerWaterLvlAndUpDisease()
	for iVine,vVine in pairs(trellisFarming.vineplantings) do
		trellisFarming.lowerWaterLvl(vVine)
		trellisFarming.upDisease(vVine)
--        saveData(vPlant)
	end
end

-- up or low the health of our vine, depending on weather, if they are well watered, etc.
function trellisFarming.changeHealth()
	for iVine,vVine in pairs(trellisFarming.vineplantings) do
		-- change with weather
		local weather = getWorld():getWeather()
		if "sunny" == weather then -- if it's sunny
			if vVine.exterior then
				vVine.health = vVine.health + 1
			else
				vVine.health = vVine.health + 0.25
			end
        end
        -- lower health if temperature is not high
        if season.currentTemp <= 10 then
            vVine.health = vVine.health - 0.25;
        end
		-- change with water
		local water = trellis_vegetableconf.calcWater(vVine.waterNeeded, vVine.waterLvl)
		local waterMax = trellis_vegetableconf.calcWater(vVine.waterLvl, vVine.waterNeededMax)
		if water >= 0 and waterMax >= 0 then
			vVine.health = vVine.health + 0.4
		elseif water == -1 then -- we low health by 0.2
			vVine.health = vVine.health - 0.2
		elseif water == -2 then -- low health by 0.5
			vVine.health = vVine.health - 0.5
		elseif waterMax == -1 and vVine.health > 20  then
			vVine.health = vVine.health - 0.2
		elseif waterMax == -2 and vVine.health > 20  then
			vVine.health = vVine.health - 0.5
		end
--		saveData(vVine)
	end
end

-- up the disease by a number, it's the double if your vine is not well watered
function trellisFarming.upDisease(vine)
	-- mildew lvl up by 1 or 0.5 if your vine is well watered
	if vine.mildewLvl ~= nil and vine.mildewLvl > 0 then
		local water = trellis_vegetableconf.calcWater(vine.waterNeeded, vine.waterLvl)
		if(water >= 0) then
			vine.mildewLvl = vine.mildewLvl + 0.5
		else
			vine.mildewLvl = vine.mildewLvl + 1
		end
		vine.mildewLvl = math.min(vine.mildewLvl, 100)
--		trellisFarming.playerData["planting:" .. vine.id .. ":mildewLvl"] = vine.mildewLvl
	end
	-- flies lvl up by 1 or 0.5 if your vine is well watered
	if vine.fliesLvl ~= nil and vine.fliesLvl > 0 then
		local water = trellis_vegetableconf.calcWater(vine.waterNeeded, vine.waterLvl)
		if(water >= 0) then
			vine.fliesLvl = vine.fliesLvl + 0.5
		else
			vine.fliesLvl = vine.fliesLvl + 1
		end
		vine.fliesLvl = math.min(vine.fliesLvl, 100)
--		trellisFarming.playerData["planting:" .. vine.id .. ":fliesLvl"] = vine.fliesLvl
	end
	-- aphid is different than mildew, you'll have to dehydrate your vine to lower the aphid lvl
	if vine.aphidLvl ~= nil and vine.aphidLvl > 0 then
		local water = trellis_vegetableconf.calcWater(vine.waterNeeded, vine.waterLvl)
		if water == -1 or water == -2 then
			vine.aphidLvl = vine.aphidLvl - 2
			if vine.aphidLvl < 0 then
				vine.aphidLvl = 0
			end
		else
			vine.aphidLvl = vine.aphidLvl + 1
			vine.aphidLvl = math.min(vine.aphidLvl, 100)
		end
--		trellisFarming.playerData["planting:" .. vine.id .. ":aphidLvl"] = vine.aphidLvl
	end
end

-- lower by 1 the waterLvl of all our vine
function trellisFarming.lowerWaterLvl(vine)
	if vine.waterLvl ~= nil then
		-- flies make water dry more quickly, every 10 pts of flies, water lower by 1 more pts
		local waterFliesChanger = math.floor(vine.fliesLvl / 10)
		vine.waterLvl = vine.waterLvl - 1 - waterFliesChanger
		if vine.waterLvl < 0 then
			vine.waterLvl = 0
		end
--		trellisFarming.playerData["planting:" .. vine.id .. ":waterLvl"] = vine.waterLvl
	end
end

-- if we add mildew spray
function trellisFarming.cureMildew(vine, mildewCureSource, uses)
	for i=1,uses do
			if mildewCureSource then
				mildewCureSource:Use()
			end
			vine.mildewLvl = vine.mildewLvl - 5
			if vine.mildewLvl < 0 then
				vine.mildewLvl = 0
			end
	end
	trellisFarming.saveData(vine)
end

-- if we add insecticide spray
function trellisFarming.cureFlies(vine, fliesCureSource, uses)
	for i=1,uses do
			if fliesCureSource then
				fliesCureSource:Use()
			end
			vine.fliesLvl = vine.fliesLvl - 5
			if vine.fliesLvl < 0 then
				vine.fliesLvl = 0
			end
	end
	trellisFarming.saveData(vine)
end

-- if we water our vine
-- we gonna add 5 water lvl for the vine for each use of the water source
function trellisFarming.water(vine, waterSource, uses)
	for i=1,uses do
		if(vine.waterLvl < 100) then
			if waterSource then
				if waterSource:getUsedDelta() > 0 then
					waterSource:Use()
				end
			end
			vine.waterLvl = vine.waterLvl + 5
			if(vine.waterLvl > 100) then
				vine.waterLvl = 100
			end
		end
	end
	-- we notice the hour of our last water, because if we don't water the vine every 48 hours, she die
	vine.lastWaterHour = trellisFarming.hoursElapsed;
	trellisFarming.saveData(vine)
end

function trellisFarming.checkVine()
	for iVine,vVine in pairs(trellisFarming.vineplantings) do
		local square = vVine:getSquare()
		if square then vVine.exterior = square:isOutside() end
		trellisFarming.destroyOnWalk(vVine)
		if vVine.nextGrowing ~= nil then
			if trellisFarming.hoursElapsed >= vVine.nextGrowing then
				trellisFarming.growVine(vVine, nil, true)
			end
		end
		if vVine.state ~= "trellised" and vVine:isAlive() then
			if RainManager.isRaining() then
				if vVine.exterior then
					vVine.waterLvl = vVine.waterLvl + 3
					if vVine.waterLvl > 100 then
						vVine.waterLvl = 100
					end
					vVine.lastWaterHour = trellisFarming.hoursElapsed
				end
			-- if it's sunny, we lower a bit our water lvl
			elseif season.weather == "sunny" then
				vVine.waterLvl = vVine.waterLvl - 0.1
				if vVine.waterLvl < 0 then
					vVine.waterLvl = 0
				end
			end
		end
		trellisFarming.addVineIcon(vVine)
		trellisFarming.checkStat(vVine)
		trellisFarming.saveData(vVine)
	end
end

function trellisFarming.checkStat(vine)
	if vine.state ~= "trellised" and vine.nbOfVineGrow > 1 then
		if vine.waterLvl <= 0 then
			trellisFarming.dryThis(vine)
		elseif vine.waterLvl > 100 then
			vine.waterLvl = 100
		end
		if vine.health <= 0 then
			trellisFarming.dryThis(vine)
		end
	end
	if vine.waterLvl < 0 then
		vine.waterLvl = 0
	end
	if vine.health < 0 then
		vine.health = 0
	elseif vine.health > 100 then
		vine.health = 100
	end
end

function trellisFarming.dryThis(vine)
	if vine.typeOfSeed == "Bean" then
		vine:setSpriteName("FarmoidTiles01_7")
	elseif vine.typeOfSeed == "BellPepper" then
		vine:setSpriteName("FarmoidTiles01_47")
	elseif vine.typeOfSeed == "Eggplant" then
		vine:setSpriteName("FarmoidTiles01_63")
	elseif vine.typeOfSeed == "Grape" then
		vine:setSpriteName("FarmoidTiles01_55")
	elseif vine.typeOfSeed == "Pea" then
		vine:setSpriteName("FarmoidTiles01_39")
	else
		vine:setSpriteName("vegetation_farming_01_5")
	end
	vine.state = "dry"
	vine:setObjectName(trellis_vegetableconf.getObjectName(vine))
	trellisFarming.deadVine(vine)
end

function trellisFarming.deadVine(vine)
	vine.nextGrowing = 0
	vine.waterLvl = 0
	vine.nbOfVineGrow = 0
	vine.mildewLvl = 0
	vine.aphidLvl = 0
	vine.fliesLvl = 0
	vine.health = 0
end

function trellisFarming.removeTallGrass(sq)
	for i=sq:getObjects():size(),1,-1 do
		o = sq:getObjects():get(i-1)
		if o:getSprite() and (
				o:getSprite():getProperties():Is(IsoFlagType.canBeRemoved) or
				(o:getSprite():getProperties():Is(IsoFlagType.vegitation) and o:getType() ~= IsoObjectType.tree) or
				(o:getSprite():getName() and luautils.stringStarts(o:getSprite():getName(), "blends_grassoverlays"))) then
			sq:transmitRemoveItemFromSquare(o)
			sq:RemoveTileObject(o)
		end
	end
end

-- build the trellis
function trellisFarming.build(square)
	trellisFarming.removeTallGrass(square)
	local vine = ISVine:new(square:getX(), square:getY(), square:getZ())
	vine.exterior = square:isOutside()
	vine:addObject()
	table.insert(trellisFarming.vineplantings, vine)
	local modData = {}
	vine:toModData(modData)
	modData.x = vine.x
	modData.y = vine.y
	modData.z = vine.z
	table.insert(trellisFarming.modData.trellis.vines, modData)
	vine.modData = modData
	noise('trellised '..vine.x..','..vine.y)
	noise("#vineplantings="..#trellisFarming.vineplantings)
	noise("#vines="..#trellisFarming.modData.trellis.vines)
end

function trellisFarming.getHealth()
	if season.moonCycle >= 4 and season.moonCycle < 18 then
		return ZombRand(47, 54)
	elseif season.moonCycle >= 18 and season.moonCycle <= 21 then
		return ZombRand(57, 64)
	else
		return ZombRand(37, 44)
	end
end

function trellisFarming.rottenThis(vine)
	local texture = nil
	if(vine.typeOfSeed == "Bean") then
		texture = "FarmoidTiles01_7"
	elseif(vine.typeOfSeed == "BellPepper") then
		texture = "FarmoidTiles01_47"
	elseif(vine.typeOfSeed == "Eggplant") then
		texture = "FarmoidTiles01_63"
	elseif(vine.typeOfSeed == "Grape") then
		texture = "FarmoidTiles01_55"
	elseif(vine.typeOfSeed == "Pea") then
		texture = "FarmoidTiles01_39"
	end
	vine:setSpriteName(texture)
	vine.state = "rotten"
	vine:setObjectName(trellis_vegetableconf.getObjectName(vine))
	trellisFarming.deadVine(vine)
end

-- make the player more tired etc. when plowing land
function trellisFarming.changePlayer(player)
	player:getStats():setFatigue(player:getStats():getFatigue() + 0.03)
	player:getStats():setEndurance(player:getStats():getEndurance() - 0.005)
end

function trellisFarming.saveData(vine)
	local object = vine:getObject()
	if object then
		vine:toModData(object:getModData())
		object:transmitModData()
	end
	if vine.modData then
		vine:toModData(vine.modData)
		return
	end
	for i=1,#trellisFarming.modData.trellis.vines do
		local data = trellisFarming.modData.trellis.vines[i]
		if vine.x == data.x and vine.y == data.y and vine.z == data.z then
			vine:toModData(data)
			break
		end
	end
end

function trellisFarming.reuseGridsquare(sq)
end

function trellisFarming.loadGridsquare(sq)
	if isClient() then return end
	for _,vine in pairs(trellisFarming.vineplantings) do
		if vine.x == sq:getX() and vine.y == sq:getY() and vine.z == sq:getZ() then
			if vine:getObject() then
				vine:loadGridSquare()
			else
				noise('removing vine-without-object '..vine.x..','..vine.y)
				trellisFarming.removeVine(vine)
			end
			if sq:hasModData() and trellisFarming.isValidModData(sq:getModData()) then
				trellisFarming.removeSquareModData(sq)
				sq:transmitModdata()
			end
			return
		end
	end

	if isClient() then return end
	local object = trellisFarming.findVineObject(sq)
	if object then
		noise('found an unknown vine object '..sq:getX()..','..sq:getY())
		local modData = nil
		if trellisFarming.isValidModData(object:getModData()) then
			modData = object:getModData()
		elseif trellisFarming.isValidModData(sq:getModData()) then
			modData = sq:getModData()
		end
		if not modData then
			noise("couldn't find valid modData for the unknown vine, removing it")
			sq:RemoveTileObject(object)
			return
		end
		local vine = ISVine:new(sq:getX(), sq:getY(), sq:getZ())
		vine:fromModData(modData)
		vine.objectName = object:getName()
		vine.spriteName = object:getSpriteName()
		if vine.lastWaterHour and vine.lastWaterHour > trellisFarming.hoursElapsed then
			if trellis_vegetableconf.props[vine.typeOfSeed] then
				vine.nextGrowing = trellis_vegetableconf.props[vine.typeOfSeed].timeToGrow
			end
			vine.lastWaterHour = trellisFarming.hoursElapsed
			noise('reset lastWaterHour/nextGrowing on vine '..vine.x..','..vine.y)
		end
		table.insert(trellisFarming.vineplantings, vine)
		modData = {}
		vine:toModData(modData)
		modData.x = vine.x
		modData.y = vine.y
		modData.z = vine.z
		table.insert(trellisFarming.modData.trellis.vines, modData)
		vine.modData = modData
		noise('added previously-unknown vine '..vine.x..','..vine.y)
		return
	end

	-- Remove old-style modData
	if sq:hasModData() and trellisFarming.isValidModData(sq:getModData()) then
		trellisFarming.removeSquareModData(sq)
		sq:transmitModdata()
	end
end

function trellisFarming.loadGridsquareJavaHook(sq, vine, object)
	if isClient() then return end

	if vine then
		if object then
			-- Sync the IsoObject with the current state of the vine
			noise('loaded vine-with-object '..vine.x..','..vine.y)
			vine:loadGridSquare()
		else
			-- Fix for the object not being there anymore
			noise('removing vine-without-object '..vine.x..','..vine.y)
			trellisFarming.removeVine(vine)
		end
		-- Remove old-style modData
		if sq:hasModData() and trellisFarming.isValidModData(sq:getModData()) then
			trellisFarming.removeSquareModData(sq)
			sq:transmitModdata()
		end
		return
	end

	-- Find vine objects that aren't in the plantings[] table for some strange reason
	if object then
		noise('found an unknown vine object '..sq:getX()..','..sq:getY())
		local modData = nil
		if trellisFarming.isValidModData(object:getModData()) then
			modData = object:getModData()
		elseif trellisFarming.isValidModData(sq:getModData()) then
			modData = sq:getModData()
		end
		if not modData then
			noise("couldn't find valid modData for the unknown vine, removing it")
			sq:RemoveTileObject(object)
			return
		end
		local vine = ISVine:new(sq:getX(), sq:getY(), sq:getZ())
		vine:fromModData(modData)
		vine.objectName = object:getName()
		vine.spriteName = object:getSpriteName()
		if vine.lastWaterHour and vine.lastWaterHour > trellisFarming.hoursElapsed then
			-- after a server soft-reset, all GameTime modData is lost
			if trellis_vegetableconf.props[vine.typeOfSeed] then
				vine.nextGrowing = trellis_vegetableconf.props[vine.typeOfSeed].timeToGrow
			end
			vine.lastWaterHour = trellisFarming.hoursElapsed
			noise('reset lastWaterHour/nextGrowing on vine '..vine.x..','..vine.y)
		end
		table.insert(trellisFarming.vineplantings, vine)
		modData = {}
		vine:toModData(modData)
		modData.x = vine.x
		modData.y = vine.y
		modData.z = vine.z
		table.insert(trellisFarming.modData.trellis.vines, modData)
		vine.modData = modData
		noise('added previously-unknown vine '..vine.x..','..vine.y)
		return
	end

	-- Remove old-style modData
	if sq:hasModData() and trellisFarming.isValidModData(sq:getModData()) then
		trellisFarming.removeSquareModData(sq)
		sq:transmitModdata()
	end
end

-- add xp, depending on the health of the vine
trellisFarming.gainXp = function(player, vine)
	local xp = vine.health / 2
	if vine.badCare == true then
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
trellisFarming.getXp = function(character)
--~ 	return 5
	if not character then character = getPlayer() end
	return character:getPerkLevel(Perks.Farming)
end

trellisFarming.convertOldModData = function()
	if trellisFarming.modData.trellis and trellisFarming.modData.trellis.vines then return end
	trellisFarming.modData.trellis = {}
	trellisFarming.modData.trellis.vines = {}
	noise('converting old-style GameTime modData')
	local indexes = {}
	for iPData,vPData in pairs(trellisFarming.modData) do
        for index in string.gmatch(iPData, "^vineplanting:(.+):") do
			if tonumber(index) then
print(iPData..'='..vPData)
				if indexes[tonumber(index)] == nil then
					indexes[tonumber(index)] = index
				end
			end
		end
	end
	local vines = trellisFarming.modData.trellis.vines
	for ind,var in pairs(indexes) do
		local x = trellisFarming.modData["vineplanting:" .. ind .. ":x"]
		if x and x > -1 then
			local vine = {}
			vine.x = x
			vine.y = trellisFarming.modData["vineplanting:" .. ind .. ":y"]
			vine.z = trellisFarming.modData["vineplanting:" .. ind .. ":z"]
			vine.nbOfVineGrow = trellisFarming.modData["vineplanting:" .. ind .. ":nbOfVineGrow"]
			vine.typeOfSeed = trellisFarming.modData["vineplanting:" .. ind .. ":typeOfSeed"]
			vine.waterNeeded = trellisFarming.modData["vineplanting:" .. ind .. ":waterNeeded"]
			vine.waterNeededMax = trellisFarming.modData["vineplanting:" .. ind .. ":waterNeededMax"]
			vine.fertilizer = trellisFarming.modData["vineplanting:" .. ind .. ":fertilizer"]
			if trellisFarming.modData["vineplanting:" .. ind .. ":hasVegetable"] == "true" then
				vine.hasVegetable = true
			else
				vine.hasVegetable = false
			end
			vine.lastWaterHour = trellisFarming.modData["vineplanting:" .. ind .. ":lastWaterHour"]
			vine.waterLvl = trellisFarming.modData["vineplanting:" .. ind .. ":waterLvl"] or 0
			vine.mildewLvl = trellisFarming.modData["vineplanting:" .. ind .. ":mildewLvl"] or 0
			vine.aphidLvl = trellisFarming.modData["vineplanting:" .. ind .. ":aphidLvl"] or 0
			vine.fliesLvl = trellisFarming.modData["vineplanting:" .. ind .. ":fliesLvl"] or 0
			vine.health = trellisFarming.modData["vineplanting:" .. ind .. ":health"] or 50
			if trellisFarming.modData["vineplanting:" .. ind .. ":badCare"] == true then
				vine.badCare = true
			else
				vine.badCare = false
			end
			vine.state = trellisFarming.modData["vineplanting:" .. ind .. ":state"]
			vine.nextGrowing = trellisFarming.modData["vineplanting:" .. ind .. ":nextGrowing"]
			trellisFarming.removeModData("vineplanting:"..ind..":", trellisFarming.modData)
			table.insert(vines, vine)
		end
	end
	noise('converted '..#vines..' vines')
end

function trellisFarming.loadVinePlanting(DoiT)
	if not DoiT then return end
	if getCore():isDedicated() then return; end
	noise('loading GameTime modData')
	local gameTime = GameTime:getInstance()
	trellisFarming.modData = gameTime:getModData()
	trellisFarming.hoursElapsed = trellisFarming.modData["hoursElapsed"] or 0 -- FIXME: must send to client as initial world state
	local sec = math.floor(gameTime:getTimeOfDay() * 3600)
	trellisFarming.previousHour = math.floor(sec / 3600)

	if trellisFarming.modData.trellis and #trellisFarming.modData.trellis.vines == 0 then
		-- FIXME: this gets called twice, once before GameTime has been loaded
		trellisFarming.modData.trellis.vines = nil
	end
	trellisFarming.convertOldModData()

	trellisFarming.vineplantings = {}
	for i=1,#trellisFarming.modData.trellis.vines do
		local data = trellisFarming.modData.trellis.vines[i]
		local vine = ISVine:new(data.x, data.y, data.z)
		vine:fromModData(data)
		table.insert(trellisFarming.vineplantings, vine)
		vine.modData = data
		noise('added vine '..vine.x..','..vine.y)
	end
end

trellisFarming.loadVinePlantingStart = function()
	trellisFarming.loadVinePlanting(isServer() or not isClient())
end

trellisFarming.loadVinePlantingGametime = function()
	trellisFarming.loadVinePlanting(not isClient())
end

trellisFarming.tooltip = function(tooltip, square)
    local playerObj = getSpecificPlayer(0)
    if playerObj and trellisFarming.getXp(playerObj) >= 4 then
        local farmingLevel = trellisFarming.getXp(playerObj)
        local vine = trellisFarming.getVineAt(square:getX(),square:getY(),square:getZ());
        if not vine or vine.typeOfSeed == "none" then
            return
        end
        local y = 5;
        local width = 200;
        tooltip:setWidth(width);
        tooltip:DrawTextureScaled(tooltip:getTexture(), 0, 0, tooltip:getWidth(), y + 60, 0.75);
        local title_rgb = ISTrellisInfo.getTitleColor(vine);
        local water_rgb = ISTrellisInfo.getWaterLvlColor(vine, farmingLevel);

        tooltip:DrawTextCentre(vine:getObject():getObjectName(), width / 2, y, title_rgb["r"], title_rgb["g"], title_rgb["b"], 1);
        y = y + 20;

        tooltip:DrawText(getText("Farming_Water_levels"), 5, y, water_rgb["r"], water_rgb["g"], water_rgb["b"], 1);
        tooltip:DrawTextRight(ISTrellisInfo.getWaterLvl(vine, farmingLevel), width - 5, y, water_rgb["r"], water_rgb["g"], water_rgb["b"], 1);
        y = y + 20;

        local lastWatedHour = ISTrellisInfo.getLastWatedHour(vine);
        local nowateredsince_rgb = ISTrellisInfo.getNoWateredSinceColor(vine, lastWatedHour, farmingLevel);
        tooltip:DrawText(getText("Farming_Last_time_watered") .. " : ", 5, y, 1, 1, 1, 1);
        lastWatedHour = lastWatedHour .. " " .. getText("Farming_Hours");
        tooltip:DrawTextRight(lastWatedHour, width - 5, y, nowateredsince_rgb["r"], nowateredsince_rgb["g"], nowateredsince_rgb["b"], 1);
        y = y + 20;

        tooltip:setHeight(y);
    end
end

Events.EveryTenMinutes.Add(trellisFarming.EveryTenMinutes)

--Events.OnGameStart.Add(trellisFarming.loadPlantingStart)
-- OnGameBoot is to handle soft-reset, no effect on client/sp
Events.OnGameBoot.Add(trellisFarming.loadVinePlantingStart)
Events.OnGameTimeLoaded.Add(trellisFarming.loadVinePlantingGametime)

--Events.ReuseGridsquare.Add(trellisFarming.reuseGridsquare)
--Events.LoadGridsquare.Add(trellisFarming.loadGridsquare)
Events.DoSpecialTooltip.Add(trellisFarming.tooltip)
