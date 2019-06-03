--[[
Injury Detection And Armor Based Injury Blocking 
By Nolan Ritchie


]]

if GlobalBooleanArmorSystemEnabled then return end

GlobalBooleanArmorSystemEnabled = true


MyArmArmor = {}
MyHeadArmor = {}
MyLegArmor = {}
MyBodyArmor = {}
MyHandArmor = {}
MyFeetArmor = {}
MyShieldArmor = {}
MyArmorInitCheck = {}



function EquipAnyArmor(item, player)

	if(GlobalArmor[item:getType()]["Location"] == "Arms") then EquipOnArms(item, player,1) 
	elseif(GlobalArmor[item:getType()]["Location"] == "Head") then EquipOnHead(item, player,1) 
	elseif(GlobalArmor[item:getType()]["Location"] == "Legs") then EquipOnLegs(item, player,1)
	elseif(GlobalArmor[item:getType()]["Location"] == "Body") then EquipOnChest(item, player,1)
	elseif(GlobalArmor[item:getType()]["Location"] == "Hands") then EquipOnHands(item, player,1)
	elseif(GlobalArmor[item:getType()]["Location"] == "Feet") then EquipOnFeet(item, player,1)
	elseif(GlobalArmor[item:getType()]["Location"] == "Shield") then EquipAsShield(item, player,1)
	end
	
end

function UnEquipAnyArmor(item, player)
	
	if(GlobalArmor[item:getType()]["Location"] == "Arms") then EquipOnArms(item, player, 0) 
	elseif(GlobalArmor[item:getType()]["Location"] == "Head") then EquipOnHead(item, player,0) 
	elseif(GlobalArmor[item:getType()]["Location"] == "Legs") then EquipOnLegs(item, player,0)
	elseif(GlobalArmor[item:getType()]["Location"] == "Body") then EquipOnChest(item, player,0)
	elseif(GlobalArmor[item:getType()]["Location"] == "Hands") then EquipOnHands(item, player,0)
	elseif(GlobalArmor[item:getType()]["Location"] == "Feet") then EquipOnFeet(item, player,0)
	elseif(GlobalArmor[item:getType()]["Location"] == "Shield") then EquipAsShield(item, player,0)
	end
	
end

function loadArmor(Armor)
local tempDurability;
    if(Armor:getModData().Durability == nil) and (GlobalArmor[Armor:getType()]["Durability"] ~= nil) then
        Armor:getModData().Durability = GlobalArmor[Armor:getType()]["Durability"] ;
    end
    
    local thetype = Armor:getType();
    GlobalArmor[thetype]["Time"] = 60; -- just a default time
	
    if(GlobalArmor[thetype]["ScratchRes"]) then Armor:getModData().ScratchRes = GlobalArmor[thetype]["ScratchRes"] end
    if(GlobalArmor[thetype]["DeepWoundRes"]) then Armor:getModData().DeepWoundRes = GlobalArmor[thetype]["DeepWoundRes"] end
    if(GlobalArmor[thetype]["BurnRes"]) then Armor:getModData().BurnRes = GlobalArmor[thetype]["BurnRes"] end
    if(GlobalArmor[thetype]["BulletRes"]) then Armor:getModData().BulletRes = GlobalArmor[thetype]["BulletRes"] end
    if(GlobalArmor[thetype]["FractureRes"]) then Armor:getModData().FractureRes = GlobalArmor[thetype]["FractureRes"] end
    if(GlobalArmor[thetype]["GlassRes"]) then Armor:getModData().GlassRes = GlobalArmor[thetype]["GlassRes"] end
    if(GlobalArmor[thetype]["BiteRes"]) then Armor:getModData().BiteRes = GlobalArmor[thetype]["BiteRes"] end
	if(GlobalArmor[thetype]["Time"]) then Armor:getModData().BiteRes = GlobalArmor[thetype]["BiteRes"] end
    if(GlobalArmor[thetype]["Location"]) then Armor:getModData().Location= GlobalArmor[thetype]["Location"] end
    
end

function loadArmorToPlayer(Armor, player)
	ArmorSaveBodyDamage(player);
	loadArmor(Armor);	
end 

