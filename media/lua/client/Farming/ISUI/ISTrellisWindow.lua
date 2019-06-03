--***********************************************************
--**                    ROBERT JOHNSON                     **
--** Simple collapsable window wich handle our farming info panel **
--***********************************************************

require "ISUI/ISCollapsableWindow"

ISTrellisWindow = ISCollapsableWindow:derive("ISTrellisWindow");


function ISTrellisWindow:initialise()

	ISCollapsableWindow.initialise(self);
end

function ISTrellisWindow:visible(visible)
	ISTrellisWindow.instance:setVisible(visible);
end


--************************************************************************--
--** ISPanel:instantiate
--**
--************************************************************************--
function ISTrellisWindow:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.trellisPanel = ISTrellisInfo:new(0, 16, self.width, self.height-16, self.character, self.vine);
	self.trellisPanel:initialise();
	self:addChild(self.trellisPanel);
end

function ISTrellisWindow:new (x, y, width, height, character, vine)
	local o = {}
	--o.data = {}
	o = ISCollapsableWindow:new(x, y, width, height);
	o:setResizable(false)
	setmetatable(o, self)
	self.__index = self
	self.trellisPanel = {};
	o.character = character
	o.vine = vine;
	return o
end
