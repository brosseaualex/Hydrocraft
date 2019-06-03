
--Randomize findings for Gathering Dung.
function HCDungGather(items, result, player)
 if not player:isOutside() then
player:Say("There are no dung indoors.");
return;
end
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    dungLvl0 = 1024+(18.6*skill);
    dungLvl1 = 512+(18.6*skill);
    dungLvl2 = 256+(18.6*skill);
    dungLvl3 = 128+(18.6*skill);
    dungLvl4 = 64+(18.6*skill);
    dungLvl5 = 32+(18.6*skill);
    dungLvl6 = 16+(18.6*skill);
    dungLvl7 = 8+(18.6*skill);
    dungLvl8 = 4+(18.6*skill);
    dungLvl9 = 2+(18.6*skill);
    dungLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
        dungLvl0 = dungLvl0/2;
        dungLvl1 = dungLvl1/2;
        dungLvl2 = dungLvl2/2;
        dungLvl3 = dungLvl3/2;
        dungLvl4 = dungLvl4/2;
        dungLvl5 = dungLvl5/2;
        dungLvl6 = dungLvl6/2;
        dungLvl7 = dungLvl7/2;
        dungLvl8 = dungLvl8/2;
        dungLvl9 = dungLvl9/2;
        dungLvl10 = dungLvl10/2;
        nothing = nothing+(dungLvl0)+(dungLvl1)+(dungLvl2)+(dungLvl3)+(dungLvl4)+(dungLvl5)+(dungLvl6)+(dungLvl7)+(dungLvl8)+(dungLvl9)+(dungLvl10);
    end
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= dungLvl10 then
		secondChance = ZombRand(2);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCBearpoop");
		elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCCougarpoop");		
		end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCHorsepoopferal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCHorsepoopferal");	
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCDonkeypoopferal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCDonkeypoopferal");
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCPigpoopferal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCPigpoopferal");	
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCBoarpoop");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCBoarpoop");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2)
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCGoatpoopferal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCGoatpoopferal");
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl4+dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCSheeppoopferal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCSheeppoopferal");			
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl3+dungLvl4+dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCDogpoop");	
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCDogpoop");	
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl2+dungLvl3+dungLvl4+dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCSmallgamepoop");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCSmallgamepoop");		
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl1+dungLvl2+dungLvl3+dungLvl4+dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCowpoopferal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCCowpoopferal");						
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= dungLvl0+dungLvl1+dungLvl2+dungLvl3+dungLvl4+dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCDeerpoop");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCDeerpoop");		
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= nothing+dungLvl0+dungLvl1+dungLvl2+dungLvl3+dungLvl4+dungLvl5+dungLvl6+dungLvl7+dungLvl8+dungLvl9+dungLvl10 and nothing > 0 then
        player:Say("I found nothing!");
    end
end


