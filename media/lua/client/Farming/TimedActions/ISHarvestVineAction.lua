--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISHarvestVineAction = ISBaseTimedAction:derive("ISHarvestVineAction");

function ISHarvestVineAction:isValid()
	return self.vine:getObject() and self.vine:canHarvest()
end

function ISHarvestVineAction:update()
end

function ISHarvestVineAction:start()
end

function ISHarvestVineAction:stop()
	ISBaseTimedAction.stop(self);
end

function ISHarvestVineAction:perform()
	if isClient() then
		local sq = self.vine:getSquare()
		local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
		sendClientCommand(self.character, 'trellis', 'vineharvest', args)
		-- we successfull harvest our vine, we may gain xp !
		trellisFarming.gainXp(self.character, self.vine)
		-- needed to remove from queue / start next.
		ISBaseTimedAction.perform(self);
		return
	end
	
	local vine = self.vine;
	-- add all the item in the vine container into the player inventory
	local vegetable = trellis_vegetableconf.props[vine.typeOfSeed].vegetableName;
	local numberOfVeg = getVegetablesNumber(trellis_vegetableconf.props[vine.typeOfSeed].minVeg, trellis_vegetableconf.props[vine.typeOfSeed].maxVeg, trellis_vegetableconf.props[vine.typeOfSeed].minVegAutorized, trellis_vegetableconf.props[vine.typeOfSeed].maxVegAutorized, vine);
	local items = self.character:getInventory():AddItems(vegetable, numberOfVeg);
	for i=1,items:size() do
		if items:get(i-1) then
			items:get(i-1):setLastAged(getGameTime():getWorldAgeHours())
		end
	end

	if vine.hasSeed then
		local seed = trellis_vegetableconf.props[vine.typeOfSeed].seedName;
		self.character:getInventory():AddItems(seed, (trellis_vegetableconf.props[vine.typeOfSeed].seedPerVeg * numberOfVeg));
	end

	vine.hasVegetable = false;
	vine.hasSeed = false;

	-- the strawberrie don't disapear, it goes on phase 2 again
--	if vine.typeOfSeed == "Strawberry plant" then
--		vine.nbOfGrow = 1;
--		trellisFarming.growVine(vine, nil, true);
--	else
--        trellisFarming.removeVine(vine);
--	end
	vine.state = "trellised"
	vine:setObjectName(trellis_vegetableconf.getObjectName(vine))
	vine:setSpriteName("TrellisStart")
	-- we successfull harvest our plant, we may gain xp !
	trellisFarming.gainXp(self.character, vine);
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISHarvestVineAction:new(character, vine, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.vine = vine;
	o.maxTime = time;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end
