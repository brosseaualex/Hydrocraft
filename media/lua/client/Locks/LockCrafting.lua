function matchDoorknobtoKey(items, result, player)

	local theKeyId = -1;
	local theDoorKnob = -1;

	for i=0, items:size()-1 do
		if(items:get(i):getCategory() == "Key") then
			theKeyId = items:get(i):getKeyId();
		elseif(items:get(i):getType() == "Doorknob") then
			theDoorKnob = items:get(i);
		end
	end
	
	if(theKeyId ~= -1) then
	--player:Say("keyid:" .. tostring(theKeyId) .. " | DoorId:" .. tostring(theDoorKnob:getKeyId()));
		theDoorKnob:setKeyId(theKeyId);
	--player:Say("keyid:" .. tostring(theKeyId) .. " | DoorId:" .. tostring(theDoorKnob:getKeyId()));
	else
		sendClientCommand(player, "LockCrafting", "Say", {saythis = "This Key does not have a lock ID"});
		player:Say("This Key does not have a lock ID");
	end	

end

function matchKeytoDoorknob(items, result, player)

	local theDoorKnobId = -1;
	local theKey = -1;

	for i=0, items:size()-1 do
		if(items:get(i):getType() == "Doorknob") then
			theDoorKnobId = items:get(i):getKeyId();
		elseif(items:get(i):getCategory() == "Key") then
			theKey = items:get(i);
		end
	end
	
	if(theDoorKnobId ~= -1) then
	--player:Say("theDoorKnobId:" .. tostring(theDoorKnobId) .. " | theKeyid:" .. tostring(theKey:getKeyId()));
		theKey:setKeyId(theDoorKnobId);
	--player:Say("theDoorKnobId:" .. tostring(theDoorKnobId) .. " | theKeyid:" .. tostring(theKey:getKeyId()));
	else
		sendClientCommand(player, "LockCrafting", "Say", {saythis = "This Doorknob does not have a lock"});
		player:Say("This Doorknob does not have a lock");
	end	

end