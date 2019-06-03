
--Randomize findings for Catching Bugs.
function HCBugCatch(items, result, player)
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    bugLvl0 = 1024+(18.6*skill);
    bugLvl1 = 512+(18.6*skill);
    bugLvl2 = 256+(18.6*skill);
    bugLvl3 = 128+(18.6*skill);
    bugLvl4 = 64+(18.6*skill);
    bugLvl5 = 32+(18.6*skill);
    bugLvl6 = 16+(18.6*skill);
    bugLvl7 = 8+(18.6*skill);
    bugLvl8 = 4+(18.6*skill);
    bugLvl9 = 2+(18.6*skill);
    bugLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
        bugLvl0 = bugLvl0/2;
        bugLvl1 = bugLvl1/2;
        bugLvl2 = bugLvl2/2;
        bugLvl3 = bugLvl3/2;
        bugLvl4 = bugLvl4/2;
        bugLvl5 = bugLvl5/2;
        bugLvl6 = bugLvl6/2;
        bugLvl7 = bugLvl7/2;
        bugLvl8 = bugLvl8/2;
        bugLvl9 = bugLvl9/2;
        bugLvl10 = bugLvl10/2;
        nothing = nothing+(bugLvl0)+(bugLvl1)+(bugLvl2)+(bugLvl3)+(bugLvl4)+(bugLvl5)+(bugLvl6)+(bugLvl7)+(bugLvl8)+(bugLvl9)+(bugLvl10);
    end
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= bugLvl10 then
		secondChance = ZombRand(4);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCFirefly");
		elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCSilkmothfemale");
		elseif secondChance == 2 then
			player:getInventory():AddItem("Hydrocraft.HCSilkmothmale");
		elseif secondChance == 3 then
			player:getInventory():AddItem("Hydrocraft.HCBeehive");
		end
    elseif chance <= bugLvl9+bugLvl10 then
        player:getInventory():AddItem("Hydrocraft.HCDragonfly");
    elseif chance <= bugLvl8+bugLvl9+bugLvl10 then
        player:getInventory():AddItem("Hydrocraft.HCYellowjacket");
    elseif chance <= bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCBlackwidow");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCHoneybee");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCBumblebee");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCBollweevil");
        end
    elseif chance <= bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCHousefly");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Cockroach");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Base.Grasshopper");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCGardenspider");
        end
    elseif chance <= bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(2)
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCHousespider");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTermite");
        end
    elseif chance <= bugLvl4+bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCMolecricket");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCCicada");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Base.Cricket");
        end
    elseif chance <= bugLvl3+bugLvl4+bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(5);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCChrysalis");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCMonarch");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCButterfly");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCCaterpillar");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCBeetle");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCChrysalis2");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCCaterpillar2");			
        end
    elseif chance <= bugLvl2+bugLvl3+bugLvl4+bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCLadybug");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Worm");
        end
    elseif chance <= bugLvl1+bugLvl2+bugLvl3+bugLvl4+bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
	    secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCRedant");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCSnail");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCSlug");
        end	
    elseif chance <= bugLvl0+bugLvl1+bugLvl2+bugLvl3+bugLvl4+bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 then
        secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCPillbug");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCBlackant");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCBeetlegrub");
        end
    elseif chance <= nothing+bugLvl0+bugLvl1+bugLvl2+bugLvl3+bugLvl4+bugLvl5+bugLvl6+bugLvl7+bugLvl8+bugLvl9+bugLvl10 and nothing > 0 then
        player:Say("I caught nothing!");
    end
end
