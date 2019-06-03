
--Randomize findings for dirt sifting.
function HCSiftDirt(items, result, player)
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    dirtLvl0 = 1024+(18.6*skill);
    dirtLvl1 = 512+(18.6*skill);
    dirtLvl2 = 256+(18.6*skill);
    dirtLvl3 = 128+(18.6*skill);
    dirtLvl4 = 64+(18.6*skill);
    dirtLvl5 = 32+(18.6*skill);
    dirtLvl6 = 16+(18.6*skill);
    dirtLvl7 = 8+(18.6*skill);
    dirtLvl8 = 4+(18.6*skill);
    dirtLvl9 = 2+(18.6*skill);
    dirtLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCGoldore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTrashlarge");	
        end
    elseif chance <= dirtLvl9+dirtLvl10 then
		secondChance = ZombRand(2);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCSilverore");
		elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCTrashmedium");				
		end
    elseif chance <= dirtLvl8+dirtLvl9+dirtLvl10 then	
		secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCBauxiteore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTrashsmall");			
        end
    elseif chance <= dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCIronore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCLeadore");				
        end
    elseif chance <= dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCopperore");
        elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCTinore");
        end
    elseif chance <= dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2)
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCoal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCQuartz");
        end
    elseif chance <= dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then	
		secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCRocksalt");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCSandstone");
        end	
    elseif chance <= dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
		secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCObsidian");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCLimestone");
        end			
    elseif chance <= dirtLvl2+dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
		secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCRedclay");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCGreyclay");
        end	
    elseif chance <= dirtLvl1+dirtLvl2+dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
	    secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Stone");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.SharpedStone");
        end	
    elseif chance <= dirtLvl0+dirtLvl1+dirtLvl2+dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCZombiebones");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Worm");
        end
    end
end

--Randomize findings for Mine
function HCMine(items, result, player)
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    mineLvl0 = 1024+(18.6*skill);
    mineLvl1 = 512+(18.6*skill);
    mineLvl2 = 256+(18.6*skill);
    mineLvl3 = 128+(18.6*skill);
    mineLvl4 = 64+(18.6*skill);
    mineLvl5 = 32+(18.6*skill);
    mineLvl6 = 16+(18.6*skill);
    mineLvl7 = 8+(18.6*skill);
    mineLvl8 = 4+(18.6*skill);
    mineLvl9 = 2+(18.6*skill);
    mineLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCGoldore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTrashlarge");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCMeteorite");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCPlatinumore");			
        end
    elseif chance <= mineLvl9+mineLvl10 then
		secondChance = ZombRand(4);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCSilverore");
		elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCTrashmedium");
		elseif secondChance == 2 then
			player:getInventory():AddItem("Hydrocraft.HCStonearrowhead");
		elseif secondChance == 3 then
			player:getInventory():AddItem("Hydrocraft.HCNickelore");				
		end
    elseif chance <= mineLvl8+mineLvl9+mineLvl10 then	
		secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCBauxiteore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCCinnabar");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCMagnetite");
		elseif secondChance == 3 then
			player:getInventory():AddItem("Hydrocraft.HCTrashsmall");				
        end
    elseif chance <= mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCIronore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCLeadore");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCSaltpeter");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCSulphur");				
        end
    elseif chance <= mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCopperore");
        elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCTinore");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCGypsum");
        end
    elseif chance <= mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(3)
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCoal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTar");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCGraphite");
        end
    elseif chance <= mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then	
		secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCQuartz");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCBorax");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCFeldspar");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCRocksalt");	
        end	
    elseif chance <= mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
		secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCZombiebones");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCMarble");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCObsidian");			
        end			
    elseif chance <= mineLvl2+mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
		secondChance = ZombRand(4);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Worm");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCSandstone");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCLimestone");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCChalkrock");
        end	
    elseif chance <= mineLvl1+mineLvl2+mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
	    secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCRedclay");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCGreyclay");
        end	
    elseif chance <= mineLvl0+mineLvl1+mineLvl2+mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.SharpedStone");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Stone");
        end
    end	
end