function getBodyPartDisplayName(TypeIn)

	BPType = tostring(TypeIn);
	if(BPType == "Foot_L") then return "Left Foot";
	elseif(BPType == "Foot_R") then return "Right Foot";
	elseif(BPType == "ForeArm_L") then return "Left Fore Arm";
	elseif(BPType == "ForeArm_R") then return "Right Fore Arm";
	elseif(BPType == "Hand_L") then return "Left Hand";
	elseif(BPType == "Hand_R") then return "Right Hand";
	elseif(BPType == "LowerLeg_L") then return "Left Lower Leg"; 
	elseif(BPType == "LowerLeg_R") then return "Right Lower Leg";
	elseif(BPType == "Torso_Lower") then return "Lower Torso";
	elseif(BPType == "Torso_Upper") then return "Upper Torso";
	elseif(BPType == "UpperArm_L") then return "Left Upper Arm";
	elseif(BPType == "UpperArm_R") then return "Right Upper Arm";
	elseif(BPType == "UpperLeg_L") then return "Left Upper Leg"; 
	elseif(BPType == "UpperLeg_R") then return "Right Upper Leg";
	else return BPType;
	end

end

function ExamineArmor(item, player)
	
	
	Armor = item;
		
	loadArmor(Armor);
	
	local out = "Remaining Durability: " .. tostring(Armor:getModData().Durability) .. "\n";
	local BPs = player:getBodyDamage():getBodyParts();
	for i=0, BPs:size()-1 do		
		
		if(Armor:getModData().ScratchRes ~= nil) and (Armor:getModData().ScratchRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out .. tostring(Armor:getModData().ScratchRes[tostring(BPs:get(i):getType())]).. "%" .. " chance to block Scratches on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
		if(Armor:getModData().DeepWoundRes ~= nil) and (Armor:getModData().DeepWoundRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out  .. tostring(Armor:getModData().DeepWoundRes[tostring(BPs:get(i):getType())]).. "%" .. " Chance to block to Deep Wounds on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
		if(Armor:getModData().BiteRes ~= nil) and (Armor:getModData().BiteRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out  .. tostring(Armor:getModData().BiteRes[tostring(BPs:get(i):getType())]) .. "%".. " Chance to block to Bites on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
		if(Armor:getModData().GlassRes ~= nil) and (Armor:getModData().GlassRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out  .. tostring(Armor:getModData().GlassRes[tostring(BPs:get(i):getType())]) .. "%".. " Chance to block to Glass on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
		if(Armor:getModData().FractureRes ~= nil) and (Armor:getModData().FractureRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out  .. tostring(Armor:getModData().FractureRes[tostring(BPs:get(i):getType())]) .. "%".. " Chance to block to Fractures on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
		if(Armor:getModData().BurnRes ~= nil) and (Armor:getModData().BurnRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out .. tostring(Armor:getModData().BurnRes[tostring(BPs:get(i):getType())])  .. "%".. " Chance to block to Burns on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
		if(Armor:getModData().BulletRes ~= nil) and (Armor:getModData().BulletRes[tostring(BPs:get(i):getType())] ~= nil) then
			out = out  .. tostring(Armor:getModData().BulletRes[tostring(BPs:get(i):getType())]).. "%" .. " Chance to block to Bullets on the " .. getBodyPartDisplayName(BPs:get(i):getType()) .. "\n";
		end
	end
	out = Armor:getDisplayName() .. "\n" .. out;
	ArmorWindow:setText(out);
	ArmorWindow:setVisible(true);
	--player:Say();
end

function ArmorSaveBodyDamage(player)
	
	player:getModData().ArmorTempBodyDamage = {};
	ArmorTempBodyDamage = player:getModData().ArmorTempBodyDamage;
	local BD = player:getBodyDamage();
	--local InjuryTypes = {0 = "Scratch",1 = "DeepWound", 2 = "Burn", 3 = "BulletRes", 4 = "Fracture", 5 = "Glass"};
	
	ArmorTempBodyDamage["IsInfected"] = BD:IsInfected();
		
	local BPs = BD:getBodyParts();
	for i=0, BPs:size()-1 do
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())] = {Splint= false, Bandage = false, Bite = false, Scratch = false, DeepWound = false, Burn = false, Bullet = false, Fracture = false, Glass = false};
		
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Splint"] = BPs:get(i):isSplint();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bandage"] = BPs:get(i):bandaged();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Scratch"] = BPs:get(i):scratched();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["DeepWound"] = BPs:get(i):deepWounded();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Burn"] = BPs:get(i):getBurnTime();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bullet"] = BPs:get(i):haveBullet();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Fracture"] = BPs:get(i):getFractureTime();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Glass"] = BPs:get(i):haveGlass();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bite"] = BPs:get(i):bitten();
			ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["HasInjury"] = BPs:get(i):HasInjury();
		
	end
	player:getModData().ArmorBDamageSaved = true;
