ArmorWindow = ISCollapsableWindow:derive("ArmorWindow");
ArmorWindow.compassLines = {}
function ArmorWindow:initialise()
	ISCollapsableWindow.initialise(self);
end

function ArmorWindow:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "Armor";
	o.pin = false;
	o:noBackground();
	return o;
end

function ArmorWindow:setText(newText)
	ArmorWindow.HomeWindow.text = newText;
	ArmorWindow.HomeWindow:paginate();
end


function ArmorWindow:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.HomeWindow = ISRichTextPanel:new(0, 16, 375, 455);
	self.HomeWindow:initialise();
	self.HomeWindow.autosetheight = false
	self.HomeWindow:ignoreHeightChange()
	self:addChild(self.HomeWindow)
end

function CompassWindowCreate()
	ArmorWindow = ArmorWindow:new(35, 250, 375, 455)
	ArmorWindow:addToUIManager();
	ArmorWindow:setVisible(false);
	ArmorWindow.pin = true;
	ArmorWindow.resizable = true
end

Events.OnGameStart.Add(CompassWindowCreate);