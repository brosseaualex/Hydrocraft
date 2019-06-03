--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISTrellisSeedAction = ISBaseTimedAction:derive("ISTrellisSeedAction");

function ISTrellisSeedAction:isValid()
	return true;
end

function ISTrellisSeedAction:update()
end

function ISTrellisSeedAction:start()
end

function ISTrellisSeedAction:stop()
    ISBaseTimedAction.stop(self);
end

function ISTrellisSeedAction:perform()
	local currentVine = self.vine;
	for i=1, self.nbOfSeed do
		local seed = self.seeds[i];
		self.character:getInventory():Remove(seed);
	end
	if isClient() then
		local sq = self.vine:getSquare()
		local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ(), typeOfSeed = self.typeOfSeed }
		sendClientCommand(self.character, 'trellis', 'seed', args)
	else
		trellisFarming.seed(self.typeOfSeed, currentVine)
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISTrellisSeedAction:new(character, seeds, nbOfSeed, typeOfSeed, vine, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.seeds = seeds;
	o.nbOfSeed = nbOfSeed;
	o.typeOfSeed = typeOfSeed;
    o.vine = vine;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