end

function tryBlock(BodyPartType, InjuryType, ArmorType, player)
	local Armor = player:getInventory():getItemFromType(ArmorType);
	if(InjuryType == "Scratch") then
		if(Armor:getModData().ScratchRes ~= nil) and (Armor:getModData().ScratchRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().ScratchRes[BodyPartType] );
		end	
	elseif(InjuryType == "DeepWound") then
		if((Armor:getModData().DeepWoundRes ~= nil) and Armor:getModData().DeepWoundRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().DeepWoundRes[BodyPartType] );
		end
	elseif(InjuryType == "Bite") then
		if(Armor:getModData().BiteRes ~= nil) and (Armor:getModData().BiteRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().BiteRes[BodyPartType] );
		end
	elseif(InjuryType == "Fracture") then
		if(Armor:getModData().FractureRes ~= nil) and (Armor:getModData().FractureRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().FractureRes[BodyPartType] );
		end
	elseif(InjuryType == "Burn") then
		if(Armor:getModData().BurnRes ~= nil) and (Armor:getModData().BurnRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().BurnRes[BodyPartType] );
		end
	elseif(InjuryType == "Glass") then
		if(Armor:getModData().GlassRes ~= nil) and (Armor:getModData().GlassRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().GlassRes[BodyPartType] );
		end
	elseif(InjuryType == "Bullet") then
		if(Armor:getModData().BulletRes ~= nil) and (Armor:getModData().BulletRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().BulletRes[BodyPartType] );
		end
	end

end
function EquipAsShield(item, player, equip) 

	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end

	
	if(equip == 1) then		
	
		if(MyShieldArmor[ID] ~= nil) and (MyShieldArmor[ID] ~= item) then  
			
			if player:getInventory():contains(MyShieldArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyShieldArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyShieldArmor[ID])
				player:setSecondaryHandItem(nil)
			end
		end
	
		MyShieldArmor[ID] = item
		loadArmorToPlayer(item, player);		
		if (player:getSecondaryHandItem() == player:getPrimaryHandItem()) then
			player:setPrimaryHandItem(nil);
		end
		player:setSecondaryHandItem(item);
		player:getModData().ShieldArmor = item:getType();
	else
		MyShieldArmor[ID] = nil
		player:getModData().ShieldArmor = nil;
		player:setSecondaryHandItem(nil);
	end
	
end
function EquipOnHead(item, player, equip) 
	
	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	--player:Say("player "..tostring(ID).." starting equip head")
	if(equip == 1) then
		
		if(MyHeadArmor[ID] ~= nil) and (MyHeadArmor[ID] ~= item) then  
			
			if player:getInventory():contains(MyHeadArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyHeadArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyHeadArmor[ID])
			end
			--player:Say("Un-Equipping old helm")
		end
	
		MyHeadArmor[ID] = item
		loadArmorToPlayer(item, player);
		player:getModData().HeadArmor = item:getType();	
		--player:Say("Equipping new helm: "..MyHeadArmor[ID]:getDisplayName()	)	
	else
		MyHeadArmor[ID] = nil
		player:getModData().HeadArmor = nil;
	end
end
function EquipOnHands(item, player, equip) 

	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	
	if(equip == 1) then		
	
		if(MyHandArmor[ID] ~= nil) and (MyHandArmor[ID] ~= item) then 
		
			if player:getInventory():contains(MyHandArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyHandArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyHandArmor[ID])
			end
		end
	
		MyHandArmor[ID] = item
		loadArmorToPlayer(item, player);
		player:getModData().HandArmor = item:getType();			
	else
		MyHandArmor[ID] = nil
		player:getModData().HandArmor = nil;
	end
end
function EquipOnArms(item, player, equip) 
	
	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	
	
	if(equip == 1) then
		
		if(MyArmArmor[ID] ~= nil) and (MyArmArmor[ID] ~= item) then 
			
			if player:getInventory():contains(MyArmArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyArmArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyArmArmor[ID])
			end
		end
	
		MyArmArmor[ID] = item
		loadArmorToPlayer(item, player);
		player:getModData().ArmArmor = item:getType();			
	else
		MyArmArmor[ID] = nil
		player:getModData().ArmArmor = nil;
	end
