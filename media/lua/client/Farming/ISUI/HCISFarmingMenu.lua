require "Farming/ISUI/ISFarmingMenu"
HCFarmMenu = {};
HCFarmMenu.info = {};

HCFarmMenu.haveSeed = function(player)
    local hcSeedsList = {};
    hcSeedsList.cornSeed = {};
    hcSeedsList.leekSeed = {};
	hcSeedsList.lettuceSeed = {};
	hcSeedsList.onionSeed = {};
	hcSeedsList.peanutSeed = {};
	hcSeedsList.pumpkinSeed = {};
	hcSeedsList.watermelonSeed = {};
	hcSeedsList.zucchiniSeed = {};
	-- we gonna test if we can seed the plowed land
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "HCCornseeds" or item:getType() == "HCCornseedspacket" then
			table.insert(hcSeedsList.cornSeed, item);
		end
		if item:getType() == "HCLeekseeds" or item:getType() == "HCLeekseedspacket" then
			table.insert(hcSeedsList.leekSeed, item);
		end
		if item:getType() == "HCLettuceseeds" or item:getType() == "HCLettuceseedspacket" then
			table.insert(hcSeedsList.lettuceSeed, item);
		end
		if item:getType() == "HCOnionseeds" or item:getType() == "HCOnionseedspacket" then
			table.insert(hcSeedsList.onionSeed, item);
		end
		if item:getType() == "HCPeanutseeds" or item:getType() == "HCPeanutseedspacket" then
			table.insert(hcSeedsList.peanutSeed, item);
		end
		if item:getType() == "HCPumpkinseeds" or item:getType() == "HCPumpkinseedspacket" then
			table.insert(hcSeedsList.pumpkinSeed, item);
		end
		if item:getType() == "HCWatermelonseeds" or item:getType() == "HCWatermelonseedspacket" then
			table.insert(hcSeedsList.watermelonSeed, item);
		end
		if item:getType() == "HCZucchiniseeds" or item:getType() == "HCZucchiniseedspacket" then
			table.insert(hcSeedsList.zucchiniSeed, item);
		end
	end
		return hcSeedsList;
end

HCFarmMenu.doHCPatchFarmMenu = function(player, context, worldobjects, test)
    local sq = nil;
    local player = getSpecificPlayer(player);
	local currentPlant = nil;
		
	for i,v in ipairs(worldobjects) do
		
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(v:getSquare())
	if plant then
		currentPlant = plant
		sq = v:getSquare();
		break
	end
end
	if test and ISWorldObjectContextMenu.Test then return true end

	--What you use to add to the existing farm submenu in your own script:
	local subMenu = nil;
	local farmOption = nil;
	
	for i,v in ipairs(context.options) do
	if v.name == getText("ContextMenu_Sow_Seed") then
		farmOption = v;
		subMenu = context:getSubMenu(farmOption.subOption);
	end
end
	if subMenu then		
    	local hcSeedsList = HCFarmMenu.haveSeed(player);

		context:addSubMenu(farmOption, subMenu);

		-- Corn needs 10 seeds
		local cornOption = subMenu:addOption(getText("Farming_Corn"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.cornSeed, farming_vegetableconf.props["Corn"].seedsRequired, "Corn", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.cornSeed, "Corn", cornOption);
		-- Leek needs 9 seeds
		local leekOption = subMenu:addOption(getText("Farming_Leek"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.leekSeed, farming_vegetableconf.props["Leek"].seedsRequired, "Leek", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.leekSeed, "Leek", leekOption);
		-- Lettuce needs 6 seeds
		local lettuceOption = subMenu:addOption(getText("Farming_Lettuce"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.lettuceSeed, farming_vegetableconf.props["Lettuce"].seedsRequired, "Lettuce", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.lettuceSeed, "Lettuce", lettuceOption);
		-- Onion needs 4 seeds
		local onionOption = subMenu:addOption(getText("Farming_Onion"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.onionSeed, farming_vegetableconf.props["Onion"].seedsRequired, "Onion", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.onionSeed, "Onion", onionOption);
		-- Peanut needs 4 seeds
		local peanutOption = subMenu:addOption(getText("Farming_Peanut"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.peanutSeed, farming_vegetableconf.props["Peanut"].seedsRequired, "Peanut", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.peanutSeed, "Peanut", peanutOption);				
		-- Pumpkin needs 4 seeds
		local pumpkinOption = subMenu:addOption(getText("Farming_Pumpkin"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.pumpkinSeed, farming_vegetableconf.props["Pumpkin"].seedsRequired, "Pumpkin", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.pumpkinSeed, "Pumpkin", pumpkinOption);		
		-- Watermelon needs 4 seeds
		local watermelonOption = subMenu:addOption(getText("Farming_Watermelon"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.watermelonSeed, farming_vegetableconf.props["Watermelon"].seedsRequired, "Watermelon", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.watermelonSeed, "Watermelon", watermelonOption);
		-- Zucchini needs 6 seeds
		local zucchiniOption = subMenu:addOption(getText("Farming_Zucchini"), worldobjects, ISFarmingMenu.onSeed, hcSeedsList.zucchiniSeed, farming_vegetableconf.props["Zucchini"].seedsRequired, "Zucchini", currentPlant, sq, player);
		ISFarmingMenu.canPlow(#hcSeedsList.zucchiniSeed, "Zucchini", zucchiniOption);			
	end	
end

Events.OnFillWorldObjectContextMenu.Add(HCFarmMenu.doHCPatchFarmMenu);