require "BuildingObjects/ISBuildingObject"

trellisPlot = ISBuildingObject:derive("trellisPlot");

function trellisPlot:create(x, y, z, north, sprite)
	local sq = getWorld():getCell():getGridSquare(x, y, z);
	if luautils.walkAdj(self.character, self.square) then
		local handItem = self.character:getPrimaryHandItem()
		if not (handItem and (handItem:getType() == "HandShovel" or handItem:getType() == "Shovel")) then
			handItem = ISWorldObjectContextMenu.equip(self.character, self.handItem, "HandShovel", true)
            if handItem:getType() ~= "Shovel" then
				handItem = nil;
            end
		end
		ISTimedActionQueue.add(ISBuildTrellisAction:new(self.character, sq, handItem, 50));
	end
end

function trellisPlot:new(handItem, character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setNorthSprite("TrellisStart");
	o:setSprite("TrellisStart");
	o.handItem = handItem;
	o.skipBuildAction = true
    o.character = character;
    o.noNeedHammer = true;
	return o;
end

function trellisPlot:isValid(square)
	if not self.character:getInventory():contains("TrellisKit") then return false end
	if not square:isFreeOrMidair(true, true) then return false end
	for i = 0, square:getObjects():size() - 1 do
		local item = square:getObjects():get(i);
		if item:getTextureName() and (luautils.stringStarts(item:getTextureName(), "floors_exterior_natural") or
				luautils.stringStarts(item:getTextureName(), "blends_natural_01")) then
			return true;
		end
	end
	return false;
end

function trellisPlot:getAPrompt()
    if self.canBeBuild then
        return getText("ContextMenu_Build")
    end
end

function trellisPlot:getLBPrompt()
    return nil
end

function trellisPlot:getRBPrompt()
    return nil
end

function trellisPlot:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
