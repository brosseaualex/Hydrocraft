--Initializations.
BoltsArrows = {};
BoltsArrows.SBolts = {x=0, y=1, z=2};
BoltsArrows.SArrows = {x=0, y=1, z=2};


-- ***********************************************************
-- **                    Hydromancerx                       **
-- **				 Single Item Returns.					**
-- ***********************************************************

function rprolld6(items, result, player)
	num = tostring(ZombRand(6)+1);
    player:Say("*Rolls* ... " .. num);
end

function recipe_hcgetplastic(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlastic");
end

function recipe_hcbreakbottle(player)
	local pl = getPlayer();
	if ZombRand(5) == 0 then
	pl:getBodyDamage():getBodyPart(BodyPartType.Hand_R):generateDeepShardWound();
	else return end
end

function HCEightBall(items, result, player)
    sayThis = ZombRand(21);
    if sayThis == 0 then
        player:Say("It is certain");
    elseif sayThis == 1 then
        player:Say("It is decidedly so");
	elseif sayThis == 2 then
        player:Say("Without a doubt");
    elseif sayThis == 3 then
        player:Say("Yes, definitely");
    elseif sayThis == 4 then
        player:Say("You may rely on it");
    elseif sayThis == 5 then
        player:Say("As I see it, yes");
    elseif sayThis == 6 then
        player:Say("Most likely");
    elseif sayThis == 7 then
        player:Say("Outlook good");
    elseif sayThis == 8 then
        player:Say("Yes");
    elseif sayThis == 9 then
        player:Say("Signs point to yes");
    elseif sayThis == 10 then
        player:Say("Reply hazy try again");
    elseif sayThis == 11 then
        player:Say("Ask again later");
    elseif sayThis == 12 then
        player:Say("Better not tell you now");
    elseif sayThis == 13 then
        player:Say("Cannot predict now");
    elseif sayThis == 14 then
        player:Say("Concentrate and ask again");	
    elseif sayThis == 15 then
        player:Say("Don't count on it");	
    elseif sayThis == 16 then
        player:Say("My reply is no");	
    elseif sayThis == 17 then
        player:Say("My sources say no");	
    elseif sayThis == 18 then
        player:Say("Outlook not so good");
    elseif sayThis == 19 then
        player:Say("Very doubtful");
    elseif sayThis == 20 then
        player:Say("All signs point to no");		
    end
end

function recipe_hcwalletmoney(items, result, player)
    local wallet = ZombRand(20);
    if wallet == 19 then
       player:getInventory():AddItem("Hydrocraft.HCCheque");  
	elseif wallet == 18 then		
       player:getInventory():AddItem("Hydrocraft.HCPokerchip");  
	elseif wallet == 17 then		
       player:getInventory():AddItem("Hydrocraft.HCDriverslicense");  
	elseif wallet == 16 then	
       player:getInventory():AddItem("Hydrocraft.HCCinematicket");  
	elseif wallet == 15 then	
       player:getInventory():AddItem("Hydrocraft.HCPostagestamp");  
	elseif wallet == 14 then		
       player:getInventory():AddItem("Base.Mirror");  
	elseif wallet == 13 then	
       player:getInventory():AddItem("Base.CreditCard");  
	elseif wallet == 12 then
       player:getInventory():AddItem("Hydrocraft.HC100dollarbill");  
	elseif wallet == 11 then
       player:getInventory():AddItem("Hydrocraft.HC50dollarbill");  
	elseif wallet == 10 then	
       player:getInventory():AddItem("Hydrocraft.HC20dollarbill");  
	elseif wallet == 9 then
       player:getInventory():AddItem("Hydrocraft.HC10dollarbill");  
	elseif wallet == 8 then
       player:getInventory():AddItem("Hydrocraft.HC5dollarbill");  
	elseif wallet == 7 then	
       player:getInventory():AddItem("Hydrocraft.HC2dollarbill");  
	elseif wallet == 6 then
       player:getInventory():AddItem("Hydrocraft.HC1dollarbill");  
	elseif wallet == 5 then
       player:getInventory():AddItem("Hydrocraft.HCDollar");  
	elseif wallet == 4 then	
       player:getInventory():AddItem("Hydrocraft.HCHalfdollar");  
	elseif wallet == 3 then
       player:getInventory():AddItem("Hydrocraft.HCQuarter");  
	elseif wallet == 2 then
       player:getInventory():AddItem("Hydrocraft.HCDime");	   
	elseif wallet == 1 then
       player:getInventory():AddItem("Hydrocraft.HCNickel");
    elseif wallet == 0 then
       player:getInventory():AddItem("Hydrocraft.HCPenny");      
    end
end

function recipe_hcslotmachine(items, result, player)
    local slots = ZombRand(13);
    if slots == 12 then	
       player:getInventory():AddItem("Hydrocraft.HC100dollarbill");  
	elseif slots == 11 then
       player:getInventory():AddItem("Hydrocraft.HC50dollarbill");  
	elseif slots == 10 then	
       player:getInventory():AddItem("Hydrocraft.HC20dollarbill");  
	elseif slots == 9 then
       player:getInventory():AddItem("Hydrocraft.HC10dollarbill");  
	elseif slots == 8 then
       player:getInventory():AddItem("Hydrocraft.HC5dollarbill");  
	elseif slots == 7 then	
       player:getInventory():AddItem("Hydrocraft.HC2dollarbill");  
	elseif slots == 6 then
       player:getInventory():AddItem("Hydrocraft.HC1dollarbill");  
	elseif slots == 5 then
       player:getInventory():AddItem("Hydrocraft.HCDollar");  
	elseif slots == 4 then	
       player:getInventory():AddItem("Hydrocraft.HCHalfdollar");  
	elseif slots == 3 then
       player:getInventory():AddItem("Hydrocraft.HCQuarter");  
	elseif slots == 2 then
       player:getInventory():AddItem("Hydrocraft.HCDime");	   
	elseif slots == 1 then
       player:getInventory():AddItem("Hydrocraft.HCNickel");
    elseif slots == 0 then
       player:getInventory():AddItem("Hydrocraft.HCPenny");      
    end
end

-- Trash

function recipe_hcget8trashbottle(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTrashbottle", 7, player);
end 

function recipe_hcget12trashbottle(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTrashbottle", 11, player);
end 

function recipe_hcget2emptymilk(items, result, player)
	HCAddManySameItem("Hydrocraft.HCUHTmilkempty", 2, player);
end 

-- Label

function recipe_hclabeldetergent(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabeldetergent");
end

function recipe_hclabelpoison(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelpoison");
end

function recipe_hclabelammonia(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelammonia");
end

function recipe_hclabelh2o2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelh2o2");
end

function recipe_hclabelmethylamin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelmethylamin");
end

function recipe_hclabelphenyl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelphenylaceticacid");
end

function recipe_hclabelsulfuricacid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelsulfuricacid");
end

-- Get Buckets Beakers Cans

function recipe_hcget1beaker(items, result, player)
	HCAddManySameItem("Hydrocraft.HCGlassbeaker", 0, player);
end 

function recipe_hcget2beakers(items, result, player)
	HCAddManySameItem("Hydrocraft.HCGlassbeaker", 1, player);
end 

function recipe_hcget4beakers(items, result, player)
	HCAddManySameItem("Hydrocraft.HCGlassbeaker", 3, player);
end 

function recipe_hcgetwoodenbucket(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWoodenbucket");
end

function recipe_hcgetemptypoisoncan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPoisonempty");
end

function recipe_hcgetemptydetergentcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDetergentempty");
end

function recipe_hcgetemptyplasticcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlasticcanempty");
end

function recipe_hcgetemptyammoniacan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAmmoniacanempty");
end

function recipe_hcgetemptyh2o2can(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCh2o2canempty");
end

function recipe_hcgetemptysulfuriccan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSulfuricacidcanempty");
end

function recipe_hcget3plasticcans(items, result, player)
	HCAddManySameItem("Hydrocraft.HCPlasticcanempty", 2, player);
end 

function recipe_hcget3ammoniacans(items, result, player)
	HCAddManySameItem("Hydrocraft.HCAmmoniacanempty", 2, player);
end 

function recipe_hcget3detergentcans(items, result, player)
	HCAddManySameItem("Hydrocraft.HCDetergentempty", 2, player);
end 

function recipe_hcget3poisoncans(items, result, player)
	HCAddManySameItem("Hydrocraft.HCPoisonempty", 2, player);
end 

function recipe_hcget3sulfuricacidcans(items, result, player)
	HCAddManySameItem("Hydrocraft.HCSulfuricacidcanempty", 2, player);
end 

function recipe_hcgeteyedropper(items, result, player)
	HCAddManySameItem("Hydrocraft.HCEyedropper", 2, player);
end 

-- Get Barrels

function recipe_hcgetemptymetalbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBarrelmetalempty");
end

function recipe_hcgetemptyammoniabarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAmmoniabarrelempty");
end

function recipe_hcgetemptyammoniabarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAmmoniabarrelblueempty");
end

function recipe_hcgetemptymethlaminbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMethylaminbarrelempty");
end

function recipe_hcgetemptymethlaminbarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMethylaminbarrelblueempty");
end

function recipe_hcgetemptyphenylbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPhenylbarrelempty");
end

function recipe_hcgetemptyphenylbarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPhenylbarrelblueempty");
end

function recipe_hcgetemptysulfuricbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSulfuricacidbarrelempty");
end

function recipe_hcgetemptysulfuricbarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSulfuricacidbarrelblueempty");
end

--Carpentry Stuff

function recipe_hclog5(items, result, player)
	HCAddManySameItem("Base.Log", 4, player);
end 

function recipe_hcwoodenstick(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WoodenStick");
end

function recipe_hcsawdust(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSawdust");
end

function recipe_hcpallet(items, result, player)
	HCAddManySameItem("Hydrocraft.HCRopethick", 0, player);
	HCAddManySameItem("Hydrocraft.HCWoodenpallet", 0, player);
end 

--Tool Stuff

function recipe_hcportableminingmachine(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPortableminingmachine");
end

function recipe_hcgetmultitool(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCElectricmultitooloff");
end

function recipe_hcbolt(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBolt");
end

function recipe_hcemptyweldingtank(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWeldingtankempty");
end

--Medical Stuff

function recipe_hcgetmedicalskeleton(items, result, player)
	HCAddManySameItem("Hydrocraft.HCMedicalskeletonparts", 0, player);
	HCAddManySameItem("Hydrocraft.HCMedicalskeletonholderparts", 0, player);
end 

function recipe_hcgetpetridish(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPetridish");
end

function recipe_hcmicroscopefunghi(items, result, player)
    local microbe = ZombRand(5);
    if microbe == 4 then
       player:getInventory():AddItem("Hydrocraft.HCPetripenecilinumzoom");  
	elseif microbe == 3 then
       player:getInventory():AddItem("Hydrocraft.HCPetriaspergilluszoom");  
	elseif microbe == 2 then
       player:getInventory():AddItem("Hydrocraft.HCPetriyeastzoom");	   
	elseif microbe == 1 then
       player:getInventory():AddItem("Hydrocraft.HCPetrididymiumzoom");
    elseif microbe == 0 then
       player:getInventory():AddItem("Hydrocraft.HCPetrinothingzoom");      
    end
end

--Inject with Rabbit Blood
function HCInjectrabbit(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.DeadRabbit");
end

--Inject with Zed Blood
function HCInjectyourself(items, result, player)
    player:getBodyDamage():setInfectionLevel(1);
end

--Homemade Beta Blockers
 function HCBetaBlocker(items, result, player)
	local player = getPlayer(); 
	local stats = player:getStats();
	stats:setPanic(stats:getPanic() - 10);
end

 function HCBetaBlockerMild(items, result, player)
	local player = getPlayer(); 
	local stats = player:getStats();
	stats:setPanic(stats:getPanic() - 5);
end

--Sewing Stuff

function recipe_hcspindle3(items, result, player)
	HCAddManySameItem("Hydrocraft.HCSpindle", 2, player);
end 

function recipe_hcpincushion(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPincushion");
end

function recipe_hcpillowcase(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPillowcase");
end

function recipe_hczipper(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCZipper");
end

--Container Stuff

function recipe_hccdcase(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCDcase");
end

function recipe_hctennisballcontainer(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCTennisballcontainer");
end 

function recipe_hcgetplasticcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlasticcanempty");
end

function recipe_hcwoodenvat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCVat");
end

function recipe_hcwashtub(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWashtub");
end

function recipe_hcwoodenbucketbottle(items, result, player)
	HCAddManySameItem("Base.WhiskeyEmpty", 0, player);
	HCAddManySameItem("Hydrocraft.HCWoodenbucket", 0, player);
end 

function recipe_hcwoodenbucket(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWoodenbucket");
end

function recipe_hcwoodenbucket4(items, result, player)
	HCAddManySameItem("Hydrocraft.HCWoodenbucket", 3, player);
end 

function recipe_hcwoodenbucket5(items, result, player)
	HCAddManySameItem("Hydrocraft.HCWoodenbucket", 4, player);
end 

function recipe_hcwoodenbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWoodenbarrel");
end

--Electric  Stuff

function recipe_hcsolarpark(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSolarpark");
end

function recipe_hcelectronics(items, result, player)
    local pup = ZombRand(5);
    if pup == 4 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicpartsbroken");  
	elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCLedyellow");  
	elseif pup == 2 then
       player:getInventory():AddItem("Hydrocraft.HCLedgreen");	   
	elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCLedred");
    elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCCablecopper");      
    end
end

function recipe_hcheaterwire(items, result, player)
    local pup = ZombRand(5);
    if pup == 4 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicpartsbroken");  
	elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCWireconstantan");  
	elseif pup == 2 then
       player:getInventory():AddItem("Hydrocraft.HCLedyellow");	   
	elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCLedgreen");
    elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCLedred");      
    end
end

function recipe_hcelectromotorsmall(items, result, player)
    local pup = ZombRand(5);
    if pup == 4 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicpartsbroken");  
	elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCElectromotorsmall");  
	elseif pup == 2 then
       player:getInventory():AddItem("Hydrocraft.HCLedyellow");	   
	elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCLedgreen");
    elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCLedred");      
    end
end

function recipe_hcelectronics02(items, result, player)
    local pup = ZombRand(25);
    if pup == 24 then
       player:getInventory():AddItem("Hydrocraft.HCCircutchip");  
	elseif pup == 23 then
       player:getInventory():AddItem("Hydrocraft.HCCeramicoscillator");  
	elseif pup == 22 then
       player:getInventory():AddItem("Hydrocraft.HCIREncoder");  
	elseif pup == 21 then
       player:getInventory():AddItem("Hydrocraft.HCIRDecoder");  
	elseif pup == 20 then
       player:getInventory():AddItem("Hydrocraft.HCDiode");	   
	elseif pup == 19 then
       player:getInventory():AddItem("Hydrocraft.HCFuse");
	elseif pup == 18 then
       player:getInventory():AddItem("Hydrocraft.HCGlowlamp");	   
	elseif pup == 17 then
       player:getInventory():AddItem("Hydrocraft.HCInduktor");
        elseif pup == 16 then
       player:getInventory():AddItem("Hydrocraft.HCIREmitter");  
	elseif pup == 15 then
       player:getInventory():AddItem("Hydrocraft.HCIRReceiver");	   
	elseif pup == 14 then
       player:getInventory():AddItem("Hydrocraft.HCLDR");
	elseif pup == 13 then
       player:getInventory():AddItem("Hydrocraft.HCPoti");	   
	elseif pup == 12 then
       player:getInventory():AddItem("Hydrocraft.HCReceiverIC");  
	elseif pup == 11 then
       player:getInventory():AddItem("Hydrocraft.HCTransistor");	   
	elseif pup == 10 then
       player:getInventory():AddItem("Hydrocraft.HCTerminalstrip");
	elseif pup == 9 then
       player:getInventory():AddItem("Hydrocraft.HCResistor");	   
	elseif pup == 8 then
       player:getInventory():AddItem("Hydrocraft.HCLedblue");
        elseif pup == 7 then
       player:getInventory():AddItem("Hydrocraft.HCLedyellow");  
	elseif pup == 6 then
       player:getInventory():AddItem("Hydrocraft.HCCapacitor02");	   
	elseif pup == 5 then
       player:getInventory():AddItem("Hydrocraft.HCCapacitor01");
	elseif pup == 4 then
       player:getInventory():AddItem("Hydrocraft.HCLedgreen");	   
	elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCLedred");
        elseif pup == 2 then
       player:getInventory():AddItem("Hydrocraft.HCCoppercablestriped");	   
	elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCCoppercablered");
        elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCCablecopper");      
    end
end

function recipe_hclightbulb(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.LightBulb");
end

function recipe_hcdisplay(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDisplay");
end

function recipe_hccomputerfan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCComputerfandismantled");
end

function recipe_hcwashingmachine(items, result, player)
	HCAddManySameItem("Hydrocraft.HCElectromotor", 0, player);
	HCAddManySameItem("Base.SheetMetal", 1, player);
	HCAddManySameItem("Hydrocraft.HCWashingmachinepump", 0, player);
	HCAddManySameItem("Hydrocraft.HCTerminalstrip", 4, player);
	HCAddManySameItem("Hydrocraft.HCColoredwire", 1, player);
	HCAddManySameItem("Hydrocraft.HCLedred", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedgreen", 0, player);
	HCAddManySameItem("Hydrocraft.HCCablecopper", 0, player);
	HCAddManySameItem("Hydrocraft.HCElectronicpartsbroken", 1, player);
end 

function recipe_hcfridge(items, result, player)
	HCAddManySameItem("Hydrocraft.HCElectromotor", 0, player);
	HCAddManySameItem("Base.SheetMetal", 0, player);
	HCAddManySameItem("Hydrocraft.HCTerminalstrip", 4, player);
	HCAddManySameItem("Hydrocraft.HCColoredwire", 1, player);
	HCAddManySameItem("Hydrocraft.HCLedred", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedgreen", 0, player);
	HCAddManySameItem("Hydrocraft.HCCablecopper", 0, player);
	HCAddManySameItem("Hydrocraft.HCElectronicpartsbroken", 1, player);
end 

function recipe_hclargevac(items, result, player)
	HCAddManySameItem("Hydrocraft.HCElectromotor", 0, player);
	HCAddManySameItem("Hydrocraft.HCSteelpipe", 0, player);
	HCAddManySameItem("Hydrocraft.HCSwitch", 0, player);
	HCAddManySameItem("Hydrocraft.HCTerminalstrip", 4, player);
	HCAddManySameItem("Hydrocraft.HCColoredwire", 1, player);
	HCAddManySameItem("Hydrocraft.HCLedred", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedgreen", 0, player);
	HCAddManySameItem("Hydrocraft.HCCablecopper", 0, player);
	HCAddManySameItem("Hydrocraft.HCElectronicpartsbroken", 1, player);
end 

function recipe_hcbike1(items, result, player)
	HCAddManySameItem("Base.Pipe", 3, player);
	HCAddManySameItem("Hydrocraft.HCBicyclewheel", 0, player);
end 

function recipe_hcbike2(items, result, player)
	HCAddManySameItem("Base.Pipe", 3, player);
	HCAddManySameItem("Hydrocraft.HCBicyclewheel", 1, player);
end 

function recipe_hcelectronicparts(items, result, player)
    local pup = ZombRand(5);
    if pup == 4 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicparts04");  
	elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicparts03");  
	elseif pup == 2 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicparts02");	   
	elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicparts01");
    elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCElectronicpartsbroken");      
    end
end

function recipe_hcsortparts01(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCapacitor02", 1, player);
	HCAddManySameItem("Hydrocraft.HCPoti", 0, player);
	HCAddManySameItem("Hydrocraft.HCTransistor", 1, player);
	HCAddManySameItem("Hydrocraft.HCReceiverIC", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedgreen", 0, player);
	HCAddManySameItem("Hydrocraft.HCResistor", 1, player);
end 

function recipe_hcsortparts02(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCeramicoscillator", 0, player);
	HCAddManySameItem("Hydrocraft.HCCapacitor01", 0, player);
	HCAddManySameItem("Hydrocraft.HCCapacitor02", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedblue", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedyellow", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedred", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedgreen", 0, player);
	HCAddManySameItem("Hydrocraft.HCResistor", 1, player);
end 

function recipe_hcsortparts03(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCapacitor02", 0, player);
	HCAddManySameItem("Hydrocraft.HCDiode", 3, player);
	HCAddManySameItem("Hydrocraft.HCLDR", 0, player);
	HCAddManySameItem("Hydrocraft.HCLedred", 0, player);
	HCAddManySameItem("Hydrocraft.HCTransistor", 0, player);
	HCAddManySameItem("Hydrocraft.HCResistor", 1, player);
end 

function recipe_hcsortparts04(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCapacitor02", 0, player);
	HCAddManySameItem("Hydrocraft.HCDiode", 2, player);
	HCAddManySameItem("Hydrocraft.HCIREncoder", 0, player);
	HCAddManySameItem("Hydrocraft.HCIREmitter", 0, player);
	HCAddManySameItem("Hydrocraft.HCIRReceiver", 0, player);
	HCAddManySameItem("Hydrocraft.HCResistor", 1, player);
end 

function recipe_hccabletangle(items, result, player)
	HCAddManySameItem("Hydrocraft.HCWirecopper", 1, player);
	HCAddManySameItem("Hydrocraft.HCCoppercablestriped", 0, player);
	HCAddManySameItem("Hydrocraft.HCCoppercablered", 1, player);
	HCAddManySameItem("Hydrocraft.HCCablecopper", 1, player);
end 

function recipe_hcrecyclecable(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCoppercablestriped", 0, player);
	HCAddManySameItem("Hydrocraft.HCCoppercablered", 0, player);
end 

function recipe_hcdismantleengineparts(items, result, player)
    local parts = ZombRand(5);
    if parts == 4 then
       player:getInventory():AddItem("Hydrocraft.HCFanbelt");  
	elseif parts == 3 then
       player:getInventory():AddItem("Hydrocraft.HCClutch");  
	elseif parts == 2 then
       player:getInventory():AddItem("Hydrocraft.HCCamshaft");	   
	elseif parts == 1 then
       player:getInventory():AddItem("Hydrocraft.HCAirfilter");
    elseif parts == 0 then
       player:getInventory():AddItem("Hydrocraft.HCSparkplug");      
    end
end

function recipe_hcdismantlebreaks(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBreakpads");
end

--Battery Stuff

function recipe_hcbatterysmalldead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatterysmalldead");
end

function recipe_hcbatterymediumdead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatterymediumdead");
end

function recipe_hcbatterylargedead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatterylargedead");
end

function recipe_hcbatteryhugedead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatteryhugedead");
end

-- Barrels

function recipe_hcgetemptygasolinebarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGasolinebarrelempty");
end

function recipe_hcgetpetrolcan(items, result, player)
	HCAddManySameItem("Base.PetrolCan", 1, player);
end 

-- Explosives Stuff

function recipe_hcgetcapsule(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMk1capsule");
end

function recipe_hcgetrubberbung(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRubberbung");
end

function recipe_hcgetrubberbunghole(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRubberbunghole");
end

--Alchemy Stuff

function recipe_hcbiodieselcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.EmptyPetrolCan");
end

function recipe_hcgetcalciumcarbonate(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCalciumcarbonatpowder");
end

function recipe_hcgetacidbath(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAcidbathempty");
end

function recipe_hcbiogasempty(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBiogas");
end

function recipe_hcglycerin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGlycerin");
end

function recipe_hcgeteyedropperammonia(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperammonia");
end 

function recipe_hcgeteyedropperpotassiumpermanganate(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperpotassiumpermanganate");
end 

function recipe_hcgeteyedroppercalciumchloride(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppercalciumchloridesolution");
end 

function recipe_hcgeteyedropperh2o2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperh2o2");
end 

function recipe_hcgeteyedroppermercuricoxide(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermercuricoxide");
end 

function recipe_hcgeteyedroppermethylamin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermethylamin");
end 

function recipe_hcgeteyedroppermorphinhydrochloridsolution(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermorphinhydrochloridsolution");
end 

function recipe_hcgeteyedroppermuriaticacid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermuriaticacid");
end 

function recipe_hcgeteyedropperphenyl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperphenyl");
end 

function recipe_hcgeteyedroppersodiumhydroxidesolution(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppersodiumhydroxidesolution");
end 

function recipe_hcgeteyedroppersulfuricacid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppersulfuricacid");
end 

function recipe_hcgeteyedroppertronasulution(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppertronasulution");
end 

function recipe_hcgeteyedropperwater(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperwater");
end 

function recipe_hcgeteyedropperether(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperether");
end

function recipe_hcpaperscreen(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPaperscreen");
end  

--Lab Stuff

function recipe_hcgetglassbaloon(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGlassbaloon");
end

function recipe_hcgetbaloonandhose(items, result, player)
	HCAddManySameItem("Hydrocraft.HCGlassbaloonconnector", 0, player);
	HCAddManySameItem("Hydrocraft.HCRubberhose", 0, player);
end 

function recipe_hcgetbeaker(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGlassbeaker");
end

function recipe_hcbeakerbottle(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCGlassbeaker");
        inv:AddItem("Base.WhiskeyEmpty");
end

function recipe_hccork(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCork");
end

function recipe_hccorkhole(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCorkhole");
end

function recipe_hctesttuberack(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCTesttuberack");
end

function recipe_hcringstand(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRingstand");
end

function recipe_hccentifugemarble(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCalcitepowder", 6, player);
end 

function recipe_hcelectrolyzerobsidian(items, result, player)
	HCAddManySameItem("Hydrocraft.HCMagnesiumpowder", 0, player);
	HCAddManySameItem("Hydrocraft.HCSiliconpowder", 1, player);
end 

--Animal Stuff

function recipe_hcsheepmalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSheepmalesheared");
end

function recipe_hcsheepfemalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSheepfemalesheared");
end

function recipe_hcgoatmalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGoatmalesheared");
end

function recipe_hcgoatfemalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGoatfemalesheared");
end
	
function recipe_hchamsterpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHamsterpoop");
end

function recipe_hcrabbitpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRabbitpoop");
end

function recipe_hcchickenpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCChickenpoop");
end

function recipe_hcpigpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPigpoop");
end

function recipe_hcsheeppoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSheeppoop");
end

function recipe_hcgoatpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGoatpoop");
end

function recipe_hccowpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCowpoop");
end

function recipe_hcdonkeypoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDonkeypoop");
end

function recipe_hchorsepoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHorsepoop");
end

function recipe_hcpigbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCPigmaletired");
        inv:AddItem("Hydrocraft.HCPigfemaletired");
end

function recipe_hcsheepbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCSheepmaletired");
        inv:AddItem("Hydrocraft.HCSheepfemaletired");
end

function recipe_hcgoatbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCGoatmaletired");
        inv:AddItem("Hydrocraft.HCGoatfemaletired");
end

function recipe_hcgoatmilk(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCGoatfemaletired");
end

function recipe_hccowbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCCowmaletired");
        inv:AddItem("Hydrocraft.HCCowfemaletired");
end

function recipe_hccowmilk(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCCowfemaletired");
end

function recipe_hcdonkeybreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCDonkeymaletired");
        inv:AddItem("Hydrocraft.HCDonkeyfemaletired");
end

function recipe_hchorsebreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCHorsemaletired");
        inv:AddItem("Hydrocraft.HCHorsefemaletired");
end

function recipe_hcchickencoop(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCCooptired");
end

--Seeds Stuff

function recipe_hcpumpkinseeds8(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTPumpkinseeds", 7, player);
end 

function recipe_hcteaseeds2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTeaseeds", 1, player);
end 

function recipe_hccottonseeds(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCottonseeds", 0, player);
end 

function recipe_hchempseeds2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCHempseeds", 1, player);
end 

function recipe_hctobaccoseeds2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTobaccoseeds", 1, player);
end 

function recipe_hcjuteseeds2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCJuteseeds", 1, player);
end

function recipe_hcmulberryleaves(items, result, player)
	HCAddManySameItem("Hydrocraft.HCMulberryleaf", 4, player);
end 

function recipe_hcgrapeleaves(items, result, player)
	HCAddManySameItem("Base.GrapeLeaves", 4, player);
end 

--Herbalism Stuff

function recipe_hcgetpoppyflower(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPoppyflower");
end

function recipe_hcchilipeppercut(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCChilipeppercut");
end

function recipe_hcplantfibers(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlantfibers");
end

function recipe_hcchaff(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCChaff");
end

function recipe_hcchaff2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCChaff", 1, player);
end 

function recipe_hcchaffbran(items, result, player)
	HCAddManySameItem("Hydrocraft.HCChaff", 1, player);
	HCAddManySameItem("Hydrocraft.HCBran", 1, player);	
end 

function recipe_hccob(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCob", 0, player);
	HCAddManySameItem("Hydrocraft.HCHusk", 0, player);	
end 

--Open Cigarette Packs
function recipe_opencigpack1(items, result, player)
	HCAddManySameItem("Base.Cigarettes", 0, player);
end

function recipe_opencigpack2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCigaretteslights", 0, player);
end

function recipe_opencigpack3(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCigarettesmenthol", 0, player);
end

--Beekeeping Stuff

function recipe_hcbeeswax(items, result, player)
	HCAddManySameItem("Hydrocraft.HCBeeswax", 3, player);
end 

    local function isWinter()
        if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
            return true
        end
        return false
    end

    function recipe_hcfeedbeehive1(items, result, player)
        local inv = player:getInventory();

        if isWinter() then 
            player:Say("Bees are dormant in the winter.")
            inv:AddItems("Hydrocraft.HCPollen",4)
			inv:AddItem("Hydrocraft.HCBeehive1")
            return
        end

        inv:AddItem("Hydrocraft.HCBeehive1Active")
    end

    function recipe_hcfeedbeehive2(items, result, player)
        local inv = player:getInventory();

        if isWinter() then 
            player:Say("Bees are dormant in the winter.")
            inv:AddItems("Hydrocraft.HCPollen",8)
			inv:AddItem("Hydrocraft.HCBeehive2")			
            return
        end

        inv:AddItem("Hydrocraft.HCBeehive2Active")
    end

    function recipe_hcfeedbeehive3(items, result, player)
        local inv = player:getInventory();

        if isWinter() then 
            player:Say("Bees are dormant in the winter.")
            inv:AddItems("Hydrocraft.HCPollen",12)
			inv:AddItem("Hydrocraft.HCBeehive3")			
            return
        end

        inv:AddItem("Hydrocraft.HCBeehive3Active")
    end

    function recipe_hcbeehive1(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCBeehive1");
    end

    function recipe_hcbeehive2(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCBeehive2");
    end

    function recipe_hcbeehive3(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCBeehive3");
    end

--Cheese Stuff

function recipe_Process_RWAX(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCCheesecloth");
        inv:AddItem("Base.Pot");
        inv:AddItem("Base.Stone");
end

function recipe_hccheesetray(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCheesetray");
	inv:AddItem("Hydrocraft.HCCheeserack");	
end

--Wine Stuff

function recipe_hcwineempty(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WineEmpty");
end

function recipe_hcwineempty2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WineEmpty2");
end

--Seafood Stuff

function recipe_hcmusselshell(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMusselshell");
end

--Chicken Ramen
function recipe_openchickenramen(items, result, player)
	HCAddManySameItem("Hydrocraft.HCRamenchickenflavor", 0, player);
	HCAddManySameItem("Hydrocraft.HCRamenchickentrash", 0, player);
end

--Beef Ramen
function recipe_openbeeframen(items, result, player)
	HCAddManySameItem("Hydrocraft.HCRamenbeefflavor", 0, player);
	HCAddManySameItem("Hydrocraft.HCRamenbeeftrash", 0, player);
end

--Shrimp Ramen
function recipe_openshrimpramen(items, result, player)
	HCAddManySameItem("Hydrocraft.HCRamenshrimpflavor", 0, player);
	HCAddManySameItem("Hydrocraft.HCRamenshrimptrash", 0, player);
end

--Cheese Ramen
function recipe_opencheeseramen(items, result, player)
	HCAddManySameItem("Hydrocraft.HCRamencheeseflavor", 0, player);
	HCAddManySameItem("Hydrocraft.HCRamencheesetrash", 0, player);
end

--Unbox Flat of Ramen
function recipe_unboxramenflat(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCardboardflat", 0, player);

end

--Kitchen Stuff (Cookies Functions)

function RemoveCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCHomemadecookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveChocolateChipCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCChipcookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveWhiteChocolateCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCookiewhitetray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemovePeanutButterCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCookiepeanutbuttertray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveChocolateCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCChocolatecookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveDoubleChocolateCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDoublechocolatecookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveGingerbreadManCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCGingerbreadmantray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveChristmasCookies_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCChristmascookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveAppleJello_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJelloapplemix" then
        return sourceItem:isCooked()
    end
    return true
end

--Kitchen Stuff (Jello Functions)

function recipe_HCHoneybun(items, result, player)
	HCAddManySameItem("Hydrocraft.HCHoneybun", 3, player);
end 

function recipe_HCCupcake(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCupcake", 5, player);
end 

--Kitchen Stuff (Item Functions)

function recipe_hcnapkinholder(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCNapkinholder");
end

function ReturnBakingTray_OnCreate(items,result,player)
    player:getInventory():AddItem("Base.BakingTray");
end

function ReturnSaucePan_OnCreate(items,result,player)
    player:getInventory():AddItem("Base.Saucepan");
end

function ReturnJelloMold_OnCreate(items,result,player)
    player:getInventory():AddItem("Hydrocraft.HCJellomold1");
end

-- baking tray will be obsolete
function recipe_hcbakingtray(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.BakingTray");
end

function recipe_hcbreadpan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBreadpan");
end

function recipe_hcbowl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Bowl");
end

function recipe_hcjar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCJar");
end

function recipe_hcjar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCJar");
end

function recipe_hcporcelainsaucer(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPorcelainsaucer");
end

function recipe_hcjar5(items, result, player)
	HCAddManySameItem("Hydrocraft.HCJar", 4, player);
end 

function recipe_hcfortune(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCFortune");
end

function recipe_hcjarlid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.JarLid");
end

function recipe_hcpizzastone(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPizzastone");
end

function recipe_hcacornsoaked(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAcornsoaked");
end

function recipe_hcsourdough(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSourdoughstarterdepleted");
end

function recipe_hcpot(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Pot");
end

function recipe_hcpotatopot3(items, result, player)
	HCAddManySameItem("Base.Pot", 2, player);
end 

function recipe_hclargetuplid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLargetuplid");
end

function recipe_hcmediumtuplid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMediumtuplid");
end

function recipe_hcsmalltuplid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSmalltuplid");
end

--Rope Stuff

function recipe_hcropethin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRopethin");
end 

function recipe_hcrope(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Rope");
end 

function recipe_hcropethick(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRopethick");
end 

--Pack Animal Stuff

function HCRemoveDogPack(items, result, player)
	HCAddManySameItem("Base.Rope", 0, player);
	HCAddManySameItem("Base.BigHikingBag", 1, player);
	--AiweLeliaThamm Сохранение голода животного
	recipe_saveOldTimingState(items, result, player)
end 

function HCRemoveDogPack2(items, result, player)
	HCAddManySameItem("Base.Rope", 0, player);
	HCAddManySameItem("Hydrocraft.HCBighikingbagpouch", 1, player);
	--AiweLeliaThamm Сохранение голода животного
	recipe_saveOldTimingState(items, result, player)
end 

function HCRemoveDonkeyPack(items, result, player)
	HCAddManySameItem("Base.Rope", 0, player);
	HCAddManySameItem("Hydrocraft.HCAlicepack3", 1, player);
	--AiweLeliaThamm Сохранение голода животного
	recipe_saveOldTimingState(items, result, player)
end 

function HCRemoveHorseSaddle(items, result, player)
	HCAddManySameItem("Hydrocraft.HCHorsesaddle", 0, player);
	--AiweLeliaThamm Сохранение голода животного
	recipe_saveOldTimingState(items, result, player)
end 

--Bike Stuff

function HCRemoveBikeBaskets(items, result, player)
	HCAddManySameItem("Base.Rope", 0, player);
	HCAddManySameItem("Hydrocraft.HCStrawbasket", 1, player);
end 

--Telescope Stuff

function recipe_hctelescopetripod(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCTelescopetripod");
end 

function recipe_hcopentelescope(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTelescopescope", 0, player);
	HCAddManySameItem("Hydrocraft.HCTelescopetripod", 0, player);
	HCAddManySameItem("Hydrocraft.HCBubblewrap", 0, player);
end

--Zombie Stuff

function recipe_hcskinzed(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCZedskin");
end 

function recipe_hcdissectzed(items, result, player)
	HCAddManySameItem("Hydrocraft.HCZedbrain", 0, player);
	HCAddManySameItem("Hydrocraft.HCZedheart", 0, player);
	HCAddManySameItem("Hydrocraft.HCZedlung", 1, player);
	HCAddManySameItem("Hydrocraft.HCZedkidney", 1, player);
	HCAddManySameItem("Hydrocraft.HCZedliver", 0, player);	
	HCAddManySameItem("Hydrocraft.HCZedpancreas", 0, player);
	HCAddManySameItem("Hydrocraft.HCZedintestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 1, player);	
	player:getXp():AddXP(Perks.Doctor, 10)	
end 

function recipe_hcremovezed(items, result, player)
	HCAddManySameItem("Hydrocraft.HCZedmeat", 0, player);
	HCAddManySameItem("Hydrocraft.HCZedskin", 0, player);
end 

function recipe_hczedskull(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCZedskull");
end 

function recipe_hczedhead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCZedhead");
end 

function recipe_hczedbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCZedsteak", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 1, player);	
end 

--Animal Skinning Stuff

function recipe_hcskinrabbit(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawrabbit");
end 

function recipe_hcskinsquirrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawsquirrel");
end 

function recipe_hcskingroundhog(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawgroundhog");
end 

function recipe_hcskinmuskrat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawmuskrat");
end 

function recipe_hcskinnutria(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawnutria");
end 

function recipe_hcskinbeaver(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbeaver");
end 

function recipe_hcskinporcupine(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPorcupinequills");
end 

function recipe_hcskinarmadillo(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawarmadillo");
end 

function recipe_hcskinfox(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawfox");
end

function recipe_hcskinopossum(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawopossum");
end  

function recipe_hcskinskunk(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawskunk");
end  

function recipe_hcskinraccoon(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawraccoon");
end 

function recipe_hcskinboar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawboar");
end 

function recipe_hcskindeer(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawdeer");
end 

function recipe_hcskinbearblack(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbearblack");
end

function recipe_hcskinbear(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbear");
end

function recipe_hcskincougar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawcougar");
end    

function recipe_hcskindog(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawdog");
end 

function recipe_hcskincat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawcat");
end 

function recipe_hcskinsheep(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawsheep");
end 

function recipe_hcskingoat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawgoat");
end 

function recipe_hcskinpig(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawpig");
end 

function recipe_hcskincow(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawcow");
end 

function recipe_hcskinbull(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbull");
end 

function recipe_hcskindonkey(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawdonkey");
end 

function recipe_hcskinhorse(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawhorse");
end 

function recipe_hcskinanimal(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAnimalfur");
end 

function recipe_hcskinanimal2(items, result, player)
	HCAddManySameItem("Hydrocraft.HCAnimalfur", 1, player);
end 

function recipe_hcskinanimal4(items, result, player)
	HCAddManySameItem("Hydrocraft.HCAnimalfur", 3, player);
end 

function recipe_hcskinanimal6(items, result, player)
	HCAddManySameItem("Hydrocraft.HCAnimalfur", 5, player);
end 

function recipe_hcskinanimal8(items, result, player)
	HCAddManySameItem("Hydrocraft.HCAnimalfur", 7, player);
end 

function recipe_hcboartusks(items, result, player)
	HCAddManySameItem("Hydrocraft.HCBoartusk", 1, player);
end 

function recipe_hcgoathorn(items, result, player)
	HCAddManySameItem("Hydrocraft.HCGoathorn", 1, player);
end 

--Animal Butchering Stuff

function recipe_hcchickenbutcher(items, result, player)
	HCAddManySameItem("Base.Chicken", 0, player);
	HCAddManySameItem("Hydrocraft.HCBone", 0, player);
	HCAddManySameItem("Hydrocraft.HCWishbone", 0, player);	
end 

function recipe_hcsmallbirdbutcher(items, result, player)
	HCAddManySameItem("Base.Smallbirdmeat", 0, player);
	HCAddManySameItem("Hydrocraft.HCBone", 0, player);
	HCAddManySameItem("Hydrocraft.HCWishbone", 0, player);
end 

function recipe_hcduckbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCDuckmeat", 0, player);
	HCAddManySameItem("Hydrocraft.HCBone", 0, player);
	HCAddManySameItem("Hydrocraft.HCWishbone", 0, player);	
end 

function recipe_hcgoosebutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCGoosemeat", 0, player);
	HCAddManySameItem("Hydrocraft.HCBone", 0, player);
	HCAddManySameItem("Hydrocraft.HCWishbone", 0, player);	
end 

function recipe_hcturkeybutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCTurkeymeat", 0, player);
	HCAddManySameItem("Hydrocraft.HCBone", 0, player);
	HCAddManySameItem("Hydrocraft.HCWishbone", 0, player);	
end 

function recipe_hcpigbutcher(items, result, player)
	HCAddManySameItem("Base.PorkChop", 3, player);
	HCAddManySameItem("farming.Bacon", 1, player);
	HCAddManySameItem("Hydrocraft.HCFreshham", 1, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 5, player);
end 

function recipe_hcsheepbutcher(items, result, player)
	HCAddManySameItem("Base.MuttonChop", 2, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 1, player);
	HCAddManySameItem("Hydrocraft.HCLard", 2, player);	
end 

function recipe_hccowbutcher(items, result, player)
	HCAddManySameItem("Base.Steak", 9, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 4, player);
	HCAddManySameItem("Hydrocraft.HCLard", 5, player);	
end 

function recipe_hcdonkeybutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCheval", 7, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 4, player);	
end 

function recipe_hchorsebutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCheval", 9, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 5, player);	
end 

function recipe_hcsmallgamebutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCSmallgamesteak", 3, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 1, player);
end 

function recipe_hcboarbutcher(items, result, player)
	HCAddManySameItem("Base.PorkChop", 3, player);
	HCAddManySameItem("Base.Bacon", 1, player);
	HCAddManySameItem("Hydrocraft.HCFreshham", 1, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 4, player);	
end 

function recipe_hcdeerbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCVenison", 9, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 3, player);	
end 

function recipe_hcdeerantlers(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDeerantlers");
end

function recipe_hcbearbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCBearsteak", 19, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 5, player);
	HCAddManySameItem("Hydrocraft.HCLard", 5, player);	
end 

function recipe_hcblackbearbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCBearsteak", 15, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 3, player);
	HCAddManySameItem("Hydrocraft.HCLard", 4, player);	
end 

function recipe_hccougarbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCCougarsteak", 7, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 2, player);
	HCAddManySameItem("Hydrocraft.HCLard", 1, player);	
end 

function recipe_hcdogbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCSmallgamesteak", 10, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 1, player);
	HCAddManySameItem("Hydrocraft.HCLard", 1, player);	
end 

function recipe_hccatbutcher(items, result, player)
	HCAddManySameItem("Hydrocraft.HCSmallgamesteak", 4, player);
	HCAddManySameItem("Hydrocraft.HCIntestines", 1, player);
	HCAddManySameItem("Hydrocraft.HCLard", 1, player);	
end 

--Tree Cutting Stuff

function recipe_hccutfirtree3(items, result, player)
	HCAddManySameItem("Base.Log", 0, player);
	HCAddManySameItem("Base.Twigs", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 0, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 4, player);
	HCAddManySameItem("Hydrocraft.HCResin", 0, player);		
end 

function recipe_hccutfirtree4(items, result, player)
	HCAddManySameItem("Base.Log", 1, player);
	HCAddManySameItem("Base.Twigs", 3, player);
	HCAddManySameItem("Hydrocraft.HCFircone", 0, player);
	HCAddManySameItem("Hydrocraft.HCBark", 1, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 9, player);
	HCAddManySameItem("Hydrocraft.HCResin", 1, player);		
end

function recipe_hccutfirtree5(items, result, player)
	HCAddManySameItem("Base.Log", 2, player);
	HCAddManySameItem("Base.Twigs", 7, player);
	HCAddManySameItem("Hydrocraft.HCFircone", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 2, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 14, player);
	HCAddManySameItem("Hydrocraft.HCResin", 2, player);		
end  

function recipe_hccutfirtree6(items, result, player)
	HCAddManySameItem("Base.Log", 3, player);
	HCAddManySameItem("Base.Twigs", 15, player);
	HCAddManySameItem("Hydrocraft.HCFircone", 2, player);
	HCAddManySameItem("Hydrocraft.HCBark", 3, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 19, player);
	HCAddManySameItem("Hydrocraft.HCResin", 3, player);	
end 

function recipe_hccutoaktree3(items, result, player)
	HCAddManySameItem("Base.Log", 0, player);
	HCAddManySameItem("Base.Twigs", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 0, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 4, player);	
end 

function recipe_hccutoaktree4(items, result, player)
	HCAddManySameItem("Base.Log", 1, player);
	HCAddManySameItem("Base.Twigs", 3, player);
	HCAddManySameItem("Hydrocraft.HCAcorn", 0, player);
	HCAddManySameItem("Hydrocraft.HCBark", 1, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 9, player);	
end

function recipe_hccutoaktree5(items, result, player)
	HCAddManySameItem("Base.Log", 2, player);
	HCAddManySameItem("Base.Twigs", 7, player);
	HCAddManySameItem("Hydrocraft.HCAcorn", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 2, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 14, player);	
end  

function recipe_hccutoaktree6(items, result, player)
	HCAddManySameItem("Base.Log", 3, player);
	HCAddManySameItem("Base.Twigs", 15, player);
	HCAddManySameItem("Hydrocraft.HCAcorn", 2, player);
	HCAddManySameItem("Hydrocraft.HCBark", 3, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 19, player);
end 

function recipe_hccutbirchtree3(items, result, player)
	HCAddManySameItem("Base.Log", 0, player);
	HCAddManySameItem("Base.Twigs", 1, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 0, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 4, player);
end 

function recipe_hccutbirchtree4(items, result, player)
	HCAddManySameItem("Base.Log", 1, player);
	HCAddManySameItem("Base.Twigs", 3, player);
	HCAddManySameItem("Hydrocraft.HCBirchcatkin", 0, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 1, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 9, player);	
end

function recipe_hccutbirchtree5(items, result, player)
	HCAddManySameItem("Base.Log", 2, player);
	HCAddManySameItem("Base.Twigs", 7, player);
	HCAddManySameItem("Hydrocraft.HCBirchcatkin", 1, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 2, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 14, player);	
end  

function recipe_hccutbirchtree6(items, result, player)
	HCAddManySameItem("Base.Log", 3, player);
	HCAddManySameItem("Base.Twigs", 15, player);
	HCAddManySameItem("Hydrocraft.HCBirchcatkin", 2, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 3, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 19, player);
end 

--Breaking Dead Stuff

function hcrecipegetpillbox(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCPillbox");
end

function hcammoniamaking(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCChalkpowder");
end

function hcdryammoniarecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.EmptySandbag");
end

function hcfillammoniarecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.BakingTray");
end

function hcextractassrecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCJar");
end

function hcmedicanti_a(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCPetridish");
    inv:AddItem("Hydrocraft.HCPetridish");
end

function hcantidish(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydromancerx.HCPetridish");
end

function hcbluemethrecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.BakingTray");
end

function hcmeth(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCEmptybarrelblue");
    inv:AddItem("Hydrocraft.HCEmptybarrelmetal");
end

--Skinning functions. HCFurClothes.lua was redundant.
function HCSkinRabbit(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        result:setBaseHunger(anim:getBaseHunger() + 0.02);
        result:setHungChange(anim:getBaseHunger() + 0.02);
		getPlayer():getInventory():AddItem("FurClothes.HCAnimalfur");
		getPlayer():getInventory():AddItem("FurClothes.HCAnimalfur");
    end
end

function HCSkinSquirrel(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        result:setBaseHunger(anim:getBaseHunger() + 0.02);
        result:setHungChange(anim:getBaseHunger() + 0.02);
		getPlayer():getInventory():AddItem("FurClothes.AnimalFur");
    end
end

--Pinata Code

function HCPinataBreak(items, result, player)
    HCAddManySameItem("Hydrocraft.HCCandymixed", 0, player);
    HCDoStats(player, 20, 20);
end

--Minor Mundane Boost, like brushing teeth 
function recipe_minorhyienic(items, result, player)
    local boredom = 5;
    local unhappy = 5;
	local stress = 5;
	HCDoStats(player, boredom, unhappy, stress);
end 

--Yossitaru
--Boredom and Unhappiness recipe modifiers.

function HC_ToyStatModifier(items, result, player)
    --Defaults to ten each.
    local boredom = 10;
    local unhappy = 10;
    
    --Combo uses are twenty each.
    if items:size() > 1 then
    boredom = 20;
    unhappy = 20;
    else
        local toy = items:get(0):getType();
    
        --Minus two to both.
        if toy == "HCBaseballglove" or toy == "HCToyglasses" or toy == "HCBowlingpin" then
            boredom = 2;
            unhappy = 2;
        --Two boredom, four unhappy.
        elseif toy == "HCGardengnome" then
            boredom = 2;
            unhappy = 4;
        --Two boredom, six unhappy.
        elseif toy == "Doll" or toy == "HCToydoll" or toy == "HCToydog" or toy == "HCToyoctopus" or toy == "HCToytriceratops" or toy == "HCToytrex" or toy == "HCToystegosaurus" or toy == "HCToypterodactyl" or toy == "HCToybrontosaurus" or toy == "HCToyshark" or toy == "HCToyactionfigure1" or toy == "HCToyactionfigure2" or toy == "HCToyactionfigure3" or toy == "HCToyactionfigure4" or toy == "HCToyarmyman" or toy == "Rubberducky" or toy == "ToyBear" or toy == "HCToyrabbit" or toy == "HCToycat" or toy == "HCToydonkey" or toy == "HCToyhippo" or toy == "HCToymonkey" or toy == "HCToypanda" then
            boredom = 2;
            unhappy = 6;
        --Two boredom, ten unhappy.
        elseif toy == "Spiffo" or toy == "HCToyunicorn" or toy == "HCToydragon" then
            boredom = 2;
            unhappy = 10;
        --Four boredom, two unhappy.
        elseif toy == "HCCaclulator" or toy == "Dice" or toy == "HCToyrings" or toy == "HCToytop" then
            boredom = 4;
            unhappy = 2;
        --Four boredom, six unhappy.
        elseif toy == "CardDeck" then
            boredom = 4;
            unhappy = 6;
        --Six boredom, four unhappy.
        elseif toy == "HCBinoculars" or toy == "HCCammera" or toy == "Yoyo" then
            boredom = 6;
            unhappy = 4;
        --Six boredom, six unhappy.
        elseif toy == "HCLaserpointer" or toy == "HCPaddleball" or toy == "PoolBall" or toy == "HCToyhorse" or toy == "HCToyrobot" then
            boredom = 6;
            unhappy = 6;
        --Six boredom, ten unhappy.
        elseif toy == "HCHarmonica" then
            boredom = 6;
            unhappy = 10;
        --Ten boredom, four unhappy.
        elseif toy == "Bricktoys" or toy == "HCToycar" or toy == "HCToyairplane" or toy == "HCToyship" or toy == "HCToytrain" or toy == "HCToyrocketship" or toy == "HCToyhelicopter" or toy == "HCToydrawing" then
            boredom = 10;
            unhappy = 4;
        --Ten boredom, six unhappy.
        elseif toy == "HCCheckers" then
            boredom = 10;
            unhappy = 6;
        end
    end
    HCDoStats(player, boredom, unhappy);
end

--Changes made to boredom and unhappyness.
function HCDoStats(player, b, u)
	player:getBodyDamage():setBoredomLevel(player:getBodyDamage():getBoredomLevel() - b);
	player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() - u);
end

--Cookie Jar random cookies.
function HCJarCookies(items, result, player)
	local cookie = ZombRand(6);
	local count = ZombRand(10);
	if cookie == 0 then
		HCAddManySameItem("Hydrocraft.HCHomemadecookie", count+1, player);
	elseif cookie == 1 then
		HCAddManySameItem("Hydrocraft.HCChipcookie", count+1, player);
	elseif cookie == 2 then
		HCAddManySameItem("Hydrocraft.HCCookiewhite", count+1, player);
	elseif cookie == 3 then
		HCAddManySameItem("Hydrocraft.HCCookiepeanutbutter", count+1, player);
	elseif cookie == 4 then
		HCAddManySameItem("Hydrocraft.HCChocolatecookie", count+1, player);
	elseif cookie == 5 then
		HCAddManySameItem("Hydrocraft.HCChocolatecookie", count+1, player);
	end
end

--Simple loop for lots of the same item.
function HCAddManySameItem(item, count, player)
	for x=0, count do
		player:getInventory():AddItem(item);
	end
end

function HCHappyTen(items, result, player)
	player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() - 10);
end

--Checking Bowls.
function HCRecipeBowls(items, result, player)
    bowls = 0;
    for x=0, items:size()-1 do
        print(items:get(x):getType());
            if items:get(x):getType() == "HCTacosaucebowl" or items:get(x):getType() == "HCGuacamolebowl" or items:get(x):getType() == "HCSalsabowl" or items:get(x):getType() == "HCNachobowl" or items:get(x):getType() == "HCSpicypaste" or items:get(x):getType() == "HCTomatosaucebowl" or items:get(x):getType() == "HCLemonjuicebowl" or items:get(x):getType() == "HCBBQsaucebowl" then
                    bowls = bowls + 1;
            end
    end
    if bowls > 0 then
        HCAddManySameItem("Base.Bowl", bowls-1, player);
    end
end

--Random Gifts
function HCRandomGiftGet(items, result, player)
giftSet = {"Hydrocraft.HCCoal", "Hydrocraft.HCBaseball", "Hydrocraft.HCBaseballglove", "Hydrocraft.HCBasketball", "Hydrocraft.HCBinoculars", "Hydrocraft.HCBowlingball", "Base.Bricktoys", "Hydrocraft.HCCamera", "Base.CardDeck", "Hydrocraft.HCCalculator", "Hydrocraft.HCCheckers", "Base.Cube", "Base.Doll", "Hydrocraft.HCFrisbee", "Hydrocraft.HCFootball", "Base.Gardengnome", "Hydrocraft.HCGolfball", "Hydrocraft.HCHarmonica", "Hydrocraft.HCLaserpointer", "Hydrocraft.HCPaddleball", "Hydrocraft.HCRubberball", "Base.Rubberducky", "Hydrocraft.HCSoccerball", "Base.Spiffo", "Hydrocraft.HCSoftball", "Base.ToyBear", "Hydrocraft.HCTennisballcontainerfull", "Hydrocraft.HCToycar", "Hydrocraft.HCToyairplane", "Hydrocraft.HCToyrabbit", "Hydrocraft.HCToyrobot", "Hydrocraft.HCToytrain", "Hydrocraft.HCVolleyball", "Hydrocraft.HCWiffleball", "Base.Yoyo", "Hydrocraft.HCToyhippo", "Hydrocraft.HCToymonkey", "Hydrocraft.HCToycat", "Hydrocraft.HCToypanda", "Hydrocraft.HCToytop", "Hydrocraft.HCToydrawing", "Hydrocraft.HCToysterioscope", "Hydrocraft.HCToysterioscopereel", "Hydrocraft.HCCrayonbox", "Hydrocraft.HCVinylrecord1", "Hydrocraft.HCVinylrecord2", "Hydrocraft.HCVinylrecord3", "Hydrocraft.HCVinylrecord4", "Hydrocraft.HCVinylrecord5", "Hydrocraft.HCDVD", "Hydrocraft.HCDVDPlayer", "Base.Book", "Base.Whiskey", "Base.Wine", "Base.Wine2", "Base.Trousers", "Base.Vest", "Base.Shirt", "Base.Blouse", "Base.Socks", "Base.Socks2" , "Base.Shoes", "Base.Skirt", "Base.Belt", "Base.FishingRod", "Base.Headphones", "Base.Disc", "Base.Radio", "Base.Necklacepearl", "Base.Locket", "Base.Earrings", "Base.WeddingRing_Man", "Base.WeddingRing_Woman", "Base.Ring", "Base.DigitalWatch", "Base.Glasses", "Base.Glasses2", "Hydrocraft.HC20dollarbill", "Hydrocraft.HCLavalamp", "Hydrocraft.HCFlashlightoff", "Hydrocraft.HCSantahat", "Hydrocraft.HCCowboyhat", "Hydrocraft.HCTophat", "Hydrocraft.HCMittens", "Hydrocraft.HCSkimask", "Hydrocraft.HCRaincoat", "Hydrocraft.HCBra", "Hydrocraft.HCBra2", "Hydrocraft.HCBra3", "Hydrocraft.HCBra4", "Hydrocraft.HCBra5", "Hydrocraft.HCBriefs", "Hydrocraft.HCBriefs2", "Hydrocraft.HCBriefs3", "Hydrocraft.HCBriefs4", "Hydrocraft.HCBriefs5", "Hydrocraft.HCBriefs6", "Hydrocraft.HCBoxers", "Hydrocraft.HCBoxers2", "Hydrocraft.HCBoxers3", "Hydrocraft.HCBoxers4", "Hydrocraft.HCBoxers5", "Hydrocraft.HCBoxers6", "Hydrocraft.HCPanties", "Hydrocraft.HCPanties2", "Hydrocraft.HCPanties3", "Hydrocraft.HCPanties4", "Hydrocraft.HCPanties5", "Hydrocraft.HCCompass", "Hydrocraft.HCBookbedtime", "Hydrocraft.HCBookfairytale", "Hydrocraft.HCDogwhistle"};
    gift = ZombRand(#giftSet) + 1;
    player:getInventory():AddItem(giftSet[gift]);
end

--Randomized Eggs.
function HCRandomegg(items, result, player)
    local pup = ZombRand(4);
    if pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCSparrowegg");  
	elseif pup == 2 then
       player:getInventory():AddItem("Hydrocraft.HCChickenegg");	   
	elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCGooseegg");
    elseif pup == 0 then
       player:getInventory():AddItem("Base.WildEggs");      
    end
end

--Randomized Dogs. 
function HCDogCall(items, result, player)
    local pup = ZombRand(36);
    if pup == 35 then
        player:getInventory():AddItem("Hydrocraft.HCGoldenfemale");
    elseif pup == 34 then	
        player:getInventory():AddItem("Hydrocraft.HCGoldenmale");
    elseif pup == 33 then	
        player:getInventory():AddItem("Hydrocraft.HCBeaglefemale");
    elseif pup == 32 then
        player:getInventory():AddItem("Hydrocraft.HCBeaglemale");
    elseif pup == 31 then
        player:getInventory():AddItem("Hydrocraft.HCIrishsetterfemale");
    elseif pup == 30 then
        player:getInventory():AddItem("Hydrocraft.HCIrishsettermale");
    elseif pup == 29 then
        player:getInventory():AddItem("Hydrocraft.HCDachshundfemale");
    elseif pup == 28 then
        player:getInventory():AddItem("Hydrocraft.HCDachshundmale");
    elseif pup == 27 then	
        player:getInventory():AddItem("Hydrocraft.HCBordercolliemale");
    elseif pup == 26 then
        player:getInventory():AddItem("Hydrocraft.HCBordercolliefemale");
    elseif pup == 25 then
        player:getInventory():AddItem("Hydrocraft.HCBoxermale");
    elseif pup == 24 then
        player:getInventory():AddItem("Hydrocraft.HCBoxerfemale");
    elseif pup == 23 then
        player:getInventory():AddItem("Hydrocraft.HCColliemale");
    elseif pup == 22 then
        player:getInventory():AddItem("Hydrocraft.HCColliefemale");
    elseif pup == 21 then
        player:getInventory():AddItem("Hydrocraft.HCCorgimale");
    elseif pup == 20 then
        player:getInventory():AddItem("Hydrocraft.HCCorgifemale");
    elseif pup == 19 then
        player:getInventory():AddItem("Hydrocraft.HCDobermanmale");
    elseif pup == 18 then
        player:getInventory():AddItem("Hydrocraft.HCDobermanfemale");
    elseif pup == 17 then
        player:getInventory():AddItem("Hydrocraft.HCGreatdanemale");
    elseif pup == 16 then
       player:getInventory():AddItem("Hydrocraft.HCGreatdanefemale");
    elseif pup == 15 then
        player:getInventory():AddItem("Hydrocraft.HCGermanshepherdmale");
    elseif pup == 14 then
        player:getInventory():AddItem("Hydrocraft.HCGermanshepherdfemale");
    elseif pup == 13 then
        player:getInventory():AddItem("Hydrocraft.HCHeelermale");
    elseif pup == 12 then
        player:getInventory():AddItem("Hydrocraft.HCHeelerfemale");
    elseif pup == 11 then
        player:getInventory():AddItem("Hydrocraft.HCHuskymale");
    elseif pup == 10 then
        player:getInventory():AddItem("Hydrocraft.HCHuskyfemale");
    elseif pup == 9 then
        player:getInventory():AddItem("Hydrocraft.HCLabradormale");
    elseif pup == 8 then
        player:getInventory():AddItem("Hydrocraft.HCLabradorfemale");
    elseif pup == 7 then
        player:getInventory():AddItem("Hydrocraft.HCRottweilermale");
    elseif pup == 6 then
        player:getInventory():AddItem("Hydrocraft.HCRottweilerfemale");
    elseif pup == 5 then
        player:getInventory():AddItem("Hydrocraft.HCShibainumale");
    elseif pup == 4 then
        player:getInventory():AddItem("Hydrocraft.HCShibainufemale");
    elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCPitbullmale");
    elseif pup == 2 then
        player:getInventory():AddItem("Hydrocraft.HCPitbullfemale");
    elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCBernesemale");   
    elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCBernesefemale");      
    end
end

--Randomized Cats. 
function HCCatCall(items, result, player)
    local pup = ZombRand(16);
    if pup == 15 then
        player:getInventory():AddItem("Hydrocraft.HCCatwhitemale");
    elseif pup == 14 then
        player:getInventory():AddItem("Hydrocraft.HCCatwhitefemale");
    elseif pup == 13 then
        player:getInventory():AddItem("Hydrocraft.HCCatsilvermale");
    elseif pup == 12 then
        player:getInventory():AddItem("Hydrocraft.HCCatsilverfemale");
    elseif pup == 11 then
        player:getInventory():AddItem("Hydrocraft.HCCatgingermale");
    elseif pup == 10 then
        player:getInventory():AddItem("Hydrocraft.HCCatgingerfemale");
    elseif pup == 9 then
        player:getInventory():AddItem("Hydrocraft.HCCatcreammale");
    elseif pup == 8 then
        player:getInventory():AddItem("Hydrocraft.HCCatcreamfemale");
    elseif pup == 7 then
        player:getInventory():AddItem("Hydrocraft.HCCatbrownmale");
    elseif pup == 6 then
        player:getInventory():AddItem("Hydrocraft.HCCatbrownfemale");
    elseif pup == 5 then
        player:getInventory():AddItem("Hydrocraft.HCCatbluemale");
    elseif pup == 4 then
        player:getInventory():AddItem("Hydrocraft.HCCatbluefemale");
    elseif pup == 3 then
       player:getInventory():AddItem("Hydrocraft.HCCatblackmale");
    elseif pup == 2 then
        player:getInventory():AddItem("Hydrocraft.HCCatblackfemale");
    elseif pup == 1 then
       player:getInventory():AddItem("Hydrocraft.HCCatmale");   
    elseif pup == 0 then
       player:getInventory():AddItem("Hydrocraft.HCCatfemale");      
    end
end

--Randomized Deer.
function getDeer(items, result, player)
    deer = ZombRand(4);
    if deer == 3 then
        player:getInventory():AddItem("Hydrocraft.HCDeermale");
    elseif deer == 2 then
        player:getInventory():AddItem("Hydrocraft.HCDeerfemale");
    end
end

--Randomized Chicken.
function getChicken(items, result, player)
    chicken = ZombRand(3);
    if chicken == 2 then
        player:getInventory():AddItem("Hydrocraft.HCChickenmalebaby");
    elseif chicken == 1 then
        player:getInventory():AddItem("Hydrocraft.HCChickenfemalebaby");
    elseif chicken == 0 then
        player:getInventory():AddItem("Base.Egg");		
    end
end

--Randomized Pig.
function getPig(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find pigs indoors!");
player:getInventory():AddItem("Hydrocraft.HCPigpoopferal");
player:getInventory():AddItem("Base.Rope");
else
    pig = ZombRand(4);
    if pig == 3 then
        player:getInventory():AddItem("Hydrocraft.HCPigmale");
    elseif pig == 2 then
        player:getInventory():AddItem("Hydrocraft.HCPigfemale");
    end
end
end

--Randomized Baby Pigs.
function getPigBaby(items, result, player)
    weightCount = ZombRand(3);
    count = 0;
    mcount = 0;
    if weightCount == 0 then
        count = 1;
    elseif weightCount <= 1  then
        count = 2;
    elseif weightCount <= 2 then
        count = 3;
    end
	--Randomize gender.
    for x=0, count-1 do
        gender = ZombRand(2);
        if gender == 0 then
            mcount = mcount + 1;
        end
    end
	--Add males to inventory, if any.
    if mcount > 0 then
        HCAddManySameItem("Hydrocraft.HCPigmalebaby", mcount-1, player);
    end
	--Add females to inventory, if any.
    if mcount < count then
        HCAddManySameItem("Hydrocraft.HCPigfemalebaby", (count-mcount)-1, player);
    end;
	
		player:getInventory():AddItem("Hydrocraft.HCPigmaletired");
end

--Randomized Sheep.
function getSheep(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find sheep indoors!");
player:getInventory():AddItem("Hydrocraft.HCSheeppoopferal");
player:getInventory():AddItem("Base.Rope");
else
    sheep = ZombRand(4);
    if sheep == 3 then
        player:getInventory():AddItem("Hydrocraft.HCSheepmale");
    elseif sheep == 2 then
        player:getInventory():AddItem("Hydrocraft.HCSheepfemale");
    end
end
end

--Randomized Baby Sheep.
function getSheepBaby(items, result, player)	
		local sheep = ZombRand(1,2);
		if sheep == 1 then
			player:getInventory():AddItem("Hydrocraft.HCSheepmalebaby");
		elseif sheep == 0 then
			player:getInventory():AddItem("Hydrocraft.HCSheepfemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCSheepmaletired");
end

--Randomized Goat.
function getGoat(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find anything indoors!");
player:getInventory():AddItem("Hydrocraft.HCGoatpoopferal");
player:getInventory():AddItem("Base.Rope");
else
    sheep = ZombRand(4);
    if sheep == 3 then
        player:getInventory():AddItem("Hydrocraft.HCGoatmale");
    elseif sheep == 2 then
        player:getInventory():AddItem("Hydrocraft.HCGoatfemale");
    end
end
end

--Randomized Baby Goat.
function getGoatBaby(items, result, player)	
		local goat = ZombRand(1,2);
		if goat == 1 then
			player:getInventory():AddItem("Hydrocraft.HCGoatmalebaby");
		elseif goat == 0 then
			player:getInventory():AddItem("Hydrocraft.HCGoatfemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCGoatmaletired");
end

--Randomized Cow.
function getCow(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find anything indoors!");
player:getInventory():AddItem("Hydrocraft.HCCowpoopferal");
player:getInventory():AddItem("Base.Rope");
else
    cow = ZombRand(4);
    if cow == 3 then
        player:getInventory():AddItem("Hydrocraft.HCCowmale");
    elseif cow == 2 then
        player:getInventory():AddItem("Hydrocraft.HCCowfemale");
    end
end
end

--Randomized Baby Cow.
function getCowBaby(items, result, player)	
		local cow = ZombRand(2);
		if cow == 1 then
			player:getInventory():AddItem("Hydrocraft.HCCowmalebaby");
		elseif cow == 0 then
			player:getInventory():AddItem("Hydrocraft.HCCowfemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCCowmaletired");
		
end

--Randomized Donkey.
function getDonkey(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find anything indoors!");
player:getInventory():AddItem("Hydrocraft.HCDonkeypoopferal");
player:getInventory():AddItem("Base.Rope");
else
    donkey = ZombRand(4);
    if donkey == 3 then
        player:getInventory():AddItem("Hydrocraft.HCDonkeymale");
    elseif donkey == 2 then
        player:getInventory():AddItem("Hydrocraft.HCDonkeyfemale");
    end
end
end

--Randomized Baby Donkey.
function getDonkeyBaby(items, result, player)
		local donkey = ZombRand(2);
		if donkey == 1 then
			player:getInventory():AddItem("Hydrocraft.HCDonkeymalebaby");
		elseif donkey == 0 then
			player:getInventory():AddItem("Hydrocraft.HCDonkeyfemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCDonkeymaletired");
end

--Randomized Horse.
function getHorse(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find anything indoors!");
player:getInventory():AddItem("Hydrocraft.HCHorsepoopferal");
player:getInventory():AddItem("Base.Rope");
else
    horse = ZombRand(4);
    if horse == 3 then
        player:getInventory():AddItem("Hydrocraft.HCHorsemale");
    elseif horse == 2 then
        player:getInventory():AddItem("Hydrocraft.HCHorsefemale");
    end
end
end

--Randomized Baby Horse.
function getHorseBaby(items, result, player)
		local horse = ZombRand(2);
		if horse == 1 then
			player:getInventory():AddItem("Hydrocraft.HCHorsemalebaby");
		elseif horse == 0 then
			player:getInventory():AddItem("Hydrocraft.HCHorsefemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCHorsemaletired");
end

--Randomized Silk Moth.
function getSilkmoth(items, result, player)
    silkmoth = ZombRand(4);
    if silkmoth == 3 then
        player:getInventory():AddItem("Hydrocraft.HCSilkmothmale");
    elseif silkmoth == 2 then
        player:getInventory():AddItem("Hydrocraft.HCSilkmothfemale");
    end
end

--Randomized Baby Rabbits.
function HCRabbitGet(items, result, player)
    weightCount = ZombRand(56);
    count = 0;
    mcount = 0;
    if weightCount == 0 then
        count = 1;
    elseif weightCount <= 2  then
        count = 2;
    elseif weightCount <= 5 then
        count = 3;
    elseif weightCount <= 9 then
        count = 4;
    elseif weightCount <= 14 then
        count = 5;
    elseif weightCount <= 20 then
        count = 6;
    elseif weightCount <= 27 then
        count = 7;
    elseif weightCount <= 34 then
        count = 8;
    elseif weightCount <= 40 then
        count = 9;
    elseif weightCount <= 45 then
        count = 10;
    elseif weightCount <= 49 then
        count = 11;
    elseif weightCount <= 52 then
        count = 12;
    elseif weightCount <= 54 then
        count = 13;
    elseif weightCount == 55 then
        count = 14;
    end
	--Randomize gender.
    for x=0, count-1 do
        gender = ZombRand(2);
        if gender == 0 then
            mcount = mcount + 1;
        end
    end
	--Add males to inventory, if any.
    if mcount > 0 then
        HCAddManySameItem("Hydrocraft.HCRabbitmale", mcount-1, player);
    end
	--Add females to inventory, if any.
    if mcount < count then
        HCAddManySameItem("Hydrocraft.HCRabbitfemale", (count-mcount)-1, player);
    end
end

--Dig With Shoe
function hcdigshoe(items, result, player)
    local digshoe = ZombRand(8);
    if digshoe == 7 then
        player:getInventory():AddItem("Hydrocraft.HCGrass");
    elseif digshoe == 6 then		
        player:getInventory():AddItem("Base.Twigs");
    elseif digshoe == 5 then	
        player:getInventory():AddItem("Hydrocraft.HCDirt");
    elseif digshoe == 4 then
        player:getInventory():AddItem("Hydrocraft.HCGreyclay");
    elseif digshoe == 3 then
       player:getInventory():AddItem("Base.Stone");
    elseif digshoe == 2 then
        player:getInventory():AddItem("Base.SharpedStone");
    elseif digshoe == 1 then
       player:getInventory():AddItem("Hydrocraft.HCZombiebones");   
    elseif digshoe == 0 then
       player:getInventory():AddItem("Base.Worm");      
    end
end

--Arrows and Bolts in Corpses
function BoltsArrows.arrowBoltHit(wielder, char, weapon)
    w = weapon:getType();
    i = char:getInventory();
    add = false;
    
	--80% chance of recovery.
    if ZombRand(10) > 1 then
        add = true;
    end
    --Initialize bolt count.
    if BoltsArrows.SBolts[i] == nil then
        BoltsArrows.SBolts[i] = 0;
    end
    --Initialize arrow count.
    if BoltsArrows.SArrows[i] == nil then
        BoltsArrows.SArrows = 0;
    end
    --Count recovered bolts and arrows.
    if w == "HCCrossbow" and add then
        BoltsArrows.SBolts[i] = BoltsArrows.SBolts[i] + 1;
    elseif w == "HCLongbow" and add then
        BoltsArrows.SArrows[i] = BoltsArrows.SArrows[i] + 1;
    end
end

function BoltsArrows.arrowBoltSpawn(roomName, containerName, containerID)
    if BoltsArrows.SBolts[containerID] ~= nil and BoltsArrows.SBolts[containerID] > 0 then
        for x = 0, BoltsArrows.SBolts[containerID] - 1 do
            containerID:AddItem("Hydrocraft.HCXbowbolt");
        end
    end
    if BoltsArrows.SArrows[containerID] ~= nil and BoltsArrows.SArrows[containerID] > 0 then
        for x = 0, BoltsArrows.SArrows[containerID] - 1 do
            containerID:addItem("Hydrocraft.HCArrow");
        end
    end
end


-- Events.OnWeaponHitCharacter.Add(BoltsArrows.arrowBoltHit);
Events.OnFillContainer.Add(BoltsArrows.arrowBoltSpawn);




