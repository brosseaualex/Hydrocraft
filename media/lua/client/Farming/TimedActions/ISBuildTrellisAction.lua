--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISBuildTrellisAction = ISBaseTimedAction:derive("ISBuildTrellisAction");

function ISBuildTrellisAction:isValid()
	return true;
end

function ISBuildTrellisAction:update()
	self.character:faceLocation(self.gridSquare:getX(), self.gridSquare:getY())
    if self.item then
	    self.item:setJobDelta(self:getJobDelta());
    end
end

function ISBuildTrellisAction:start()
    if self.item then
        self.item:setJobType(getText("ContextMenu_Build"));
        self.item:setJobDelta(0.0);
    end
    self.sound = getSoundManager():PlayWorldSound("shoveling", self.gridSquare, 0, 10, 1, true);
    --    self.gridSquare:playSound("shoveling", true);
end

function ISBuildTrellisAction:stop()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
    ISBaseTimedAction.stop(self);
    if self.item then
        self.item:setJobDelta(0.0);
    end
end

function ISBuildTrellisAction:perform()
    if self.item then
        self.item:getContainer():setDrawDirty(true);
        self.item:setJobDelta(0.0);
    end
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
	if isClient() then
		local sq = self.gridSquare
		local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
		sendClientCommand(self.character, 'trellis', 'build', args)
	else
		local sq = self.gridSquare
		local vine = trellisFarming.getVineAt(sq:getX(), sq:getY(), sq:getZ())
		if vine then
			trellisFarming.removeVine(vine)
		end
		trellisFarming.build(self.gridSquare)
	end
	trellisFarming.changePlayer(self.character);
    -- maybe give worm ?
	local buried = ZombRand(20)
    if buried == 15 then
        self.character:getInventory():AddItem("Base.Worm");
    elseif buried == 0 then
        self.character:getInventory():AddItem("Base.SharpedStone");
    end
	ISBaseTimedAction.perform(self);
	self.character:getInventory():Remove("TrellisKit");
end

function ISBuildTrellisAction:new (character, square, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	-- custom fields
	o.item = item;
	o.gridSquare = square
    o.caloriesModifier = 5;
	return o
end
