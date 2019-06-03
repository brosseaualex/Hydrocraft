 --[[
Player Traps Mod
By Nolan Ritchie


]]

function getRandomBodyPart(player)
	
	local parttohurt;
	local r = ZombRand(11);
	if(r == 0) then
	parttohurt = BodyPartType.LowerLeg_L;
	elseif(r == 1) then
	parttohurt = BodyPartType.LowerLeg_R;
	elseif(r == 2) then
	parttohurt = BodyPartType.UpperLeg_R;
	elseif(r == 3) then
	parttohurt = BodyPartType.UpperLeg_L;
	elseif(r == 4) then
	parttohurt = BodyPartType.UpperArm_R;
	elseif(r == 5) then
	parttohurt = BodyPartType.UpperArm_L;
	elseif(r == 6) then
	parttohurt = BodyPartType.Head;
	elseif(r == 7) then
	parttohurt = BodyPartType.Torso_Lower;
	elseif(r == 8) then
	parttohurt = BodyPartType.Torso_Upper;
	elseif(r == 9) then
	parttohurt = BodyPartType.ForeArm_L;
	else
	parttohurt = BodyPartType.ForeArm_R;
	end
	
	return player:getBodyDamage():getBodyPart(parttohurt);
	
	
end

function SetTrapDown(items, result, player)
local theTraptoSet;
	for i=0, items:size()-1 do
		theTraptoSet = items:get(i);
	end
	
	local AlreadyTrapOnSquare = false;
	if (player:getCurrentSquare():getModData().isTrapSet == true) then
			local Objs = player:getCurrentSquare():getObjects();
		
		for i=0, Objs:size()-1 do
			if (Objs:get(i):getWorldObjectIndex() ~= -1) then -- (Objs:get(i):getName() == "Spike Trap (Set)") then
				if(Objs:get(i):getItem() ~= nil) and (Objs:get(i):getItem():getModData().isSet == true or Objs:get(i):getModData().isSet == true) then
					AlreadyTrapOnSquare = true;                    
				end
			end
		end
	end
	
	if(AlreadyTrapOnSquare == false) then
	
		
	
		player:getCurrentSquare():getModData().isTrapSet = true;
		player:getCurrentSquare():transmitModdata();
		player:getInventory():Remove(theTraptoSet);
		theTraptoSet:getModData().isSet = true;
		theTraptoSet = player:getCurrentSquare():AddWorldInventoryItem(theTraptoSet,0.5,0.5,0,true);
		player:getModData().immuneToTrap = true;
		
		theTraptoSet:getWorldItem():getModData().isSet = true;
		theTraptoSet:getWorldItem():transmitModData();
		sendClientCommand(player, "Trap", "SetTrap", {x = player:getX(),y = player:getY(),z = player:getZ(),trapid = theTraptoSet:getWorldItem():getKeyId()});
		
	else
		player:Say("Already a trap on this square");
		sendClientCommand(player, "Trap", "Say", {saythis = "Already a trap on this square"});
	end
	
end

function getTextureFor(name)

	--getPlayer():Say(name);
	local temp = getPlayer():getInventory():AddItem(name);
	--local temp = InventoryItem.new('Base',name,name,name);
	--getPlayer():Say(temp:getType());
	local texture = temp:getTexture();
	getPlayer():getInventory():Remove(temp);
	return texture;

end

