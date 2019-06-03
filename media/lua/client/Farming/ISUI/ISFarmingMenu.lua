--***********************************************************
--**                    ROBERT JOHNSON                     **
--**      Contextual inventory menu for farming stuff      **
--***********************************************************

ISFarmingMenu = {};
ISFarmingMenu.info = {};
ISFarmingMenu.GardeningSprayMilk = nil;
ISFarmingMenu.GardeningSprayCigarettes = nil;
ISFarmingMenu.cheat = false

ISFarmingMenu.doFarmingMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	if JoypadState.players[player+1] then
		local playerObj = getSpecificPlayer(player)
		local playerInv = playerObj:getInventory()
		if playerInv:contains("HandShovel") or playerInv:contains("Shovel") then
			if test then return ISWorldObjectContextMenu.setTest() end
			local handItem = playerObj:getPrimaryHandItem();
			context:addOption(getText("ContextMenu_Dig"), worldobjects, ISFarmingMenu.onPlow, playerObj, handItem)
		end
		for i,v in ipairs(worldobjects) do
			local plant = CFarmingSystem.instance:getLuaObjectOnSquare(v:getSquare())
			if plant then
				if test then return ISWorldObjectContextMenu.setTest() end
				context:addOption(getText("ContextMenu_Farming"), plant:getSquare(), ISFarmingMenu.onJoypadFarming, player)
				return
			end
		end
		return
	end

	return ISFarmingMenu.doFarmingMenu2(player, context, worldobjects, test)
end

ISFarmingMenu.itemSortByName = function(a,b)
    return not string.sort(a:getName(), b:getName());
end

