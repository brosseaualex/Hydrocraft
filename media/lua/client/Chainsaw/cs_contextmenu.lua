
require "TimedActions/ISBaseTimedAction"
ChainSawMenu = {};

ChainSawMenu.doMenu = function(player, context, items)
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if (tempitem:getType() == "ChainSaw" or tempitem:getType() == "ChainSawNoGas") then
			context:addOption("Put Gas In Chain Saw", worldobjects, ChainSawMenu.onFill, player, tempitem);
		end
	
	end
	
	
end




ChainSawMenu.onFill = function(item, player)
	local playerObj = getSpecificPlayer(player)
	local gasCan = playerObj:getInventory():FindAndReturn("PetrolCan");
	if(gasCan ~= nil) then
		--playerObj:Say("hahere dy");
		local chainSaw = playerObj:getInventory():FindAndReturn("ChainSaw");
		if(chainSaw == nil) then chainSaw = playerObj:getInventory():FindAndReturn("ChainSawNoGas"); end
		
		if(chainSaw ~= nil) then
			if(chainSaw:getModData().gasUse == nil and chainSaw:getType() == "ChainSaw") then chainSaw:getModData().gasUse = 100 end
			if(chainSaw:getModData().gasUse == nil and chainSaw:getType() == "ChainSawNoGas") then chainSaw:getModData().gasUse = 0 end
			if(chainSaw:getModData().gasUse < 100) then
				gasCan:Use();
				
				if(chainSaw:getType() == "ChainSawNoGas") then 
					--playerObj:Say("hahere dy");
					local gasedchainsaw = playerObj:getInventory():AddItem("Hydrocraft.ChainSaw");
					if(playerObj:getPrimaryHandItem() == chainSaw) then
						playerObj:setPrimaryHandItem(gasedchainsaw);
						playerObj:setSecondaryHandItem(gasedchainsaw); 
					end
					playerObj:getInventory():Remove(chainSaw);		
					chainSaw = gasedchainsaw;
					chainSaw:getModData().gasUse = 0 ;
				end
				chainSaw:getModData().gasUse = chainSaw:getModData().gasUse + 10;
				if(chainSaw:getModData().gasUse > 100) then chainSaw:getModData().gasUse = 100; end
				playerObj:Say("ChainSaw Gas:" .. tostring(chainSaw:getModData().gasUse) .. "%");
				
			else
				playerObj:Say("Oh she is already 100% full. Silly me.");
			end
		else
			playerObj:Say("Hmm I Should put the chain saw in my inventory first. Silly me.");
		end
	else
		playerObj:Say("Hmm I guess I need to get some gas before I can put gas in it. Silly me.");
	end
	
end

Events.OnFillInventoryObjectContextMenu.Add(ChainSawMenu.doMenu);