--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "ISBaseObject"

ISVine = ISBaseObject:derive("ISVine")

function ISVine:new(x, y, z)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.x = x
	o.y = y
	o.z = z
	o.state = "trellised"
	o.nbOfVineGrow = -1
	o.typeOfSeed = "none"
	o.fertilizer = 0
	o.mildewLvl = 0
	o.aphidLvl = 0
	o.fliesLvl = 0
	o.waterLvl = 0
	o.waterNeeded = 0
	o.waterNeededMax = nil
	o.lastWaterHour = 0
	o.hasSeed = false
	o.hasVegetable = false
	o.health = trellisFarming.getHealth()
	o.badCare = false
	o.exterior = true
	o.spriteName = "TrellisStart"
	o.objectName = getText("Farming_Trellised_Land")
	return o
end

function ISVine:getSquare()
	return getCell():getGridSquare(self.x, self.y, self.z)
end

function ISVine:getObject()
	local square = self:getSquare()
	if square then
		return trellisFarming.findVineObject(square)
	end
	return nil
end

function ISVine:setObjectName(objectName)
	if objectName == self.objectName then return end
	self.objectName = objectName
	local object = self:getObject()
	if object then
		object:setName(self.objectName)
		if isServer() then
			object:sendObjectChange('name')
		end
		-- objectName is stored in modData
		self:toModData(object:getModData())
		-- also update GameTime modData
	end
end

function ISVine:setSpriteName(spriteName)
	if spriteName == self.spriteName then return end
	self.spriteName = spriteName
	local object = self:getObject()
	if object then
		object:setSprite(self.spriteName)
		if isServer() then
			object:sendObjectChange('sprite')
		end
		-- spriteName is stored in modData
		self:toModData(object:getModData())
		-- also update GameTime modData
	end
end

function ISVine:isAlive()
	return self.state ~= "destroy" and self.state ~= "dry" and self.state ~= "rotten"
end

function ISVine:canHarvest()
	return self:isAlive() and self.hasVegetable
end

function ISVine:addSeed(typeOfSeed)
	if self.state ~= "trellised" then return end
	self.state = "seeded"
	self.typeOfSeed = typeOfSeed
	self.nbOfVineGrow = 0
	self.lastWaterHour = trellisFarming.hoursElapsed
	self.waterNeeded = 0
end

function ISVine:addObject()
	if self:getObject() then return end
	local square = self:getSquare()
	if not square then return end
	local object = IsoObject.new(square, self.spriteName, self.objectName)
    object:setSpecialTooltip(true);
	self:toModData(object:getModData())
	square:AddTileObject(object)
	object:transmitCompleteItemToClients()
end

function ISVine:removeObject()
	local square = self:getSquare()
	local object = self:getObject()
	if square and object then
		square:transmitRemoveItemFromSquare(object)
		square:RemoveTileObject(object)
	end
end

function ISVine:addWater(amount)
end

function ISVine:addFertilizer(amount)
end

function ISVine:destroy()
end

function ISVine:rot()
end

function ISVine:grow(...)
end

function ISVine:fromModData(modData)
	self.state = modData.state
	self.nbOfVineGrow = modData.nbOfVineGrow
	self.typeOfSeed = modData.typeOfSeed
	self.fertilizer = modData.fertilizer
	self.mildewLvl = modData.mildewLvl
	self.aphidLvl = modData.aphidLvl
	self.fliesLvl = modData.fliesLvl
	self.waterLvl = modData.waterLvl
	self.waterNeeded = modData.waterNeeded
	self.waterNeededMax = modData.waterNeededMax
	self.lastWaterHour = modData.lastWaterHour
	self.nextGrowing = modData.nextGrowing
	self.hasSeed = modData.hasSeed == "true" or modData.hasSeed == true
	self.hasVegetable = modData.hasVegetable == "true" or modData.hasVegetable == true
	self.health = modData.health
	self.badCare = modData.badCare == "true" or modData.badCare == true
	self.exterior = modData.exterior == true or modData.exterior == nil
	self.spriteName = modData.spriteName
	self.objectName = modData.objectName
	if not self.spriteName then -- old-style modData
		self.spriteName = trellis_vegetableconf.getSpriteName(self)
	end
	if not self.objectName then -- old-style modData
		self.objectName = trellis_vegetableconf.getObjectName(self)
	end
end

function ISVine:toModData(modData)
	modData.state = self.state
	modData.nbOfVineGrow = self.nbOfVineGrow
	modData.typeOfSeed = self.typeOfSeed
	modData.fertilizer = self.fertilizer
	modData.mildewLvl = self.mildewLvl
	modData.aphidLvl = self.aphidLvl
	modData.fliesLvl = self.fliesLvl
	modData.waterLvl = self.waterLvl
	modData.waterNeeded = self.waterNeeded
	modData.waterNeededMax = self.waterNeededMax
	modData.lastWaterHour = self.lastWaterHour
	modData.nextGrowing = self.nextGrowing
	modData.hasSeed = self.hasSeed
	modData.hasVegetable = self.hasVegetable
	modData.health = self.health
	modData.badCare = self.badCare
	modData.exterior = self.exterior
	modData.spriteName = self.spriteName
	modData.objectName = self.objectName
end

function ISVine:fromObject(object)
	self:fromModData(object:getModData())
	self.objectName = object:getName()
	self.spriteName = object:getSpriteName()
end

function ISVine:loadGridSquare()
	local object = self:getObject()
	if not object then return end
	self.exterior = self:getSquare():isOutside()
	if object:getName() ~= self.objectName then
		trellisFarming.noise('set object name to '..self.objectName)
		object:setName(self.objectName)
		if isServer() then
			object:sendObjectChange('name')
		end
	end
	if object:getSpriteName() ~= self.spriteName then
		trellisFarming.noise('set object sprite to '..self.spriteName)
		object:setSprite(self.spriteName)
		if isServer() then
			object:sendObjectChange('sprite')
		end
	end
	if tonumber(self.aphidLvl) then self.aphidLvl = math.min(self.aphidLvl, 100) end
	if tonumber(self.fliesLvl) then self.fliesLvl = math.min(self.fliesLvl, 100) end
	if tonumber(self.mildewLvl) then self.mildewLvl = math.min(self.mildewLvl, 100) end
	self:toModData(object:getModData())
	object:transmitModData() -- name/sprite saved in modData
end
