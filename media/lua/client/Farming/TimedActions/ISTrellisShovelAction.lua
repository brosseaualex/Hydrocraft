--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISTrellisShovelAction = ISBaseTimedAction:derive("ISTrellisShovelAction");

function ISTrellisShovelAction:isValid()
	return true;
end

function ISTrellisShovelAction:update()
	self.item:setJobDelta(self:getJobDelta());
end

function ISTrellisShovelAction:start()
	self.item:setJobType(getText("ContextMenu_Remove"));
	self.item:setJobDelta(0.0);
    if self.vine:getSquare() then
        self.sound = getSoundManager():PlayWorldSound("shoveling", self.vine:getSquare(), 0, 10, 1, true);
    end
end

function ISTrellisShovelAction:stop()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISTrellisShovelAction:perform()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
	self.item:getContainer():setDrawDirty(true);
	self.item:setJobDelta(0.0);
	if isClient() then
		local sq = self.vine:getSquare()
		local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
		sendClientCommand(self.character, 'trellis', 'removeVine', args)
	else
		trellisFarming.removeVine(self.vine)
		self.character:getInventory():AddItem("Farmoid.TrellisKit")
    end
	ISBaseTimedAction.perform(self);
end

function ISTrellisShovelAction:new (character, item, vine, time)
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
