--***********************************************************
--**                    ROBERT JOHNSON                     **
--**    The (not so) famous farming info panel            **
--***********************************************************

require "ISUI/ISPanelJoypad"

ISTrellisInfo = ISPanelJoypad:derive("ISTrellisInfo");

water_rgb = {["r"]=255.0,["g"]=255.0,["b"]=255.0};
waterbar_rgb = {["r"]=0.15,["g"]=0.3,["b"]=0.63};
fertilizer_rgb = {["r"]=0.0,["g"]=0.0,["b"]=0.0};
health_rgb = {["r"]=0.0,["g"]=0.0,["b"]=0.0};
nowateredsince_rgb = {["r"]=255.0,["g"]=255.0,["b"]=255.0};
disease_rgb = {["0r"]=255.0,["0g"]=255.0,["0b"]=255.0};
disease = {};
title_rgb = {["r"]=1.0,["g"]=1.0,["b"]=1.0};
deb = true;

--************************************************************************--
--** ISPanel:initialise
--**
--************************************************************************--

function ISTrellisInfo:initialise()
	ISPanelJoypad.initialise(self);
end

function ISTrellisInfo:setVine(vine)
	self.vine = vine;
	self.vegetable = getTexture(trellis_vegetableconf.icons[vine.typeOfSeed]);
end


--************************************************************************--
--** ISPanel:render
--**
--************************************************************************--
function ISTrellisInfo:prerender()
	if self.vine then
		local square = self.vine:getSquare()
		-- Hide the window when the vine is out-of-bounds
--		if not square then self:getParent():setVisible(false); return end
		if isClient() then
			-- Hack: because the client does not have an up-to-date list of vines
			local object = self.vine:getObject()
			if object then
				self.vine:fromModData(object:getModData())
			end
		end
	end
	self:drawText(getText("Farming_Vine_Information") , 32, - 14, 1,1,1,1);
end