ISFarmingMenu.doFarmingMenu2 = function(player, context, worldobjects, test)

	local handShovel = false;
	ISFarmingMenu.GardeningSprayMilk = nil;
	local fertilizer = false;
	local shovel = false;
	local handItem = getSpecificPlayer(player):getPrimaryHandItem();
	local canSeed = false;
	local canWater = false;
	local cureMildew = false;
	local cureFlies = false;
	local info = false;
	local canHarvest = false;
	local playerInv = getSpecificPlayer(player):getInventory();
	if playerInv:contains("HandShovel") then -- dig
		handShovel = true;
    end
	if playerInv:contains("Shovel") then -- shovel is used to remove plant
		shovel = true;
	end
    local sq = nil;
    local player = getSpecificPlayer(player);
	local currentPlant = nil;
	for i,v in ipairs(worldobjects) do
		local plant = CFarmingSystem.instance:getLuaObjectOnSquare(v:getSquare())
		if plant then
			if playerInv:contains("Fertilizer") or playerInv:contains("CompostBag") then -- fertilizer
				fertilizer = true;
			end
			if plant.state == "plow" then -- sow seed
				canSeed = true;
			end
			if plant.state == "seeded" then -- water the plant
				canWater = true;
			end
			if plant.state ~= "plow" then -- info
				info = true;
			end
			-- disease
			if plant.mildewLvl > 0 and playerInv:contains("GardeningSprayMilk") then -- mildew
				cureMildew = true;
			end
			if plant.fliesLvl > 0 and playerInv:contains("GardeningSprayCigarettes") then -- flies
				cureFlies = true;
			end
			-- harvest
			if plant:canHarvest() then
				canHarvest = true;
			end
			currentPlant = plant
			sq = v:getSquare();
			break
		end
	end

    if not JoypadState.players[player:getPlayerNum()+1] and ISFarmingMenu.canDigHere(worldobjects) then
        if handShovel or shovel then
            if test then return ISWorldObjectContextMenu.setTest() end
             context:addOption(getText("ContextMenu_Dig"), worldobjects, ISFarmingMenu.onPlow, player, handItem);
        else
            if(not player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):HasInjury() and not player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):HasInjury()) then
                if test then return ISWorldObjectContextMenu.setTest() end
                local option = context:addOption(getText("ContextMenu_DigWithHands"), worldobjects, ISFarmingMenu.onPlow, player, nil)
                local tooltip = ISWorldObjectContextMenu.addToolTip();
                tooltip.description = getText("ContextMenu_DigWithHandsTT");
                option.toolTip = tooltip;
            else
				if test then return ISWorldObjectContextMenu.setTest() end
                local option = context:addOption(getText("ContextMenu_DigWithHands"), worldobjects, ISFarmingMenu.onPlow, player, nil)
                option.notAvailable = true;
                local tooltip = ISWorldObjectContextMenu.addToolTip();
                tooltip.description = getText("ContextMenu_DamagedHands");
                option.toolTip = tooltip;
            end
        end
    end

	if fertilizer then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Fertilize"), worldobjects, ISFarmingMenu.onFertilize, handItem, currentPlant, sq, player);
	end
	if handItem and (handItem:getType() == "Shovel" or handItem:getType() == "HandShovel") and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISFarmingMenu.onShovel, handItem, currentPlant, player, sq);
	elseif shovel and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISFarmingMenu.onShovel, handItem, currentPlant, player, sq);
    elseif handShovel and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISFarmingMenu.onShovel, handItem, currentPlant, player, sq);
    end
	if info then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Info"), worldobjects, ISFarmingMenu.onInfo, currentPlant, sq, player);
	end
	if canHarvest then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Harvest"), worldobjects, ISFarmingMenu.onHarvest, currentPlant, sq, player);
	end
	-- plant seed subMenu
    local seedsList = ISFarmingMenu.haveSeed(player);
	if canSeed and seedsList then
		if test then return ISWorldObjectContextMenu.setTest() end
		local seedOption = context:addOption(getText("ContextMenu_Sow_Seed"), worldobjects, nil);
		-- now do the subMenu
		local subMenu = context:getNew(context);
		-- carrots need 12 seeds
		local carrotOption = subMenu:addOption(getText("Farming_Carrots"), worldobjects, ISFarmingMenu.onSeed, seedsList.carrotsSeed, farming_vegetableconf.props["Carrots"].seedsRequired, "Carrots", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.carrotsSeed, "Carrots", carrotOption);
		-- corn need 10 seeds
		local cornOption = subMenu:addOption(getText("Farming_Corn"), worldobjects, ISFarmingMenu.onSeed, seedsList.cornSeed, farming_vegetableconf.props["Corn"].seedsRequired, "Corn", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.cornSeed, "Corn", cornOption);
		-- broccoli need 6 seeds
		local broccoliOption = subMenu:addOption(getText("Farming_Broccoli"), worldobjects, ISFarmingMenu.onSeed, seedsList.broccoliSeed, farming_vegetableconf.props["Broccoli"].seedsRequired, "Broccoli", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.broccoliSeed, "Broccoli", broccoliOption);
		-- leek need 9 seeds
		local LeekOption = subMenu:addOption(getText("Farming_Leek"), worldobjects, ISFarmingMenu.onSeed, seedsList.LeekSeed, farming_vegetableconf.props["Leek"].seedsRequired, "Leek", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.LeekSeed, "Leek", LeekOption);
		-- lettuce need 9 seeds
		local LettuceOption = subMenu:addOption(getText("Farming_Lettuce"), worldobjects, ISFarmingMenu.onSeed, seedsList.LettuceSeed, farming_vegetableconf.props["Lettuce"].seedsRequired, "Lettuce", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.LettuceSeed, "Lettuce", LettuceOption);
		-- onions need 4 seeds
		local OnionOption = subMenu:addOption(getText("Farming_Onion"), worldobjects, ISFarmingMenu.onSeed, seedsList.OnionSeed, farming_vegetableconf.props["Onion"].seedsRequired, "Onion", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.OnionSeed, "Onion", OnionOption);
		-- peanuts need 4 seeds
		local PeanutOption = subMenu:addOption(getText("Farming_Peanut"), worldobjects, ISFarmingMenu.onSeed, seedsList.PeanutSeed, farming_vegetableconf.props["Peanut"].seedsRequired, "Peanut", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.PeanutSeed, "Peanut", PeanutOption);
		-- redradish need 12 seeds
		local radishesOption = subMenu:addOption(getText("Farming_Radishes"), worldobjects, ISFarmingMenu.onSeed, seedsList.redRadishSeed, farming_vegetableconf.props["Radishes"].seedsRequired, "Radishes", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.redRadishSeed, "Radishes", radishesOption);
		-- strawerry need 6 seeds
		local strawberryOption = subMenu:addOption(getText("Farming_Strawberry_plant"), worldobjects, ISFarmingMenu.onSeed, seedsList.strawberrySeed, farming_vegetableconf.props["Strawberry plant"].seedsRequired, "Strawberry plant", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.strawberrySeed, "Strawberry plant", strawberryOption);
		-- tomatoes need 4 seeds
		local tomatoOption = subMenu:addOption(getText("Farming_Tomato_Vine"), worldobjects, ISFarmingMenu.onSeed, seedsList.tomatoSeed, farming_vegetableconf.props["Tomato"].seedsRequired, "Tomato", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.tomatoSeed, "Tomato", tomatoOption);
		-- potatoes need 4 seeds
		local potatoOption = subMenu:addOption(getText("Farming_Potatoes"), worldobjects, ISFarmingMenu.onSeed, seedsList.potatoSeed, farming_vegetableconf.props["Potatoes"].seedsRequired, "Potatoes", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.potatoSeed, "Potatoes", potatoOption);
		-- cabbage need 9 seeds
		local cabbageOption = subMenu:addOption(getText("Farming_Cabbages"), worldobjects, ISFarmingMenu.onSeed, seedsList.cabbageSeed, farming_vegetableconf.props["Cabbages"].seedsRequired, "Cabbages", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.cabbageSeed, "Cabbages", cabbageOption);
		-- pumpkin need 4 seeds
		local PumpkinOption = subMenu:addOption(getText("Farming_Pumpkin"), worldobjects, ISFarmingMenu.onSeed, seedsList.PumpkinSeed, farming_vegetableconf.props["Pumpkin"].seedsRequired, "Pumpkin", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.PumpkinSeed, "Pumpkin", PumpkinOption);
		-- watermelon need 4 seeds
		local WatermelonOption = subMenu:addOption(getText("Farming_Watermelon"), worldobjects, ISFarmingMenu.onSeed, seedsList.WatermelonSeed, farming_vegetableconf.props["Watermelon"].seedsRequired, "Watermelon", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.WatermelonSeed, "Watermelon", WatermelonOption);
		-- zucchini need 12 seeds
		local ZucchiniOption = subMenu:addOption(getText("Farming_Zucchini"), worldobjects, ISFarmingMenu.onSeed, seedsList.ZucchiniSeed, farming_vegetableconf.props["Zucchini"].seedsRequired, "Zucchini", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#seedsList.ZucchiniSeed, "Zucchini", ZucchiniOption);
		-- we add the subMenu to our current option (Seed)
		context:addSubMenu(seedOption, subMenu);
	end
	-- water your plant
	if canWater and currentPlant.waterLvl < 100 then
		local waterSources = {}
		if handItem and handItem:isWaterSource() and math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) > 0 then
			table.insert(waterSources, handItem)
		else
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:isWaterSource() and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					table.insert(waterSources, item)
				end
			end
		end
		-- we get how many use we can do on our item
		if #waterSources > 0 then
			if test then return ISWorldObjectContextMenu.setTest() end
			local waterOption = context:addOption(getText("ContextMenu_Water"), worldobjects, nil);
			local subMenuWater = context
			if #waterSources > 1 then
				subMenuWater = context:getNew(context);
				context:addSubMenu(waterOption, subMenuWater);
				table.sort(waterSources, ISFarmingMenu.itemSortByName)
			end
			for index,handItem in ipairs(waterSources) do
				local use = math.floor(handItem:getUsedDelta()/handItem:getUseDelta());
				-- prepare subMenu for water (we make a submenu for every lvl 5 by 5)
				local subMenu = context:getNew(subMenuWater);
				-- if waterLvl missing is below the max use of the water plant (so we can't have the option for 40 water if the plant have 80)
				local missingWaterUse = math.ceil((100 - currentPlant.waterLvl) / 5);
				if missingWaterUse < use then
					use = missingWaterUse;
				end
				subMenu:addOption(getText("ContextMenu_Full", use * 5), worldobjects, ISFarmingMenu.onWater, use, handItem, sq, player);
				if use > 10 then
					use = 10
				else
					use = use - 1
				end
				for i=use,1,-1 do
					subMenu:addOption(tostring(i * 5), worldobjects, ISFarmingMenu.onWater, i, handItem, sq, player);
				end
				if #waterSources > 1 then
					waterOption = subMenuWater:addOption(handItem:getName(), worldobjects, nil);
				end
				-- we add the subMenu to our current option (Water)
				context:addSubMenu(waterOption, subMenu);
			end
		end
	end
	-- disease
	if cureMildew or cureFlies then
		-- we try to get the cure for mildew
		if not handItem or handItem:getType() ~= "GardeningSprayMilk" or math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) == 0 then
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:getType() == "GardeningSprayMilk" and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					ISFarmingMenu.GardeningSprayMilk = item;
					break;
				end
			end
		else
			ISFarmingMenu.GardeningSprayMilk = handItem;
		end
		-- we try to get the cure for flies
		ISFarmingMenu.GardeningSprayCigarettes = nil
		if not handItem or handItem:getType() ~= "GardeningSprayCigarettes" or math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) == 0 then
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:getType() == "GardeningSprayCigarettes" and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					ISFarmingMenu.GardeningSprayCigarettes = item;
					break;
				end
			end
		else
			ISFarmingMenu.GardeningSprayCigarettes = handItem;
		end
		if ISFarmingMenu.GardeningSprayMilk or ISFarmingMenu.GardeningSprayCigarettes then
			if test then return ISWorldObjectContextMenu.setTest() end
			local diseaseOption = context:addOption(getText("ContextMenu_Treat_Problem"), worldobjects, nil);
			local subMenuCure = context:getNew(context);
			context:addSubMenu(diseaseOption, subMenuCure);
			if ISFarmingMenu.GardeningSprayMilk and currentPlant.mildewLvl > 0 then
				-- we get how many use we can do on our item
				local use = math.floor(ISFarmingMenu.GardeningSprayMilk:getUsedDelta()/ISFarmingMenu.GardeningSprayMilk:getUseDelta());
				if use > 0 then
					-- prepare subMenu for mildew
					local mildewMenu = subMenuCure:addOption(getText("Farming_Mildew"), worldobjects, nil);
					-- now submenu for lvl of mildew you want to cure (5 by 5)
					local subMenuMildew = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local mildewLvl = 0;
					for i=1, use do
						mildewLvl = i * 5;
						subMenuMildew:addOption(mildewLvl .. "", worldobjects, ISFarmingMenu.onMildewCure, i, sq, player);
					end
					context:addSubMenu(mildewMenu, subMenuMildew);
				end
			end
			if ISFarmingMenu.GardeningSprayCigarettes and currentPlant.fliesLvl > 0  then
				-- we get how many use we can do on our item
				local use = math.floor(ISFarmingMenu.GardeningSprayCigarettes:getUsedDelta()/ISFarmingMenu.GardeningSprayCigarettes:getUseDelta());
				if use > 0 then
					-- prepare subMenu for mildew
					local flieMenu = subMenuCure:addOption(getText("Farming_Pest_Flies"), worldobjects, nil);
					-- now submenu for lvl of flies you want to cure (5 by 5)
					local subMenuFlie = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local fliesLvl = 0;
					for i=1, use do
						fliesLvl = i * 5;
						subMenuFlie:addOption(fliesLvl .. "", worldobjects, ISFarmingMenu.onFliesCure, i, sq, player);
					end
					context:addSubMenu(flieMenu, subMenuFlie);
				end
			end
		end
	end
	if ISFarmingMenu.cheat and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
		local option = context:addOption("Cheat", worldobjects, nil);
		local subMenu = context:getNew(context);
		context:addSubMenu(option, subMenu);
		subMenu:addOption("Grow", worldobjects, ISFarmingMenu.onCheatGrow, currentPlant);
		subMenu:addOption("Water To Max", worldobjects, ISFarmingMenu.onCheatWater, currentPlant);
		subMenu:addOption("Zero Water", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'waterLvl', count = -currentPlant.waterLvl });
		subMenu:addOption("Flies +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'fliesLvl', count = 5 });
		subMenu:addOption("Flies -5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'fliesLvl', count = -5 });
		subMenu:addOption("Mildew +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'mildewLvl', count = 5 });
		subMenu:addOption("Mildew -5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'mildewLvl', count = -5 });
		subMenu:addOption("Aphids +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'aphidLvl', count = 5 });
		subMenu:addOption("Aphids -5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'aphidLvl', count = -5 });
	end
end

ISFarmingMenu.canDigHere = function(worldObjects)
	local squares = {}
	local didSquare = {}
	for _,worldObj in ipairs(worldObjects) do
		if not didSquare[worldObj:getSquare()] then
			table.insert(squares, worldObj:getSquare())
			didSquare[worldObj:getSquare()] = true
		end
	end
	for _,square in ipairs(squares) do
		for i=1,square:getObjects():size() do
			local obj = square:getObjects():get(i-1);
			if obj:getTextureName() and (luautils.stringStarts(obj:getTextureName(), "floors_exterior_natural") or
					luautils.stringStarts(obj:getTextureName(), "blends_natural_01")) then
				return true
			end
		end
	end
	return false
end

ISFarmingMenu.canPlow = function(seedAvailable, typeOfSeed, option)
	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);
	option.toolTip = tooltip;
	tooltip:setName(getText("Farming_" .. typeOfSeed));
	local result = true;
	tooltip.description = getText("Farming_Tooltip_MinWater") .. farming_vegetableconf.props[typeOfSeed].waterLvl .. "";
	if farming_vegetableconf.props[typeOfSeed].waterLvlMax then
		tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_MaxWater") ..  farming_vegetableconf.props[typeOfSeed].waterLvlMax;
	end
	tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_TimeOfGrow") .. math.floor((farming_vegetableconf.props[typeOfSeed].timeToGrow * 7) / 24) .. " " .. getText("IGUI_Gametime_days");
    local waterPlus = "";
    if farming_vegetableconf.props[typeOfSeed].waterLvlMax then
        waterPlus = "-" .. farming_vegetableconf.props[typeOfSeed].waterLvlMax;
    end
    tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_AverageWater") .. farming_vegetableconf.props[typeOfSeed].waterLvl .. waterPlus;
	local rgb = "";
	if seedAvailable < farming_vegetableconf.props[typeOfSeed].seedsRequired then
		result = false;
		rgb = "<RGB:1,0,0>";
	end
	tooltip.description = tooltip.description .. " <LINE> " .. rgb .. getText("Farming_Tooltip_RequiredSeeds") .. seedAvailable .. "/" .. farming_vegetableconf.props[typeOfSeed].seedsRequired;
	tooltip:setTexture(farming_vegetableconf.props[typeOfSeed].texture);
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
    end
    tooltip:setWidth(170);
end

ISFarmingMenu.onHarvest = function(worldobjets, plantToharvest, sq, player)
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
		else
			return;
		end
	end
	ISTimedActionQueue.add(ISHarvestPlantAction:new(player, plantToharvest, 100));
end

ISFarmingMenu.onMildewCure = function(worldobjets, uses, sq, player)
	if player:getPrimaryHandItem() ~= ISFarmingMenu.GardeningSprayMilk then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, ISFarmingMenu.GardeningSprayMilk, 50, true));
	end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISCureMildewAction:new(player, ISFarmingMenu.GardeningSprayMilk, uses, basicFarming.getCurrentPlanting(sq), 10 * (uses * 5)));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISCureMildewAction:new(player, ISFarmingMenu.GardeningSprayMilk, uses, basicFarming.getCurrentPlanting(sq), 10 * (uses * 5)));
	end
end

ISFarmingMenu.onFliesCure = function(worldobjets, uses, sq, player)
	if player:getPrimaryHandItem() ~= ISFarmingMenu.GardeningSprayCigarettes then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, ISFarmingMenu.GardeningSprayCigarettes, 50, true));
	end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISCureFliesAction:new(player, ISFarmingMenu.GardeningSprayCigarettes, uses, basicFarming.getCurrentPlanting(sq), 10 * (uses * 5)));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISCureFliesAction:new(player, ISFarmingMenu.GardeningSprayCigarettes, uses, basicFarming.getCurrentPlanting(sq), 10 * (uses * 5)));
	end
