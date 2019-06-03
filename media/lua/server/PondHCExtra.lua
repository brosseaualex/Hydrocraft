
--Randomize findings for Fishing in Pond.
function HCPondFishing(items, result, player)
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    pondLvl0 = 1024+(18.6*skill);
    pondLvl1 = 512+(18.6*skill);
    pondLvl2 = 256+(18.6*skill);
    pondLvl3 = 128+(18.6*skill);
    pondLvl4 = 64+(18.6*skill);
    pondLvl5 = 32+(18.6*skill);
    pondLvl6 = 16+(18.6*skill);
    pondLvl7 = 8+(18.6*skill);
    pondLvl8 = 4+(18.6*skill);
    pondLvl9 = 2+(18.6*skill);
    pondLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
        pondLvl0 = pondLvl0/2;
        pondLvl1 = pondLvl1/2;
        pondLvl2 = pondLvl2/2;
        pondLvl3 = pondLvl3/2;
        pondLvl4 = pondLvl4/2;
        pondLvl5 = pondLvl5/2;
        pondLvl6 = pondLvl6/2;
        pondLvl7 = pondLvl7/2;
        pondLvl8 = pondLvl8/2;
        pondLvl9 = pondLvl9/2;
        pondLvl10 = pondLvl10/2;
        nothing = nothing+(pondLvl0)+(pondLvl1)+(pondLvl2)+(pondLvl3)+(pondLvl4)+(pondLvl5)+(pondLvl6)+(pondLvl7)+(pondLvl8)+(pondLvl9)+(pondLvl10);
    end
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= pondLvl10 then
		secondChance = ZombRand(2);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCEel");		
		elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCReeds");
		end
		player:getXp():AddXP(Perks.Fishing, 10);
    elseif chance <= pondLvl9+pondLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Pike");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCZander");
        end
		player:getXp():AddXP(Perks.Fishing, 10);	
    elseif chance <= pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(5);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Bass");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Trout");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCCarp");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCGrayling");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCSalmon");			
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(5);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Panfish");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Perch");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCAsp");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCBurbot");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCLavaret");			
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Catfish");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCBrill");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCPlaice");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCTench");			
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(4)
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Crappie");
        elseif secondChance == 1 then	
            player:getInventory():AddItem("Hydrocraft.HCChub");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCRoach");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCSilverbream");		
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl4+pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.BaitFish");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCRuffe");
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl3+pondLvl4+pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCMussel");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCCrayfish");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCPondturtle");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCSnappingturtle");			
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl2+pondLvl3+pondLvl4+pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(5);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Frog");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCToad");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCTadpole");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCNewt");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCSalamander");				
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl1+pondLvl2+pondLvl3+pondLvl4+pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
	    secondChance = ZombRand(7);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCLotusleaf");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCLotusflower");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCLotusroot");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCHyacinthflower");	
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCWaterlilyleaf");	
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCWaterlilyflower");	
		elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCHyacinthleaf");				
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= pondLvl0+pondLvl1+pondLvl2+pondLvl3+pondLvl4+pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 then
        secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCReeds");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCCattail");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCDuckweed");			
        end
		player:getXp():AddXP(Perks.Fishing, 10);		
    elseif chance <= nothing+pondLvl0+pondLvl1+pondLvl2+pondLvl3+pondLvl4+pondLvl5+pondLvl6+pondLvl7+pondLvl8+pondLvl9+pondLvl10 and nothing > 0 then
        player:Say("I caught nothing!");
    end
end
