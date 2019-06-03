SafeStorageWindow = ISCollapsableWindow:derive("SafeStorageWindow");
SafeStorageWindow.compassLines = {}
function SafeStorageWindow:initialise()
	ISCollapsableWindow.initialise(self);
end

function SafeStorageWindow:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "Armor";
	o.pin = false;
	o:noBackground();
	return o;
end

function SafeStorageWindow:setText(newText)
	SafeStorageWindow.HomeWindow.text = newText;
	SafeStorageWindow.HomeWindow:paginate();
end


function SafeStorageWindow:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.HomeWindow = ISRichTextPanel:new(0, 16, 375, 455);
	self.HomeWindow:initialise();
	self.HomeWindow.autosetheight = false
	self.HomeWindow:ignoreHeightChange()
	self:addChild(self.HomeWindow)
end

function SafeStorageWindowCreate()
	SafeStorageWindow = SafeStorageWindow:new(35, 250, 375, 455)
	SafeStorageWindow:addToUIManager();
	SafeStorageWindow:setVisible(false);
	SafeStorageWindow.pin = true;
	SafeStorageWindow.resizable = true
end

Events.OnGameStart.Add(SafeStorageWindowCreate);