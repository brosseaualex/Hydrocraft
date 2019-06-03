--***********************************************************
--**                    ROBERT JOHNSON                     **
--**      Contextual inventory menu for farming stuff      **
--***********************************************************

ISTrellisMenu = {};
ISTrellisMenu.vineinfo = {};
ISTrellisMenu.GardeningSprayMilk = nil;
ISTrellisMenu.GardeningSprayCigarettes = nil;
ISTrellisMenu.cheat = false

ISTrellisMenu.doTrellisMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	if JoypadState.players[player+1] then
		local playerObj = getSpecificPlayer(player)
		local playerInv = playerObj:getInventory()
		if playerInv:contains("TrellisKit") and playerInv:contains("HandShovel") then
			if test then return ISWorldObjectContextMenu.setTest() end
			local handItem = playerObj:getPrimaryHandItem();
			context:addOption(getText("ContextMenu_Build_Trellis"), worldobjects, ISTrellisMenu.onBuild, playerObj, handItem)
		end
		for i,v in ipairs(worldobjects) do
			local vine = trellisFarming.getCurrentVinePlanting(v:getSquare())
			if vine then
				if test then return ISWorldObjectContextMenu.setTest() end
				context:addOption(getText("ContextMenu_Trellis"), vine:getSquare(), ISTrellisMenu.onJoypadFarming, player)
				return
			end
		end
		return
	end

	return ISTrellisMenu.doTrellisMenu2(player, context, worldobjects, test)
end

ISTrellisMenu.itemSortByName = function(a,b)
    return not string.sort(a:getName(), b:getName());
end

