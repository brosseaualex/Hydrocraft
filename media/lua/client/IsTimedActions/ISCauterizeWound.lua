
require "TimedActions/ISBaseTimedAction"

ISCauterizeWound = ISBaseTimedAction:derive("ISCauterizeWound");

function ISCauterizeWound:isValid()
	if ISHealthPanel.DidPatientMove(self.character, self.otherPlayer, self.bandagedPlayerX, self.bandagedPlayerY) then
		return false
	end
    return true;
end

function ISCauterizeWound:update()
    if self.item then
        self.item:setJobDelta(self:getJobDelta());
    end
    local jobType = self.doIt and getText("ContextMenu_Cauterize_Wound")
    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, self, jobType, {CauterizeWound = true})
end

function ISCauterizeWound:start()
end

function ISCauterizeWound:stop()
    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, nil, nil, nil)
    ISBaseTimedAction.stop(self);
end

function ISCauterizeWound:perform()
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);

    if self.character:HasTrait("Hemophobic") then
        self.character:getStats():setPanic(self.character:getStats():getPanic() + 50);
    end

    self.character:getXp():AddXP(Perks.Doctor, 10);
    local addPain = (60 - (self.doctorLevel * 1));
    if self.character:getAccessLevel() ~= "None" then
        self.bodyPart:setAdditionalPain(self.bodyPart:getAdditionalPain() + addPain);
    end
	self.bodyPart:setBleeding(false);
	self.bodyPart:setBleedingTime(0);
	self.bodyPart:AddDamage(1);
    self.bodyPart:setNeedBurnWash(true);
	self.bandage:Use();

    if isClient() then
        sendCauterizeWound(self.otherPlayer:getOnlineID(), self.bodyPart:getIndex());
        if self.character:getAccessLevel() ~= "None" then
            sendAdditionalPain(self.otherPlayer:getOnlineID(), self.bodyPart:getIndex(), addPain);
        end
    end

    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, nil, nil, nil)
end

function ISCauterizeWound:new(doctor, otherPlayer, bandage, bodyPart)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = doctor;
    o.otherPlayer = otherPlayer;
    o.doctorLevel = doctor:getPerkLevel(Perks.Doctor);
	o.bodyPart = bodyPart;
    o.bandage = bandage;
	o.stopOnWalk = true;
	o.stopOnRun = true;
    o.bandagedPlayerX = otherPlayer:getX();
    o.bandagedPlayerY = otherPlayer:getY();
    o.maxTime = 250 - (o.doctorLevel * 6);
    if doctor:getAccessLevel() ~= "None" then
        o.maxTime = 1;
        o.doctorLevel = 10;
    end
	return o;
end