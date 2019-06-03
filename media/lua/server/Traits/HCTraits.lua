--Hydrocraft Traits and Related Things
--Yossitaru

TraitFactory.addTrait("WearsGlasses", "Wearing Glasses", -2, "This character wears glasses.", false);
TraitFactory.addTrait("WearsHearingAid", "Wearing Hearing Aid", -2, "This character wears a hearing aid.", false);

function WearGlassesRecipe(items, result, player)
    foundGlassesTrait = 0; --Default and non-short sighted people.
    for x=0, player:getTraits():size()-1 do
   	 if player:getTraits():get(x) == "ShortSighted" then
   		 foundTrait = 1; --Short Sighted people.
   	 elseif player:getTraits():get(x) == "WearsGlasses" then
   		 foundTrait = 2; --Short sighted people wearing glasses.
   	 end
    end
    if foundTrait == 1 then --Remove short sighted and add wears glasses.
   	 player:getTraits():remove("ShortSighted");
   	 player:getTraits():add("WearsGlasses");
   	 player:Say("I put on the glasses.");
    elseif foundTrait == 2 then --You can't wear glasses while wearing glasses.
   	 player:Say("I'm already wearing glasses.");
    else --Glasses not needed.
   	 player:Say("I don't need glasses.");
    end
end

function WearHAidRecipe(items, result, player)
    foundTrait = 0; --Default and non-hard of hearing people.
    for x=0, player:getTraits():size()-1 do
		if player:getTraits():get(x) == "HardOfHearing" then
			foundTrait = 1; --Hard of Hearing people.
		elseif player:getTraits():get(x) == "WearsHearingAid" then
			foundTrait = 2; --Heard of hearing people wearing an aid.
		end
    end
    
	if foundTrait == 1 then --Remove hard of hearing and add wears hearing aid.
		player:getTraits():remove("HardOfHearing");
		player:getTraits():add("WearsHearingAid");
		player:Say("I put on the hearing aid.");
    elseif foundTrait == 2 then --You can't wear a hearing aid while wearing a hearing aid.
		player:Say("I'm already wearing a hearing aid.");
    else --Hearing aid not needed.
		player:Say("I don't need a hearing aid.");
    end
end

function CheckTraitItem(player)
   	glassesTrait = false;
	hearingAidTrait = false;
   	glassesItem = false;
	hearingAidItem = false;
	
    for x=0, player:getTraits():size()-1 do --Are you wearing glasses?
		if player:getTraits():get(x) == "WearsGlasses" then
			glassesTrait = true;
		end
		if player:getTraits():get(x) == "WearsHearingAid" then
			hearingAidTrait = true;
		end	 
    end
	
    if player:getInventory():contains("Glasses") then --Do you still have your glasses?
		glassesItem = true;
    end
	if player:getInventory():contains("HCHearingaid") then
		hearingAidItem = true;
	end

    if glassesTrait and not glassesItem then --You can't wear that which you don't have.
		player:getTraits():remove("WearsGlasses");
		player:getTraits():add("ShortSighted");
    end
	if hearingAidTrait and not hearingAidItem then
		player:getTraits():remove("WearsHearingAid");
		player:getTraits():add("HardOfHearing");
	end
end


Events.OnPlayerUpdate.Add(CheckTraitItem);