end

ISFarmingMenu.onInfo = function(worldobjects, plant, sq, player)
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISPlantInfoAction:new(player, plant));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISPlantInfoAction:new(player, plant));
	end
end

ISFarmingMenu.onWater = function(worldobjects, uses, handItem, sq, player)
	if player:getPrimaryHandItem() ~= handItem then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, handItem, 50, true));
	end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISWaterPlantAction:new(player, handItem, uses, sq, 3 * uses));
			return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISWaterPlantAction:new(player, handItem, uses, sq, 3 * uses));
	end
end

ISFarmingMenu.onSeed = function(worldobjetcs, seeds, nbOfSeed, typeOfSeed, plant, sq, player)
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISSeedAction:new(player, seeds, nbOfSeed, typeOfSeed, plant, 40));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISSeedAction:new(player, seeds, nbOfSeed, typeOfSeed, plant, 40));
	end
end

ISFarmingMenu.haveSeed = function(player)
    local seedsList = {};
    seedsList.carrotsSeed = {};
    seedsList.cornSeed = {};
    seedsList.broccoliSeed = {};
    seedsList.LeekSeed = {};
    seedsList.LettuceSeed = {};
    seedsList.OnionSeed = {};
    seedsList.PeanutSeed = {};
    seedsList.redRadishSeed = {};
    seedsList.strawberrySeed = {};
    seedsList.tomatoSeed = {};
    seedsList.potatoSeed = {};
    seedsList.cabbageSeed = {};
	seedsList.PumpkinSeed = {};
	seedsList.WatermelonSeed = {};
	seedsList.ZucchiniSeed = {};
	-- we gonna test if we can seed the plowed land
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "CarrotSeed" or item:getType() == "CarrotSeed50" then
			table.insert(seedsList.carrotsSeed, item);
		end
		if item:getType() == "HCCornseeds" or item:getType() == "HCCornseedspacket" then
			table.insert(seedsList.cornSeed, item);
		end
		if item:getType() == "BroccoliSeed" or item:getType() == "BroccoliSeed50" then
			table.insert(seedsList.broccoliSeed, item);
		end
		if item:getType() == "HCLeekseeds" or item:getType() == "HCLeekseedspacket" then
			table.insert(seedsList.LeekSeed, item);
		end
		if item:getType() == "HCLettuceseeds" or item:getType() == "HCLettuceseedspacket" then
			table.insert(seedsList.LettuceSeed, item);
		end
		if item:getType() == "HCOnionseeds" or item:getType() == "HCOnionseedspacket" then
			table.insert(seedsList.OnionSeed, item);
		end
		if item:getType() == "HCPeanutseeds" or item:getType() == "HCPeanutseedspacket" then
			table.insert(seedsList.PeanutSeed, item);
		end
		if item:getType() == "RedRadishSeed" or item:getType() == "RedRadishSeed50" then
			table.insert(seedsList.redRadishSeed, item);
		end
		if item:getType() == "StrewberrieSeed" or item:getType() == "StrewberrieSeed50" then
			table.insert(seedsList.strawberrySeed, item);
		end
		if item:getType() == "TomatoSeed" or item:getType() == "TomatoSeed50" then
			table.insert(seedsList.tomatoSeed, item);
		end
		if item:getType() == "PotatoSeed" or item:getType() == "PotatoSeed50" then
			table.insert(seedsList.potatoSeed, item);
		end
		if item:getType() == "CabbageSeed" or item:getType() == "CabbageSeed50" then
			table.insert(seedsList.cabbageSeed, item);
		end
		if item:getType() == "HCPumpkinseeds" or item:getType() == "HCPumpkinseedspacket" then
			table.insert(seedsList.PumpkinSeed, item);
		end
		if item:getType() == "HCWatermelonseeds" or item:getType() == "HCWatermelonseedspacket" then
			table.insert(seedsList.WatermelonSeed, item);
		end
		if item:getType() == "HCZucchiniseeds" or item:getType() == "HCZucchiniseedspacket" then
			table.insert(seedsList.ZucchiniSeed, item);
		end
	end
