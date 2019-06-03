ISCompassWindow = ISCollapsableWindow:derive("ISCompassWindow");
ISCompassWindow.compassLines = {}
function ISCompassWindow:initialise()
	ISCollapsableWindow.initialise(self);
end

function ISCompassWindow:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "Compass";
	o.pin = false;
	o:noBackground();
	return o;
end

function ISCompassWindow:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.HomeWindow = ISRichTextPanel:new(0, 16, 250, 140);
	self.HomeWindow:initialise();
	self.HomeWindow.autosetheight = false
	self.HomeWindow:ignoreHeightChange()
	self:addChild(self.HomeWindow)
end

function CompassWindowCreate()
	ISCompassWindow = ISCompassWindow:new(35, 250, 250, 155)
	ISCompassWindow:addToUIManager();
	ISCompassWindow:setVisible(false);
	ISCompassWindow.pin = true;
	ISCompassWindow.resizable = true
end

Events.OnGameStart.Add(CompassWindowCreate);