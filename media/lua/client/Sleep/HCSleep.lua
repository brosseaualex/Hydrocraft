HCSleepKey = "sleepin"; -- any item containing this string in the codename can be slept in/on


-- Made by Wintermuteai1 - 2016 <--- Thanks a bunch!
-- Rest option and edits added by Nolan

HCRestKey = HCSleepKey; --"restin"; 

require 'Camping/camping'
require "TimedActions/ISBaseTimedAction"
HCSleep = {};

HCSleep.doMenu = function(player, context, items)
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if(getSpecificPlayer(player):getInventory():contains(tempitem) == false) then
			if (tempitem:getType().find(tempitem:getType(),HCSleepKey) ~= nil) then
				context:addOption(getText("ContextMenu_Sleep"), worldobjects, HCSleep.onSleep, player, sleep);
			end
			if (tempitem:getType().find(tempitem:getType(),HCRestKey) ~= nil) then
				context:addOption(getText("ContextMenu_Rest"), worldobjects, HCSleep.onRest, player, sleep);
			end
		end
	end
	
	
end


HCSleep.onRest = function(item, player)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.clear(playerObj)
	ISTimedActionQueue.add(ISRestAction:new(playerObj));
end

HCSleep.onSleep = function(item, player)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.clear(playerObj)
	ISWorldObjectContextMenu.onSleepWalkToComplete(player)
end



Events.OnFillInventoryObjectContextMenu.Add(HCSleep.doMenu);