--~ 	if #ISFarmingMenu.carrotsSeed >= 12 or #ISFarmingMenu.broccoliSeed > 6 or #ISFarmingMenu.redRadishSeed > 12 or #ISFarmingMenu.strawberrySeed > 6 or #ISFarmingMenu.tomatoSeed > 4 or #ISFarmingMenu.potatoSeed > 4 or #ISFarmingMenu.cabbageSeed > 9 then
		return seedsList;
--~ 	end
--~ 	return false;
end

ISFarmingMenu.onPlow = function(worldobjects, player, handItem)
	local bo = farmingPlot:new(handItem, player);
	bo.player = player:getPlayerNum()
	getCell():setDrag(bo, bo.player)
end

ISFarmingMenu.onShovel = function(worldobjects, handItem, plant, player, sq)
	if handItem and (handItem:getType() == "Shovel" or handItem:getType() == "HandShovel") then
		-- use the equipped item
    elseif player:getInventory():contains("Shovel") then
        handItem = ISWorldObjectContextMenu.equip(player, handItem, "Shovel", true);
    else
        handItem = ISWorldObjectContextMenu.equip(player, handItem, "HandShovel", true);
    end
--    getCell():setDrag(farmingPlot:new(handItem));
    if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
        local adjacent = AdjacentFreeTileFinder.Find(sq, player);
        if adjacent ~= nil then
            ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
            ISTimedActionQueue.add(ISShovelAction:new(player, handItem, plant, 40));
            return;
        else
            return;
        end
    else
        ISTimedActionQueue.add(ISShovelAction:new(player, handItem, plant, 40));
    end
