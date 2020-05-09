--Box Loot

--Art
function recipe_hclootart(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Base.Erase", "Base.SheetPaper", "Base.Pen", "Base.Pencil", "Base.Crayons", "Base.Paintbrush", "Hydrocraft.HCStyrofoamball", "Hydrocraft.HCStyrofoamblock", "Hydrocraft.HCProtractor", "Hydrocraft.HCTriangle", "Hydrocraft.HCRuler", "Hydrocraft.HCPenbox", "Hydrocraft.HCPencilsharpener", "Hydrocraft.HCPencilbox", "Hydrocraft.HCChalkeraser", "Hydrocraft.HCChalkbox", "Hydrocraft.HCCrayonbox", "Hydrocraft.HCJarpaintblack", "Hydrocraft.HCJarpaintblue", "Hydrocraft.HCJarpaintred", "Hydrocraft.HCJarpaintyellow", "Hydrocraft.HCJarpaintwhite", "Hydrocraft.HCTurpentine", "Hydrocraft.HCEasel", "Hydrocraft.HCCanvas", "Hydrocraft.HCPainterpalette", "Hydrocraft.HCPaintbrush"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Canned Food
function recipe_hccannedfoodbox(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Hydrocraft.HCCannedapple", "Base.TinnedBeans", "Base.CannedBolognese", "Base.CannedCarrots2", "Base.CannedChili", "Base.CannedCorn", "Base.CannedCornedBeef", "Hydrocraft.HCCannedcranberries", "Hydrocraft.HCCannedcreamofchicken", "Hydrocraft.HCCannedgreenbeans", "Base.CannedMushroomSoup", "Hydrocraft.HCCannedshrooms", "Hydrocraft.HCCannedpeach", "Hydrocraft.HCCannedpear", "Base.CannedPeas", "Hydrocraft.HCCannedpineapple", "Base.CannedPotato2", "Hydrocraft.HCCannedpumpkin", "Hydrocraft.HCCannedrefriedbeans", "Base.CannedSardines", "Base.TinnedSoup", "Hydrocraft.HCCannedsoupclassic", "Hydrocraft.HCCannedspam", "Base.CannedTomato2", "Hydrocraft.HCCanbangedup", "Hydrocraft.HCCannedcheesesauce", "Hydrocraft.HCCannedchickenbreast", "Hydrocraft.HCCannedfruitcocktail", "Hydrocraft.HCCannedgovermentbeef", "Hydrocraft.HCCannedgovermentbread", "Hydrocraft.HCCannedgovermentchicken", "Hydrocraft.HCCannedgovermentpork", "Hydrocraft.HCCannedmacncheese", "Hydrocraft.HCCannedpiefillingapple", "Hydrocraft.HCCannedpiefillingblueberry", "Hydrocraft.HCCannedpiefillingcherry", "Hydrocraft.HCCannedravioli", "Hydrocraft.HCCannedspaghettirings"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Electronic
function recipe_hclootelectronic(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Base.Battery", "Base.ElectronicsScrap", "Base.Screwdriver", "Base.ElectricWire", "Base.Disc", "Base.Remote","Base.Headphones", "Base.Earbuds", "Base.CDplayer", "Base.VideoGame", "Base.CordlessPhone", "Base.LightBulb", "Base.ElectronicsMag1", "Base.ElectronicsMag2", "Base.ElectronicsMag3", "Base.ElectronicsMag4", "Base.Speaker", "Hydrocraft.HCMagazineelectronics03", "Hydrocraft.HCMagazineelectronics02", "Hydrocraft.HCMagazineelectronics01", "Hydrocraft.HCCDcasefull", "Hydrocraft.HCDVDPlayer", "Hydrocraft.HCDVDCase", "Hydrocraft.HCDVD", "Hydrocraft.HCLedblue", "Hydrocraft.HCLedyellow", "Hydrocraft.HCLedgreen", "Hydrocraft.HCLedred", "Hydrocraft.HCSwitch", "Hydrocraft.HCDisplay", "Hydrocraft.HCTransistor", "Hydrocraft.HCTerminalstrip", "Hydrocraft.HCResistorbox", "Hydrocraft.HCHeatelement", "Hydrocraft.HCGlowlamp", "Hydrocraft.HCFuse", "Hydrocraft.HCElectromotorsmall", "Hydrocraft.HCElectromotor", "Hydrocraft.HCDiode", "Hydrocraft.HCCoppercablestriped", "Hydrocraft.HCCoppercablered", "Hydrocraft.HCColoredwire", "Hydrocraft.HCElectronicparts04", "Hydrocraft.HCElectronicparts03", "Hydrocraft.HCElectronicparts02", "Hydrocraft.HCElectronicparts01", "Hydrocraft.HCElectronicpartsbroken", "Hydrocraft.HCCircuitboarduseless", "Hydrocraft.HCCabletangle", "Hydrocraft.HCSoldergun", "Hydrocraft.HCSolder", "Hydrocraft.HCCircutchip", "Hydrocraft.HCComputerfan", "Hydrocraft.HCMousepad", "Hydrocraft.HCComputermouse", "Hydrocraft.HCCablecopper", "Hydrocraft.HCComputerkeyboard", "Hydrocraft.HCComputer", "Hydrocraft.HCComputermonitor", "Hydrocraft.HCScaner", "Hydrocraft.HCRouter", "Hydrocraft.HCJoystick", "Hydrocraft.HCPrinter", "Hydrocraft.HCFaxmachine", "Hydrocraft.HCPowercord", "Hydrocraft.HCElectonicscale", "Hydrocraft.HCBattery9volt", "Hydrocraft.HCBatteryhuge", "Hydrocraft.HCBatterylarge", "Hydrocraft.HCBatterymedium", "Hydrocraft.HCBatterysmall", "Hydrocraft.HCCPU", "Hydrocraft.HCElectrictape", "Hydrocraft.HCComputerPSU", "Hydrocraft.HCCalculator"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Garden
function recipe_hclootgarden(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"farming.HandShovel", "farming.Shovel", "farming.WateredCan", "farming.GardeningSprayEmpty", "Base.Fertilizer", "Hydrocraft.HCKAS", "Hydrocraft.HCBugspraycan", "Hydrocraft.HCBugsprayer", "Hydrocraft.HCLawnmower", "Hydrocraft.HCLawnmower", "Hydrocraft.HCGardengnome", "Hydrocraft.HCWindchimes", "Hydrocraft.HCWeedwacker", "Hydrocraft.HCRake", "Hydrocraft.HCHedgetrimmer", "Hydrocraft.HCHedgecutter", "Hydrocraft.HCPruningsheers", "Hydrocraft.HCMysteryseedspacket", "Hydrocraft.TrellisKit", "Hydrocraft.HCHandcultivator", "Hydrocraft.HCPostholedigger", "Hydrocraft.HCLeafrake", "Hydrocraft.HCLooper", "Hydrocraft.HCGardenhose"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Holiday
function recipe_hclootholiday(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Hydrocraft.HCCookiecutter", "Hydrocraft.HCPumpkinknife", "Hydrocraft.HCWitchhat", "Hydrocraft.HCCandybucket", "Hydrocraft.HCXmasgift", "Hydrocraft.HCXmaslights", "Hydrocraft.HCGarland", "Hydrocraft.HCwreath", "Hydrocraft.HCSnowglobe", "Hydrocraft.HCStocking", "Hydrocraft.HCStargold", "Hydrocraft.HCOrnamentyellow", "Hydrocraft.HCOrnamentsilver", "Hydrocraft.HCOrnamentred", "Hydrocraft.HCOrnamentpurple", "Hydrocraft.HCOrnamentgreen", "Hydrocraft.HCOrnamentblue", "Hydrocraft.HCSantahat", "Hydrocraft.HCMexicanponcho", "Hydrocraft.HCSombrero", "Hydrocraft.HCPinata"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Lab
function recipe_hclootlab(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Hydrocraft.HCTeslamachine", "Hydrocraft.HCPlasmaglobe", "Hydrocraft.HCGasmask", "Hydrocraft.HCHazmat", "Hydrocraft.HCSafetyglasses","Hydrocraft.HCLatexgloves", "Hydrocraft.HCMicroscope","Hydrocraft.HCWashbottle",  "Hydrocraft.HCGlassburette", "Hydrocraft.HCGlasspipeelbow", "Hydrocraft.HCGlasspipe", "Hydrocraft.HCGlasscooler", "Hydrocraft.HCGlassfunnel", "Hydrocraft.HCTesttubebrushbox", "Hydrocraft.HCBunsenburner", "Hydrocraft.HCRubberhose", "Hydrocraft.HCWiregauze", "Hydrocraft.HCWiregauze", "Hydrocraft.HCRingstand", "Hydrocraft.HCRingclamp", "Hydrocraft.HCUtilityclamp", "Hydrocraft.HCPinchclamp", "Hydrocraft.HCForeceps", "Hydrocraft.HCTesttubeholder", "Hydrocraft.HCTesttuberack", "Hydrocraft.HCRubberbunghole", "Hydrocraft.HCRubberbung", "Hydrocraft.HCCorkhole", "Hydrocraft.HCCork", "Hydrocraft.HCGlasstesttube", "Hydrocraft.HCEyedropper", "Hydrocraft.HCGlassgraduatedcylinder", "Hydrocraft.HCGlassbeaker", "Hydrocraft.HCGlassflaskretort", "Hydrocraft.HCGlassflaskflorence", "Hydrocraft.HCGlassflaskbuchner", "Hydrocraft.HCGlassflask", "Hydrocraft.HCPlasticcanempty", "Hydrocraft.HCChemicalbottleempty", "Hydrocraft.HCGlassbottleethanol", "Hydrocraft.HCGlassbottleammonia", "Hydrocraft.HCGlassbottleh2o2", "Hydrocraft.HCGlassbottlepotassiumpermanganate", "Hydrocraft.HCGlassbottlemethylamin", "Hydrocraft.HCGlassbottlephenyl", "Hydrocraft.HCGlassbottlesulfuricacid", "Hydrocraft.HCGlasspipebox", "Hydrocraft.HCGlasspipeelbowbox", "Hydrocraft.HCRubberbung", "Hydrocraft.HCCorkbox"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Office
function recipe_hclootoffice(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Base.Eraser", "Base.Notebook", "Base.SheetPaper", "Base.Glue", "Base.Scotchtape", "Base.LetterOpener", "Base.Scissors", "Hydrocraft.HCChildsafetyscissors", "Hydrocraft.HCPostagestamp", "Hydrocraft.HCEnvelope", "Hydrocraft.HCRubbercement", "Hydrocraft.HCSuperglue", "Hydrocraft.HCPackingtape", "Hydrocraft.HCMaskingtape", "Hydrocraft.HCGlobe", "Hydrocraft.HCFolder2", "Hydrocraft.HCFolder", "Hydrocraft.HCTriangle", "Hydrocraft.HCStapleremover", "Hydrocraft.HCRuler", "Hydrocraft.HCHighlighter", "Hydrocraft.HCThumbtack", "Hydrocraft.HCWhiteout", "Hydrocraft.HCClipboard", "Hydrocraft.HCBinderclip", "Hydrocraft.HCTypewriter", "Hydrocraft.HCRubberbandbox", "Hydrocraft.HCPostitpad", "Hydrocraft.HCStapler", "Hydrocraft.HCStaplesbox", "Hydrocraft.HCPenbox", "Hydrocraft.HCManilaenvelope", "Hydrocraft.HCManilaenvelope2", "Hydrocraft.HCStamp", "Hydrocraft.HCAbacus", "Hydrocraft.HCCertificate", "Hydrocraft.HCPencilsharpener"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Pet
function recipe_hclootpet(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Base.DogChew", "Base.Dogfood", "Base.CatToy", "Base.WaterDish", "Base.Leash", "Hydrocraft.HCBirdfeeder", "Hydrocraft.HCPooperscooper", "Hydrocraft.HCPetcone", "Hydrocraft.HCBirdcage", "Hydrocraft.HCAntfarm", "Hydrocraft.HCDogwhistle", "Hydrocraft.HCFishtank", "Hydrocraft.HCFishbowl", "Hydrocraft.HCFishfood2", "Hydrocraft.HCFishfood", "Hydrocraft.HCDogkibble", "Hydrocraft.HCDogbiscuit", "Hydrocraft.HCDogbowl", "Hydrocraft.HCBirdfoodbag", "Hydrocraft.HCBirdfoodbox", "Hydrocraft.HCRodentfood2", "Hydrocraft.HCRodentfood", "Hydrocraft.HCHamsterwheel", "Hydrocraft.HCAnimalcagesmall", "Hydrocraft.HCAnimalcage", "Hydrocraft.HCDogropetoy", "Hydrocraft.HCGroomingbrush", "Hydrocraft.HCCatfood", "Hydrocraft.HCCatlitter"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Photo
function recipe_hclootphoto(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Base.RoastingPan", "Hydrocraft.HCRubberglove", "Hydrocraft.HCFlashlightbulbred", "Hydrocraft.HCPhotolacquer", "Hydrocraft.HCPhotofixer", "Hydrocraft.HCPhotodevloper", "Hydrocraft.HCFilmroll", "Hydrocraft.HCFilmcanister", "Hydrocraft.HCCamera"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

--Toys
function recipe_hcloottoy(items, result, player)
    local gets = ZombRand(6);
    local itemSet = {"Base.VideoGame", "Base.Yoyo", "Base.ToyBear", "Base.Spiffo", "Base.Rubberducky", "Base.HCLaserpointer", "Base.Doll", "Base.Dice", "Base.Cube", "Base.CardDeck", "Base.Bricktoys", "Base.ChessWhite", "Base.ChessBlack", "Hydrocraft.HCToysaber", "Hydrocraft.HCToydog", "Hydrocraft.HCToyunicorn", "Hydrocraft.HCToyoctopus", "Hydrocraft.HCToyshark", "Hydrocraft.HCToytriceratops", "Hydrocraft.HCToytrex", "Hydrocraft.HCToystegosaurus", "Hydrocraft.HCToypterodactyl", "Hydrocraft.HCToybrontosaurus", "Hydrocraft.HCToyrocketship", "Hydrocraft.HCToyglasses", "Hydrocraft.HCToyrings", "Hydrocraft.HCToyarmyman", "Hydrocraft.HCToyship", "Hydrocraft.HCToydragon", "Hydrocraft.HCToydoll", "Hydrocraft.HCToyactionfigure4", "Hydrocraft.HCToyactionfigure3", "Hydrocraft.HCToyactionfigure2", "Hydrocraft.HCToyactionfigure1", "Hydrocraft.HCToydrawing", "Hydrocraft.HCToytop", "Hydrocraft.HCToyjack", "Hydrocraft.HCToysterioscopereel", "Hydrocraft.HCToysterioscope", "Hydrocraft.HCToyhorse", "Hydrocraft.HCToydonkey", "Hydrocraft.HCToypanda", "Hydrocraft.HCToycat", "Hydrocraft.HCToymonkey", "Hydrocraft.HCToyhippo", "Hydrocraft.HCToyrabbit", "Hydrocraft.HCCheckers", "Hydrocraft.HCPaddleball", "Hydrocraft.HCFrisbee", "Hydrocraft.HCToyrobot", "Hydrocraft.HCToyhelicopter", "Hydrocraft.HCToyairplane", "Hydrocraft.HCToytrain", "Hydrocraft.HCToycar", "Hydrocraft.HCWhoopiecushion", "Hydrocraft.HCBalloonbox", "Hydrocraft.HCRubberball", "Hydrocraft.HCPacifier", "Hydrocraft.HCBabyteether", "Hydrocraft.HCBabyrattle", "Hydrocraft.HCKazoo", "Hydrocraft.HCToyblock", "Hydrocraft.HCKickball", "Hydrocraft.HCGlassmarbles", "Hydrocraft.HCToyship", "Hydrocraft.HCToyragdoll", "Hydrocraft.HCToyarmyman2", "Hydrocraft.HCToypeople", "Hydrocraft.HCToyclay", "Hydrocraft.HCToybubbles", "Hydrocraft.HCToyglider", "Hydrocraft.HCBoardgame1", "Hydrocraft.HCBoardgame2", "Hydrocraft.HCBoardgame3", "Hydrocraft.HCCardgame1", "Hydrocraft.HCAbacus", "Hydrocraft.HCToycaterpillar"};
    player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    for x=0, gets do
        HCItemGet(player, itemSet);
    end
end

function HCItemGet(player, itemSet)
 player:getInventory():AddItem(itemSet[ZombRand(#itemSet)+1]);
end