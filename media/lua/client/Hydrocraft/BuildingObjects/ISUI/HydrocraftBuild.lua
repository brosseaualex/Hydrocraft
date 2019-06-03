--Hydrocraft's Build Menu
--Based on ISBuildMenu.lua by Robert Johnson
--Written by Yossitaru

HydrocraftBuild = {};
HydrocraftBuild.planks = 0;
HydrocraftBuild.nails = 0;
HydrocraftBuild.worms = 0;
HydrocraftBuild.cheat = false;
HydrocraftBuild.woodWorkXP = 0;
HydrocraftBuild.farmWorkXP = 0;

--New menu for building.
HydrocraftBuild.doBuildMenu = function(player, context, worldobjects, test)
	HydrocraftBuild.woodWorkXP = getSpecificPlayer(player):getPerkLevel(Perks.Woodwork);
	HydrocraftBuild.farmWorkXP = getSpecificPlayer(player):getPerkLevel(Perks.Farming);
	local thump = nil;
	local square = nil;
	
	-- we get the thumpable item (like wall/door/furniture etc.) if exist on the tile we right clicked
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
		
		if instanceof(v, "IsoThumpable") and v:getModData()["isBin"] then
			thump = v;
		end
    end
	
	if HydrocraftBuild.hydrohaveSomethingtoBuild(player) then
		local buildOption = context:addOption("Hydrocraft", worldobjects, nil);
		
		local subMenu = ISContextMenu:getNew(context);
		context:addSubMenu(buildOption, subMenu);
		
		HydrocraftBuild.buildMenu(subMenu, player);
	end
	
	--Dismantle
	if getSpecificPlayer(player):getInventory():contains("Saw") and getSpecificPlayer(player):getInventory():contains("Screwdriver") then
		context:addOption(getText("ContextMenu_Dismantle"), worldobjects, HydrocraftBuild.onDismantle, getSpecificPlayer(player));
	end

	--Smash it!
	local sledgehammer = getSpecificPlayer(player):getInventory():getBestCondition("Sledgehammer")
	if sledgehammer and not sledgehammer:isBroken() then
		context:addOption(getText("ContextMenu_Destroy"), worldobjects, ISWorldObjectContextMenu.onDestroy, getSpecificPlayer(player))
	end
end	

--Tool and material checking.
function HydrocraftBuild.hydrohaveSomethingtoBuild(player)
	HydrocraftBuild.materialOnGround = buildUtil.checkMaterialOnGround(getSpecificPlayer(player):getCurrentSquare())
	if HydrocraftBuild.cheat then
		return true;
	end
	HydrocraftBuild.planks = 0;
	HydrocraftBuild.nails = 0;
	HydrocraftBuild.worms = 0;
	
	HydrocraftBuild.hasHammer = getSpecificPlayer(player):getInventory():contains("Hammer") or getSpecificPlayer(player):getInventory():contains("HammerStone")
	HydrocraftBuild.planks = HydrocraftBuild.countMaterial(player, "Base.Plank")
	HydrocraftBuild.nails = HydrocraftBuild.countMaterial(player, "Base.Nails")
	HydrocraftBuild.worms = HydrocraftBuild.countMaterial(player, "Base.Worm")
	return true;
end

HydrocraftBuild.onDismantle = function(worldobjects, player)
	local bo = ISDestroyCursor:new(player, true)
	getCell():setDrag(bo, bo.player)
end

--Submenu population.
HydrocraftBuild.buildMenu = function(subMenu, player)
	local binSprite = HydrocraftBuild.getBinSprite(player);
	local binOption = subMenu:addOption("Compost Bin", nil, HydrocraftBuild.onCompostBin, binSprite, player, "Compost Bin");
	local toolTip = HydrocraftBuild.canBuild(2, 2, 5, 0, 0, binOption, player);
	toolTip:setName("Compost Bin");
	toolTip.description = "Toss your rotten food in here! " .. toolTip.description;
	toolTip:setTexture("media/textures/Object_HCCompostbinempty.png");
	HydrocraftBuild.requireHammer(binOption);
	
end

--Compost bin building requirements.
HydrocraftBuild.onCompostBin = function(worldobjects, binSprite, player)
	local bin = HydroBin:new("Compost Bin", binSprite);
	bin.modData["need:Base.Plank"] = "2";
	bin.modData["need:Base.Nails"] = "2";
	bin.modData["need:Base.Worm"] = "5";
	bin.player = player;
	getCell():setDrag(bin, player);
end

HydrocraftBuild.getBinSprite = function(player)
	local sprite = "media/textures/Object_HCCompostbinempty.png";
	return sprite;
end

-- Tooltip

--Create the tooltip with these requirements.
HydrocraftBuild.canBuild = function(plankNb, nailNb, wormNb, carpentrySkill, farmingSkill, option, player)
	local tooltip = HydrocraftBuild.addToolTip();
	
	--Add to our current tooltip.
	option.toolTip = tooltip;
	local result = true;
	
	tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
	
	--All the stuff we need. 
	if HydrocraftBuild.planks < plankNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Plank") .. " " .. HydrocraftBuild.planks .. "/" .. plankNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Plank") .. " " .. plankNb .. " <LINE>";
	end
	if HydrocraftBuild.nails < nailNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Nail") .. " " .. HydrocraftBuild.nails .. "/" .. nailNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Nail") .. " " .. nailNb .. " <LINE>";
	end
	if HydrocraftBuild.worms < wormNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Worm") .. " " .. HydrocraftBuild.worms .. "/" .. wormNb .. " <LINE>";
		result = false;
	elseif wormNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Worm") .. " " .. wormNb .. " <LINE>";
	end
	if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
		result = false;
	elseif carpentrySkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
	end
	if getSpecificPlayer(player):getPerkLevel(Perks.Farming) < farmingSkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Farming") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Farming) .. "/" .. farmingSkill .. " <LINE>";
		result = false;
	elseif farmingSkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Farming") .. " " .. farmingSkill .. " <LINE>";
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	return tooltip
end

HydrocraftBuild.addToolTip = function()
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	return toolTip;
end

HydrocraftBuild.countMaterial = function(player, fullType)
    local inv = getSpecificPlayer(player):getInventory()
    local count = inv:getItemCount(fullType)
    local type = string.split(fullType, "\\.")[2]
    for k,v in pairs(HydrocraftBuild.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

--This is now manditory due to hardcoded hammer requirements.
HydrocraftBuild.requireHammer = function(option)
	if not HydrocraftBuild.hasHammer and not HydrocraftBuild.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end

--Events.OnFillWorldObjectContextMenu.Add(HydrocraftBuild.doBuildMenu);