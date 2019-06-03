require('NPCs/MainCreationMethods');
--[[
Safe Storage Mod
By Nolan Ritchie


]]
NOD = 5;


local function AddcrackSafeRecipetoBurglar()    
	local Burglar = ProfessionFactory.getProfession("burglar");
		Burglar:getFreeRecipes():add("Attempt to Crack Safe Open");
end


function CrackOpenSafe(items, result, player)
local theLockedSafe;
	for i=0, items:size()-1 do
		if(items:get(i):getType() == "MetalSafeComboClosed") or (items:get(i):getType() == "MetalSafeClosed") then
			theLockedSafe = items:get(i);
		end
	end
	
	local Sneaking = player:getPerkInfo(Perks.Sneak):getLevel();

	if((ZombRand(30) + 3) < Sneaking) then
		if(theLockedSafe:getModData().safeID ~= nil) then
			SafeStorageUnlockSafe(player, theLockedSafe,"key");
		elseif (theLockedSafe:getModData().Combo ~= nil) then
			SafeStorageUnlockSafe(player, theLockedSafe,"combo");
		end
	else
		getPlayer():Say("@!#%");
		sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = "@!#%"});    
	end
	

	
end


function removeNoResults(player)
	local sq = player:getCurrentSquare();
	local objs = sq:getWorldObjects();
	for i=0, objs:size()-1 do
		if objs:get(i) then
			if(objs:get(i):getItem():getType() == "Nothing") then            
				sq:transmitRemoveItemFromSquare(objs:get(i));
				objs:get(i):removeFromSquare();
			end
		end
	end
end
function ComboOpenSafe(items, result, player)

	for i=0, items:size()-1 do
		if(items:get(i):getType() == "MetalSafeComboClosed") then
			GSafe = items:get(i);
		end
	end
	
	if(GSafe == nil) then
		player:Say("error could not detect safe");
	end
	
	SafeStorageComboEntered = "";
	SafeStorageComboEnteredCount = 0;
	SafeStorageListenForCombo = true;
	SafeStorageCheckingCombo = true;
	
	getPlayer():Say("*Enter " .. tostring(NOD).. " Digit Combination*");
	sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = "*Enter " .. tostring(NOD).. " Digit Combination*"});
	
	removeNoResults(player);
end

function ComboLockSafe(items, result, player)

	for i=0, items:size()-1 do
		if(items:get(i):getType() == "MetalSafeCombo") then
			GSafe = items:get(i);
		end
	end
	
	if(GSafe == nil) then
		player:Say("error could not detect safe");
	end
	
	SafeStorageComboEntered = "";
	SafeStorageComboEnteredCount = 0;
	SafeStorageListenForCombo = true;
	SafeStorageSettingCombo = true;
	getPlayer():Say("*Enter 5 Digit Combination* *End key to Cancel*");
	sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = "*Enter 5 Digit Combination* *End key to Cancel*"});
	removeNoResults(player);
end

function LockSafe(items, result, player)
local theSafe;
	for i=0, items:size()-1 do
		theSafe = items:get(i);
	end
		local ID = ZombRand(100000) + 1;
		
		local newsafe = player:getInventory():AddItem("Hydrocraft.MetalSafeClosed");
		local innersafe = player:getInventory():AddItem("Hydrocraft.MetalSafeClosedInner");
		
		innersafe:getItemContainer():AddItem(theSafe);
		newsafe:getItemContainer():AddItem(innersafe);
		
		newsafe:getModData().safeID = ID;
						
		local SafeKey = player:getInventory():AddItem("Hydrocraft.SafeKey");
		SafeKey:getModData().safeID = ID;
		
		player:getInventory():Remove(innersafe);
		player:getInventory():Remove(newsafe);
		
		if(player:getInventory():contains(theSafe) == true) then
			player:getInventory():Remove(theSafe);
		elseif(theSafe:getWorldItem()) then
			theSafe:getWorldItem():getSquare():transmitRemoveItemFromSquare(theSafe:getWorldItem());
			theSafe:getWorldItem():removeFromSquare();
		end
		
		player:getCurrentSquare():AddWorldInventoryItem(newsafe,0.5,0.5,0);    
		removeNoResults(player);
end

function UnLockSafe(items, result, player)
local theLockedSafe;
local theKey;
	for i=0, items:size()-1 do
		if(items:get(i):getType() == "SafeKey") then
			theKey = items:get(i);
		elseif(items:get(i):getType() == "MetalSafeClosed") then
			theLockedSafe = items:get(i);
		end
	end
		
		if(theLockedSafe:getModData().safeID == theKey:getModData().safeID) then
			SafeStorageUnlockSafe(player, theLockedSafe,"key");    
			player:getInventory():Remove(theKey);
		else
			player:Say("This is not the right key it seems");
			sendClientCommand(player, "SafeStorage", "Say", {saythis = "This is not the right key it seems"});
		end
		removeNoResults(player);
end