end
function EquipOnLegs(item, player, equip) 

	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	
	if(equip == 1) then
	
		if(MyLegArmor[ID] ~= nil) and (MyLegArmor[ID] ~= item) then 
			
			if player:getInventory():contains(MyLegArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyLegArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyLegArmor[ID])
			end
		end
	
		MyLegArmor[ID] = item
		loadArmorToPlayer(item, player);
		player:getModData().LegArmor = item:getType();			
	else
		MyLegArmor[ID] = nil
		player:getModData().LegArmor = nil;
	end
end
function EquipOnChest(item, player, equip) 

	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	
	
	if(equip == 1) then
	
		if(MyBodyArmor[ID] ~= nil) and (MyBodyArmor[ID] ~= item) then 
			
			if player:getInventory():contains(MyBodyArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyBodyArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyBodyArmor[ID])
			end
		end
	
		MyBodyArmor[ID] = item
		loadArmorToPlayer(item, player);
		player:getModData().ChestArmor = item:getType();			
	else	
		MyBodyArmor[ID] = nil
		player:getModData().ChestArmor = nil;
	end
end
function EquipOnFeet(item, player, equip) 

	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	
	
	if(equip == 1) then
		
		if(MyFeetArmor[ID] ~= nil) and (MyFeetArmor[ID] ~= item) then 
			
			if player:getInventory():contains(MyFeetArmor[ID]) then
				player:getCurrentSquare():AddWorldInventoryItem(MyFeetArmor[ID],0.5,0.5,0)	
				player:getInventory():DoRemoveItem(MyFeetArmor[ID])
			end
		end
	
		MyFeetArmor[ID] = item
		loadArmorToPlayer(item, player);
		player:getModData().FootArmor = item:getType();			
	else
		MyFeetArmor[ID] = nil
		player:getModData().FootArmor = nil;
	end
end

function DamageArmor(Armor, player, InjuryType)

	local Damage = 1;
	
	if(InjuryType == "Scratch") then
		Damage = 1;
	elseif(InjuryType == "DeepWound") then
		Damage = 3;
	elseif(InjuryType == "Bite") then
		Damage = 2;
	elseif(InjuryType == "Fracture") then
		Damage = 3;
	elseif(InjuryType == "Burn") then
		Damage = 2;
	elseif(InjuryType == "Glass") then
		Damage = 2;
	elseif(InjuryType == "Bullet") then
		Damage = 5;
	end

	local isBroken = false;
	Armor:getModData().Durability = Armor:getModData().Durability - Damage;
	if (Armor:getModData().Durability <= 0) then
		isBroken = true;
		if(Armor:getModData().onBreakTurnInto ~= nil) then
			print("adding broken armor" .. Armor:getModData().onBreakTurnInto);
			player:getInventory():AddItem(Armor:getModData().onBreakTurnInto);
		end
		player:getInventory():Remove(Armor);
	end
	return isBroken;
end

