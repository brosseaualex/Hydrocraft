
--Randomize findings for Gathering Flora.
function HCFloraGather(items, result, player)
 if not player:isOutside() then
player:Say("There are no flora indoors.");
return;
end
player:getStats():setFatigue(player:getStats():getFatigue()+0.05)
    skill = player:getPerkLevel(Perks.PlantScavenging);

    floraLvl0 = 1024+(18.6*skill);
    floraLvl1 = 512+(18.6*skill);
    floraLvl2 = 256+(18.6*skill);
    floraLvl3 = 128+(18.6*skill);
    floraLvl4 = 64+(18.6*skill);
    floraLvl5 = 32+(18.6*skill);
    floraLvl6 = 16+(18.6*skill);
    floraLvl7 = 8+(18.6*skill);
    floraLvl8 = 4+(18.6*skill);
    floraLvl9 = 2+(18.6*skill);
    floraLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
        floraLvl0 = floraLvl0/2;
        floraLvl1 = floraLvl1/2;
        floraLvl2 = floraLvl2/2;
        floraLvl3 = floraLvl3/2;
        floraLvl4 = floraLvl4/2;
        floraLvl5 = floraLvl5/2;
        floraLvl6 = floraLvl6/2;
        floraLvl7 = floraLvl7/2;
        floraLvl8 = floraLvl8/2;
        floraLvl9 = floraLvl9/2;
        floraLvl10 = floraLvl10/2;
        nothing = nothing+(floraLvl0)+(floraLvl1)+(floraLvl2)+(floraLvl3)+(floraLvl4)+(floraLvl5)+(floraLvl6)+(floraLvl7)+(floraLvl8)+(floraLvl9)+(floraLvl10);
    end
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= floraLvl10 then
		secondChance = ZombRand(10);
		if secondChance == 0 then
			player:getInventory():AddItem("Hydrocraft.HCCrabapple");
		elseif secondChance == 1 then
			player:getInventory():AddItem("Base.Grapes");
		elseif secondChance == 2 then
			player:getInventory():AddItem("Base.Lemon");
		elseif secondChance == 3 then
			player:getInventory():AddItem("Base.Orange");
		elseif secondChance == 4 then
			player:getInventory():AddItem("Hydrocraft.HCSeaberry");
		elseif secondChance == 5 then
			player:getInventory():AddItem("Hydrocraft.HCBlackcurrant");
		elseif secondChance == 6 then
			player:getInventory():AddItem("Hydrocraft.HCRedcurrant");
		elseif secondChance == 7 then
			player:getInventory():AddItem("Hydrocraft.HCCrampbarkberry");
		elseif secondChance == 8 then
			player:getInventory():AddItem("Hydrocraft.HCGooseberry");
		elseif secondChance == 9 then
			player:getInventory():AddItem("Hydrocraft.HCBleedingheart");			
		end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl9+floraLvl10 then
        secondChance = ZombRand(6);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.Corn");
        elseif secondChance == 1 then
            player:getInventory():AddItem("farming.Tomato");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCCrowberry");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCBlackthornberry");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCHawthornfruit");
        elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCTetterwort");
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCMazus");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(7);
        if secondChance == 0 then
            player:getInventory():AddItem("farming.Cabbage");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCWildcarrot");
		elseif secondChance == 2 then
            player:getInventory():AddItem("farming.Potato");
		elseif secondChance == 3 then
            player:getInventory():AddItem("farming.RedRadish");
		elseif secondChance == 4 then
            player:getInventory():AddItem("farming.HCCamellia");
		elseif secondChance == 5 then
            player:getInventory():AddItem("farming.HCMorningglory");
		elseif secondChance == 6 then
            player:getInventory():AddItem("farming.HCStrelitzia");			
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(6);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCLobstershroom");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCYellowmorelshroom");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCWitchshatshroom");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCColumbine");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCCinquefoils");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCChrysanthemum");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(10);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.MushroomGeneric3");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.MushroomGeneric5");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Base.Log");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCSunflower");		
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCVenusflytrap");
        elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCRhododendron");
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCCalily");
        elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCMagnolia");
        elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCCarnation");
        elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCBluedaisy");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(12)
        if secondChance == 0 then
            player:getInventory():AddItem("Base.MushroomGeneric7");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.MushroomGeneric6");
		elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCBlewitshroom");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCAnemome");	
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCDaffodil");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCTulip");
		elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCPansy");
		elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCDaisy");	
		elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCIris");
		elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCWolfsbane");	
		elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCMandrake");
		elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCBelladonna");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl4+floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(14);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.MushroomGeneric1");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.MushroomGeneric2");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Base.MushroomGeneric4");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Base.Rosehips");
		elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCValerian");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCRosebud");	
		elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCCamomile");	
		elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCLavender");
		elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCSpeedwell");	
		elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCDogwood");
		elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCChantrelle");
		elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCFlaxflower");
		elseif secondChance == 12 then
            player:getInventory():AddItem("Hydrocraft.HCCatnip");
		elseif secondChance == 13 then
            player:getInventory():AddItem("Hydrocraft.HCChicory");			
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl3+floraLvl4+floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(13);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCCandleberry");	
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCMulberry");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCMulberryleaf");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCHuckleberry");		
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCCranberry");
        elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCArrowwoodberry");	
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCRaspberry");
        elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCJuniperberry");
        elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCSumacberry");
        elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCBirchcatkin");
        elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCMilkweedroot");
        elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCSoapgrass");
        elseif secondChance == 12 then
            player:getInventory():AddItem("Hydrocraft.HCKvann");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 11);
    elseif chance <= floraLvl2+floraLvl3+floraLvl4+floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(17);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.BerryBlack");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.BerryBlue");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Base.BerryPoisonIvy");
        elseif secondChance == 3 then
            player:getInventory():AddItem("Base.BerryGeneric2");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Base.BerryGeneric5");
		elseif secondChance == 5 then
            player:getInventory():AddItem("Base.GrapeLeaves");
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCFircone");	
        elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCAcorn");
		elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCChestnut");	
        elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCHickorynuts");
        elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCReeds");
        elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCElderberry");	
        elseif secondChance == 12 then
            player:getInventory():AddItem("Hydrocraft.HCHolly");
        elseif secondChance == 13 then
            player:getInventory():AddItem("Hydrocraft.HCJutestems");
        elseif secondChance == 14 then
            player:getInventory():AddItem("Hydrocraft.HCClover");
        elseif secondChance == 15 then
            player:getInventory():AddItem("Hydrocraft.HCBeechnut");
        elseif secondChance == 16 then
            player:getInventory():AddItem("Hydrocraft.HCFlax");			
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl1+floraLvl2+floraLvl3+floraLvl4+floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(12);
        if secondChance == 0 then
            player:getInventory():AddItem("Hydrocraft.HCHickoryleaves");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Hydrocraft.HCOakleaves");	
        elseif secondChance == 2 then
            player:getInventory():AddItem("Hydrocraft.HCWillowbranch");	
        elseif secondChance == 3 then
            player:getInventory():AddItem("Hydrocraft.HCPinebough");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Hydrocraft.HCFirbough");	
        elseif secondChance == 5 then
            player:getInventory():AddItem("Hydrocraft.HCFern");
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCAlderbough");	
        elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCElmbough");	
        elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCSprucebough");	
        elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCYewbough");
        elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCFiddleheadfern");		
        elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCMapleleaf");					
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= floraLvl0+floraLvl1+floraLvl2+floraLvl3+floraLvl4+floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 then
        secondChance = ZombRand(14);
        if secondChance == 0 then
            player:getInventory():AddItem("Base.BerryGeneric1");
        elseif secondChance == 1 then
            player:getInventory():AddItem("Base.BerryGeneric3");
        elseif secondChance == 2 then
            player:getInventory():AddItem("Base.BerryGeneric4");
		elseif secondChance == 3 then
            player:getInventory():AddItem("Base.Violets");
        elseif secondChance == 4 then
            player:getInventory():AddItem("Base.TreeBranch");
        elseif secondChance == 5 then
            player:getInventory():AddItem("Base.Twigs");
        elseif secondChance == 6 then
            player:getInventory():AddItem("Hydrocraft.HCGrass");
        elseif secondChance == 7 then
            player:getInventory():AddItem("Hydrocraft.HCStraw");	
        elseif secondChance == 8 then
            player:getInventory():AddItem("Hydrocraft.HCBark");	
        elseif secondChance == 9 then
            player:getInventory():AddItem("Hydrocraft.HCBirchbark");
        elseif secondChance == 10 then
            player:getInventory():AddItem("Hydrocraft.HCWillowbark");
        elseif secondChance == 11 then
            player:getInventory():AddItem("Hydrocraft.HCThistle");		
        elseif secondChance == 12 then
            player:getInventory():AddItem("Hydrocraft.HCNettles");		
        elseif secondChance == 13 then
            player:getInventory():AddItem("Hydrocraft.HCClover");				
        end
		player:getXp():AddXP(Perks.PlantScavenging, 10);
    elseif chance <= nothing+floraLvl0+floraLvl1+floraLvl2+floraLvl3+floraLvl4+floraLvl5+floraLvl6+floraLvl7+floraLvl8+floraLvl9+floraLvl10 and nothing > 0 then
        player:Say("I found nothing!");
    end
end