ISTrellisMenu.doTrellisMenu2 = function(player, context, worldobjects, test)

	local trellisKit = false;
	ISTrellisMenu.GardeningSprayMilk = nil;
	local fertilizer = false;
	local shovel = false;
	local handItem = getSpecificPlayer(player):getPrimaryHandItem();
	local canSeed = false;
	local canWater = false;
	local cureMildew = false;
	local cureFlies = false;
	local vineinfo = false;
	local canHarvest = false;
	local playerInv = getSpecificPlayer(player):getInventory();
	if playerInv:contains("TrellisKit") and playerInv:contains("HandShovel") then -- dig
		trellisKit = true;
    end
	if playerInv:contains("HandShovel") then
		handShovel = true;
    end
	if playerInv:contains("Shovel") then -- shovel is used to remove plant
		shovel = true;
	end
	
    local sq = nil;
    local player = getSpecificPlayer(player);
	local currentVine = nil;
	for i,v in ipairs(worldobjects) do
		local vine = trellisFarming.getCurrentVinePlanting(v:getSquare())
		if vine then
			if playerInv:contains("Fertilizer") or playerInv:contains("CompostBag") then -- fertilizer
				fertilizer = true;
			end
			if vine.state == "trellised" then -- sow seed
				canSeed = true;
			end
			if vine.state == "seeded" then -- water the vine
				canWater = true;
			end
			if vine.state ~= "trellised" then
				vineinfo = true;
			end
			-- disease
			if vine.mildewLvl > 0 and playerInv:contains("GardeningSprayMilk") then -- mildew
				cureMildew = true;
			end
			if vine.fliesLvl > 0 and playerInv:contains("GardeningSprayCigarettes") then -- flies
				cureFlies = true;
			end
			-- harvest
			if vine:canHarvest() then
				canHarvest = true;
			end
			currentVine = vine
			sq = v:getSquare();
			break
		end
	end

    if not JoypadState.players[player:getPlayerNum()+1] and ISTrellisMenu.canBuildHere(worldobjects) then
        if trellisKit then
            if test then return ISWorldObjectContextMenu.setTest() end
             context:addOption(getText("ContextMenu_Build_Trellis"), worldobjects, ISTrellisMenu.onBuild, player, handItem);
        end
    end

	if fertilizer then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Fertilize"), worldobjects, ISTrellisMenu.onFertilize, handItem, currentVine, sq, player);
	end
	if handItem and (handItem:getType() == "Shovel" or handItem:getType() == "HandShovel") and currentVine then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISTrellisMenu.onShovel, handItem, currentVine, player, sq);
	elseif shovel and currentVine then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISTrellisMenu.onShovel, handItem, currentVine, player, sq);
    elseif handShovel and currentVine then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISTrellisMenu.onShovel, handItem, currentVine, player, sq);
    end
	if vineinfo then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Info"), worldobjects, ISTrellisMenu.onVineInfo, currentVine, sq, player);
	end
	if canHarvest then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Harvest"), worldobjects, ISTrellisMenu.onHarvest, currentVine, sq, player);
	end
	
    local seedsList = ISTrellisMenu.haveSeed(player);
	if canSeed and seedsList then
		if test then return ISWorldObjectContextMenu.setTest() end
		local seedOption = context:addOption(getText("ContextMenu_Sow_Seed"), worldobjects, nil);
		local subMenu = context:getNew(context);
		local BeanOption = subMenu:addOption(getText("Farming_Bean"), worldobjects, ISTrellisMenu.onSeed, seedsList.BeanSeed, trellis_vegetableconf.props["Bean"].seedsRequired, "Bean", currentVine, sq, player);
		ISTrellisMenu.canBuild(#seedsList.BeanSeed, "Bean", BeanOption);
		local BellPepperOption = subMenu:addOption(getText("Farming_BellPepper"), worldobjects, ISTrellisMenu.onSeed, seedsList.BellPepperSeed, trellis_vegetableconf.props["BellPepper"].seedsRequired, "BellPepper", currentVine, sq, player);
		ISTrellisMenu.canBuild(#seedsList.BellPepperSeed, "BellPepper", BellPepperOption);
		local EggplantOption = subMenu:addOption(getText("Farming_Eggplant"), worldobjects, ISTrellisMenu.onSeed, seedsList.EggplantSeed, trellis_vegetableconf.props["Eggplant"].seedsRequired, "Eggplant", currentVine, sq, player);
		ISTrellisMenu.canBuild(#seedsList.EggplantSeed, "Eggplant", EggplantOption);
		local GrapeOption = subMenu:addOption(getText("Farming_Grape"), worldobjects, ISTrellisMenu.onSeed, seedsList.GrapeSeed, trellis_vegetableconf.props["Grape"].seedsRequired, "Grape", currentVine, sq, player);
		ISTrellisMenu.canBuild(#seedsList.GrapeSeed, "Grape", GrapeOption);
		local PeaOption = subMenu:addOption(getText("Farming_Pea"), worldobjects, ISTrellisMenu.onSeed, seedsList.PeaSeed, trellis_vegetableconf.props["Pea"].seedsRequired, "Pea", currentVine, sq, player);
		ISTrellisMenu.canBuild(#seedsList.PeaSeed, "Pea", PeaOption);
		context:addSubMenu(seedOption, subMenu);
	end
	-- water your plant
	if canWater and currentVine.waterLvl < 100 then
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
		if #waterSources > 0 then
			if test then return ISWorldObjectContextMenu.setTest() end
			local waterOption = context:addOption(getText("ContextMenu_Water"), worldobjects, nil);
			local subMenuWater = context
			if #waterSources > 1 then
				subMenuWater = context:getNew(context);
				context:addSubMenu(waterOption, subMenuWater);
				table.sort(waterSources, ISTrellisMenu.itemSortByName)
			end
			for index,handItem in ipairs(waterSources) do
				local use = math.floor(handItem:getUsedDelta()/handItem:getUseDelta());
				local subMenu = context:getNew(subMenuWater);
				local missingWaterUse = math.ceil((100 - currentVine.waterLvl) / 5);
				if missingWaterUse < use then
					use = missingWaterUse;
				end
				subMenu:addOption(getText("ContextMenu_Full", use * 5), worldobjects, ISTrellisMenu.onWater, use, handItem, sq, player);
				if use > 10 then
					use = 10
				else
					use = use - 1
				end
				for i=use,1,-1 do
					subMenu:addOption(tostring(i * 5), worldobjects, ISTrellisMenu.onWater, i, handItem, sq, player);
				end
				if #waterSources > 1 then
					waterOption = subMenuWater:addOption(handItem:getName(), worldobjects, nil);
				end
				context:addSubMenu(waterOption, subMenu);
			end
		end
	end
	
	if cureMildew or cureFlies then
		if not handItem or handItem:getType() ~= "GardeningSprayMilk" or math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) == 0 then
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:getType() == "GardeningSprayMilk" and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					ISTrellisMenu.GardeningSprayMilk = item;
					break;
				end
			end
		else
			ISTrellisMenu.GardeningSprayMilk = handItem;
		end
		ISTrellisMenu.GardeningSprayCigarettes = nil
		if not handItem or handItem:getType() ~= "GardeningSprayCigarettes" or math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) == 0 then
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:getType() == "GardeningSprayCigarettes" and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					ISTrellisMenu.GardeningSprayCigarettes = item;
					break;
				end
			end
		else
			ISTrellisMenu.GardeningSprayCigarettes = handItem;
		end
		if ISTrellisMenu.GardeningSprayMilk or ISTrellisMenu.GardeningSprayCigarettes then
			if test then return ISWorldObjectContextMenu.setTest() end
			local diseaseOption = context:addOption(getText("ContextMenu_Treat_Problem"), worldobjects, nil);
			local subMenuCure = context:getNew(context);
			context:addSubMenu(diseaseOption, subMenuCure);
			if ISTrellisMenu.GardeningSprayMilk and currentVine.mildewLvl > 0 then
				local use = math.floor(ISTrellisMenu.GardeningSprayMilk:getUsedDelta()/ISTrellisMenu.GardeningSprayMilk:getUseDelta());
				if use > 0 then
					local mildewMenu = subMenuCure:addOption(getText("Farming_Mildew"), worldobjects, nil);
					local subMenuMildew = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local mildewLvl = 0;
					for i=1, use do
						mildewLvl = i * 5;
						subMenuMildew:addOption(mildewLvl .. "", worldobjects, ISTrellisMenu.onMildewCure, i, sq, player);
					end
					context:addSubMenu(mildewMenu, subMenuMildew);
				end
			end
			if ISTrellisMenu.GardeningSprayCigarettes and currentVine.fliesLvl > 0  then
				local use = math.floor(ISTrellisMenu.GardeningSprayCigarettes:getUsedDelta()/ISTrellisMenu.GardeningSprayCigarettes:getUseDelta());
				if use > 0 then
					local flieMenu = subMenuCure:addOption(getText("Farming_Pest_Flies"), worldobjects, nil);
					local subMenuFlie = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local fliesLvl = 0;
					for i=1, use do
						fliesLvl = i * 5;
						subMenuFlie:addOption(fliesLvl .. "", worldobjects, ISTrellisMenu.onFliesCure, i, sq, player);
					end
					context:addSubMenu(flieMenu, subMenuFlie);
				end
			end
		end
	end
	if ISTrellisMenu.cheat and currentVine then
		if test then return ISWorldObjectContextMenu.setTest() end
		local option = context:addOption("Cheat", worldobjects, nil);
		local subMenu = context:getNew(context);
		context:addSubMenu(option, subMenu);
		subMenu:addOption("Grow", worldobjects, ISTrellisMenu.onCheatGrow, currentVine);
		subMenu:addOption("Water To Max", worldobjects, ISTrellisMenu.onCheatWater, currentVine);
		subMenu:addOption("Zero Water", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'waterLvl', count = -currentVine.waterLvl });
		subMenu:addOption("Flies +5", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'fliesLvl', count = 5 });
		subMenu:addOption("Flies -5", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'fliesLvl', count = -5 });
		subMenu:addOption("Mildew +5", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'mildewLvl', count = 5 });
		subMenu:addOption("Mildew -5", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'mildewLvl', count = -5 });
		subMenu:addOption("Aphids +5", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'aphidLvl', count = 5 });
		subMenu:addOption("Aphids -5", worldobjects, ISTrellisMenu.onCheat, currentVine, { var = 'aphidLvl', count = -5 });
	end
