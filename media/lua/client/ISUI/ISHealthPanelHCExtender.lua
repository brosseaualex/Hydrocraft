--Required base game definitions. Do NOT touch unless base version change.

local BaseHandler = ISBaseObject:derive("BaseHandler")

function BaseHandler:new(panel, bodyPart)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.panel = panel
    o.bodyPart = bodyPart
    o.items = {}
    return o
end

function BaseHandler:isInjured()
    local bodyPart = self.bodyPart
    return (bodyPart:HasInjury() or bodyPart:stitched() or bodyPart:getSplintFactor() > 0) and not bodyPart:bandaged()
end

function BaseHandler:checkItems()
    local items = {}
    for k,v in pairs(self.items) do
        items[k] = {}
    end
    self.items = items

    local containers = ISInventoryPaneContextMenu.getContainers(self:getDoctor())
    for i=1,containers:size() do
        local container = containers:get(i-1)
        for j=1,container:getItems():size() do
            local item = container:getItems():get(j-1)
            if instanceof(item, "InventoryContainer") and item:getType() == "FirstAidKit" then
                for k=1,item:getItemContainer():getItems():size() do
                    local item2 = item:getItemContainer():getItems():get(k-1)
                    self:checkItem(item2)
                end
            else
                self:checkItem(item)
            end
        end
    end
end

function BaseHandler:addItem(items, item)
    table.insert(items, item)
end

function BaseHandler:getAllItemTypes(items)
    local done = {}
    local types = {}
    for _,item in ipairs(items) do
        if not done[item:getFullType()] then
            table.insert(types, item:getFullType())
            done[item:getFullType()] = true
        end
    end
    return types
end

function BaseHandler:getItemOfType(items, type)
    for _,item in ipairs(items) do
        if item:getFullType() == type then
            return item
        end
    end
    return nil
end

function BaseHandler:getAllItemsOfType(items, type)
    local items = {}
    for _,item in ipairs(items) do
        if item:getFullType() == type then
            table.insert(items, item)
        end
    end
    return items
end

