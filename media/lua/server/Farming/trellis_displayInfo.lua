-----------------------------------------------------------------------
--                          FARMING MOD                              --
--                      CODE BY ROBERT JOHNSON                       --
--                       TEXTURES BY THUZTOR                         --
-----------------------------------------------------------------------
--                          OFFICIAL TOPIC                           --
--  http://www.theindiestone.com/community/viewtopic.php?f=33&t=8675 --
--                                                                   --
-----------------------------------------------------------------------

trellis_displayInfo = {};
water_rgb = {["r"]=255.0,["g"]=255.0,["b"]=255.0};
fertilizer_rgb = {["r"]=0.0,["g"]=0.0,["b"]=0.0};
disease_rgb = {["0r"]=255.0,["0g"]=255.0,["0b"]=255.0};
disease = {};

trellis_displayInfo.showVineStat = function(curVine)
	if(curVine ~= nil and curVine.state ~= "trellised") then
		local textManager = getTextManager();
		local core = getCore();
		local posX = 580;
		local posY = 100;
--		local background = getTexture("media/texturepacks/Thuztor_uiFbox.png");
--		background:render(700, 282);
		getWaterLvlColor(curVine);
		getWaterFertilizerColor(curVine);
		disease = getDiseaseName(curVine)
		textManager:DrawStringCentre(UIFont.Small, posX + 245, posY + 215, curVine.tile:getObjectName(), 1, 1, 1, 0.9);
		textManager:DrawStringCentre(UIFont.Small, posX + 245, posY + 218, "____________________________________", 1, 1, 1, 0.9);
		textManager:DrawString(UIFont.Small, posX + 160, posY + 230, "My farming xp : " .. trellisFarming.farmingXp, 1, 1, 1, 0.9);
		textManager:DrawString(UIFont.Small, posX + 160, posY + 245, "Current growing phase : " .. getCurrentGrowingPhase(curVine), 1, 1, 1, 0.9);
		textManager:DrawString(UIFont.Small, posX + 160, posY + 260, "Next growing phase : " .. getNextGrowingPhase(curVine), 1, 1, 1, 0.9);
		textManager:DrawString(UIFont.Small, posX + 160, posY + 275, "Water : " .. curVine.waterLvl .. "/100", water_rgb["r"], water_rgb["g"], water_rgb["b"], 0.9);
		textManager:DrawString(UIFont.Small, posX + 160, posY + 290, "No watered since : " .. getLastWatedHour(curVine), 1, 1, 1, 0.8);
		textManager:DrawString(UIFont.Small, posX + 160, posY + 305, "Fertilizer : " .. curVine.fertilizer, fertilizer_rgb["r"], fertilizer_rgb["g"], fertilizer_rgb["b"], 0.8);
		if(disease[1] ~= nil) then
			textManager:DrawString(UIFont.Small, posX + 160, posY + 320, "Disease " .. disease[1], disease_rgb["1r"], disease_rgb["1g"], disease_rgb["1b"], 0.8);
			--textManager:DrawString(UIFont.Small, posX + 160, posY + 320, "Disease " .. disease[1], 255.0, 255.0, 255.0, 0.8);
		end
		if(disease[2] ~= nil) then
			textManager:DrawString(UIFont.Small, posX + 160, posY + 335, disease[2], disease_rgb["2r"], disease_rgb["2g"], disease_rgb["2b"], 0.8);
			--textManager:DrawString(UIFont.Small, posX + 160, posY + 335, disease[2], 255.0, 255.0, 255.0, 0.8);
		end
		if(disease[3] ~= nil) then
			textManager:DrawString(UIFont.Small, posX + 160, posY + 350, disease[3], disease_rgb["3r"], disease_rgb["3g"], disease_rgb["3b"], 0.8);
			--textManager:DrawString(UIFont.Small, posX + 160, posY + 350, disease[3], 255.0, 255.0, 255.0, 0.8);
		end
	end
end

-- we show the current growing phase if we have at least 20 farming pts
function getCurrentGrowingPhase(curVine)
	if(trellisFarming.farmingXp >= 20) then
		if(curVine.nbOfVineGrow > 7) then
			return "7";
		end
		return curVine.nbOfVineGrow .. "/7";
	end
	return "???";
end

-- we show color of disease with 40 farming skill
function getDiseaseColor(diseaseLvl, index)
	getWhite(disease_rgb, index);
	if(trellisFarming.farmingXp >= 40) then
		local disease = trellis_vegetableconf.calcDisease(diseaseLvl);
		getGreen(disease_rgb, index);
		if(diseaseLvl > 0) then -- orange
			getOrange(disease_rgb, index);
		elseif(disease == -2) then -- red
			getRed(disease_rgb, index);
		end
	end
end

