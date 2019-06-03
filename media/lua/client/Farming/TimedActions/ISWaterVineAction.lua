--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISWaterVineAction = ISBaseTimedAction:derive("ISWaterVineAction");

function ISWaterVineAction:isValid()
	local vine = trellisFarming.getCurrentVinePlanting(self.sq)
	if not vine or vine.waterLvl >= 100 then return false end
	if not self.character:getInventory():contains(self.item) then return false end
	local uses = math.floor(self.item:getUsedDelta() / self.item:getUseDelta())
	if uses > 20 then uses = 20 end
	if uses < self.uses then return false end
	return true;
end

function ISWaterVineAction:update()
	self.item:setJobDelta(self:getJobDelta());
end

function ISWaterVineAction:start()
	self.item:setJobType(getText("ContextMenu_Water"));
	self.item:setJobDelta(0.0);
end

function ISWaterVineAction:stop()
	ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISWaterVineAction:perform()
	self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
	local vine = trellisFarming.getCurrentVinePlanting(self.sq);
	if isClient() then
		local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ(), uses = self.uses }
		sendClientCommand(self.character, 'trellis', 'water', args)
		-- Hack: use the water, too hard to get the server to update the client's inventory
		local waterLvl = vine.waterLvl
		for i=1,self.uses do
			if(waterLvl < 100) then
				if self.item:getUsedDelta() > 0 then
					self.item:Use()
				end
				waterLvl = waterLvl + 5
				if(waterLvl > 100) then
					waterLvl = 100
				end
			end
		end
	else
		trellisFarming.water(vine, self.item, self.uses)
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISWaterVineAction:new(character, item, uses, sq, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.uses = uses;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.sq = sq;
	return o;
end
