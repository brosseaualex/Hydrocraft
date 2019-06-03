-- Made by MisterInSayne for Hydrocraft. Permission to use this code, or copy from this code is only allowed when credits are given.

InFridgeMenu = {};

InFridgeMenu.doMenu = function(player, context, items)
	
	for i,v in ipairs(items) do
		local item = v;
        if not instanceof(v, "InventoryItem") then
            item = v.items[1];
        end
		
		if item:getType() == "HCCooler" or item:getType() == "HCIcechest" then
			local container = item:getItemContainer();
			if container:getType() == "fridge" then
				context:addOption("Take Coldpack out of "..item:getName(), item, InFridgeMenu.toggleCooler, player);
			else
				if getSpecificPlayer(player):getInventory():contains("Base.Coldpack") then
					context:addOption("Put Coldpack into "..item:getName(), item, InFridgeMenu.toggleCooler, player);
				end
			end
		end
	end
	
	--fridgeItemTest.doError();
end

InFridgeMenu.toggleCooler = function(item, player)
	local container = item:getItemContainer();
	if container:getType() == "fridge" then
		container:setType("notfridge");
		getSpecificPlayer(player):getInventory():AddItem("Base.Coldpack")
	else
		local icePack = getSpecificPlayer(player):getInventory():getItemFromType("Base.Coldpack");
		if icePack then
			getSpecificPlayer(player):getInventory():Remove(icePack);
			container:setType("fridge");
		end
	end
end


Events.OnFillInventoryObjectContextMenu.Add(InFridgeMenu.doMenu);