end

ISTrellisMenu.canBuildHere = function(worldObjects)
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

ISTrellisMenu.canBuild = function(seedAvailable, typeOfSeed, option)
	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);
	option.toolTip = tooltip;
	tooltip:setName(getText("Farming_" .. typeOfSeed));
	local result = true;
	tooltip.description = getText("Farming_Tooltip_MinWater") .. trellis_vegetableconf.props[typeOfSeed].waterLvl .. "";
	if trellis_vegetableconf.props[typeOfSeed].waterLvlMax then
		tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_MaxWater") ..  trellis_vegetableconf.props[typeOfSeed].waterLvlMax;
	end
	tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_TimeOfGrow") .. math.floor((trellis_vegetableconf.props[typeOfSeed].timeToGrow * 7) / 24) .. " " .. getText("IGUI_Gametime_days");
    local waterPlus = "";
    if trellis_vegetableconf.props[typeOfSeed].waterLvlMax then
        waterPlus = "-" .. trellis_vegetableconf.props[typeOfSeed].waterLvlMax;
    end
    tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_AverageWater") .. trellis_vegetableconf.props[typeOfSeed].waterLvl .. waterPlus;
	local rgb = "";
	if seedAvailable < trellis_vegetableconf.props[typeOfSeed].seedsRequired then
		result = false;
		rgb = "<RGB:1,0,0>";
	end
	tooltip.description = tooltip.description .. " <LINE> " .. rgb .. getText("Farming_Tooltip_RequiredSeeds") .. seedAvailable .. "/" .. trellis_vegetableconf.props[typeOfSeed].seedsRequired;
	tooltip:setTexture(trellis_vegetableconf.props[typeOfSeed].texture);
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
    end
    tooltip:setWidth(170);
