--Hydrocraft Fishing Additions.

 require "Fishing/fishing_properties"

function HCAddLure(lure)
	for x=1, #Fishing.fishes do
		table.insert(Fishing.fishes[x].lure, lure);
	end
	print("Hydrocraft lure" .. lure .. " loaded.");
end

local HCWoodFish = {};
HCWoodFish.item = "HCLurewoodfish";
HCWoodFish.plastic = true;
HCWoodFish.chanceOfBreak = 1;
Fishing.lure["HCWoodfish"] = HCWoodFish;
HCAddLure("HCLurewoodfish");

local HCFeatherFly = {};
HCFeatherFly.item = "HCLurefeatherfly";
HCFeatherFly.plastic = true;
HCFeatherFly.chanceOfBreak = 1;
Fishing.lure["HCFeatherFly"] = HCFeatherFly;
HCAddLure("HCLurefeatherfly");

local HCPinecone = {};
HCPinecone.item = "HCLurepinecone";
HCPinecone.plastic = true;
HCPinecone.chanceOfBreak = 1;
Fishing.lure["HCPinecone"] = HCPinecone;
HCAddLure("HCLurepinecone");

local HCBirchbark = {};
HCBirchbark.item = "HCLurebirchbark";
HCBirchbark.plastic = true;
HCBirchbark.chanceOfBreak = 1;
Fishing.lure["HCBirchbark"] = HCBirchbark;
HCAddLure("HCLurebirchbark");

local HCStick = {};
HCStick.item = "HCLurestick";
HCStick.plastic = true;
HCStick.chanceOfBreak = 1;
Fishing.lure["HCStick"] = HCStick;
HCAddLure("HCLurestick");

local HCGarland = {};
HCGarland.item = "HCLuregarland";
HCGarland.plastic = true;
HCGarland.chanceOfBreak = 1;
Fishing.lure["HCGarland"] = HCGarland;
HCAddLure("HCLuregarland");

local HCIntestine = {};
HCIntestine.item = "HCIntestines";
HCIntestine.plastic = false;
HCIntestine.chanceOfBreak = 15;
Fishing.lure["HCIntestine"] = HCIntestine;
HCAddLure("HCIntestines");

local HCLeech = {};
HCLeech.item = "HCLeech";
HCLeech.plastic = false;
HCLeech.chanceOfBreak = 15;
Fishing.lure["HCLeech"] = HCLeech;
HCAddLure("HCLeech");

local HCLeechbloated = {};
HCLeechbloated.item = "HCLeechbloated";
HCLeechbloated.plastic = false;
HCLeechbloated.chanceOfBreak = 15;
Fishing.lure["HCLeechbloated"] = HCLeechbloated;
HCAddLure("HCLeechbloated");

local HCBeetle = {};
HCBeetle.item = "HCBeetle";
HCBeetle.plastic = false;
HCBeetle.chanceOfBreak = 15;
Fishing.lure["HCBeetle"] = HCBeetle;
HCAddLure("HCBeetle");

local HCBeetlegrub = {};
HCBeetlegrub.item = "HCBeetlegrub";
HCBeetlegrub.plastic = false;
HCBeetlegrub.chanceOfBreak = 15;
Fishing.lure["HCBeetlegrub"] = HCBeetlegrub;
HCAddLure("HCBeetlegrub");

local HCPillbug = {};
HCPillbug.item = "HCPillbug";
HCPillbug.plastic = false;
HCPillbug.chanceOfBreak = 15;
Fishing.lure["HCPillbug"] = HCPillbug;
HCAddLure("HCPillbug");

local HCCaterpillar = {};
HCCaterpillar.item = "HCCaterpillar";
HCCaterpillar.plastic = false;
HCCaterpillar.chanceOfBreak = 15;
Fishing.lure["HCCaterpillar"] = HCCaterpillar;
HCAddLure("HCCaterpillar");

local HCMaggot = {};
HCMaggot.item = "HCMaggot";
HCMaggot.plastic = false;
HCMaggot.chanceOfBreak = 15;
Fishing.lure["HCMaggot"] = HCMaggot;
HCAddLure("HCMaggot");

local HCHousefly = {};
HCHousefly.item = "HCHousefly";
HCHousefly.plastic = false;
HCHousefly.chanceOfBreak = 15;
Fishing.lure["HCHousefly"] = HCHousefly;
HCAddLure("HCHousefly");

local HCCicada = {};
HCCicada.item = "HCCicada";
HCCicada.plastic = false;
HCCicada.chanceOfBreak = 15;
Fishing.lure["HCCicada"] = HCCicada;
HCAddLure("HCCicada");

local HCMoleCricket = {};
HCMoleCricket.item = "HCMolecricket";
HCMoleCricket.plastic = false;
HCMoleCricket.chanceOfBreak = 15;
Fishing.lure["HCMoleCricket"] = HCMoleCricket;
HCAddLure("HCMolecricket");

local HCFireFly = {};
HCFireFly.item = "HCFirefly";
HCFireFly.plastic = false;
HCFireFly.chanceOfBreak = 15;
Fishing.lure["HCFireFly"] = HCFireFly;
HCAddLure("HCFirefly");

local HCSilkWorm = {};
HCSilkWorm.item = "HCSilkworm";
HCSilkWorm.plastic = false;
HCSilkWorm.chanceOfBreak = 15;
Fishing.lure["HCSilkWorm"] = HCSilkWorm;
HCAddLure("HCSilkworm");

local HCSilkMothMale = {};
HCSilkMothMale.item = "HCSilkmothmale";
HCSilkMothMale.plastic = false;
HCSilkMothMale.chanceOfBreak = 15;
Fishing.lure["HCSilkMothMale"] = HCSilkMothMale;
HCAddLure("HCSilkmothmale");

local HCSilkMothFemale = {};
HCSilkMothFemale.item = "HCSilkmothfemale";
HCSilkMothFemale.plastic = false;
HCSilkMothFemale.chanceOfBreak = 15;
Fishing.lure["HCSilkMothFemale"] = HCSilkMothFemale;
HCAddLure("HCSilkmothfemale");

