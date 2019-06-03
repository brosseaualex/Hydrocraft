--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISCureVineMildewAction = ISBaseTimedAction:derive("ISCureVineMildewAction");

function ISCureVineMildewAction:isValid()
	return true;
end

function ISCureVineMildewAction:update()
end

function ISCureVineMildewAction:start()
end

function ISCureVineMildewAction:stop()
    ISBaseTimedAction.stop(self);
end

function ISCureVineMildewAction:perform()
	if isClient() then
		local sq = self.vine:getSquare()
		local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ(), uses = self.uses }
		sendClientCommand(self.character, 'trellis', 'cureMildew', args)
		-- Hack until server manages player inventory
		local level = self.vine.mildewLvl
		for i=1,self.uses do
			if level < 100 then
				self.item:Use()
				level = level - 5
			end
		end
	else
		trellisFarming.cureMildew(self.vine, self.item, self.uses)
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISCureVineMildewAction:new(character, item, uses, vine, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.uses = uses;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.vine = vine;
	return o;
end