end

ISTrellisMenu.onHarvest = function(worldobjects, vineToharvest, sq, player)
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
		else
			return;
		end
	end
	ISTimedActionQueue.add(ISHarvestVineAction:new(player, vineToharvest, 100));
end

ISTrellisMenu.onMildewCure = function(worldobjects, uses, sq, player)
	if player:getPrimaryHandItem() ~= ISTrellisMenu.GardeningSprayMilk then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, ISTrellisMenu.GardeningSprayMilk, 50, true));
	end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISCureMildewAction:new(player, ISTrellisMenu.GardeningSprayMilk, uses, trellisFarming.getCurrentVinePlanting(sq), 10 * (uses * 5)));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISCureMildewAction:new(player, ISTrellisMenu.GardeningSprayMilk, uses, trellisFarming.getCurrentVinePlanting(sq), 10 * (uses * 5)));
	end
end

ISTrellisMenu.onFliesCure = function(worldobjects, uses, sq, player)
	if player:getPrimaryHandItem() ~= ISTrellisMenu.GardeningSprayCigarettes then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, ISTrellisMenu.GardeningSprayCigarettes, 50, true));
	end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISCureFliesAction:new(player, ISTrellisMenu.GardeningSprayCigarettes, uses, trellisFarming.getCurrentVinePlanting(sq), 10 * (uses * 5)));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISCureFliesAction:new(player, ISTrellisMenu.GardeningSprayCigarettes, uses, trellisFarming.getCurrentVinePlanting(sq), 10 * (uses * 5)));
	end
end

ISTrellisMenu.onVineInfo = function(worldobjects, vine, sq, player)
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISVineInfoAction:new(player, vine));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISVineInfoAction:new(player, vine));
	end
end

ISTrellisMenu.onWater = function(worldobjects, uses, handItem, sq, player)
	if player:getPrimaryHandItem() ~= handItem then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, handItem, 50, true));
	end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISWaterVineAction:new(player, handItem, uses, sq, 3 * uses));
			return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISWaterVineAction:new(player, handItem, uses, sq, 3 * uses));
	end
end

ISTrellisMenu.onSeed = function(worldobjects, seeds, nbOfSeed, typeOfSeed, vine, sq, player)
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISTrellisSeedAction:new(player, seeds, nbOfSeed, typeOfSeed, vine, 40));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISTrellisSeedAction:new(player, seeds, nbOfSeed, typeOfSeed, vine, 40));
	end
end

