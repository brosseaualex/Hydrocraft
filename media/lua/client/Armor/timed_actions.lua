

ArmorTA = {};

ArmorTA.init = function(_player, context, _items)

    local player = getSpecificPlayer(_player);
    local clickedItems = _items;
    
    if #clickedItems > 1 then
        return;
    end
    
    for i, item in ipairs(clickedItems) do
        if not instanceof(item, "InventoryItem") then
            item = item.items[2];
        end
        if instanceof(item, "InventoryItem") then
            ArmorTA.createMenus(player, context, item);
        end
    end
end

ArmorTA.createMenus = function(player, context, item)

    local itemType = item:getType();
    
    if GlobalArmor[itemType] ~= nil and GlobalArmor[itemType]["Location"] ~= nil
    then
        
        local time = 0
        
		loadArmor(item);
        
        time = 60
     
       
        if (player:getModData().FootArmor == itemType
			or player:getModData().ChestArmor == itemType 
			or player:getModData().LegArmor == itemType 
			or player:getModData().ArmArmor == itemType 
			or player:getModData().HandArmor == itemType 
			or player:getModData().HeadArmor == itemType 
			or player:getModData().ShieldArmor == itemType) and (player:getInventory():contains(item)) then
				context:addOption("Unequip Armor", item, ArmorTA.UnequipArmor, player, time);
		else
			context:addOption("Equip on ".. GlobalArmor[itemType]["Location"], item, ArmorTA.EquipArmor, player, GlobalArmor[itemType]["Time"]);
        end
        context:addOption("Examine Armor", item, ArmorTA.InspectArmor, player, GlobalArmor[itemType]["Time"]);
    else
		--getSpecificPlayer(0):Say("not armor")
	end
end

ArmorTA.EquipArmor = function(item, player, time)
    if luautils.haveToBeTransfered(player, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
    end
    ISTimedActionQueue.add(MGEquipArmorAction:new(player, item, time));
end

ArmorTA.UnequipArmor = function(item, player, time)
    if luautils.haveToBeTransfered(player, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
    end
    ISTimedActionQueue.add(MGUnequipArmorAction:new(player, item, time));
end

ArmorTA.InspectArmor = function(item, player, time)
    if luautils.haveToBeTransfered(player, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
    end
    ISTimedActionQueue.add(ExamineArmorAction:new(player, item, time));
end

Events.OnFillInventoryObjectContextMenu.Add(ArmorTA.init);







require "TimedActions/ISBaseTimedAction"

MGEquipArmorAction = ISBaseTimedAction:derive("MGEquipArmorAction");

function MGEquipArmorAction:isValid()
    return self.character:getInventory():contains(self.item);
end

function MGEquipArmorAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function MGEquipArmorAction:start()
    self.item:setJobType("Equip Armor");
    self.item:setJobDelta(0.0);
end

function MGEquipArmorAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function MGEquipArmorAction:perform()
    self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
    
    local itemType = self.item:getType();
    local player = self.character;
    
    
	local EquipedItem = self.item;
	EquipAnyArmor(EquipedItem,player);
	  
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function MGEquipArmorAction:new(character, item, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    return o
end







require "TimedActions/ISBaseTimedAction"

MGUnequipArmorAction = ISBaseTimedAction:derive("MGUnequipArmorAction");

function MGUnequipArmorAction:isValid()
    return self.character:getInventory():contains(self.item);
end

function MGUnequipArmorAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function MGUnequipArmorAction:start()
    self.item:setJobType("Unequip Armor");
    self.item:setJobDelta(0.0);
end

function MGUnequipArmorAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function MGUnequipArmorAction:perform()
    self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
    
    local itemType = self.item:getType();
    local player = self.character;
    
    local EquipedItem = self.item;
    UnEquipAnyArmor(EquipedItem,player);
	
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function MGUnequipArmorAction:new(character, item, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    return o
end


 ExamineArmorAction = ISBaseTimedAction:derive("ExamineArmorAction");

function ExamineArmorAction:isValid()
    return self.character:getInventory():contains(self.item);
end

function ExamineArmorAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function ExamineArmorAction:start()
    self.item:setJobType("Examine Armor");
    self.item:setJobDelta(0.0);
end

function ExamineArmorAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ExamineArmorAction:perform()
    self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
    
    local player = self.character;
    local item = self.item
    
    ExamineArmor(item, player)
    
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ExamineArmorAction:new(character, item, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    return o
end 