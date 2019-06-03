function HCOnfire(items, result, player)

	player:setOnFire(true);

end

function HCPoison(items, result, player)

	player:getBodyDamage():setPoisonLevel(500.0);
	player:getBodyDamage():Update();
	
end

function HCPoisonNL(items, result, player)

	player:getBodyDamage():setPoisonLevel(25.0);
	player:getBodyDamage():Update();
	
end

function HCAddPoison(items, result, player)
		 
	player:getInventory():FindAndReturnCategory("Food"):setPoisonPower(500.0);
	player:Say("*Adds the poison into " .. player:getInventory():FindAndReturnCategory("Food"):getType() .. "*");
	
end
function HCAddPoisonNL(items, result, player)
	
	player:getInventory():FindAndReturnCategory("Food"):setPoisonPower(25.0);
	player:Say("*Adds the poison into " .. player:getInventory():FindAndReturnCategory("Food"):getType() .. "*");
	
end

function HCKill(items, result, player)
	
	player:getBodyDamage():getBodyPart(BodyPartType.Head):AddDamage(500);
	player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):AddDamage(500);
	player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):AddDamage(500);
	player:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_R):AddDamage(500);
	player:getBodyDamage():Update();
		
end
function HCPourwater(items, result, player)

	local newwetness = player:getBodyDamage():getWetness() + 35.0;
	player:getBodyDamage():setWetness(newwetness);
	player:getBodyDamage():UpdateWetness();
	player:getBodyDamage():setIsOnFire(false);
		
end
function HCBurn(items, result, player)

	local dmg = ZombRand(5) + 10;
	player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):AddDamage(dmg);
	player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):setBurned();
		
end
function HCStab(items, result, player)
	
	local dmg = ZombRand(5) + 65;
	player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):AddDamage(dmg);
	player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):setBleeding(true);
	player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):setDeepWounded(true);
		
end

function HCShoothead(items, result, player)
	
	local dmg = ZombRand(10) + 80;
	player:getBodyDamage():getBodyPart(BodyPartType.Head):AddDamage(dmg);
	player:getBodyDamage():getBodyPart(BodyPartType.Head):setBleeding(true);
	player:getBodyDamage():getBodyPart(BodyPartType.Head):setDeepWounded(true);
	player:getBodyDamage():getBodyPart(BodyPartType.Head):setHaveBullet(true,1);
		
end

function HCShootleg(items, result, player)
	
	local dmg = ZombRand(10) + 45;
	player:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_R):AddDamage(dmg);
	player:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_R):setBleeding(true);
	player:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_R):setDeepWounded(true);
	player:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_R):setHaveBullet(true,1);
		
end

function HCSlit(items, result, player)
	
	local dmg = ZombRand(5) + 15;
	player:getBodyDamage():getBodyPart(BodyPartType.ForeArm_L):AddDamage(dmg);
	player:getBodyDamage():getBodyPart(BodyPartType.ForeArm_L):setBleeding(true);
	player:getBodyDamage():getBodyPart(BodyPartType.ForeArm_L):setDeepWounded(true);
		
end

function HCInfect(items, result, player)
	
	local dmg = ZombRand(5) + 15;
	player:getBodyDamage():getBodyPart(BodyPartType.ForeArm_L):AddDamage(dmg);
	player:getBodyDamage():getBodyPart(BodyPartType.ForeArm_L):setScratched(true);
	player:getBodyDamage():setInfectionLevel(1);
		
end


