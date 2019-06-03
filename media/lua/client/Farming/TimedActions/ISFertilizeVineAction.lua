--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISFertilizeVineAction = ISBaseTimedAction:derive("ISFertilizeVineAction");

function ISFertilizeVineAction:isValid()
	return true;
end

function ISFertilizeVineAction:update()
	self.item:setJobDelta(self:getJobDelta());
end

function ISFertilizeVineAction:start()
	self.item:setJobType(getText("ContextMenu_Fertilize"));
	self.item:setJobDelta(0.0);
end

function ISFertilizeVineAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISFertilizeVineAction:perform()
	self.item:getContainer():setDrawDirty(true);
	self.item:setJobDelta(0.0);
	if isClient() then
		local sq = self.vine:getSquare()
		local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
		sendClientCommand(self.character, 'trellis', 'fertilize', args)
	else
		basicFarming.fertilize(self.item, self.vine)
	end
	-- MP shouldn't do this directly
	self.item:Use()
	self.character:getInventory():Remove("FertilizerEmpty")
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISFertilizeVineAction:new(character, item, vine, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
    o.vine = vine;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o
end
