--- HUNTING MOD LUAS ---
--- *UNGRATEFULDEAD* ---
------------------------
--Adapted for Hydrocraft by Yossitaru.
------HUNTING-----

function countDogs(player)
	 local inv = player:getInventory();
	local dogsFullType = {"Hydrocraft.HCBeaglemale", "Hydrocraft.HCBeaglefemale", "Hydrocraft.HCBoxermale", "Hydrocraft.HCBoxerfemale", "Hydrocraft.HCDachshundmale", "Hydrocraft.HCDachshundfemale", "Hydrocraft.HCGermanshepherdmale", "Hydrocraft.HCGermanshepherdfemale", "Hydrocraft.HCGreatdanemale", "Hydrocraft.HCGreatdanefemale", "Hydrocraft.HCIrishsettermale", "Hydrocraft.HCIrishsetterfemale", "Hydrocraft.HCGoldenmale", "Hydrocraft.HCGoldenfemale", "Hydrocraft.HCLabradormale", "Hydrocraft.HCLabradorfemale", "Hydrocraft.HCShibainumale", "Hydrocraft.HCShibainufemale"};
	local count = 0;
	 for x=1, #dogsFullType do
		count = count + inv:getItemCount(dogsFullType[x]);
		local dogsType = string.split(dogsFullType[x], "\\.")[2];
			for k,v in pairs(buildUtil.checkMaterialOnGround(player:getCurrentSquare())) do
			if k == dogsType then
				count = count + v;
			end
		end
	end
	return count;
end

function HCSpeaking(player, line)
	if line == 0 then
		player:Say("This is too difficult!");
	elseif line == 1 then
		player:Say("I bagged one!");
	elseif line == 2 then
		player:Say("Darn, it got away!");
	elseif line == 3 then
		player:Say("What a waste, the bears are hibernating!");
	end
end

function HCHuntSmallGame(items, result, player)
	if not player:isOutside() then
		player:Say("There are no animals indoors.");
	return;
	end
	local chance = 0;
	--Base chance per weapon type.	
	for x=0, items:size()-1 do
		if items:get(x):getType() == "WoodenLance" then
			chance = 39;
		elseif items:get(x):getType() == "HCLongbow" or items:get(x):getType() == "HCCrossbow" then
			chance = 49;
		elseif items:get(x):getType() == "Shotgun" or items:get(x):getType() == "VarmintRifle" or items:get(x):getType() == "HuntingRifle" then
			chance = 69;
		end
	end
	--Add skill bonuses.
	chance = chance + ((player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Sneak)) * 1.5);
	--Dog bonus.
	chance = chance + (countDogs(player) * 5);
	--Wintertime check.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		chance = chance - 49;
	end
	if chance < 0 then
		HCSpeaking(player, 0);
	else
		local actual = ZombRand(100);
		if actual <= chance then
			local animal = ZombRand(12);
			if animal == 0 then
				player:getInventory():AddItem("Base.DeadRabbit");
			elseif animal == 1 then
				player:getInventory():AddItem("Base.DeadSquirrel");
			elseif animal == 2 then
				player:getInventory():AddItem("Hydrocraft.HCFoxdead");
			elseif animal == 3 then
				player:getInventory():AddItem("Hydrocraft.HCSkunkdead");
			elseif animal == 4 then
				player:getInventory():AddItem("Hydrocraft.HCRaccoondead");
			elseif animal == 5 then
				player:getInventory():AddItem("Hydrocraft.HCBeaverdead");
			elseif animal == 6 then
				player:getInventory():AddItem("Hydrocraft.HCMuskratdead");
			elseif animal == 7 then
				player:getInventory():AddItem("Hydrocraft.HCOpossumdead");
			elseif animal == 8 then
				player:getInventory():AddItem("Hydrocraft.HCGroundhogdead");
			elseif animal == 9 then
				player:getInventory():AddItem("Hydrocraft.HCArmadillodead");
			elseif animal == 10 then
				player:getInventory():AddItem("Hydrocraft.HCPorcupinedead");
			elseif animal == 11 then
				player:getInventory():AddItem("Hydrocraft.HCNutriadead");
			end
			HCSpeaking(player, 1);
		else
			HCSpeaking(player, 2);
		end
	end
end

