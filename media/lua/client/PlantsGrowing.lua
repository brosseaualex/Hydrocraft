--Created By AiweLeliaThamm

function recipe_NDPlantsHarvest(items, result, player)
	local plant=nil;
	
    for i=0, items:size()-1 do
        if string.find(items:get(i):getType(),"HCPotted") then
			plant=items:get(i)
		end
    end
	
	local plantName = plant:getType();
	
	if plant:getType()=="HCPottedappletreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Apple");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCAppleseeds");
		end
	elseif plant:getType()=="HCPottedbananatreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Banana");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBananaseeds");
		end
	elseif plant:getType()=="HCPottedKiwiready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCKiwi");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCKiwiseeds");
		end
	elseif plant:getType()=="HCPottedPlumready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCPlum");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPlumseeds");
		end
	elseif plant:getType()=="HCPottedPersimmonready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCPersimmon");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPersimmonseeds");
		end
	elseif plant:getType()=="HCPottedDateready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCDates");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCDateseeds");
		end
	elseif plant:getType()=="HCPottedFigready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCFigs");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCFigseeds");
		end
	elseif plant:getType()=="HCPottedblackberrybushready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.BerryBlack");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBlackberryseeds");
		end
	elseif plant:getType()=="HCPottedblueberrybushready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.BerryBlue");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBlueberryseeds");
		end
	elseif plant:getType()=="HCPottedgrapevineready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Grapes");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCGrapeseeds");
		end
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Base.GrapeLeaves");
		end
	elseif plant:getType()=="HCPottedBeansready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCPeapod");
		end
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCBeans");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBeanseeds");
		end
	elseif plant:getType()=="HCPottedGrapesgreenvineready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCGrapesgreen");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCGrapesgreenseeds");
		end
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Base.GrapeLeaves");
		end
	elseif plant:getType()=="HCPottedlemontreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Lemon");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCLemonseeds");
		end
	elseif plant:getType()=="HCPottedlimetreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCLime");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCLimeseeds");
		end
	elseif plant:getType()=="HCPottedorangetreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Orange");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCOrangeseeds");
		end
	elseif plant:getType()=="HCPottedpeachtreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Peach");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPeachseeds");
		end
	elseif plant:getType()=="HCPottedstrawberrybushready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("farming.Strewberrie");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.StrewberrieSeed");
		end
	elseif plant:getType()=="HCPottedwatermelonready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Base.Watermelon");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCWatermelonseeds");
		end
	elseif plant:getType()=="HCPottedbellpepperready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.BellPepper");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBellpepperredseeds");
		end
	elseif plant:getType()=="HCPottedBellpeppergreenready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCBellpeppergreen");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBellpeppergreenseeds");
		end
	elseif plant:getType()=="HCPottedBellpepperyellowready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCBellpepperyellow");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBellpepperyellowseeds");
		end
	elseif plant:getType()=="HCPottedbroccoliready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("farming.Broccoli");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.BroccoliSeed");
		end
	elseif plant:getType()=="HCPottedcabbageready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("farming.Cabbage");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.CabbageSeed");
		end
	elseif plant:getType()=="HCPottedCabbageredready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCabbagered");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCabbageredseeds");
		end
	elseif plant:getType()=="HCPottedCabbagewhiteready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCabbagewhite");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCabbagewhiteseeds");
		end
	elseif plant:getType()=="HCPottedSquashsummerready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCSquashsummer");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCSquashsummerseeds");
		end
	elseif plant:getType()=="HCPottedCauliflowerready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCauliflower");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCauliflowerseeds");
		end
	elseif plant:getType()=="HCPottedcarrotsready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("farming.Carrots");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.CarrotSeed");
		end
	elseif plant:getType()=="HCPottedcornstalkready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Corn");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCornseeds");
		end
	elseif plant:getType()=="HCPottedeggplantready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Eggplant");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCEggplantseeds");
		end
	elseif plant:getType()=="HCPottedleekready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Leek");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCLeekseeds");
		end
	elseif plant:getType()=="HCPottedlettuceready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Lettuce");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCLettuceseeds");
		end
	elseif plant:getType()=="HCPottedonionready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Onion");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCOnionseeds");
		end
	elseif plant:getType()=="HCPottedpeaplantready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCPeapod");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPeaseeds");
		end
	elseif plant:getType()=="HCPottedpotatoready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("farming.Potato");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.PotatoSeed");
		end
	elseif plant:getType()=="HCPottedpumpkinready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkin");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinseeds");
		end
	elseif plant:getType()=="HCPottedradishready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("farming.RedRadish");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.RedRadishSeed");
		end
	elseif plant:getType()=="HCPottedtomatoready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("farming.Tomato");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("farming.TomatoSeed");
		end
	elseif plant:getType()=="HCPottedpeanutplantready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Peanuts");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPeanutseeds");
		end
	elseif plant:getType()=="HCPottedavocadotreeready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Base.Avocado");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCAvacadoseeds");
		end
	elseif plant:getType()=="HCPottedcherrytreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Cherry");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCherryseeds");
		end
	elseif plant:getType()=="HCPottedpeartreeready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCPear");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPearseeds");
		end
	elseif plant:getType()=="HCPottedTomatocherryready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCTomatocherry");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCTomatocherryseeds");
		end
	elseif plant:getType()=="HCPottedpineappleready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Base.Pineapple");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPineappleseeds");
		end
	elseif plant:getType()=="HCPottedzucchiniready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Base.Zucchini");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCZucchiniseeds");
		end
	elseif plant:getType()=="HCPottedteaready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCTeafresh");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCTeaseeds");
		end
	elseif plant:getType()=="HCPottedhempready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCPlantfibers");
		end
		for i=0, ZombRand(4) do
			player:getInventory():AddItem("Hydrocraft.HCHempbudfresh");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCHempseeds");
		end
	elseif plant:getType()=="HCPottedtobaccoready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCTobaccoleaffresh");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCTobaccoseeds");
		end
	elseif plant:getType()=="HCPottedchinesecabbageready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCChinesecabbage");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCChinesecabbageseeds");
		end
	elseif plant:getType()=="HCPottedcucumberready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCucumber");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCucumberseeds");
		end
	elseif plant:getType()=="HCPottedgingerready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCGinger");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCGingerseeds");
		end
	elseif plant:getType()=="HCPottedgarlicready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCGarlic");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCGarlicseeds");
		end
	elseif plant:getType()=="HCPottedoniongreenready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCOniongreen");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCOniongreenseeds");
		end
	elseif plant:getType()=="HCPottedsweetpotatoready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCSweetpotato");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPotatosweetseeds");
		end
	elseif plant:getType()=="HCPottedPotatogoldenready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCPotatogolden");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPotatogoldenseeds");
		end
	elseif plant:getType()=="HCPottedPotatoredready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCPotatored");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPotatoredseeds");
		end
	elseif plant:getType()=="HCPottedjuteready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCJutestems");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCJuteseeds");
		end
	elseif plant:getType()=="HCPottedpumpkingreenready"  then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkingreen");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkingreenseeds");
		end
	elseif plant:getType()=="HCPottedpumpkinwhiteready"  then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinwhite");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinwhiteseeds");
		end
	elseif plant:getType()=="HCPottedpumpkinlargeready"  then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinlarge");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinlargeseeds");
		end
	elseif plant:getType()=="HCPottedpumpkinbuskinready"  then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinbuskin");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPumpkinbuskinseeds");
		end
	elseif plant:getType()=="HCPottedcornwhiteready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCornwhite");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCornwhiteseeds");
		end
	elseif plant:getType()=="HCPottedcornredready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCornred");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCornredseeds");
		end
	elseif plant:getType()=="HCPottedcornblueready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCornblue");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCornblueseeds");
		end
	elseif plant:getType()=="HCPottedchilipepperplantready"  then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCChilipepper");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCChilipepperseeds");
		end
	elseif plant:getType()=="HCPottedpoppy" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCPoppyflower");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPoppyseeds");
		end
	elseif plant:getType()=="HCPottedpoppyready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCPoppycapsule");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPoppyseeds");
		end
	elseif plant:getType()=="HCPottedcactusready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCactusfruit");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCactusseeds");
		end
	elseif plant:getType()=="HCPottedagaveblueready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCAgavebluecut");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCAgaveblueseeds");
		end
	elseif plant:getType()=="HCPottedpricklypearcactusready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPricklypearfruit");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCPricklypearseeds");
		end
	elseif plant:getType()=="HCPottedchiligreenready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCChiligreen");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCChiligreenseeds");
		end
	elseif plant:getType()=="HCPottedJalapenoready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCJalapeno");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCJalapenoseeds");
		end
	elseif plant:getType()=="HCPottedtomatilloplantready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCTomatillo");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCTomatilloseeds");
		end
	elseif plant:getType()=="HCPottedcottonplantready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCottonraw");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCottonseeds");
		end
	elseif plant:getType()=="HCPottedriceready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCRiceraw");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCRiceseeds");
		end
	elseif plant:getType()=="HCPottedshiitakeready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCShiitake");
		end
	elseif plant:getType()=="HCPottedportobelloready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCPortobello");
		end
	elseif plant:getType()=="HCPottedcolewortready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCColewort");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCColewortseeds");
		end
	elseif plant:getType()=="HCPottedrubbertreeready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCRubbertreeseeds");
		end
	elseif plant:getType()=="HCPottedbasilready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBasilleaf");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBasilseeds");
		end
	elseif plant:getType()=="HCPottedalfalfaready" then
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCAlfalfa");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCAlfalfaseeds");
		end
	elseif plant:getType()=="HCPottedbambooready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCBamboo");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCBambooseeds");
		end
	elseif plant:getType()=="HCPottedasparagusready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCAsparagus");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCAsparagusseeds");
		end
	elseif plant:getType()=="HCPottedartichokesready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCArtichoke");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCArtichokesseeds");
		end
	elseif plant:getType()=="HCPottedbeetsready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCBeet");
		end
	elseif plant:getType()=="HCPottedBeetsugarready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCBeetsugar");
		end
	elseif plant:getType()=="HCPottedmulberryready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCMulberry");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCMulberryseeds");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCMulberryleaf");
		end
	elseif plant:getType()=="HCPottedapricotready" then
		for i=0, ZombRand(10) do
			player:getInventory():AddItem("Hydrocraft.HCApricot");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCApricotseeds");
		end
	elseif plant:getType()=="HCPottedceleryready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCCelery");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCCeleryseeds");
		end
	elseif plant:getType()=="HCPottedspinachready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCSpinach");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCSpinachseeds");
		end
	elseif plant:getType()=="HCPottedwheatready" then
		for i=0, ZombRand(5) do
			player:getInventory():AddItem("Hydrocraft.HCWheat");
		end
		for i=0, ZombRand(3) do
			player:getInventory():AddItem("Hydrocraft.HCStraw");
		end
	end
end