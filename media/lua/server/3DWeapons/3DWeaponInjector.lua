-- **********************************
-- author: francogp 
-- **********************************

require "Items/SuburbsDistributions"
require "Items/ItemPicker"
require "HCLoading"

FGP3DWeapons = {}

--Ensures exisance of graphics.
FGP3DWeapons.inject3Dmodels = function()

	if isHydrocraft3DWeaponLoaded then

		print ( "*** injecting 3D code into Hydrocraft... ");

		local newCode = {

			-- File: Boneworking.txt
			"Hydrocraft.HCBoneshiv", "HCStake",

			-- File: Cleaning.txt
			"Hydrocraft.HCBroom", "HCBroom",
			"Hydrocraft.HCPushbroom", "HCPushbroom",

			-- File: Farming.txt
			"Hydrocraft.HCRake", "HCRake",
			"Hydrocraft.HCHedgetrimmer", "HCHedgetrimmer",
			"Hydrocraft.HCHedgecutter", "Knife",

			-- File: Kitchen.txt
			"Hydrocraft.HCSpork", "Knife",
			"Hydrocraft.HCSteakknife", "Knife",
			"Hydrocraft.HCBreadknife", "Knife",
			"Hydrocraft.HCWoodenspoon", "Knife",
			"Hydrocraft.HCWoodenfork", "Knife",
			"Hydrocraft.HCMeatcleaver", "HCMeatcleaver",

			-- File: Medical.txt
			"Hydrocraft.HCScalpel", "Knife",
			"Hydrocraft.HCCrutch", "HCCrutch",
			"Hydrocraft.HCCrutchaluminium", "HCCrutchaluminium",
			"Hydrocraft.HCCrutchmakeshift", "Shovel",

			-- File: Recycling.txt
			"Hydrocraft.HCSteelpipe", "HCSteelpipe",

			-- File: Tools.txt
			"Hydrocraft.HCNailgun", "HCNailgun",
			"Hydrocraft.HCWrench", "HCWrench",
			"Hydrocraft.HCMonkeywrench", "HCMonkeywrench",
			"Hydrocraft.HCCane", "HCCane",
			"Hydrocraft.HCPickaxe", "HCPickaxe",

			-- File: Toys.txt
			"Hydrocraft.HCTennisracket", "FryingPan",
			"Hydrocraft.HCAluminiumbat", "HCAluminiumbat",
			"Hydrocraft.HCWifflebat", "HCWifflebat",

			-- File: Weapons Axes.txt
			"Hydrocraft.HCLumberaxe", "HCLumberaxe",
			"Hydrocraft.HCSawbladeaxe", "HCSawbladeaxe",			
			"Hydrocraft.HCMakeshiftaxe", "Fireaxe",
			"Hydrocraft.HCMakeshiftaxeworn", "Fireaxe",
			"Hydrocraft.HCMakeshiftaxeblunt", "Fireaxe",
			"Hydrocraft.HCSurvivalaxe", "HCSurvivalaxe",
			"Hydrocraft.HCHatchetsteel", "HCHatchetsteel",
			"Hydrocraft.HCHatchetiron", "HCHatchetiron",
			"Hydrocraft.HCHatchetbronze", "HCHatchetbronze",
			"Hydrocraft.HCHatchetcopper", "HCHatchetcopper",
			"Hydrocraft.HCBattleaxesteel", "HCBattleaxesteel",
			"Hydrocraft.HCBattleaxeiron", "HCBattleaxeiron",
			"Hydrocraft.HCBattleaxebronze", "HCBattleaxebronze",
			"Hydrocraft.HCBattleaxecopper", "HCBattleaxecopper",

			-- File: Weapons Bats.txt
			"Hydrocraft.HCBaton", "HCBaton",
			"Hydrocraft.HCHomemadebatcrude", "Baseballbat",
			"Hydrocraft.HCHomemadebatcrudenails", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadebatcrudebarbedwire", "HCBaseballbatbarbedwire",
			"Hydrocraft.HCHomemadebatcrudescrews", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadebatcrudetentpegs", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadebatcrudewrench", "HCBaseballbatwrench",
			"Hydrocraft.HCHomemadebatcrudecutter", "HCBaseballbatcutter",
			"Hydrocraft.HCHomemadebatcrudetrimmer", "HCBaseballbattrimmer",
			"Hydrocraft.HCHomemadebat", "Baseballbat",
			"Hydrocraft.HCHomemadebatnails", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadebatbarbedwire", "HCBaseballbatbarbedwire",
			"Hydrocraft.HCHomemadebatscrews", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadebattentpegs", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadebatwrench", "HCBaseballbatwrench",
			"Hydrocraft.HCHomemadebatcutter", "HCBaseballbatcutter",
			"Hydrocraft.HCHomemadebattrimmer", "HCBaseballbattrimmer",
			"Hydrocraft.HCBaseballbatbarbedwire", "HCBaseballbatbarbedwire",
			"Hydrocraft.HCBaseballbatscrews", "BaseballbatSpiked",
			"Hydrocraft.HCBaseballbattentpegs", "BaseballbatSpiked",
			"Hydrocraft.HCBaseballbatwrench", "HCBaseballbatwrench",
			"Hydrocraft.HCBaseballbatcutter", "HCBaseballbatcutter",
			"Hydrocraft.HCBaseballbattrimmer", "HCBaseballbattrimmer",
			"Hydrocraft.HCHomemadeclubcrude", "Baseballbat",
			"Hydrocraft.HCHomemadeclubcrudenails", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadeclubcrudebarbedwire", "HCBaseballbatbarbedwire",
			"Hydrocraft.HCHomemadeclubcrudescrews", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadeclubcrudetentpegs", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadeclubcrudewrench", "HCBaseballbatwrench",
			"Hydrocraft.HCHomemadeclubcrudecutter", "HCBaseballbatcutter",
			"Hydrocraft.HCHomemadeclubcrudetrimmer", "HCBaseballbattrimmer",
			"Hydrocraft.HCHomemadeclub", "Baseballbat",
			"Hydrocraft.HCHomemadeclubnails", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadeclubbarbedwire", "HCBaseballbatbarbedwire",
			"Hydrocraft.HCHomemadeclubscrews", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadeclubtentpegs", "BaseballbatSpiked",
			"Hydrocraft.HCHomemadeclubwrench", "HCBaseballbatwrench",
			"Hydrocraft.HCHomemadeclubcutter", "HCBaseballbatcutter",
			"Hydrocraft.HCHomemadeclubtrimmer", "HCBaseballbattrimmer",
			"Hydrocraft.HCMasterclub", "Baseballbat",
			"Hydrocraft.HCMasterclubnails", "BaseballbatSpiked",
			"Hydrocraft.HCMasterclubbarbedwire", "HCBaseballbatbarbedwire",
			"Hydrocraft.HCMasterclubscrews", "BaseballbatSpiked",
			"Hydrocraft.HCMasterclubtentpegs", "BaseballbatSpiked",
			"Hydrocraft.HCMasterclubwrench", "HCBaseballbatwrench",
			"Hydrocraft.HCMasterclubcutter", "HCBaseballbatcutter",
			"Hydrocraft.HCMasterclubtrimmer", "HCBaseballbattrimmer",

			-- File: Weapons Blades.txt
			"Hydrocraft.HCMachete", "HCMachete",
			"Hydrocraft.HCCombatknife", "HCCombatknife",
			"Hydrocraft.HCKatana", "HCKatana",
			"Hydrocraft.HCKnifesteel", "HCKnifesteel",
			"Hydrocraft.HCKnifeiron", "HCKnifeiron",
			"Hydrocraft.HCKnifebronze", "HCKnifebronze",
			"Hydrocraft.HCKnifecopper", "HCKnifecopper",
			"Hydrocraft.HCKnifestone", "Knife",
			"Hydrocraft.HCDaggersteel", "HCDaggersteel",
			"Hydrocraft.HCDaggeriron", "HCDaggeriron",
			"Hydrocraft.HCDaggerbronze", "HCDaggerbronze",
			"Hydrocraft.HCDaggercopper", "HCDaggercopper",
			"Hydrocraft.HCShortswordsteel", "HCShortswordsteel",
			"Hydrocraft.HCShortswordiron", "HCShortswordiron",
			"Hydrocraft.HCShortswordbronze", "HCShortswordbronze",
			"Hydrocraft.HCShortswordcopper", "HCShortswordcopper",
			"Hydrocraft.HCLongswordsteel", "HCLongswordsteel",
			"Hydrocraft.HCLongswordiron", "HCLongswordiron",
			"Hydrocraft.HCLongswordbronze", "HCLongswordbronze",
			"Hydrocraft.HCLongswordcopper", "HCLongswordcopper",
			"Hydrocraft.HCBastardswordsteel", "HCBastardswordsteel",
			"Hydrocraft.HCBastardswordiron", "HCBastardswordiron",
			"Hydrocraft.HCBastardswordbronze", "HCBastardswordbronze",
			"Hydrocraft.HCBastardswordcopper", "HCBastardswordcopper",
			"Hydrocraft.HCGreatswordsteel", "HCGreatswordsteel",
			"Hydrocraft.HCGreatswordiron", "HCGreatswordiron",
			"Hydrocraft.HCGreatswordbronze", "HCGreatswordbronze",
			"Hydrocraft.HCGreatswordcopper", "HCGreatswordcopper",
			"Hydrocraft.HCSicklesteel", "HCSicklesteel",
			"Hydrocraft.HCSickleiron", "HCSickleiron",
			"Hydrocraft.HCSicklebronze", "HCSicklebronze",
			"Hydrocraft.HCSicklecopper", "HCSicklecopper",

			-- File: Weapons Hammers.txt
			"Hydrocraft.HCSmithyhammersteel", "HCSmithyhammersteel",
			"Hydrocraft.HCSmithyhammeriron", "HCSmithyhammeriron",
			"Hydrocraft.HCSmithyhammerbronze", "HCSmithyhammerbronze",
			"Hydrocraft.HCSmithyhammercopper", "HCSmithyhammercopper",
			"Hydrocraft.HCWarhammersteel", "HCWarhammersteel",
			"Hydrocraft.HCWarhammeriron", "HCWarhammeriron",
			"Hydrocraft.HCWarhammerbronze", "HCWarhammerbronze",
			"Hydrocraft.HCWarhammercopper", "HCWarhammercopper",
			"Hydrocraft.HCSpikedmacesteel", "HCSpikedmacesteel",
			"Hydrocraft.HCSpikedmaceiron", "HCSpikedmaceiron",
			"Hydrocraft.HCSpikedmacebronze", "HCSpikedmacebronze",
			"Hydrocraft.HCSpikedmacecopper", "HCSpikedmacecopper",
			"Hydrocraft.HCSpikedflailsteel", "HCSpikedflailsteel",
			"Hydrocraft.HCSpikedflailiron", "HCSpikedflailiron",
			"Hydrocraft.HCSpikedflailbronze", "HCSpikedflailbronze",
			"Hydrocraft.HCSpikedflailcopper", "HCSpikedflailcopper",
			"Hydrocraft.HCFlailstone", "HCFlailstone",

			-- File: Weapons Improvised.txt
			"Hydrocraft.HCScalpelimprovised", "Knife",
			"Hydrocraft.HCRazorgloves", "Knife",
			"Hydrocraft.HCToothbrushshiv", "HCStake",

			-- File: Weapons Polearms.txt
			"Hydrocraft.HCHalberdsteel", "HCHalberdsteel",
			"Hydrocraft.HCHalberdiron", "HCHalberdiron",
			"Hydrocraft.HCHalberdbronze", "HCHalberdbronze",
			"Hydrocraft.HCHalberdcopper", "HCHalberdcopper",
			"Hydrocraft.HCSpearsteel", "HCSpearsteel",
			"Hydrocraft.HCSpeariron", "HCSpeariron",
			"Hydrocraft.HCSpearbronze", "HCSpearbronze",
			"Hydrocraft.HCSpearcopper", "HCSpearcopper",
			"Hydrocraft.HCSpearobsidian", "HCSpearobsidian",
			"Hydrocraft.HCSpearstone", "HCSpearstone",
			"Hydrocraft.HCQuarterstaff", "HCQuarterstaff",
			"Hydrocraft.HCTridentsteel", "HCTridentsteel",
			"Hydrocraft.HCTridentiron", "HCTridentiron",
			"Hydrocraft.HCTridentbronze", "HCTridentbronze",
			"Hydrocraft.HCTridentcopper", "HCTridentcopper",

			-- File: Weapons Ranged.txt
			"Hydrocraft.HCCrossbow", "HCCrossbow",
			"Hydrocraft.HCLongbow", "HCLongbow",
			"Hydrocraft.HCPotatocannon", "HCPotatocannon",
			"Hydrocraft.HCSlingshot", "HCSlingshot",
			"Hydrocraft.HCSling", "Slingshot",

			-- File: Weapons Stakes.txt
			"Hydrocraft.HCStakecrude", "HCStake",
			"Hydrocraft.HCStake", "HCStake",
			"Hydrocraft.HCStakehard", "HCStake",
		}
		
		local itemname = nil;
		for i, k in ipairs(newCode) do
			if not alt then -- first we take the name of the item
				itemname = k;
				--print (itemname);
			else -- next step is the random spawn part
				local newValue = k;
				local item = ScriptManager.instance:getItem(itemname);
				if item then 
					item:setWeaponSprite(newValue);
				else
					print("WARNING: 3dWeaponInjector can't find item " .. itemname);
				end
			end
			alt = not alt;
		end
		print ( "*** injecting 3D code into Hydrocraft: COMPLETED");
	else
		print ( "*** ignoring 3D code injection into Hydrocraft, ModelLoader found.");
	end

end

Events.OnPreMapLoad.Add(FGP3DWeapons.inject3Dmodels);