function HCHuntDeer(items, result, player)
	if not player:isOutside() then
		player:Say("There are no animals indoors.");
	return;
	end
	local chance = 0;
	--Base chance per weapon type.
	for x=0, items:size()-1 do
		if items:get(x):getType() == "WoodenLance" then
			chance = 29;
		elseif items:get(x):getType() == "HCLongbow" or items:get(x):getType() == "HCCrossbow" then
			chance = 39;
		elseif items:get(x):getType() == "Shotgun" or items:get(x):getType() == "VarmintRifle" or items:get(x):getType() == "HuntingRifle" then
			chance = 59;
		end
	end
	--Add skill bonuses.
	chance = chance + ((player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Sneak)) * 1.5);
	--Dog bonus.
	chance = chance + (countDogs(player) * 5);
	--Wintertime check.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		chance = chance - 49;
	end
	if chance < 0 then
		HCSpeaking(player, 0);
	else
		actual = ZombRand(100);
		if actual <= chance then
			local animal = ZombRand(2)
			if animal == 0 then
				player:getInventory():AddItem("Hydrocraft.HCDeerdead");
			elseif animal == 1 then
				player:getInventory():AddItem("Hydrocraft.HCDeerdead2");
			end
			HCSpeaking(player, 1);
		else
			HCSpeaking(player, 2);
		end
	end
end

function HCHuntBoar(items, result, player)
	if not player:isOutside() then
		player:Say("There are no animals indoors.");
	return;
	end
	local chance = 0;
	--Base chance per weapon type.
	for x=0, items:size()-1 do
		if items:get(x):getType() == "WoodenLance" then
			chance = 19;
		elseif items:get(x):getType() == "HCLongbow" or items:get(x):getType() == "HCCrossbow" then
			chance = 29;
		elseif items:get(x):getType() == "Shotgun" or items:get(x):getType() == "VarmintRifle" or items:get(x):getType() == "HuntingRifle" then
			chance = 49;
		end
	end
	--Add skill bonuses.
	chance = chance + ((player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Sneak)) * 1.5);
	--Dog bonus.
	chance = chance + (countDogs(player) * 5);
	--Wintertime check.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		chance = chance - 49;
	end
	if chance < 0 then
		HCSpeaking(player, 0);
	else
		actual = ZombRand(100);
		if actual <= chance then
			local animal = ZombRand(2)
			if animal == 0 then
				player:getInventory():AddItem("Hydrocraft.HCBoardead");
			elseif animal == 1 then
				player:getInventory():AddItem("Hydrocraft.HCPigdead");
			end
			HCSpeaking(player, 1);
		else
			HCSpeaking(player, 2);
		end
	end
end

function HCHuntBear(items, result, player)
	if not player:isOutside() then
		player:Say("There are no animals indoors.");
	return;
	end
	local chance = 0;
	--Base chance per weapon type.
	for x=0, items:size()-1 do
		if items:get(x):getType() == "WoodenLance" then
			chance = 19;
		elseif items:get(x):getType() == "HCLongbow" or items:get(x):getType() == "HCCrossbow" then
			chance = 29;
		elseif items:get(x):getType() == "Shotgun" or items:get(x):getType() == "VarmintRifle" or items:get(x):getType() == "HuntingRifle" then
			chance = 49;
		end
	end
	--Add skill bonuses.
	chance = chance + ((player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Sneak)) * 1.5);
	--Dog bonus.
	chance = chance + (countDogs(player) * 5);
	--Wintertime check.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		HCSpeaking(player, 3);
	else
		if chance < 0 then
			HCSpeaking(player, 0);
		else
			actual = ZombRand(100);
			if actual <= chance then
				local animal = ZombRand(2)
				if animal == 0 then
					player:getInventory():AddItem("Hydrocraft.HCBeardead");
				elseif animal == 1 then
					player:getInventory():AddItem("Hydrocraft.HCBlackbeardead");
				end
				HCSpeaking(player, 1);
			else
				HCSpeaking(player, 2);
			end
		end
	end
end

