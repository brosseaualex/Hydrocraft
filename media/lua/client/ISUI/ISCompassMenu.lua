require "Reloading/ISReloadUtil"

ISCompassMenu = {};



ISCompassMenu.createMenuEntries = function(_player, _context, _items)

	local context = _context;
    local clickedItems = _items;
	local hasClicked = false
	
	ISCompassMenu.finishFunction = function(whatItem, itemName)

		---------------------------
		--Making the Compass Menu-- unused
		---------------------------
		--[[
		local CompassOption = context:addOption("Use Compass...", worldobjects, nil); -- Makes the compass menu
		local subMenu = ISContextMenu:getNew(context); -- As it is a submenu, I create a new submenu.
		context:addSubMenu(CompassOption, subMenu); -- I add the menu to the submenu, otherwise it won't appear.
		--]]

		
		------------------------
		--Making the home menu--
		------------------------
		
		--[[
		local HomeOption = context:addOption("Use Compass...", worldobjects, nil);
		local subMenuHome = ISContextMenu:getNew(context);
		context:addSubMenu(HomeOption, subMenuHome);
		--]]
		
		--[[local TeleportOption = subMenuHome:addOption("Teleport to...", worldobjects, nil);
		local subMenuTeleport = subMenuHome:getNew(subMenuHome);
		context:addSubMenu(TeleportOption, subMenuTeleport);
		
		local TeleportToHomeOption = subMenuTeleport:addOption("Custom...", worldobjects, nil);
		local subMenuTeleportHome = subMenuTeleport:getNew(subMenuTeleport);
		context:addSubMenu(TeleportToHomeOption, subMenuTeleportHome);
		
		for i = 1,5 do
			subMenuTeleportHome:addOption("Custom Location "..tostring(i), worldobjects, function() CompassCore.markHome(i, nil, nil, nil, true) end)
		end
		
		local TeleportPresetOption = subMenuTeleport:addOption("Presets...", worldobjects, nil);
		local subMenuTeleportPreset = subMenuTeleport:getNew(subMenuTeleport);
		context:addSubMenu(TeleportPresetOption, subMenuTeleportPreset);
		
		MuldraughOption = subMenuTeleportPreset:addOption("Muldraugh...", worldobjects, nil);
		subMenuMuldraugh = subMenuTeleportPreset:getNew(subMenuTeleportPreset);
		context:addSubMenu(MuldraughOption, subMenuMuldraugh);
		
		WestpointOption = subMenuTeleportPreset:addOption("West Point...", worldobjects, nil);
		subMenuWestpoint = subMenuTeleportPreset:getNew(subMenuTeleportPreset);
		context:addSubMenu(WestpointOption, subMenuWestpoint);
		
		DixieOption = subMenuTeleportPreset:addOption("Dixie...", worldobjects, nil);
		subMenuDixie = subMenuTeleportPreset:getNew(subMenuTeleportPreset);
		context:addSubMenu(DixieOption, subMenuDixie);
		
		for k1,v in pairs(CompassCore.CompassPresets) do
			for k,v in pairs(v) do
				loadstring('subMenu'..k1..':addOption("'..v["Name"]..'", worldobjects, function() CompassCore.markHome(nil, "'..v["Name"]..'", "'..v["X"]..'", "'..v["Y"]..'", true) end)')() -- uses loadstring sorcery to iterate through the multi-dimensional table
			end
		end
		
		--]]
		if whatItem == "mapAndCompass" or whatItem == "GPS" then
			local SetHomeOption = context:addOption("Set custom location...", worldobjects, nil);
			local subMenuSetHome = ISContextMenu:getNew(context);
			context:addSubMenu(SetHomeOption, subMenuSetHome);
			
			for i = 1,5 do
				subMenuSetHome:addOption("Custom Location "..tostring(i), worldobjects, function() CompassCore.setHome(i) end)
			end
		end
		local MarkOnCompassOption;
		local subMenuMark;
		if whatItem == "mapAndCompass" or whatItem == "GPS" or whatItem == "map" then
			MarkOnCompassOption = context:addOption("Mark waypoint on "..itemName.."...", worldobjects, nil);
			subMenuMark = ISContextMenu:getNew(context);
			context:addSubMenu(MarkOnCompassOption, subMenuMark);
		end
		
		if whatItem == "mapAndCompass" or whatItem == "GPS" then
			local MarkHomeOption = subMenuMark:addOption("Custom...", worldobjects, nil);
			local subMenuMarkHome = subMenuMark:getNew(subMenuMark);
			context:addSubMenu(MarkHomeOption, subMenuMarkHome);
			for i = 1,5 do
				subMenuMarkHome:addOption("Mark Custom Location "..tostring(i), worldobjects, function() CompassCore.markHome(i,nil,nil,nil,nil,true) end)
			end
		end
		
		if whatItem == "onlyCompass" then
			local DirectionOption = context:addOption("Open compass", worldobjects, function() CompassCore.markHome(nil,nil,nil,nil,nil,nil,true) end);
			--local subMenuDirection = subMenuDirection:getNew(subMenuDirection);
			--context:addSubMenu(DirectionOption, subMenuDirection);
		end
		
		if whatItem == "mapAndCompass" or whatItem == "GPS" or whatItem == "map" then	
			local MarkPresetOption = subMenuMark:addOption("Presets...", worldobjects, nil);
			local subMenuMarkPreset = subMenuMark:getNew(subMenuMark);
			context:addSubMenu(MarkPresetOption, subMenuMarkPreset);
			
			MuldraughOption = subMenuMarkPreset:addOption("Muldraugh...", worldobjects, nil);
			subMenuMuldraugh = subMenuMarkPreset:getNew(subMenuMarkPreset);
			context:addSubMenu(MuldraughOption, subMenuMuldraugh);
			
			WestpointOption = subMenuMarkPreset:addOption("West Point...", worldobjects, nil);
			subMenuWestpoint = subMenuMarkPreset:getNew(subMenuMarkPreset);
			context:addSubMenu(WestpointOption, subMenuWestpoint);
			
			DixieOption = subMenuMarkPreset:addOption("Dixie...", worldobjects, nil);
			subMenuDixie = subMenuMarkPreset:getNew(subMenuMarkPreset);
			context:addSubMenu(DixieOption, subMenuDixie);
			
			if whatItem == "map" then
				CompassCore.DoNotListCoords = true
			end
			
			for k1,v in pairs(CompassCore.CompassPresets) do
				for k,v in pairs(v) do
					local isDoDirection;
					if whatItem ~= "map" then
						isDoDirection = "true"
					else
						isDoDirection = "false"
					end
					loadstring('subMenu'..k1..':addOption("'..v["Name"]..'", worldobjects, function() CompassCore.markHome(nil, "'..v["Name"]..'", "'..v["X"]..'", "'..v["Y"]..'", false, '..isDoDirection..', false) end)')() -- uses loadstring sorcery to iterate through the multi-dimensional table
				end
			end
		end
	end
	
	for i,v in ipairs(clickedItems) do	
		local inv = getPlayer():getInventory()	
		local item = v;	if not instanceof(v, "InventoryItem") then
		item = v.items[1];
		end
		if instanceof(item, "InventoryItem") then
			if item:getName() == "Compass" and not inv:FindAndReturn("HCMap") then
				ISCompassMenu.finishFunction("onlyCompass", item:getName())	
			break	
			elseif item:getName() == "Map" and not inv:FindAndReturn("HCCompass") then		
				ISCompassMenu.finishFunction("map", item:getName())		
			break	
			elseif item:getName() == "GPS" then		
				ISCompassMenu.finishFunction("GPS", item:getName())		
			break
			elseif item:getName() == "Map" and inv:FindAndReturn("HCCompass") then		
				ISCompassMenu.finishFunction("mapAndCompass", item:getName())		
			break	
			elseif item:getName() == "Compass" and inv:FindAndReturn("HCMap") then	
				ISCompassMenu.finishFunction("mapAndCompass", item:getName())		
			break	
		end
	end 
end

end
Events.OnPreFillInventoryObjectContextMenu.Add(ISCompassMenu.createMenuEntries);