function SafeStorageUnlockSafe(player, theLockedSafe, safeType)

	local innerSafe;
	local theSafe;
	local lockedsafesquare = theLockedSafe:getWorldItem():getSquare();
	if(safeType == "key") then
		innerSafe = theLockedSafe:getItemContainer():getItemFromType("MetalSafeClosedInner");
		theSafe = innerSafe:getItemContainer():getItemFromType("MetalSafe");
	elseif(safeType == "combo") then
		innerSafe = theLockedSafe:getItemContainer():getItemFromType("MetalSafeComboClosedInner");
		theSafe = innerSafe:getItemContainer():getItemFromType("MetalSafeCombo");
	end
	
	innerSafe:getItemContainer():Remove(theSafe);
	theLockedSafe:getItemContainer():Remove(innerSafe);
	
	lockedsafesquare:transmitRemoveItemFromSquare(theLockedSafe:getWorldItem());
	theLockedSafe:getWorldItem():removeFromSquare();
	
	theSafe = lockedsafesquare:AddWorldInventoryItem(theSafe,0.5,0.5,0);
end

function SafeStorageListenCombo(keynum)
local player = getPlayer();
--[[
1 = 2 or 79
2 = 3 or 80
3 = 4 or 81
4 = 5 or 75
5 = 6 or 76
6 = 7 or 77
7 = 8 or 71
8 = 9 or 72
9 = 10 or 73
0 = 11 or 82
]]
	
	if(SafeStorageListenForCombo == true) and (SafeStorageComboEnteredCount < NOD) then
		
		if(keynum == 2) or (keynum == 79) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "1";
		elseif(keynum == 3) or (keynum == 80) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "2";
		elseif(keynum == 4) or (keynum == 81) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "3";
		elseif(keynum == 5) or (keynum == 75) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "4";
		elseif(keynum == 6) or (keynum == 76) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "5";
		elseif(keynum == 7) or (keynum == 77) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "6";
		elseif(keynum == 8) or (keynum == 71) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "7";
		elseif(keynum == 9) or (keynum == 72) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "8";
		elseif(keynum == 10) or (keynum == 73) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "9";
		elseif(keynum == 11) or (keynum == 82) then
		SafeStorageComboEnteredCount = SafeStorageComboEnteredCount + 1;
		SafeStorageComboEntered = SafeStorageComboEntered .. "0";
		elseif(keynum == 207) then
		SafeStorageListenForCombo = false;
		SafeStorageSettingCombo = false;
		SafeStorageCheckingCombo = false;
		getPlayer():Say("*Setting Canceled* ");
		sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = "*Setting Canceled* "});    
		end
		
		--getPlayer():Say(tostring(SafeStorageComboEntered));
		--sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = tostring(SafeStorageComboEnteredCount)});
	end
	
	if(SafeStorageListenForCombo == true) and (SafeStorageSettingCombo == true) and (SafeStorageComboEnteredCount >= NOD) then
		SafeStorageListenForCombo = false;
		SafeStorageSettingCombo = false;
		SafeStorageCheckingCombo = false;
		
		
		local newsafe = player:getInventory():AddItem("Hydrocraft.MetalSafeComboClosed");
		local innersafe = player:getInventory():AddItem("Hydrocraft.MetalSafeComboClosedInner");
		
		innersafe:getItemContainer():AddItem(GSafe);
		newsafe:getItemContainer():AddItem(innersafe);
		newsafe:getModData().Combo = SafeStorageComboEntered;
		GSafe:getModData().Combo = SafeStorageComboEntered;
		
		player:getCurrentSquare():AddWorldInventoryItem(newsafe,0.5,0.5,0);        
		
		player:getInventory():Remove(innersafe);
		player:getInventory():Remove(newsafe);
		
		if(player:getInventory():contains(GSafe) == true) then
			player:getInventory():Remove(GSafe);
		elseif(GSafe:getWorldItem()) then
			GSafe:getWorldItem():getSquare():transmitRemoveItemFromSquare(GSafe:getWorldItem());
			GSafe:getWorldItem():removeFromSquare();
		end
		
		--getPlayer():Say("*Combination Set to " .. GSafe:getModData().Combo);
		--sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = "*Combination Set*"});
		
	elseif(SafeStorageListenForCombo == true) and (SafeStorageCheckingCombo == true) and (SafeStorageComboEnteredCount >= NOD) then
		SafeStorageListenForCombo = false;
		SafeStorageSettingCombo = false;
		SafeStorageCheckingCombo = false;
		if(GSafe:getModData().Combo == SafeStorageComboEntered) then
			SafeStorageUnlockSafe(player, GSafe,"combo");
		else
			getPlayer():Say("*Incorrect Combination* ");
			sendClientCommand(getPlayer(), "SafeStorage", "Say", {saythis = "*Incorrect Combination*"});        
		end
	end

end

function SafeStorageUpdate(player)
if 	player:getInventory():contains("Nothing") then
	player:getInventory():Remove("Nothing")

end
end
function SafeStorageStopListening()
SafeStorageListenForCombo = false;
SafeStorageSettingCombo = false;
SafeStorageCheckingCombo = false;
end

Events.OnGameBoot.Add(AddcrackSafeRecipetoBurglar);
Events.OnPlayerMove.Add(SafeStorageStopListening);
Events.OnKeyPressed.Add(SafeStorageListenCombo);
Events.OnPlayerUpdate.Add(SafeStorageUpdate);