-- we show name of disease with 30 farming skill
-- we show lvl of disease with 50 farming skill
function getDiseaseName(curVine)
	local disease = {};
	local result = "";
	-- mildew
	if(curVine.mildewLvl > 0) then
		if(trellisFarming.farmingXp >= 30) then
			result = "Mildew : ";
			if(trellisFarming.farmingXp >= 50) then
				result = result .. curVine.mildewLvl .. "/100";
			else
				result = result .. "???/100";
			end
		else
			result = "Yes";
		end
	end
	-- we have mildew, let's add it to our map
	if(result ~= "") then
		disease[1] = result;
		getDiseaseColor(curVine.mildewLvl, "1");
	end
	result = "";
	-- now we test aphid
	if(curVine.aphidLvl > 0) then
		if(trellisFarming.farmingXp >= 30) then
			result = "Devil's Water Fungi : ";
			if(trellisFarming.farmingXp >= 50) then
				result = result .. curVine.aphidLvl .. "/100";
			else
				result = result .. "???/100";
			end
		else
			result = "Yes";
		end
	end
	-- we have aphid let's add it to our map
	if(result ~= "") then
		if(disease[1] ~= "Yes") then
			disease[#disease + 1] = result;
			getDiseaseColor(curVine.aphidLvl, #disease);
		end
	end
	result = "";
	-- now we test flies
	if(curVine.fliesLvl > 0) then
		if(trellisFarming.farmingXp >= 30) then
			result = "Pest Flies : ";
			if(trellisFarming.farmingXp >= 50) then
				result = result .. curVine.fliesLvl .. "/100";
			else
				result = result .. "???/100";
			end
		else
			result = "Yes";
		end
	end
	-- we have flies let's add it to our map
	if(result ~= "") then
		if(disease[#disease] ~= "Yes") then
			disease[#disease + 1] = result;
			getDiseaseColor(curVine.fliesLvl, #disease);
		end
	end
	-- if we have no disease
	if(disease[1] == nil) then
		disease[1] = "No";
		getGreen(disease_rgb, "1");
	end
	return disease;
end

function getLastWatedHour(curVine)
	return trellisFarming.hoursElapsed - curVine.lastWaterHour .. " hours";
end

-- display the hour of the next growing phase if with have at least 70 farmings pts
function getNextGrowingPhase(curVine)
	if(curVine.state ~= "dry") then
		if(trellisFarming.farmingXp >= 80) then
			if(curVine.nextGrowing == 0) then
				return 0;
			else
				if(curVine.nextGrowing - trellisFarming.hoursElapsed < 0) then
					return "0 hours";
				end
				return (curVine.nextGrowing - trellisFarming.hoursElapsed) .. " hours";
			end
		end
		return "???";
	end
	return "No";
end

-- if we have at least 50 farming, display water lvl in color, to help the player
function getWaterLvlColor(curVine)
	if(trellisFarming.farmingXp >= 50) then
		-- first state, you must have the required water lvl, so if it's not : red
		if(curVine.nbOfVineGrow == 1) then
			getGreen(water_rgb, nil);
			if(curVine.waterLvl < curVine.waterNeeded) then
				getRed(water_rgb, nil);
			end
		else
			local water = trellis_vegetableconf.calcWater(curVine.waterNeeded, curVine.waterLvl);
			local waterMax = trellis_vegetableconf.calcWater(curVine.waterLvl, curVine.waterNeededMax);
			if(water >= 0 and waterMax >= 0) then -- green
				getGreen(water_rgb, nil);
			elseif(water == -1 or waterMax == -1) then -- orange
				getOrange(water_rgb, nil);
			else -- red
				getRed(water_rgb, nil);
			end
		end
	end
end

-- display the color danger of the fertilizer lvl (0-2 : green, 2-3 : orange, 4 red)
function getWaterFertilizerColor(curVine)
	if(curVine.fertilizer < 3) then
		getGreen(fertilizer_rgb, nil);
	elseif(curVine.fertilizer > 2 and curVine.fertilizer < 4) then
		getOrange(fertilizer_rgb, nil);
	else
		getRed(fertilizer_rgb, nil);
	end
end

function getGreen(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 0.0;
		list[index .. "g"] = 100.0;
		list[index .. "b"] = 0.0;
	else
		list["r"] = 0.0;
		list["g"] = 100.0;
		list["b"] = 0.0;
	end
end

function getOrange(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 255.0;
		list[index .. "g"] = 127.0;
		list[index .. "b"] = 0.0;
	else
		list["r"] = 255.0;
		list["g"] = 127.0;
		list["b"] = 0.0;
	end
end

function getRed(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 255.0;
		list[index .. "g"] = 0.0;
		list[index .. "b"] = 0.0;
	else
		list["r"] = 255.0;
		list["g"] = 0.0;
		list["b"] = 0.0;
	end
end

function getWhite(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 255.0;
		list[index .. "g"] = 255.0;
		list[index .. "b"] = 255.0;
	else
		list["r"] = 255.0;
		list["g"] = 255.0;
		list["b"] = 255.0;
	end
end