function HandleTrap(player, trap)
	if(trap:getType() == "BearTrap") and (trap:getModData().isSet == true or trap:getWorldItem():getModData().isSet == true) then
		local BP;
		if(ZombRand(2) == 0) then
			BP = player:getBodyDamage():getBodyPart(BodyPartType.LowerLeg_L);
		else
			BP = player:getBodyDamage():getBodyPart(BodyPartType.LowerLeg_R);
		end
		
		if(ZombRand(2) == 0) then
			BP:setFractureTime(100);
		else
			BP:generateDeepWound();
		end
		
		BP:AddDamage(ZombRand(25) + 40);
		
		trap:getModData().isSet = false;
		trap:getWorldItem():getModData().isSet = false;
		player:getCurrentSquare():getModData().isTrapSet = false;
		player:getCurrentSquare():transmitModdata();
		player:getCurrentSquare():transmitRemoveItemFromSquare(trap:getWorldItem());
		trap:getWorldItem():removeFromSquare();                
		
		local newtrap = instanceItem("Hydrocraft."..trap:getType().."Closed");
		player:getCurrentSquare():AddWorldInventoryItem(newtrap,0.5,0.5,0,true);
		
		getSoundManager():PlayWorldSound("beartrap", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false) ;
		
	elseif (trap:getType() == "SpikeTrap") and (trap:getModData().isSet == true) then
	
		local BP;
		
		BP = player:getBodyDamage():getBodyPart(BodyPartType.Foot_L );
		BP:generateDeepWound();
		BP = player:getBodyDamage():getBodyPart(BodyPartType.Foot_R );
		BP:generateDeepWound();
	
		BP:AddDamage(ZombRand(25) + 40);
		
		trap:getModData().isSet = false;
		trap:getWorldItem():getModData().isSet = false;
		player:getCurrentSquare():getModData().isTrapSet = false;
		player:getCurrentSquare():transmitModdata();
		
		player:getCurrentSquare():transmitRemoveItemFromSquare(trap:getWorldItem());
		trap:getWorldItem():removeFromSquare();        
		
		local newtrap = instanceItem("Hydrocraft."..trap:getType().."Closed");
		player:getCurrentSquare():AddWorldInventoryItem(newtrap,0.5,0.5,0,true);
		
		getSoundManager():PlayWorldSound("stabbing", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false) ;
	
	elseif (trap:getType() == "PropaneTrap") and (trap:getModData().isSet == true) then
	
		local BP;
		
		BP = getRandomBodyPart(player);
		BP:AddDamage(ZombRand(25) + 40);
		BP:setBurned();
		
		BP = getRandomBodyPart(player);
		BP:AddDamage(ZombRand(25) + 40);
		BP:setBurned();
		
		trap:getModData().isSet = false;
		trap:getWorldItem():getModData().isSet = false;
		player:getCurrentSquare():getModData().isTrapSet = false;
		player:getCurrentSquare():transmitModdata();
		
		player:getCurrentSquare():explode();
		player:getCurrentSquare():explode();
		
		player:getCurrentSquare():transmitRemoveItemFromSquare(trap:getWorldItem());
		trap:getWorldItem():removeFromSquare();        
		
		getSoundManager():PlayWorldSound("explosion", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false) ;
		
	
	end
end

function CheckForTrap(player)
	if(player:getCurrentSquare() ~= nil) then
		if (player:getCurrentSquare():getModData().isTrapSet == true) and (player:getModData().immuneToTrap ~= true) then
				local Objs = player:getCurrentSquare():getObjects();
			
			for i=0, Objs:size()-1 do
				if (Objs:get(i):getWorldObjectIndex() ~= -1) then -- (Objs:get(i):getName() == "Spike Trap (Set)") then
					if(Objs:get(i):getItem() ~= nil) and (Objs:get(i):getItem():getModData().isSet == true or Objs:get(i):getModData().isSet == false) then
						HandleTrap(player,Objs:get(i):getItem());
					end
				end
			end
			
			
		elseif (player:getCurrentSquare():getModData().isTrapSet == nil) or (player:getCurrentSquare():getModData().isTrapSet == false) or (player:getModData().immuneToTrap == nil) then
			player:getModData().immuneToTrap = false;
		end
	end
end

function TrapupdateThePlayer(player)
	
	CheckForTrap(player);
if 	player:getInventory():contains("Nothing") then
	player:getInventory():Remove("Nothing")

end
end
function TrapsKeysUp(keyNum)
local player = getPlayer();
	--getPlayer():Say(tostring(keyNum));    
	if (keyNum == 210) then
		
	
		--getPlayer():Say(tostring(getPlayer():getModData().immuneToTrap) .. "|" .. tostring(getPlayer():getCurrentSquare():getModData().isTrapSet));
	end
	
end


Events.OnKeyPressed.Add(TrapsKeysUp);
Events.OnPlayerUpdate.Add(TrapupdateThePlayer);  