--Randomize findings for Dark Mine
function HCDarkmine(items, result, player)
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    darkLvl0 = 1024+(18.6*skill);
    darkLvl1 = 512+(18.6*skill);
    darkLvl2 = 256+(18.6*skill);
    darkLvl3 = 128+(18.6*skill);
    darkLvl4 = 64+(18.6*skill);
    darkLvl5 = 32+(18.6*skill);
    darkLvl6 = 16+(18.6*skill);
    darkLvl7 = 8+(18.6*skill);
    darkLvl8 = 4+(18.6*skill);
    darkLvl9 = 2+(18.6*skill);
    darkLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= darkLvl10 then
        secondChance = ZombRand(9);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCGoldore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTrashlarge");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCUraniumore");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCMeteorite");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCTungstenore");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCPlatinumore");	
		elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCDiamond");
		elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCBerlinite");
		elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCKimberlite");			
		
        end
    elseif chance <= darkLvl9+darkLvl10 then
		secondChance = ZombRand(12);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCSilverore");
		elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCLithiumore");
		elseif secondChance == 2 then
			player:getInventory():AddItem("Hydrocraft.HCStonearrowhead");
		elseif secondChance == 3 then
			player:getInventory():AddItem("Hydrocraft.HCTrashmedium");
		elseif secondChance == 4 then
			player:getInventory():AddItem("Hydrocraft.HCTitaniumore");
		elseif secondChance == 5 then
			player:getInventory():AddItem("Hydrocraft.HCRuby");	
		elseif secondChance == 6 then
			player:getInventory():AddItem("Hydrocraft.HCSapphire");
		elseif secondChance == 7 then
			player:getInventory():AddItem("Hydrocraft.HCEmerald");
		elseif secondChance == 8 then
			player:getInventory():AddItem("Hydrocraft.HCTopaz");
		elseif secondChance == 9 then
			player:getInventory():AddItem("Hydrocraft.HCGarnet");
		elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCThoriumore");
		elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCChromeore");			
		end
    elseif chance <= darkLvl8+darkLvl9+darkLvl10 then	
		secondChance = ZombRand(13);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCBauxiteore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCCinnabar");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCMagnetite");
		elseif secondChance == 3 then
			player:getInventory():AddItem("Hydrocraft.HCZincore");	
		elseif secondChance == 4 then
			player:getInventory():AddItem("Hydrocraft.HCNickelore");
		elseif secondChance == 5 then
			player:getInventory():AddItem("Hydrocraft.HCDiatomite");
		elseif secondChance == 6 then
			player:getInventory():AddItem("Hydrocraft.HCTrashsmall");
		elseif secondChance == 7 then
			player:getInventory():AddItem("Hydrocraft.HCAlbite");
		elseif secondChance == 8 then
			player:getInventory():AddItem("Hydrocraft.HCOlivine");
		elseif secondChance == 9 then
			player:getInventory():AddItem("Hydrocraft.HCFireagate");
		elseif secondChance == 10 then
			player:getInventory():AddItem("Hydrocraft.HCAmethyst");
		elseif secondChance == 11 then
			player:getInventory():AddItem("Hydrocraft.HCRhodonite");
		elseif secondChance == 12 then
			player:getInventory():AddItem("Hydrocraft.HCLepidolite");				
        end
    elseif chance <= darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(10);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCIronore");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCLeadore");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCSaltpeter");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCSulphur");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCJade");	
        elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCTrona");
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCTurquoise");
        elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCPyrite");
        elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCLapislazuli");
        elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCAmazonite");				
        end
    elseif chance <= darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(6);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCopperore");
        elseif secondChance == 1 then
			player:getInventory():AddItem("Hydrocraft.HCTinore");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCGypsum");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCAzurite");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCMalachite");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCCobaltore");				
        end
    elseif chance <= darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(3)
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCoal");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCTar");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCGraphite");
        end
    elseif chance <= darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then	
		secondChance = ZombRand(9);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCQuartz");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCBorax");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCFeldspar");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCRocksalt");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCQuartzblue");	
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCQuartzrose");	
		elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCQuartzsmokey");	
		elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCQuartzcitrine");
		elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCSchist");			
        end	
    elseif chance <= darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
		secondChance = ZombRand(5);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCZombiebones");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCMarble");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCObsidian");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCAlabaster");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCDacite");
        elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCRhyolite");			
        end			
    elseif chance <= darkLvl2+darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
		secondChance = ZombRand(7);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Worm");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCSandstone");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCLimestone");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCChalkrock");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCBasalt");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCShale");
		elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCGabbro");			
        end	
    elseif chance <= darkLvl1+darkLvl2+darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
	    secondChance = ZombRand(3);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCRedclay");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCGreyclay");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCKaolinite");			
        end	
    elseif chance <= darkLvl0+darkLvl1+darkLvl2+darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.SharpedStone");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.Stone");
        end
    end	
end