function wasDamagedBlocked(BodyPartType, InjuryType, player)

	if(ArmorTempBodyDamage[tostring(BodyPartType)]["Bandage"] == true) or (ArmorTempBodyDamage[tostring(BodyPartType)]["Splint"] == true) then
	return false;
	end

	if(player:getSecondaryHandItem() ~= nil) then
		if(player:getModData().ShieldArmor ~= nil) and (player:getSecondaryHandItem():getType() == player:getModData().ShieldArmor)  then
			if(tryBlock(BodyPartType, InjuryType, player:getModData().ShieldArmor, player) == true) then 
				if(DamageArmor(player:getInventory():getItemFromType(player:getModData().ShieldArmor),player,InjuryType) == true) then
					player:setSecondaryHandItem(nil);
				end
				return true;
			end
		end
	end
	if(player:getModData().HeadArmor ~= nil) and (player:getInventory():contains(player:getModData().HeadArmor)) then
		if(tryBlock(BodyPartType, InjuryType, player:getModData().HeadArmor, player) == true) then 
			DamageArmor(player:getInventory():getItemFromType(player:getModData().HeadArmor),player,InjuryType);
			return true;
		end
	end
	if(player:getModData().HandArmor ~= nil) and (player:getInventory():contains(player:getModData().HandArmor)) then
		if(tryBlock(BodyPartType, InjuryType, player:getModData().HandArmor, player) == true) then
			DamageArmor(player:getInventory():getItemFromType(player:getModData().HandArmor),player,InjuryType);
			return true;
		end
	end
	if(player:getModData().ArmArmor ~= nil) and (player:getInventory():contains(player:getModData().ArmArmor)) then
		if(tryBlock(BodyPartType, InjuryType, player:getModData().ArmArmor, player) == true) then
			DamageArmor(player:getInventory():getItemFromType(player:getModData().ArmArmor),player,InjuryType);
			return true;
		end
	end
	if(player:getModData().ChestArmor ~= nil) and (player:getInventory():contains(player:getModData().ChestArmor)) then
		if(tryBlock(BodyPartType, InjuryType, player:getModData().ChestArmor, player) == true) then
			DamageArmor(player:getInventory():getItemFromType(player:getModData().ChestArmor),player,InjuryType);
			return true;
		end
	end
	if(player:getModData().LegArmor ~= nil) and (player:getInventory():contains(player:getModData().LegArmor)) then
		if(tryBlock(BodyPartType, InjuryType, player:getModData().LegArmor, player) == true) then
			DamageArmor(player:getInventory():getItemFromType(player:getModData().LegArmor),player,InjuryType);
			return true;
		end
	end
	if(player:getModData().FootArmor ~= nil) and (player:getInventory():contains(player:getModData().FootArmor)) then
		if(tryBlock(BodyPartType, InjuryType, player:getModData().FootArmor, player) == true) then
			DamageArmor(player:getInventory():getItemFromType(player:getModData().FootArmor),player,InjuryType);
			return true;
		end
	end

	return false;
	
end

function healBodyPart(bodyPart, player, BD, ArmorTempBodyDamage)

	bodyPart:SetInfected(false);
	bodyPart:setInfectedWound(false);
	bodyPart:SetFakeInfected(false);
	bodyPart:setWoundInfectionLevel(0);	
	if(ArmorTempBodyDamage["IsInfected"] == false) and (BD:IsInfected() == true) then
		BD:setInf(false); -- remove infection if did not have before the blocked scratch
		BD:setInfectionLevel(0);
		BD:setInfectionGrowthRate(0);	
		BD:setFakeInfectionLevel(0);
	end
	bodyPart:RestoreToFullHealth();
	player:Say("!");
	sendClientCommand(player, "Armor", "Say", {saythis = "!"});
	
end

function ArmorCheckForDamage(player)
local ArmorbInjuryDetected = false;
	if(player:getModData().ArmorBDamageSaved ~= nil) and (player ~= nil) then
		
		local BD = player:getBodyDamage();
		--local InjuryTypes = {0 = "Scratch",1 = "DeepWound", 2 = "Burn", 3 = "BulletRes", 4 = "Fracture", 5 = "Glass"};
		
		ArmorTempBodyDamage = player:getModData().ArmorTempBodyDamage;
			
		local BPs = BD:getBodyParts();
		for i=0, BPs:size()-1 do
			if((ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bandage"] == false) and (ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["HasInjury"] == false)) then
			
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Scratch"] ~= BPs:get(i):scratched()) and (BPs:get(i):scratched() == true) then
					--player:Say("Scratch Detected on ".. tostring(BPs:get(i):getType()));
					if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "Scratch", player)) then
						healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);						
					end
					ArmorbInjuryDetected = true;
				end
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["DeepWound"] ~= BPs:get(i):deepWounded()) and (BPs:get(i):deepWounded() == true) and (ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bullet"] ~= true) and (ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Glass"] ~= true) then
					if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bullet"]) or (ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Glass"]) then
						ArmorbInjuryDetected = true;
					else						
						if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "DeepWound", player)) then
							healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);	
						end
					end
					ArmorbInjuryDetected = true;
				end
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bite"] ~= BPs:get(i):bitten()) and (BPs:get(i):bitten() == true) then
					--player:Say("Bite Detected on ".. tostring(BPs:get(i):getType()));
					if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "Bite", player)) then
						healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);	
					end
					ArmorbInjuryDetected = true;
				end
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Burn"] ~= BPs:get(i):getBurnTime()) and (BPs:get(i):getBurnTime() ~= 0) then
					--player:Say("Burn Detected on ".. tostring(BPs:get(i):getType()) );
					if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "Burn", player)) then
						healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);	
					end
					ArmorbInjuryDetected = true;
				end
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Bullet"] ~= BPs:get(i):haveBullet()) and (BPs:get(i):haveBullet() == true) and (BPs:get(i):deepWounded() == false) then
					--player:Say("Lodged Bullets Detected on ".. tostring(BPs:get(i):getType()));
					if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "Bullet", player)) then
						healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);	
					end
					ArmorbInjuryDetected = true;
				end
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Fracture"] ~= BPs:get(i):getFractureTime()) and (BPs:get(i):getFractureTime() ~= 0) and (BPs:get(i):isSplint() == false) then
					--player:Say("Fracture Detected on ".. tostring(BPs:get(i):getType()));
					if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "Fracture", player)) then
						healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);	
					end
					ArmorbInjuryDetected = true;
				end
				if(ArmorTempBodyDamage[tostring(BPs:get(i):getType())]["Glass"] ~= BPs:get(i):haveGlass()) and (BPs:get(i):haveGlass() == true) and (BPs:get(i):deepWounded() == false) then
					--player:Say("Logged Glass Detected on ".. tostring(BPs:get(i):getType()));
					if(wasDamagedBlocked(tostring(BPs:get(i):getType()), "Glass", player)) then
						healBodyPart(BPs:get(i), player, BD, ArmorTempBodyDamage);	
					end
					ArmorbInjuryDetected = true;
				end
			end
		end
	
	end
	
	if(ArmorbInjuryDetected) then
		ArmorSaveBodyDamage(player);
	end
	
	return ArmorbInjuryDetected;