end

ISFarmingMenu.onFertilize = function(worldobjects, handItem, plant, sq, player)
    -- close the farming info window to avoid concurrent gorwing phase problem
    if player:getInventory():contains("CompostBag") then
        handItem = ISWorldObjectContextMenu.equip(player, handItem, "CompostBag", true);
    else
	    handItem = ISWorldObjectContextMenu.equip(player, handItem, "Fertilizer", true);
    end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISFertilizeAction:new(player, handItem, plant, 40));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISFertilizeAction:new(player, handItem, plant, 40));
	end
end

ISFarmingMenu.onCheatGrow = function(worldobjects, plant)
	local hours = basicFarming.hoursElapsed - plant.nextGrowing
	local args = { var = 'nextGrowing', count = hours }
	ISFarmingMenu.onCheat(worldobjects, plant, args)
end

function ISFarmingMenu.onCheatWater(worldobjects, plant)
	local diff = 100 - plant.waterLvl
	if plant.waterNeededMax then
		diff = plant.waterNeededMax - plant.waterLvl
	end
	local args = { var = 'waterLvl', count = diff }
	ISFarmingMenu.onCheat(worldobjects, plant, args)
end

function ISFarmingMenu.onJoypadFarming(square, player)
	local bo = ISFarmingCursor:new(getSpecificPlayer(player))
	getCell():setDrag(bo, bo.player)
	bo.xJoypad = square:getX()
	bo.yJoypad = square:getY()
	bo.zJoypad = square:getZ()
	return
end

ISFarmingMenu.onCheat = function(worldobjects, plant, args)
	if isClient() then
		args.x = plant.x
		args.y = plant.y
		args.z = plant.z
		sendClientCommand('farming', 'cheat', args)
	else
		plant[args.var] = plant[args.var] + args.count
		if plant[args.var] < 0 then plant[args.var] = 0 end
		if plant[args.var] > 100 then plant[args.var] = 100 end
		basicFarming.saveData(plant)
	end
end

Events.OnFillWorldObjectContextMenu.Add(ISFarmingMenu.doFarmingMenu);
