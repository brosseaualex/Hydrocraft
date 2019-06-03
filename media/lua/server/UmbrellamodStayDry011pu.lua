-- ================================================ --
--              	UmbrellaMod 	            	--
--				created by Suomiboi					--
-- ================================================	--

require "defines"

--Created from the basis of Kinyoshi's Raincoat mod. Thanks and credits to him!--
--Huge thanks to RoboMat for help with the code and awesome mods that helped me learn lua!!--
--Also thanks to RegularX, Kjulo and Aricane whos mods I've also been using to learn the lua!--
--Function for umbrella in primary slot--
--credits to RoboMat for adding split-screen compatibility--

--UmbrellaMod, Hydrocraft version.
--Modified by Yossitaru.
--Raincoats and Ponchos are now things.
--All items consolidated into a single function.
--Functionality of this process is otherwise unchanged.

--Gets the item's type.
function typeGetter(x)
	if x then
		return x:getType();
	else
		return "";
	end
end

local function checkUmbrella(player)
	local weapon = player:getPrimaryHandItem();
    local weapons = player:getSecondaryHandItem();
	local shirt = player:getClothingItem_Torso();
    local getwetness = player:getBodyDamage():getWetness();
	local wtype = typeGetter(weapon);
	local wstype = typeGetter(weapons);
	local stype = typeGetter(shirt);
	
	--Main and off hands for umbrellas, shirt for ponchos and raincoats.
	if weapon or weapons or shirt then
		if wtype ~= "UmbrellaOpen" and wtype ~= "HCWagoncoveredhorsemale" and wtype ~= "HCWagoncoveredhorsefemale" and wtype ~= "HCWagoncovered" and wtype ~= "HCWagoncoveredoxen" and wstype ~= "UmbrellaOpen" and stype ~= "HCRaincoat" and stype ~= "HCRainponcho" then
			return;
		
		elseif player:isOutside() then
			--print("UmbrellaMod:: Has Umbrella Equipped as Primary and outside.");

            --  boundaries between wetness:
            --  x < 14 dry
            --  14 <= x > 39 damp
            --  39 <= x > 69 wet
            --  69 <= x soaking

			if RainManager.isRaining() and getwetness > 14 and getwetness < 39 then
				--print("Umbrella Mod:: Is Raining and damp.");
				player:getBodyDamage():setWetness(21);
				
				ZomboidGlobals["WetnessIncrease"] = 0.0;
				--print("Umbrella Mod:: You seem to remain somewhat dry in the rain!");
            end
            if RainManager.isRaining() and getwetness >= 39 and getwetness < 69 then
                --print("Umbrella Mod:: Is Raining and wet.");
                player:getBodyDamage():setWetness(45);

                --print("Umbrella Mod:: You're not getting any wetter!");
            end
            if RainManager.isRaining() and getwetness >= 69 then
                --print("Umbrella Mod:: Is Raining and soaked.");
                player:getBodyDamage():setWetness(75);

                --print("Umbrella Mod:: You're not getting any wetter!");
            end
		end
    end
end

--Redundant.
--Function for umbrella in secondary slot--
--[[local function checkUmbrellaSecondary()
    local player = getSpecificPlayer(0);
    local weapons = player:getSecondaryHandItem();
    local getwetness = player:getBodyDamage():getWetness();


    if weapons then
        local wstype = weapons:getType();
        if wstype ~= "UmbrellaOpen" then
            return;
        end

        if wstype == "UmbrellaOpen" and player:isOutside() then
            --print("UmbrellaMod:: Has Umbrella Equipped as Secondary and outside.");

            if RainManager.isRaining() and getwetness > 14 and getwetness < 39 then
                --print("Umbrella Mod:: Is Raining and damp.");
                player:getBodyDamage():setWetness(21);
                --print("Umbrella Mod:: You seem to remain somewhat dry in the rain!");
            end
            if RainManager.isRaining() and getwetness >= 39 and getwetness < 69 then
                --print("Umbrella Mod:: Is Raining and wet.");
                player:getBodyDamage():setWetness(45);
                --print("Umbrella Mod:: You're not getting any wetter!");
            end
            if RainManager.isRaining() and getwetness >= 69 then
                --print("Umbrella Mod:: Is Raining and soaked.");
                player:getBodyDamage():setWetness(75);
                --print("Umbrella Mod:: You're not getting any wetter!");
            end
        end
    end
end]]--

Events.OnPlayerUpdate.Add(checkUmbrella);
--Events.OnPlayerUpdate.Add(checkUmbrellaSecondary);