function ISTrellisInfo:render()
	local farmingLevel = trellisFarming.getXp(self.character)
	ISTrellisInfo.getFertilizerColor(self);
	ISTrellisInfo.getWaterLvlColor(self.vine, farmingLevel);
	local lastWatedHour = ISTrellisInfo.getLastWatedHour(self.vine);
	ISTrellisInfo.getTitleColor(self.vine);
	ISTrellisInfo.getHealthColor(self, farmingLevel);
	ISTrellisInfo.getNoWateredSinceColor(self, lastWatedHour, farmingLevel);
	local disease = ISTrellisInfo.getDiseaseName(self);
	ISTrellisInfo.getWaterLvlBarColor(self, farmingLevel);
	local top = 69
	local y = top;
	-- icon of the vine
	self:drawTextureScaled(self.vegetable, 20,20,25,25,1,1,1,1);
	-- title of the vine
	if self.vine:getObject() then
		self:drawText(self.vine:getObject():getObjectName(), 60, 25, title_rgb["r"], title_rgb["g"], title_rgb["b"], 1, UIFont.Normal);
	else
		self:drawText("Dead " .. getText("Farming_" .. self.vine.typeOfSeed), 60, 25, title_rgb["r"], title_rgb["g"], title_rgb["b"], 1, UIFont.Normal);
	end
	local fontHgt = getTextManager():getFontFromEnum(UIFont.Normal):getLineHeight()
	local pady = 1
	local lineHgt = fontHgt + pady * 2
	-- background for current growing phase
	self:drawRect(13, y, self.width - 25, lineHgt, 0.1, 1.0, 1.0, 1.0);
	-- text for current growing phase
	self:drawText(getText("Farming_Current_growing_phase") .. " : ", 20, y + pady, 1, 1, 1, 1, UIFont.Normal);
	-- stat (next growing state) on the right
	self:drawTextRight(ISTrellisInfo.getCurrentGrowingPhase(self, farmingLevel), self.width - 17, y + pady, 1, 1, 1, 1, UIFont.Normal);
	y = y + lineHgt;
	self:drawRect(13, y, self.width - 25, lineHgt, 0.05, 1.0, 1.0, 1.0);
	self:drawText(getText("Farming_Next_growing_phase") .. " : ", 20, y + pady, 1, 1, 1, 1, UIFont.Normal);
	self:drawTextRight(ISTrellisInfo.getNextGrowingPhase(self), self.width - 17, y + pady, 1, 1, 1, 1, UIFont.Normal);
	y = y + lineHgt;
	self:drawRect(13, y, self.width - 25, lineHgt, 0.1, 1.0, 1.0, 1.0);
	self:drawText(getText("Farming_Last_time_watered") .. " : ", 20, y + pady, 1, 1, 1, 1, UIFont.Normal);
	lastWatedHour = lastWatedHour .. " " .. getText("Farming_Hours");
	self:drawTextRight(lastWatedHour, self.width - 17, y + pady, nowateredsince_rgb["r"], nowateredsince_rgb["g"], nowateredsince_rgb["b"], 1, UIFont.Normal);
	y = y + lineHgt;
	self:drawRect(13, y, self.width - 25, lineHgt, 0.05, 1.0, 1.0, 1.0);
	self:drawText(getText("Farming_Fertilized") .. " : ", 20, y + pady, 1.0, 1.0, 1.0, 1, UIFont.Normal);
	self:drawTextRight(self.vine.fertilizer .. "", self.width - 17, y + pady, fertilizer_rgb["r"], fertilizer_rgb["g"], fertilizer_rgb["b"], 1, UIFont.Normal);
	y = y + lineHgt;
	self:drawRect(13, y, self.width - 25, lineHgt, 0.1, 1.0, 1.0, 1.0);
	self:drawText(getText("Farming_Health") .. " : ", 20, y + pady, 1.0, 1.0, 1.0, 1, UIFont.Normal);
	self:drawTextRight(ISTrellisInfo.getHealth(self, farmingLevel), self.width - 17, y + pady, health_rgb["r"], health_rgb["g"], health_rgb["b"], 1, UIFont.Normal);
	y = y + lineHgt;
	if(disease[1]) then
		self:drawRect(13, y, self.width - 25, lineHgt, 0.05, 1.0, 1.0, 1.0);
		self:drawText(getText("Farming_Disease") .. " : ", 20, y + pady, 1, 1, 1, 1);
		self:drawTextRight(disease[1], self.width - 17, y + pady, disease_rgb["1r"], disease_rgb["1g"], disease_rgb["1b"], 1);
		y = y + lineHgt;
	end
	if(disease[2]) then
		self:drawRect(13, y, self.width - 25, lineHgt, 0.05, 1.0, 1.0, 1.0);
		self:drawTextRight(disease[2], self.width - 17, y + pady, disease_rgb["2r"], disease_rgb["2g"], disease_rgb["2b"], 1);
		y = y + lineHgt;
	end
	if(disease[3]) then
	self:drawRect(13, y, self.width - 25, lineHgt, 0.05, 1.0, 1.0, 1.0);
		self:drawTextRight(disease[3], self.width - 17, y + pady, disease_rgb["3r"], disease_rgb["3g"], disease_rgb["3b"], 1);
		y = y + lineHgt;
	end
	-- rect for all info
	self:drawRectBorder(13, top - 1, self.width - 25, y - top + 2, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
	y = y + 5;
	self:drawText(getText("Farming_Water_levels"), 13, y, 1, 1, 1, 1);
	self:drawTextRight(ISTrellisInfo.getWaterLvl(self.vine, farmingLevel), self.width - 12, y, water_rgb["r"], water_rgb["g"], water_rgb["b"], 1, UIFont.normal);
	y = y + fontHgt + 2;
	-- show the water bar with at least 4 farming skill
	if farmingLevel >= 4 then
		self:drawRect(13, y, self.width - 25, 12, 0.05, 1.0, 1.0, 1.0);
		self:drawRectBorder(13, y, self.width - 25, 12, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
		self:drawRect(14, y + 1, ISTrellisInfo.getWaterBarWidth(self), 10, 0.7, waterbar_rgb["r"], waterbar_rgb["g"], waterbar_rgb["b"]);
		y = y + 12
	end
	self.parent:setHeight(self.y + y + 8)
end

function ISTrellisInfo:update()
	ISPanelJoypad.update(self)
	if self.parent:getIsVisible() and (not self.vine or not self.vine:getObject()) then
		if self.joyfocus then
			self.joyfocus.focus = nil
			updateJoypadFocus(self.joyfocus)
		end
		self.parent:setVisible(false)
	end
end

function ISTrellisInfo:onGainJoypadFocus(joypadData)
	ISPanelJoypad.onGainJoypadFocus(self, joypadData)
	self.parent.drawJoypadFocus = true
end

function ISTrellisInfo:onLoseJoypadFocus(joypadData)
	ISPanelJoypad.onLoseJoypadFocus(self, joypadData)
	self.parent.drawJoypadFocus = false
end

function ISTrellisInfo:onJoypadDown(button, joypadData)
	if button == Joypad.BButton then
		self.parent:setVisible(false)
		joypadData.focus = nil
		if self.vine:getSquare() then
			ISTrellisMenu.onJoypadFarming(self.vine:getSquare(), joypadData.player)
		end
	end
end

-- show text with <= 4 farming skill
-- else show the right number
function ISTrellisInfo.getHealth(info, farmingLevel)
	if farmingLevel <= 4 then
		if info.vine.health > 80 then
			return getText("Farming_Flourishing");
		elseif info.vine.health > 60 then
			return getText("Farming_Verdant");
		elseif info.vine.health > 40 then
			return getText("Farming_Healthy");
		elseif info.vine.health > 20 then
			return getText("Farming_Sickly");
		else
			return getText("Farming_Stunted");
		end
	else
		return round2(info.vine.health, 2) .. "";
	end
end

-- show text with <= 2 farming skill
-- else show the right number
function ISTrellisInfo.getWaterLvl(vine, farmingLevel)
	if farmingLevel <= 4 then
		if vine.waterLvl > 80 then
			return getText("Farming_Well_watered");
		elseif vine.waterLvl > 60 then
			return getText("Farming_Fine");
		elseif vine.waterLvl > 40 then
			return getText("Farming_Thirsty");
		elseif vine.waterLvl > 20 then
			return getText("Farming_Dry");
		else
			return getText("Farming_Parched");
		end
	else
		return round2(vine.waterLvl, 2) .. "/100";
	end
end

function ISTrellisInfo.getTitleColor(vine)
    local rgb = {};
	if vine.state == "dry" or vine.state == "rotten" or vine.state == "destroyed" then
        rgb = {["r"]=1.0,["g"]=0.0,["b"]=0.0};
	else
        rgb = {["r"]=1.0,["g"]=1.0,["b"]=1.0};
    end
    title_rgb = rgb;
    return rgb;
end

function ISTrellisInfo.getWaterBarWidth(info)
	local totalWidth = info:getWidth() - 27;
	local per = totalWidth / 100;
	return totalWidth - ((100 - info.vine.waterLvl) * per);
end

-- if we have at least 2 farming, display water lvl in color, to help the player
function ISTrellisInfo.getWaterLvlBarColor(info, farmingLevel)
	ISTrellisInfo:getBlueBar(waterbar_rgb);
	if farmingLevel >= 4 and info.vine:isAlive() then
		-- first state, you must have the required water lvl, so if it's not : red
		if(info.vine.nbOfVineGrow == 1) then
			if(info.vine.waterLvl < info.vine.waterNeeded) then
				ISTrellisInfo:getRedBar(waterbar_rgb);
			end
		else
			local water = trellis_vegetableconf.calcWater(info.vine.waterNeeded, info.vine.waterLvl);
			local waterMax = trellis_vegetableconf.calcWater(info.vine.waterLvl, info.vine.waterNeededMax);
			if(water >= 0 and waterMax >= 0) then -- green
				ISTrellisInfo:getBlueBar(waterbar_rgb);
			elseif(water == -1 or waterMax == -1) then -- orange
				ISTrellisInfo:getOrangeBar(waterbar_rgb);
			else -- red
				ISTrellisInfo:getRedBar(waterbar_rgb);
			end
		end
	end
end

-- if we have at least 1 farming, display red if you don't have water your vine since more than 60hours
function ISTrellisInfo.getNoWateredSinceColor(vine, lastWatedHour, farmingLevel)
	ISTrellisInfo:getGreen(nowateredsince_rgb);
	if(farmingLevel >= 2 and (vine.state ~= "dry" or vine.state ~= "rotten" or vine.state ~= "destroyed")) then
		if(lastWatedHour < 50) then -- green
			ISTrellisInfo:getGreen(nowateredsince_rgb);
		elseif(lastWatedHour < 60) then -- orange
			ISTrellisInfo:getOrange(nowateredsince_rgb);
		else -- red
			ISTrellisInfo:getRed(nowateredsince_rgb);
		end
    end
    return nowateredsince_rgb;
end

function ISTrellisInfo:getBlueBar(list)
	list["r"] = 0.15;
	list["g"] = 0.3;
	list["b"] = 0.63;
end
function ISTrellisInfo:getOrangeBar(list)
	list["r"] = 0.98;
	list["g"] = 0.55;
	list["b"] = 0.0;
end
function ISTrellisInfo:getRedBar(list)
	list["r"] = 0.70;
	list["g"] = 0.13;
	list["b"] = 0.13;
end

--************************************************************************--
--** ISPanel:new
--**
--************************************************************************--
function ISTrellisInfo:new (x, y, width, height, character, vine)
	local o = {}
	o = ISPanelJoypad:new(x, y, width, height);
	setmetatable(o, self)
    self.__index = self
	o.vine = vine;
	o.character = character
	o.vegetable = getTexture(trellis_vegetableconf.icons[vine.typeOfSeed]);
   return o
end


-- if we have at least 2 farming, display water lvl in color, to help the player
function ISTrellisInfo.getWaterLvlColor(vine, farmingLevel)
	if farmingLevel >= 4 and vine:isAlive() then
		-- first state, you must have the required water lvl, so if it's not : red
		if(vine.nbOfVineGrow == 1) then
			ISTrellisInfo:getGreen(water_rgb, nil);
			if(vine.waterLvl < vine.waterNeeded) then
				ISTrellisInfo:getRed(water_rgb, nil);
            end
		else
			local water = trellis_vegetableconf.calcWater(vine.waterNeeded, vine.waterLvl);
			local waterMax = trellis_vegetableconf.calcWater(vine.waterLvl, vine.waterNeededMax);
			if(water >= 0 and waterMax >= 0) then -- green
				ISTrellisInfo:getGreen(water_rgb, nil);
			elseif(water == -1 or waterMax == -1) then -- orange
				ISTrellisInfo:getOrange(water_rgb, nil);
			else -- red
				ISTrellisInfo:getRed(water_rgb, nil);
			end
		end
	else
		ISTrellisInfo:getWhite(water_rgb, nil);
    end
    return water_rgb;
end

-- get the color of health if player have more than 2 farming skill (to see the health)
function ISTrellisInfo.getHealthColor(info, farmingLevel)
	if farmingLevel >= 2 then
		if(info.vine.health >= 60) then -- green
			ISTrellisInfo:getGreen(health_rgb, nil);
		elseif(info.vine.health >= 40) then -- orange
			ISTrellisInfo:getOrange(health_rgb, nil);
		else -- red
			ISTrellisInfo:getRed(health_rgb, nil);
		end
	else
		ISTrellisInfo:getWhite(health_rgb, nil);
	end
end

-- show nothing with 0 farming
-- show text with 1 to 2 farming
-- show numbers with > 2
function ISTrellisInfo.getCurrentGrowingPhase(info, farmingLevel)
	if farmingLevel >= 2 and farmingLevel <= 4 then
		if info.vine.nbOfVineGrow <= 1 then
			return getText("Farming_Seedling");
		elseif info.vine.nbOfVineGrow <= 2 then
			return getText("Farming_Sprout");
		elseif info.vine.nbOfVineGrow <= 5 then
			return getText("Farming_Young");
		elseif info.vine.nbOfVineGrow <= 6 then
			return getText("Farming_Fully_grown");
		else
			return getText("Farming_Ready_to_harvest");
		end
	elseif farmingLevel >= 4 then
		if(info.vine.nbOfVineGrow > 7) then
			return "7";
		end
		return info.vine.nbOfVineGrow .. "/7";
	end
	return "???";
end

-- display the hour of the next growing phase if with have at least 4 farmings pts
function ISTrellisInfo.getNextGrowingPhase(info)
	if(info.vine.state ~= "dry" and info.vine.state ~= "rotten" and info.vine.state ~= "destroyed") then
		if(trellisFarming.getXp(info.character) >= 8) then
			if(info.vine.nextGrowing == 0) then
				return "0 " .. getText("Farming_Hours");
			else
                if(info.vine.nextGrowing - trellisFarming.hoursElapsed < 0) then
                    return "0 " .. getText("Farming_Hours");
            end
				return round2((info.vine.nextGrowing - trellisFarming.hoursElapsed)) .. " " .. getText("Farming_Hours");
			end
		end
		return "???";
	end
	return getText("UI_No");
end

-- we show color of disease with 3 farming skill
function ISTrellisInfo:getDiseaseColor(diseaseLvl, index, info)
	ISTrellisInfo:getWhite(disease_rgb, index);
	if(trellisFarming.getXp(self.character) >= 6 and (info.vine.state ~= "dry" or info.vine.state ~= "rotten" or info.vine.state ~= "destroyed")) then
		local disease = trellis_vegetableconf.calcDisease(diseaseLvl);
		ISTrellisInfo:getGreen(disease_rgb, index);
		if(diseaseLvl > 0) then -- orange
			ISTrellisInfo:getOrange(disease_rgb, index);
		elseif(disease == -2) then -- red
			ISTrellisInfo:getRed(disease_rgb, index);
		end
	else
		ISTrellisInfo:getWhite(disease_rgb, index);
	end
end

-- we show name of disease with 2 farming skill
-- we show lvl of disease with 3 farming skill
function ISTrellisInfo.getDiseaseName(info)
	local farmingLevel = trellisFarming.getXp(info.character)
	local disease = {};
	local result = "";
	-- mildew
	if(info.vine.mildewLvl > 0) then
		if(farmingLevel >= 4) then
			result = getText("Farming_Mildew") .. " : ";
			if(farmingLevel >= 6) then
				result = result .. info.vine.mildewLvl .. "/100";
			else
				result = result .. "???/100";
			end
		else
			result = getText("UI_Yes");
		end
	end
	-- we have mildew, let's add it to our map
	if(result ~= "") then
		disease[1] = result;
		ISTrellisInfo:getDiseaseColor(info.vine.mildewLvl, "1", info);
	end
	result = "";
	-- now we test aphid
	if(info.vine.aphidLvl > 0) then
		if(farmingLevel >= 4) then
			result = getText("Farming_Devil_Water_Fungi") .. " : ";
			if(farmingLevel >= 6) then
				result = result .. info.vine.aphidLvl .. "/100";
			else
				result = result .. "???/100";
			end
		else
			result = getText("UI_Yes");
		end
	end
	-- we have aphid let's add it to our map
	if(result ~= "") then
		if(disease[1] ~= getText("UI_Yes")) then
			disease[#disease + 1] = result;
			ISTrellisInfo:getDiseaseColor(info.vine.aphidLvl, #disease, info);
		end
	end
	result = "";
	-- now we test flies
	if(info.vine.fliesLvl > 0) then
		if(farmingLevel >= 4) then
			result = getText("Farming_Pest_Flies") .. " : ";
			if(farmingLevel >= 6) then
				result = result .. info.vine.fliesLvl .. "/100";
			else
				result = result .. "???/100";
			end
		else
			result = getText("UI_Yes");
		end
	end
	-- we have flies let's add it to our map
	if(result ~= "") then
		if(disease[#disease] ~= getText("UI_Yes")) then
			disease[#disease + 1] = result;
			ISTrellisInfo:getDiseaseColor(info.vine.fliesLvl, #disease, info);
		end
	end
	-- if we have no disease
	if(disease[1] == nil) then
		disease[1] = getText("UI_No");
		ISTrellisInfo:getGreen(disease_rgb, "1");
	end
	return disease;
end

function ISTrellisInfo.getLastWatedHour(vine)
	return trellisFarming.hoursElapsed - vine.lastWaterHour;
end

-- display the color danger of the fertilizer lvl (0-2 : green, 2-3 : orange, 4 red)
function ISTrellisInfo.getFertilizerColor(info)
	if info.vine.state ~= "dry" or info.vine.state ~= "rotten" or info.vine.state ~= "destroyed" then
		if(info.vine.fertilizer <= 2) then
			ISTrellisInfo:getGreen(fertilizer_rgb, nil);
		elseif(info.vine.fertilizer > 2 and info.vine.fertilizer <= 3) then
			ISTrellisInfo:getOrange(fertilizer_rgb, nil);
		else
			ISTrellisInfo:getRed(fertilizer_rgb, nil);
		end
	else
		ISTrellisInfo:getWhite(fertilizer_rgb, nil);
	end
end


function ISTrellisInfo:getGreen(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 0.0;
		list[index .. "g"] = 0.8;
		list[index .. "b"] = 0.0;
	else
		list["r"] = 0.0;
		list["g"] = 0.8;
		list["b"] = 0.0;
	end
end

function ISTrellisInfo:getOrange(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 1.0;
		list[index .. "g"] = 0.5;
		list[index .. "b"] = 0.0;
	else
		list["r"] = 1.0;
		list["g"] = 0.5;
		list["b"] = 0.0;
	end
end

function ISTrellisInfo:getRed(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 1.0;
		list[index .. "g"] = 0.0;
		list[index .. "b"] = 0.0;
	else
		list["r"] = 1.0;
		list["g"] = 0.0;
		list["b"] = 0.0;
	end
end

function ISTrellisInfo:getWhite(list, index)
	if(index ~= nil) then
		list[index .. "r"] = 1.0;
		list[index .. "g"] = 1.0;
		list[index .. "b"] = 1.0;
	else
		list["r"] = 1.0;
		list["g"] = 1.0;
		list["b"] = 1.0;
	end
end

function round2(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end