end

function ArmorupdateThePlayer(player)
	
	if(player:getModData().Reducer == nil) then player:getModData().Reducer = 0 
	else player:getModData().Reducer = player:getModData().Reducer + 1 end
	
	if(player:getModData().Reducer % 5 == 0) then
		ArmorCheckForDamage(player)
	end
	if(player:getModData().Reducer % 30 == 0) then
		ArmorValidateEquipped(player)
	end
	
end

function ArmorisArmorEquipped(player,item)
	
	
	if(player:getInventory():contains(item)) then 
		local ID
		if (player:getModData().ID ~= nil) then ID = player:getModData().ID
		else ID = 0 end
	
		if(MyArmArmor[ID] == item) then return true
		elseif(MyHeadArmor[ID] == item) then return true
		elseif(MyLegArmor[ID] == item) then return true
		elseif(MyBodyArmor[ID] == item) then return true
		elseif(MyHandArmor[ID] == item) then return true
		elseif(MyFeetArmor[ID] == item) then return true
		elseif(MyShieldArmor[ID] == item) then return true
		else return false end
	else return false end
	
end

function ArmorValidateEquipped(player)
		
	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	
	--getSpecificPlayer(0):Say("doing valid check for player: "..tostring(ID))
	
	if (MyShieldArmor[ID] ~= nil) and ( (player:getInventory():contains(MyShieldArmor[ID]) == false) or (player:getSecondaryHandItem() ~= MyShieldArmor[ID]) ) then
		player:getModData().ShieldArmor = nil
		MyShieldArmor[ID] = nil
	end
	if(MyHeadArmor[ID] ~= nil) and (player:getInventory():contains(MyHeadArmor[ID]) == false) then
		player:getModData().HeadArmor = nil
		MyHeadArmor[ID] = nil
	end
	if(MyHandArmor[ID] ~= nil) and (player:getInventory():contains(MyHandArmor[ID]) == false) then
		player:getModData().HandArmor = nil
		MyHandArmor[ID] = nil
	end
	if(MyArmArmor[ID] ~= nil) and (player:getInventory():contains(MyArmArmor[ID]) == false) then
		player:getModData().ArmArmor = nil
		MyArmArmor[ID] = nil
	end
	if(MyLegArmor[ID] ~= nil) and (player:getInventory():contains(MyLegArmor[ID]) == false) then
		player:getModData().LegArmor = nil
		MyLegArmor[ID] = nil
	end
	if(MyBodyArmor[ID] ~= nil) and (player:getInventory():contains(MyBodyArmor[ID]) == false) then
		player:getModData().ChestArmor = nil
		MyBodyArmor[ID] = nil
	end
	if(MyFeetArmor[ID] ~= nil) and (player:getInventory():contains(MyFeetArmor[ID]) == false) then
		player:getModData().FootArmor = nil
		MyFeetArmor[ID] = nil
	end
		
		