ISTrellisMenu.haveSeed = function(player)
    local seedsList = {};
    seedsList.BeanSeed = {};
    seedsList.BellPepperSeed = {};
    seedsList.EggplantSeed = {};
    seedsList.GrapeSeed = {};
	seedsList.PeaSeed = {};
	-- we gonna test if we can seed the plowed land
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "HCBeanseeds" or item:getType() == "HCBeanseedspacket" then
			table.insert(seedsList.BeanSeed, item);
		end
		if item:getType() == "HCBellpepperseeds" or item:getType() == "HCBellpepperseedspacket" then
			table.insert(seedsList.BellPepperSeed, item);
		end
		if item:getType() == "HCEggplantseeds" or item:getType() == "HCEggplantseedspacket" then
			table.insert(seedsList.EggplantSeed, item);
		end
		if item:getType() == "HCGrapeseeds" or item:getType() == "HCGrapeseedspacket" then
			table.insert(seedsList.GrapeSeed, item);
		end
		if item:getType() == "HCPeaseeds" or item:getType() == "HCPeaseedspacket" then
			table.insert(seedsList.PeaSeed, item);
		end
	end
		return seedsList;
end

ISTrellisMenu.onBuild = function(worldobjects, player, handItem)
	local bo = trellisPlot:new(handItem, player);
	bo.player = player:getPlayerNum()
	getCell():setDrag(bo, bo.player)
end

ISTrellisMenu.onShovel = function(worldobjects, handItem, vine, player, sq)
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
            ISTimedActionQueue.add(ISTrellisShovelAction:new(player, handItem, vine, 40));
            return;
        else
            return;
        end
    else
        ISTimedActionQueue.add(ISTrellisShovelAction:new(player, handItem, vine, 40));
    end
end

ISTrellisMenu.onFertilize = function(worldobjects, handItem, vine, sq, player)
    -- close the farming info window to avoid concurrent growing phase problem
    if player:getInventory():contains("CompostBag") then
        handItem = ISWorldObjectContextMenu.equip(player, handItem, "CompostBag", true);
    else
	    handItem = ISWorldObjectContextMenu.equip(player, handItem, "Fertilizer", true);
    end
	if not AdjacentFreeTileFinder.isTileOrAdjacent(player:getCurrentSquare(), sq) then
		local adjacent = AdjacentFreeTileFinder.Find(sq, player);
		if adjacent ~= nil then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, adjacent));
			ISTimedActionQueue.add(ISFertilizeVineAction:new(player, handItem, vine, 40));
		return;
		else
			return;
		end
	else
		ISTimedActionQueue.add(ISFertilizeVineAction:new(player, handItem, vine, 40));
	end
end

ISTrellisMenu.onCheatGrow = function(worldobjects, vine)
	local hours = trellisFarming.hoursElapsed - vine.nextGrowing
	local args = { var = 'nextGrowing', count = hours }
	ISTrellisMenu.onCheat(worldobjects, vine, args)
end

function ISTrellisMenu.onCheatWater(worldobjects, vine)
	local diff = 100 - vine.waterLvl
	if vine.waterNeededMax then
		diff = vine.waterNeededMax - vine.waterLvl
	end
	local args = { var = 'waterLvl', count = diff }
	ISTrellisMenu.onCheat(worldobjects, vine, args)
end

function ISTrellisMenu.onJoypadFarming(square, player)
	local bo = ISTrellisCursor:new(getSpecificPlayer(player))
	getCell():setDrag(bo, bo.player)
	bo.xJoypad = square:getX()
	bo.yJoypad = square:getY()
	bo.zJoypad = square:getZ()
	return
end

ISTrellisMenu.onCheat = function(worldobjects, vine, args)
	if isClient() then
		args.x = vine.x
		args.y = vine.y
		args.z = vine.z
		sendClientCommand('trellis', 'cheat', args)
	else
		vine[args.var] = vine[args.var] + args.count
		if vine[args.var] < 0 then vine[args.var] = 0 end
		if vine[args.var] > 100 then vine[args.var] = 100 end
		trellisFarming.saveData(vine)
	end
end

Events.OnFillWorldObjectContextMenu.Add(ISTrellisMenu.doTrellisMenu);