function HCHuntBird(items, result, player)
	if not player:isOutside() then
		player:Say("There are no animals indoors.");
	return;
	end
	local chance = 0;
	--Base chance per weapon type.
	for x=0, items:size()-1 do
		if items:get(x):getType() == "HCLongbow" or items:get(x):getType() == "HCCrossbow" then
			chance = 49;
		elseif items:get(x):getType() == "Shotgun" or items:get(x):getType() == "VarmintRifle" or items:get(x):getType() == "HuntingRifle" then
			chance = 69;
		end
	end
	--Add skill bonuses.
	chance = chance + ((player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Sneak)) * 1.5);
	--Dog bonus.
	chance = chance + (countDogs(player) * 5);
	--Wintertime check.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		chance = chance - 74;
	end
	if chance < 0 then
		HCSpeaking(player, 0);
	else
		actual = ZombRand(100);
		if actual <= chance then
			local animal = ZombRand(12)
			if animal == 0 then
				player:getInventory():AddItem("Base.DeadBird");
			elseif animal == 1 then
				player:getInventory():AddItem("Hydrocraft.HCPigeondead");
			elseif animal == 2 then
				player:getInventory():AddItem("Hydrocraft.HCChickendead");
			elseif animal == 3 then
				player:getInventory():AddItem("Hydrocraft.HCChickendead2");
			elseif animal == 4 then
				player:getInventory():AddItem("Hydrocraft.HCTurkeydead");
			elseif animal == 5 then
				player:getInventory():AddItem("Hydrocraft.HCQuaildead");
			elseif animal == 6 then
				player:getInventory():AddItem("Hydrocraft.HCGrousedead");
			elseif animal == 7 then
				player:getInventory():AddItem("Hydrocraft.HCCrowdead");
			elseif animal == 8 then
				player:getInventory():AddItem("Hydrocraft.HCMagpiedead");
			elseif animal == 9 then
				player:getInventory():AddItem("Hydrocraft.HCBluejaydead");
			elseif animal == 10 then
				player:getInventory():AddItem("Hydrocraft.HCCardinaldead");
			elseif animal == 11 then
				player:getInventory():AddItem("Hydrocraft.HCSparrowdead");					
			end
			HCSpeaking(player, 1);
		else
			HCSpeaking(player, 2);
		end
	end
end

function HCHuntWaterfowl(items, result, player)
	if not player:isOutside() then
		player:Say("There are no animals indoors.");
	return;
	end
	local chance = 0;
	--Base chance per weapon type.
	for x=0, items:size()-1 do
		if items:get(x):getType() == "HCLongbow" or items:get(x):getType() == "HCCrossbow" then
			chance = 49;
		elseif items:get(x):getType() == "Shotgun" or items:get(x):getType() == "VarmintRifle" or items:get(x):getType() == "HuntingRifle" then
			chance = 69;
		end
	end
	--Add skill bonuses.
	chance = chance + ((player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Sneak)) * 1.5);
	--Dog bonus.
	chance = chance + (countDogs(player) * 5);
	--Wintertime check.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		chance = chance - 74;
	end
	if chance < 0 then
		HCSpeaking(player, 0);
	else
		actual = ZombRand(100);
		if actual <= chance then
			local animal = ZombRand(17)
			if animal == 0 then
				player:getInventory():AddItem("Hydrocraft.HCDuckdead");
			elseif animal == 1 then
				player:getInventory():AddItem("Hydrocraft.HCDMallarddead");
			elseif animal == 2 then
				player:getInventory():AddItem("Hydrocraft.HCCanadiangoosedead");
			elseif animal == 3 then
				player:getInventory():AddItem("Hydrocraft.HCSnowgoosedead");
			elseif animal == 4 then
				player:getInventory():AddItem("Hydrocraft.HCRedheadduckdead");
			elseif animal == 5 then
				player:getInventory():AddItem("Hydrocraft.HCRedheadduckdead2");
			elseif animal == 6 then
				player:getInventory():AddItem("Hydrocraft.HCPintailduckdead");
			elseif animal == 7 then
				player:getInventory():AddItem("Hydrocraft.HCPintailduckdead2");
			elseif animal == 8 then
				player:getInventory():AddItem("Hydrocraft.HCBlackduckdead");
			elseif animal == 9 then
				player:getInventory():AddItem("Hydrocraft.HCBlackduckdead2");
			elseif animal == 10 then
				player:getInventory():AddItem("Hydrocraft.HCCanvasbackduckdead");
			elseif animal == 11 then
				player:getInventory():AddItem("Hydrocraft.HCCanvasbackduckdead2");
			elseif animal == 12 then
				player:getInventory():AddItem("Hydrocraft.HCScaupduckdead");
			elseif animal == 13 then
				player:getInventory():AddItem("Hydrocraft.HCScaupduckdead2");
			elseif animal == 14 then
				player:getInventory():AddItem("Hydrocraft.HCCootdead");
			elseif animal == 15 then
				player:getInventory():AddItem("Hydrocraft.HCWoodduckdead");
			elseif animal == 16 then
				player:getInventory():AddItem("Hydrocraft.HCWoodduckdead2");
			end
			HCSpeaking(player, 1);
		else
			HCSpeaking(player, 2);
		end
	end
end