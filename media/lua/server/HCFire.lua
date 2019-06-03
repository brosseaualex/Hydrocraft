--Fire Risks

function FindProtection(player)
	local head = -1;
	local body = -1;
	inv = player:getInventory();
	if inv:contains("HCFiresuit") then
		body = 0;
		head = 0;
	end
	if body < 0 then
		if inv:contains("HCFirefighterjacket") then
			body = 1;
		elseif inv:contains("HCBlacksmithapron") then
			body = 2;
		end
	end
	if head < 0 then
		if inv:contains("HCFirefighterhelmet") then
			head = 1;
		elseif inv:contains("HCWeldingmask") then
			head = 2;
		elseif inv:contains("HCBlacksmithgoggles") then
			head = 3;			
		end
	end
	return body, head;
end

function DoDamage(hBurnType, bBurnType, h, b,  player)
	local hProt = 0;
	local bProt = 0;
	if h == 0 or b == 0 then
		return;
	end
	
	if h == 1 then
		hProt = 0.5;
	elseif h == 2 then
		hProt = 0.25;
	elseif h == 3 then
		hProt = 0.75;		
	end
	if b == 1 then
		bProt = 0.5;
	elseif b == 2 then
		bProt = 0.25;
	elseif b == 3 then
		bProt = 0.75;		
	end
	
	if hBurnType == 0 then
		 player:getBodyDamage():getBodyPart(BodyPartType.Head):AddDamage(5*hProt);
		 player:getBodyDamage():getBodyPart(BodyPartType.Head):setBurned();
	elseif hBurnType == 1 then
		player:getBodyDamage():getBodyPart(BodyPartType.Head):AddDamage(10*hProt);
		player:getBodyDamage():getBodyPart(BodyPartType.Head):setBurned();	
	elseif hBurnType == 2 then
		player:getBodyDamage():getBodyPart(BodyPartType.Head):AddDamage(15*hProt);
		player:getBodyDamage():getBodyPart(BodyPartType.Head):setBurned();
	elseif hBurnType == 3 then
		player:setOnFire(true);
	end
	
	if bBurnType == 0 then
		player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):AddDamage(5*hProt);
		player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):setBurned();
	elseif bBurnType == 1 then
		player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):AddDamage(10*hProt);
		player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):setBurned();
	elseif bBurnType == 2 then
		player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):AddDamage(15*hProt);
		player:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):setBurned();
	elseif bBurnType == 3 and hBurnType ~= 3 then
		player:setOnFire(true);
	end

	if bBurnType < hBurnType then
		HCSpeakBurn(player, hBurnType);
	else
		HCSpeakBurn(player, bBurnType);
	end

	return;
end

function KilnUse(items, result, player)
	local h,b = FindProtection(player);
	local hBurn = -1;
	local bBurn = -1;
	if ZombRand(100) > 99 then
		hBurn = 0;
	end
	if ZombRand(100) > 99 then
		bBurn = 0;
	end
	DoDamage(hBurn, bBurn, h, b, player);
end

function SmeltUse(items, result, player)
	local h,b = FindProtection(player);
	local hBurn = -1;
	local bBurn = -1;
	if ZombRand(100) > 59 then
		hBurn = ZombRand(2);
	end
	if ZombRand(100) > 59 then
		bBurn = ZombRand(2);
	end
	DoDamage(hBurn, bBurn, h, b, player);
end

function BFurnUse(items, result, player)
	local h,b = FindProtection(player);
	local hBurn = -1;
	local bBurn = -1;
	if ZombRand(100) > 39 then
		hBurn = ZombRand(3);
	end
	if ZombRand(100) > 39 then
		bBurn = ZombRand(3);
	end
	DoDamage(hBurn, bBurn, h, b, player);
end

function IFurnUse(items, result, player)
	local h,b = FindProtection(player);
	local hBurn = -1;
	local bBurn = -1;
	if ZombRand(100) > 19 then
		hBurn = ZombRand(4);
	end
	if ZombRand(100) > 19 then
		bBurn = ZombRand(4);
	end
	DoDamage(hBurn, bBurn, h, b, player);
end

function HCSpeakBurn(player, burn)
    if burn >= 0 and burn < 3 then
   	 player:Say("Ouch, that burns!");
   	 player:getCurrentSquare():playSound("PZ_Fire", false);
    elseif burn == 3 then
   	 player:Say("Help! I'm on fire!");
    end
end  

function WandFire(items, result, player)
player:setOnFire(true);
end