end

function ArmorInitCheck(player)
	
	local debugoutput = false
	local ID
	if (player:getModData().ID ~= nil) then ID = player:getModData().ID
	else ID = 0 end
	if(MyArmorInitCheck[ID] == nil) then
		
		if debugoutput then print("doing init check for player: "..tostring(ID)) end
		
		if(player:getModData().ShieldArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().ShieldArmor)
			if armor then 
				MyShieldArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		if(player:getModData().HeadArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().HeadArmor)
			if armor then 
				MyHeadArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		if(player:getModData().HandArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().HandArmor)
			if armor then 
				MyHandArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		if(player:getModData().ArmArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().ArmArmor)
			if armor then 
				MyArmArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		if(player:getModData().LegArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().LegArmor)
			if armor then 
				MyLegArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		if(player:getModData().ChestArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().ChestArmor)
			if armor then 
				MyBodyArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		if(player:getModData().FootArmor ~= nil) then
			local armor = player:getInventory():FindAndReturn(player:getModData().FootArmor)
			if armor then 
				MyFeetArmor[ID] = armor 
				if debugoutput then print("doing init check for player: "..tostring(ID)) end
			end
		end
		
		MyArmorInitCheck[ID] = true
		
	end

end

function ArmorInit()
	ArmorSaveBodyDamage(getSpecificPlayer(0));
	ArmorInitCheck(getSpecificPlayer(0))
end
function ArmorKeysUp(keynum)
	--getSpecificPlayer(0):Say(tostring(keynum));
	if keynum == 25 and getSpecificPlayer(0) ~= nil then
		local player = getSpecificPlayer(0);
		local armorstring = "Currently Equipped Armor \n";
		if(player:getModData().ShieldArmor ~= nil) and (player:getSecondaryHandItem() ~= nil) and (player:getSecondaryHandItem():getType() == player:getModData().ShieldArmor) then
		armorstring = armorstring .. "Shield: " .. player:getInventory():getItemFromType(player:getModData().ShieldArmor):getDisplayName() .. "\n";
		end
		if(player:getModData().HeadArmor ~= nil) and (player:getInventory():contains(player:getModData().HeadArmor)) then
		armorstring = armorstring .. "Helmet: " .. player:getInventory():getItemFromType(player:getModData().HeadArmor):getDisplayName() .. "\n";
		end
		if(player:getModData().HandArmor ~= nil) and (player:getInventory():contains(player:getModData().HandArmor)) then
		armorstring = armorstring .. "Hands: " .. player:getInventory():getItemFromType(player:getModData().HandArmor):getDisplayName() .. "\n";
		end
		if(player:getModData().ArmArmor ~= nil) and (player:getInventory():contains(player:getModData().ArmArmor)) then
		armorstring = armorstring .. "Arms: " .. player:getInventory():getItemFromType(player:getModData().ArmArmor):getDisplayName() .. "\n";
		end
		if(player:getModData().LegArmor ~= nil) and (player:getInventory():contains(player:getModData().LegArmor)) then
		armorstring = armorstring .. "Legs: " .. player:getInventory():getItemFromType(player:getModData().LegArmor):getDisplayName() .. "\n";
		end
		if(player:getModData().ChestArmor ~= nil) and (player:getInventory():contains(player:getModData().ChestArmor)) then
		armorstring = armorstring .. "Chest: " .. player:getInventory():getItemFromType(player:getModData().ChestArmor):getDisplayName() .. "\n";
		end
		if(player:getModData().FootArmor ~= nil) and (player:getInventory():contains(player:getModData().FootArmor)) then
		armorstring = armorstring .. "Feet: " .. player:getInventory():getItemFromType(player:getModData().FootArmor):getDisplayName() .. "\n";
		end
				
		ArmorWindow:setText(armorstring);
		ArmorWindow:setVisible(true);
	end		
end

Events.OnKeyPressed.Add(ArmorKeysUp);
Events.OnPlayerUpdate.Add(ArmorupdateThePlayer);
Events.OnGameStart.Add(ArmorInit);