function BaseHandler:onMenuOptionSelected(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    ISTimedActionQueue.add(HealthPanelAction:new(self:getDoctor(), self, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

function BaseHandler:toPlayerInventory(item, previousAction)
    if item:getContainer() ~= self:getDoctor():getInventory() then
        local action = ISInventoryTransferAction:new(self:getDoctor(), item, item:getContainer(), self:getDoctor():getInventory())
        ISTimedActionQueue.addAfter(previousAction, action)
        -- FIXME: ISHealthPanel.actions never gets cleared
        self.panel.actions = self.panel.actions or {}
        self.panel.actions[action] = self.bodyPart
        return action
    end
    return previousAction
end

function BaseHandler:getDoctor()
    return self.panel.otherPlayer or self.panel.character
end

function BaseHandler:getPatient()
    return self.panel.character
end

-----

local HApplyBandage = BaseHandler:derive("HApplyBandage")

function HApplyBandage:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HApplyBandage:checkItem(item)
    if item:getBandagePower() > 0 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HApplyBandage:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() then
        local option = context:addOption(getText("ContextMenu_Bandage"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
end

function HApplyBandage:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured()
end

function HApplyBandage:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISApplyBandage:new(self:getDoctor(), self:getPatient(), item, self.bodyPart, true)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HRemoveBandage = BaseHandler:derive("HRemoveBandage")

function HRemoveBandage:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    return o
end

function HRemoveBandage:checkItem(item)
end

function HRemoveBandage:addToMenu(context)
    if self.bodyPart:bandaged() then
        context:addOption(getText("ContextMenu_Remove_Bandage"), self, self.onMenuOptionSelected)
    end
end

function HRemoveBandage:isValid()
    return self.bodyPart:bandaged()
end

function HRemoveBandage:perform(previousAction)
    local action = ISApplyBandage:new(self:getDoctor(), self:getPatient(), nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HApplyPoultice = BaseHandler:derive("HApplyPoultice")

function HApplyPoultice:new(panel, bodyPart, itemType, menuLabel, actionClass)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    o.itemType = itemType
    o.menuLabel = menuLabel
    o.actionClass = actionClass
    return o
end

function HApplyPoultice:checkItem(item)
    if item:getType() == self.itemType then
        self:addItem(self.items.ITEMS, item)
    end
end

function HApplyPoultice:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and
            self.bodyPart:getPlantainFactor() == 0 and
            self.bodyPart:getComfreyFactor() == 0 and
            self.bodyPart:getGarlicFactor() == 0 then
        local option = context:addOption(getText(self.menuLabel), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
end

function HApplyPoultice:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured() and
        self.bodyPart:getPlantainFactor() == 0 and
        self.bodyPart:getComfreyFactor() == 0 and
        self.bodyPart:getGarlicFactor() == 0
end

function HApplyPoultice:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = self.actionClass:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HApplyComfrey = HApplyPoultice:derive("HApplyComfrey")

function HApplyComfrey:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "ComfreyCataplasm", "ContextMenu_ComfreyCataplasm", ISComfreyCataplasm)
end

-----

local HApplyGarlic = HApplyPoultice:derive("HApplyGarlic")

function HApplyGarlic:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "WildGarlicCataplasm", "ContextMenu_GarlicCataplasm", ISGarlicCataplasm)
end

-----

local HApplyPlantain = HApplyPoultice:derive("HApplyPlantain")

function HApplyPlantain:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "PlantainCataplasm", "ContextMenu_PlantainCataplasm", ISPlantainCataplasm)
end

-----

local HDisinfect = BaseHandler:derive("HDisinfect")

function HDisinfect:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HDisinfect:checkItem(item)
    if item:getAlcoholPower() > 0 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HDisinfect:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() then
        local option = context:addOption(getText("ContextMenu_Disinfect"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
end

function HDisinfect:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured()
end

function HDisinfect:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISDisinfect:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HStitch = BaseHandler:derive("HStitch")

function HStitch:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HStitch:checkItem(item)
    if item:getType() == "Needle" then
        self:addItem(self.items.ITEMS, item)
    end
    if item:getType() == "Thread" and item:getUsedDelta() >= 0 then
        self:addItem(self.items.ITEMS, item)
    end
    if item:getType() == "SutureNeedle" then
        self:addItem(self.items.ITEMS, item)
    end
end

function HStitch:addToMenu(context)
    if not self:isInjured() or not self.bodyPart:isDeepWounded() or self.bodyPart:haveGlass() then
        return false
    end
    local needle = self:getItemOfType(self.items.ITEMS, "Base.Needle")
    local thread = self:getItemOfType(self.items.ITEMS, "Base.Thread")
    local needlePlusThread = self:getItemOfType(self.items.ITEMS, "Base.SutureNeedle")
    if (needle and thread) or needlePlusThread then
        local option = context:addOption(getText("ContextMenu_Stitch"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        if needlePlusThread then
            subMenu:addOption(needlePlusThread:getName(), self, self.onMenuOptionSelected, needlePlusThread:getFullType(), needlePlusThread:getFullType())
        end
        if needle and thread then
            local text = needle:getName() .. " + " .. thread:getName()
            subMenu:addOption(text, self, self.onMenuOptionSelected, needle:getFullType(), thread:getFullType())
        end
    end
end

function HStitch:isValid(needleType, threadType)
    if not self:isInjured() or not self.bodyPart:isDeepWounded() or self.bodyPart:haveGlass() then
        return false
    end
    self:checkItems()
    if needleType == threadType then
        local needlePlusThread = self:getItemOfType(self.items.ITEMS, needleType)
        return needlePlusThread ~= nil
    else
        local needle = self:getItemOfType(self.items.ITEMS, needleType)
        local thread = self:getItemOfType(self.items.ITEMS, threadType)
        return (needle and thread) ~= nil
    end
end

function HStitch:perform(previousAction, needleType, threadType)
    if needleType == threadType then
        local needle = self:getItemOfType(self.items.ITEMS, needleType)
        previousAction = self:toPlayerInventory(needle, previousAction)
        local action = ISStitch:new(self:getDoctor(), self:getPatient(), needle, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    else
        local needle = self:getItemOfType(self.items.ITEMS, needleType)
        local thread = self:getItemOfType(self.items.ITEMS, threadType)
        previousAction = self:toPlayerInventory(needle, previousAction)
        previousAction = self:toPlayerInventory(thread, previousAction)
        local action = ISStitch:new(self:getDoctor(), self:getPatient(), thread, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    end
end

-----

local HRemoveStitch = BaseHandler:derive("HRemoveStitch")

function HRemoveStitch:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    return o
end

function HRemoveStitch:checkItem(item)
end

function HRemoveStitch:addToMenu(context)
    if self.bodyPart:stitched() then
        context:addOption(getText("ContextMenu_Remove_Stitch"), self, self.onMenuOptionSelected)
    end
end

function HRemoveStitch:isValid()
    return self.bodyPart:stitched()
end

function HRemoveStitch:perform(previousAction)
    local action = ISStitch:new(self:getDoctor(), self:getPatient(), nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HRemoveGlass = BaseHandler:derive("HRemoveGlass")

function HRemoveGlass:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HRemoveGlass:checkItem(item)
    if item:getType() == "SutureNeedleHolder" or item:getType() == "Tweezers" then
        self:addItem(self.items.ITEMS, item)
    end
end

function HRemoveGlass:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if self:isInjured() and self.bodyPart:haveGlass() then
        local option = context:addOption(getText("ContextMenu_Remove_Glass"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        if #types > 0 then
            for i=1,#types do
                local item = self:getItemOfType(self.items.ITEMS, types[i])
                subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
            end
        end
        subMenu:addOption(getText("ContextMenu_Hand"), self, self.onMenuOptionSelected, "Hands")
    end
end

function HRemoveGlass:isValid(itemType)
    self:checkItems()
    return (self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured() and self.bodyPart:haveGlass()) or (itemType == "Hands" and self:isInjured() and self.bodyPart:haveGlass())
end

function HRemoveGlass:perform(previousAction, itemType)
    if (itemType == "Hands") then
        local action = ISRemoveGlass:new(self:getDoctor(), self:getPatient(), self.bodyPart, true)
        ISTimedActionQueue.add(action)
    else
        local item = self:getItemOfType(self.items.ITEMS, itemType)
        previousAction = self:toPlayerInventory(item, previousAction)
        local action = ISRemoveGlass:new(self:getDoctor(), self:getPatient(), self.bodyPart)
        ISTimedActionQueue.addAfter(previousAction, action)
    end
end

-----

local HSplint = BaseHandler:derive("HSplint")

function HSplint:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.splint = {}
    o.items.plank = {}
    o.items.rippedSheet = {}
    return o
end

function HSplint:checkItem(item)
    if item:getType() == "Splint" then
        self:addItem(self.items.splint, item)
    end
    if item:getType() == "Plank" or item:getType() == "TreeBranch" or item:getType() == "WoodenStick" then
        self:addItem(self.items.plank, item)
    end
    if item:getType() == "RippedSheets" then
        self:addItem(self.items.rippedSheet, item)
    end
end

function HSplint:addToMenu(context)
    -- can't splint chest/head
    if self.bodyPart:getType() == BodyPartType.Head or self.bodyPart:getType() == BodyPartType.Torso_Upper or self.bodyPart:getType() == BodyPartType.Torso_Lower or not self:isInjured() or self.bodyPart:getFractureTime() <= 0 or self.bodyPart:getSplintFactor() > 0 then
        return false
    end
    local splintType = self:getAllItemTypes(self.items.splint)
    local plankType = self:getAllItemTypes(self.items.plank)
    local rippedSheetType = self:getAllItemTypes(self.items.rippedSheet)
    if #splintType > 0 or (#plankType > 0 and #rippedSheetType > 0) then
        local option = context:addOption(getText("ContextMenu_Splint"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#splintType do
            local item = self:getItemOfType(self.items.splint, splintType[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, nil, item:getFullType())
        end
        if #plankType > 0 and #rippedSheetType > 0 then
            local rippedSheet = self:getItemOfType(self.items.rippedSheet, rippedSheetType[1])
            for i=1,#plankType do
                local plank = self:getItemOfType(self.items.plank, plankType[i])
                local text = plank:getName() .. " + " .. rippedSheet:getName()
                subMenu:addOption(text, self, self.onMenuOptionSelected, rippedSheet:getFullType(), plank:getFullType())
            end
        end
    end
end

function HSplint:isValid(rippedSheetType, plankType)
    if not self:isInjured() or self.bodyPart:getFractureTime() <= 0 or self.bodyPart:getSplintFactor() > 0 then
        return false
    end
    self:checkItems()
    local splints = self.items.splint
    local planks = self.items.plank
    local rippedSheets = self.items.rippedSheet
    return #splints > 0 or (#planks > 0 and #rippedSheets > 0)
end

function HSplint:perform(previousAction, rippedSheetType, plankType)
    if rippedSheetType then
        local rippedSheet = self:getItemOfType(self.items.rippedSheet, rippedSheetType)
        local plank = self:getItemOfType(self.items.plank, plankType)
        previousAction = self:toPlayerInventory(rippedSheet, previousAction)
        previousAction = self:toPlayerInventory(plank, previousAction)
        local action = ISSplint:new(self:getDoctor(), self:getPatient(), rippedSheet, plank, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    else
        local splint = self:getItemOfType(self.items.splint, plankType)
        previousAction = self:toPlayerInventory(splint, previousAction)
        local action = ISSplint:new(self:getDoctor(), self:getPatient(), nil, splint, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    end
end

-----

local HRemoveSplint = BaseHandler:derive("HRemoveSplint")

function HRemoveSplint:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    return o
end

function HRemoveSplint:checkItem(item)
end

function HRemoveSplint:addToMenu(context)
    if self:isInjured() and self.bodyPart:getSplintFactor() > 0 then
        context:addOption(getText("ContextMenu_Remove_Splint"), self, self.onMenuOptionSelected)
    end
end

function HRemoveSplint:isValid()
    return self:isInjured() and self.bodyPart:getSplintFactor() > 0
end

function HRemoveSplint:perform(previousAction)
    local action = ISSplint:new(self:getDoctor(), self:getPatient(), nil, nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HRemoveBullet = BaseHandler:derive("HRemoveBullet")

function HRemoveBullet:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HRemoveBullet:checkItem(item)
    if item:getType() == "Tweezers" or item:getType() == "SutureNeedleHolder" then
        self:addItem(self.items.ITEMS, item)
    end
end

function HRemoveBullet:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and self.bodyPart:haveBullet() then
        local option = context:addOption(getText("ContextMenu_Remove_Bullet"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, item:getFullType())
        end
    end
end

function HRemoveBullet:isValid(itemType)
    return self:isInjured() and self.bodyPart:haveBullet() and self:getItemOfType(self.items.ITEMS, itemType)
end

function HRemoveBullet:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISRemoveBullet:new(self:getDoctor(), self:getPatient(), self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HCleanBurn = BaseHandler:derive("HCleanBurn")

function HCleanBurn:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HCleanBurn:checkItem(item)
    if item:getBandagePower() >= 2 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HCleanBurn:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and self.bodyPart:isNeedBurnWash() then
        local option = context:addOption(getText("ContextMenu_Clean_Burn"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, item:getFullType())
        end
    end
end

function HCleanBurn:isValid(itemType)
    return self:isInjured() and self.bodyPart:isNeedBurnWash() and self:getItemOfType(self.items.ITEMS, itemType)
end

function HCleanBurn:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISCleanBurn:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----
--Hydrocraft medical procedures

--Wound Cauterizaation
local HCHCauterizeWound = BaseHandler:derive("HCHCauterizeWound")

function HCHCauterizeWound:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HCHCauterizeWound:checkItem(item)
	--Add "BandagePower = -1," to the item definition of anything you want to be able to cauterize wounds.
    if item:getBandagePower() == -1 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HCHCauterizeWound:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and self.bodyPart:bleeding() then
        local option = context:addOption(getText("ContextMenu_Cauterize_Wound"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, item:getFullType())
        end
    end
end

function HCHCauterizeWound:isValid(itemType)
    return self:isInjured() and self.bodyPart:bleeding() and self:getItemOfType(self.items.ITEMS, itemType)
end

function HCHCauterizeWound:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISCauterizeWound:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

--Base game function Make sure unmarked sections are the same as ProjectZomboid\media\lua\client\XpSystem\ISUI\ISHealthPanel.lua ISHealthPanel:doBodyPartContextMenu

function ISHealthPanel:doBodyPartContextMenu(bodyPart, x, y)
    local playerNum = self.otherPlayer and self.otherPlayer:getPlayerNum() or self.character:getPlayerNum()
    local context = ISContextMenu.get(playerNum, x + self:getAbsoluteX(), y + self:getAbsoluteY());

    local handlers = {}
    table.insert(handlers, HRemoveBandage:new(self, bodyPart))
    table.insert(handlers, HApplyPlantain:new(self, bodyPart))
    table.insert(handlers, HApplyComfrey:new(self, bodyPart))
    table.insert(handlers, HApplyGarlic:new(self, bodyPart))
    table.insert(handlers, HApplyBandage:new(self, bodyPart))
    table.insert(handlers, HDisinfect:new(self, bodyPart))
    table.insert(handlers, HStitch:new(self, bodyPart))
    table.insert(handlers, HRemoveStitch:new(self, bodyPart))
    table.insert(handlers, HRemoveGlass:new(self, bodyPart))
    table.insert(handlers, HSplint:new(self, bodyPart))
    table.insert(handlers, HRemoveSplint:new(self, bodyPart))
    table.insert(handlers, HRemoveBullet:new(self, bodyPart))
    table.insert(handlers, HCleanBurn:new(self, bodyPart))
	
	----
	--HC Health Handlers
	table.insert(handlers, HCHCauterizeWound:new(self, bodyPart))
    ----
    
	local containers = ISInventoryPaneContextMenu.getContainers(self.otherPlayer or self.character)
    for i=1,containers:size() do
        local container = containers:get(i-1)
        for j=1,container:getItems():size() do
            local item = container:getItems():get(j-1)
            for _,handler in ipairs(handlers) do
                if instanceof(item, "InventoryContainer") and item:getType() == "FirstAidKit" then
                    for k=1,item:getItemContainer():getItems():size() do
                        local item2 = item:getItemContainer():getItems():get(k-1)
                        handler:checkItem(item2)
                    end
                else
                    handler:checkItem(item)
                end
            end
        end
    end

    for _,handler in ipairs(handlers) do
        handler:addToMenu(context)
    end

    if ISHealthPanel.cheat then
        if not isClient() or self:getPatient():isLocalPlayer() then
            local option = context:addOption("Cheat", nil);
            local subMenu = context:getNew(context);
            context:addSubMenu(option, subMenu);
            subMenu:addOption("Toggle Bleeding", bodyPart, ISHealthPanel.onCheat, "bleeding", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Bullet", bodyPart, ISHealthPanel.onCheat, "bullet", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Burned", bodyPart, ISHealthPanel.onCheat, "burned", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Burn Needs Wash", bodyPart, ISHealthPanel.onCheat, "burnWash", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Deep Wound", bodyPart, ISHealthPanel.onCheat, "deepWound", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Fracture", bodyPart, ISHealthPanel.onCheat, "fracture", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Glass Shards", bodyPart, ISHealthPanel.onCheat, "glass", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Infected", bodyPart, ISHealthPanel.onCheat, "infected", self.character, self.otherPlayer);
            subMenu:addOption("Toggle Scratched", bodyPart, ISHealthPanel.onCheat, "scratched", self.character, self.otherPlayer);
            subMenu:addOption("Health Full", bodyPart, ISHealthPanel.onCheat, "healthFull", self.character, self.otherPlayer);
        end

        local option = context:addOption("Cheat Item", nil);
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        local types = { "Base.Bandage", "Base.Bandaid", "Base.RippedSheets", "Base.Needle", "Base.Thread", "Base.SutureNeedle", "Base.Tweezers", "Base.SutureNeedleHolder", "Base.Splint", "Base.TreeBranch", "Base.WoodenStick", "Base.PlantainCataplasm", "Base.WildGarlicCataplasm", "Base.ComfreyCataplasm" }
        for _,type in ipairs(types) do
            local scriptItem = getScriptManager():FindItem(type)
            local name = scriptItem and scriptItem:getDisplayName() or type
            subMenu:addOption(name, type, ISHealthPanel.onCheatItem, self.otherPlayer or self.character)
        end
    end

    if context:isEmpty() then
        context:setVisible(false);
    end

    if JoypadState.players[playerNum+1] and context:getIsVisible() then
        context.mouseOver = 1
        context.origin = self
        JoypadState.players[playerNum+1].focus = context
        updateJoypadFocus(JoypadState.players[playerNum+1])
    end
end