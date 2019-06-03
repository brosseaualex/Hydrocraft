--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require "ISUI/ISLayoutManager"

ISVineInfoAction = ISBaseTimedAction:derive("ISVineInfoAction");

function ISVineInfoAction:isValid()
	return true;
end

function ISVineInfoAction:update()
end

function ISVineInfoAction:start()
end

function ISVineInfoAction:stop()
	ISBaseTimedAction.stop(self);
end

function ISVineInfoAction:perform()
	local vineinfo = ISTrellisMenu.vineinfo[self.character]
	if vineinfo then
		vineinfo.trellisPanel:setVine(self.vine);
	else
		local x = getPlayerScreenLeft(self.playerNum)
		local y = getPlayerScreenTop(self.playerNum)
		local w = getPlayerScreenWidth(self.playerNum)
		local h = getPlayerScreenHeight(self.playerNum)
		vineinfo = ISTrellisWindow:new(x + 70, y + 50,320,240, self.character, self.vine);
		vineinfo:initialise();
		vineinfo:addToUIManager();
		ISTrellisMenu.vineinfo[self.character] = vineinfo
		if self.character:getPlayerNum() == 0 then
			ISLayoutManager.RegisterWindow('trellis', ISCollapsableWindow, vineinfo)
		end
	end
	vineinfo:setVisible(true);
	local joypadData = JoypadState.players[self.playerNum+1]
	if joypadData then
		joypadData.focus = info.trellisPanel
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISVineInfoAction:new(character, vine)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.playerNum = character:getPlayerNum()
    o.vine = vine;
	o.maxTime = 0;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end
