
function hcdismantlemicro(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.ElectronicsScrap");
    inv:AddItem("Base.SheetMetal");
end

function hcgetscrap(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.ElectronicsScrap");
    inv:AddItem("Base.Wire");
end

function hcgetdynamo(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCDynamo");
end

function hcjunksearchsmall(items, result, player)
    local metal = ZombRand(208);
		
    if metal == 207 then
		player:getInventory():AddItem("Hydrocraft.HCCereal2trash");
    elseif metal == 206 then	
		player:getInventory():AddItem("Hydrocraft.HCCereal3trash");
    elseif metal == 205 then		
		player:getInventory():AddItem("Hydrocraft.HCEvaporatedmilkopenempty");
    elseif metal == 204 then	
		player:getInventory():AddItem("Hydrocraft.HCMilkjugempty");
    elseif metal == 203 then
		player:getInventory():AddItem("Hydrocraft.HCMilkjugchocolateempty");
    elseif metal == 202 then	
		player:getInventory():AddItem("Hydrocraft.HCCookieschocolatechipbagtrash");
    elseif metal == 201 then
		player:getInventory():AddItem("Hydrocraft.HCCookiesmintbagtrash");
    elseif metal == 200 then
		player:getInventory():AddItem("Hydrocraft.HCCookiesbrowniebagtrash");
    elseif metal == 199 then	
		player:getInventory():AddItem("Hydrocraft.HCPuddingcupempty");
    elseif metal == 198 then
		player:getInventory():AddItem("Hydrocraft.HCWhippedcreamcanempty");
    elseif metal == 197 then	
		player:getInventory():AddItem("Hydrocraft.HCPop6trash");
    elseif metal == 196 then	
		player:getInventory():AddItem("Hydrocraft.HCCoffeelargeempty");
    elseif metal == 195 then
		player:getInventory():AddItem("Hydrocraft.HCCannedspaghettiringsopenempty");
    elseif metal == 194 then
		player:getInventory():AddItem("Hydrocraft.HCCannedravioliopenempty");
    elseif metal == 193 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpiefillingblueberryopenempty");
    elseif metal == 192 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpiefillingcherryopenempty");
    elseif metal == 191 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpiefillingappleopenempty");
    elseif metal == 190 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedmacncheeseopenempty");
    elseif metal == 189 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentporkopenempty");
    elseif metal == 188 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentchickenopenempty");
    elseif metal == 187 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentbreadopenempty");
    elseif metal == 186 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentbeefopenempty");
    elseif metal == 185 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedfruitcocktailopenempty");
    elseif metal == 184 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedchickenbreastopenempty");
    elseif metal == 183 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedcheesesauceopenempty");
    elseif metal == 183 then	
		player:getInventory():AddItem("Hydrocraft.HCCanbangedupopenempty");
    elseif metal == 182 then	
		player:getInventory():AddItem("Hydrocraft.HCRamenchickentrash");
    elseif metal == 181 then	
		player:getInventory():AddItem("Hydrocraft.HCRamenbeeftrash");
    elseif metal == 180 then	
		player:getInventory():AddItem("Hydrocraft.HCRamenshrimptrash");
    elseif metal == 179 then		
		player:getInventory():AddItem("Hydrocraft.HCRamencheesetrash");
    elseif metal == 178 then	
		player:getInventory():AddItem("Hydrocraft.HCBabyfoodjar");
    elseif metal == 177 then	
		player:getInventory():AddItem("Hydrocraft.HCBeercan");
    elseif metal == 176 then	
		player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 175 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassshards");
    elseif metal == 174 then		
		player:getInventory():AddItem("Hydrocraft.HCPlasticstraw");
    elseif metal == 173 then	
		player:getInventory():AddItem("Hydrocraft.HCNapkindirty");
    elseif metal == 172 then		
		player:getInventory():AddItem("Hydrocraft.HCValve");
    elseif metal == 171 then	
		player:getInventory():AddItem("Hydrocraft.HCTray");
    elseif metal == 170 then	
		player:getInventory():AddItem("Hydrocraft.HCTray2");
    elseif metal == 169 then	
		player:getInventory():AddItem("Hydrocraft.HCPlasticcoffeespoon");
    elseif metal == 168 then	
		player:getInventory():AddItem("Hydrocraft.HCPlasticplate");
    elseif metal == 167 then	
		player:getInventory():AddItem("Hydrocraft.HCPlasticplate2");
    elseif metal == 166 then	
		player:getInventory():AddItem("Hydrocraft.HCPlasticcup");
    elseif metal == 165 then	
		player:getInventory():AddItem("Hydrocraft.HCPlastcsknife");
    elseif metal == 164 then	
		player:getInventory():AddItem("Hydrocraft.HCPlastcspoon");
    elseif metal == 163 then
		player:getInventory():AddItem("Hydrocraft.HCPlastcfork");
    elseif metal == 162 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassbottleethanolempty");
    elseif metal == 161 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassbottleammoniaempty");
    elseif metal == 160 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassbottleh2o2empty");
    elseif metal == 159 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassbottlemethylaminempty");
    elseif metal == 158 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassbottlephenylempty");
    elseif metal == 157 then	
		player:getInventory():AddItem("Hydrocraft.HCGlassbottlesulfuricacidempty");
    elseif metal == 156 then		
		player:getInventory():AddItem("Hydrocraft.HCEyedropperbottle");
    elseif metal == 155 then			
		player:getInventory():AddItem("Hydrocraft.HCLicenceplate");
    elseif metal == 154 then		
		player:getInventory():AddItem("Hydrocraft.HCScotchtapeempty");
    elseif metal == 153 then	
		player:getInventory():AddItem("Hydrocraft.HCWoodglueempty");
    elseif metal == 152 then	
		player:getInventory():AddItem("Hydrocraft.HCGlueempty");
    elseif metal == 151 then	
		player:getInventory():AddItem("Hydrocraft.HCVinegarempty");
    elseif metal == 150 then	
		player:getInventory():AddItem("Hydrocraft.HCSugarempty");
    elseif metal == 149 then	
		player:getInventory():AddItem("Hydrocraft.HCRiceempty");
    elseif metal == 148 then	
		player:getInventory():AddItem("Hydrocraft.HCFlourempty");
    elseif metal == 147 then	
		player:getInventory():AddItem("Hydrocraft.HCOatsempty");
    elseif metal == 146 then	
		player:getInventory():AddItem("Hydrocraft.HCCerealtrash");
    elseif metal == 145 then	
		player:getInventory():AddItem("Hydrocraft.HCIcecreamempty");
    elseif metal == 144 then	
		player:getInventory():AddItem("Hydrocraft.HCYoghurtempty");
    elseif metal == 143 then	
		player:getInventory():AddItem("Hydrocraft.HCMilkempty");
    elseif metal == 142 then	
		player:getInventory():AddItem("Hydrocraft.HCKetchupempty");
    elseif metal == 141 then	
		player:getInventory():AddItem("Hydrocraft.HCMustardempty");
    elseif metal == 140 then	
		player:getInventory():AddItem("Hydrocraft.HCTVDinnerpackage");
    elseif metal == 139 then	
		player:getInventory():AddItem("Hydrocraft.HCMintcandytrash");
    elseif metal == 138 then		
		player:getInventory():AddItem("Hydrocraft.HCPeanutbutterjarempty");
    elseif metal == 137 then	
		player:getInventory():AddItem("Hydrocraft.HCChocolatetrash");
    elseif metal == 136 then
		player:getInventory():AddItem("Hydrocraft.HCChocolatedarktrash");
    elseif metal == 135 then
		player:getInventory():AddItem("Hydrocraft.HCChocolatewhitetrash");
    elseif metal == 134 then
		player:getInventory():AddItem("Hydrocraft.HCTrailmixtrash");
    elseif metal == 133 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedappleempty");
    elseif metal == 132 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpearempty");
    elseif metal == 131 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpeachempty");
    elseif metal == 130 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgreenbeansempty");
    elseif metal == 129 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedmushroomsempty");
    elseif metal == 128 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpumpkinempty");
    elseif metal == 127 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedspamempty");
    elseif metal == 126 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedcranberriesempty");
    elseif metal == 125 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpineappleempty");
    elseif metal == 124 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedrefriedbeansempty");
    elseif metal == 123 then		
		player:getInventory():AddItem("Hydrocraft.HCCannedsoupclassicempty");
    elseif metal == 122 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedchiliempty");
    elseif metal == 121 then
		player:getInventory():AddItem("Hydrocraft.HCCannedbologneseempty");
    elseif metal == 120 then
		player:getInventory():AddItem("Hydrocraft.HCDogfoodempty");
    elseif metal == 119 then
		player:getInventory():AddItem("Hydrocraft.HCTunatinempty");
    elseif metal == 118 then
		player:getInventory():AddItem("Hydrocraft.HCTinnedsoupempty");
    elseif metal == 117 then
		player:getInventory():AddItem("Hydrocraft.HCBeansempty");
    elseif metal == 116 then
		player:getInventory():AddItem("Hydrocraft.HCCannedcarrotsempty");
    elseif metal == 115 then
		player:getInventory():AddItem("Hydrocraft.HCCannedtomatoempty");
    elseif metal == 114 then
		player:getInventory():AddItem("Hydrocraft.HCCannedsardinesempty");
    elseif metal == 113 then
		player:getInventory():AddItem("Hydrocraft.HCCannedpotatoempty");
    elseif metal == 112 then
		player:getInventory():AddItem("Hydrocraft.HCCannedpeasempty");
    elseif metal == 111 then
		player:getInventory():AddItem("Hydrocraft.HCCannedmushroomsoupempty");
    elseif metal == 110 then
		player:getInventory():AddItem("Hydrocraft.HCCannedcornempty");
    elseif metal == 109 then
		player:getInventory():AddItem("Hydrocraft.HCCannedcornedbeefempty");
    elseif metal == 108 then	
		player:getInventory():AddItem("Hydrocraft.HCPoptrash");
    elseif metal == 107 then
		player:getInventory():AddItem("Hydrocraft.HCPop2trash");
    elseif metal == 106 then	
		player:getInventory():AddItem("Hydrocraft.HCPop3trash");
    elseif metal == 105 then
		player:getInventory():AddItem("Hydrocraft.HCPop4trash");
    elseif metal == 104 then
		player:getInventory():AddItem("Hydrocraft.HCPop5trash");
    elseif metal == 103 then	
		player:getInventory():AddItem("Hydrocraft.HCCrispstrash");
    elseif metal == 102 then	
		player:getInventory():AddItem("Hydrocraft.HCCrisps2trash");
    elseif metal == 101 then	
		player:getInventory():AddItem("Hydrocraft.HCCrisps3trash");
    elseif metal == 100 then	
		player:getInventory():AddItem("Hydrocraft.HCCrisps4trash");
    elseif metal == 99 then		
		player:getInventory():AddItem("Hydrocraft.HCCrisps5trash");
    elseif metal == 98 then	
		player:getInventory():AddItem("Hydrocraft.HCCrisps6trash");
    elseif metal == 97 then	
		player:getInventory():AddItem("Hydrocraft.HCCrisps7trash");
    elseif metal == 96 then		
		player:getInventory():AddItem("Hydrocraft.HCCrisps8trash");
    elseif metal == 95 then
		player:getInventory():AddItem("Hydrocraft.HCCrisps9trash");
    elseif metal == 94 then	
		player:getInventory():AddItem("Hydrocraft.HCEnergydrinktrash");
    elseif metal == 93 then		
		player:getInventory():AddItem("Hydrocraft.HCEnergydrink2trash");
    elseif metal == 92 then	
		player:getInventory():AddItem("Hydrocraft.HCCandycorntrash");
    elseif metal == 91 then	
		player:getInventory():AddItem("Hydrocraft.HCCandymnmtrash");
    elseif metal == 90 then		
		player:getInventory():AddItem("Hydrocraft.HCCandyrainbowtrash");
    elseif metal == 89 then	
		player:getInventory():AddItem("Hydrocraft.HCGummybearstrash");
    elseif metal == 88 then	
		player:getInventory():AddItem("Hydrocraft.HCGummywormstrash");
    elseif metal == 87 then		
		player:getInventory():AddItem("Hydrocraft.HCJellybeanstrash");
    elseif metal == 86 then	
		player:getInventory():AddItem("Hydrocraft.HCTaffytrash");
    elseif metal == 85 then	
		player:getInventory():AddItem("Hydrocraft.HCGumtrash");
    elseif metal == 84 then		
		player:getInventory():AddItem("Hydrocraft.HCGum2trash");
    elseif metal == 83 then	
		player:getInventory():AddItem("Hydrocraft.HCGum3trash");
    elseif metal == 82 then	
		player:getInventory():AddItem("Hydrocraft.HCGumsticktrash");
    elseif metal == 81 then		
		player:getInventory():AddItem("Hydrocraft.Book");
    elseif metal == 80 then		
		player:getInventory():AddItem("Hydrocraft.HCPaintcan");
    elseif metal == 78 then		
		player:getInventory():AddItem("Hydrocraft.HCColoredwire");
    elseif metal == 77 then		
		player:getInventory():AddItem("Hydrocraft.HCElectronicparts04");
    elseif metal == 76 then		
		player:getInventory():AddItem("Hydrocraft.HCElectronicparts03");
    elseif metal == 75 then	
		player:getInventory():AddItem("Hydrocraft.HCElectronicparts02");
    elseif metal == 74 then	
		player:getInventory():AddItem("Hydrocraft.HCElectronicparts01");
    elseif metal == 73 then	
		player:getInventory():AddItem("Hydrocraft.HCCircuitboarduseless");
    elseif metal == 72 then	
	player:getInventory():AddItem("Hydrocraft.HCElectronicpartsbroken");
    elseif metal == 71 then
		player:getInventory():AddItem("Hydrocraft.HCMysteryseedspacket");
    elseif metal == 70 then
		player:getInventory():AddItem("Base.Glasses2");
    elseif metal == 69 then
		player:getInventory():AddItem("Base.Rainboots");
    elseif metal == 68 then
		player:getInventory():AddItem("Base.Needle");
    elseif metal == 67 then
		player:getInventory():AddItem("Base.CDplayer");
    elseif metal == 66 then
		player:getInventory():AddItem("Base.JarLid");
    elseif metal == 65 then
		player:getInventory():AddItem("Hydrocraft.HCDustpan");
    elseif metal == 64 then
		player:getInventory():AddItem("Hydrocraft.HCBinderclip");
    elseif metal == 63 then
		player:getInventory():AddItem("Hydrocraft.HCFolder");
    elseif metal == 62 then
		player:getInventory():AddItem("Hydrocraft.HCThumbtack");
    elseif metal == 61 then
		player:getInventory():AddItem("Hydrocraft.HCFilmcanister");
    elseif metal == 60 then	
		player:getInventory():AddItem("Hydrocraft.HCRubberhose");
    elseif metal == 59 then
		player:getInventory():AddItem("Hydrocraft.HCWeldinghose");
    elseif metal == 58 then
		player:getInventory():AddItem("Hydrocraft.HCBungeecord");
    elseif metal == 57 then
		player:getInventory():AddItem("Hydrocraft.HCBandanna");
    elseif metal == 56 then
		player:getInventory():AddItem("Hydrocraft.HCSewingpin");
    elseif metal == 55 then
		player:getInventory():AddItem("Hydrocraft.HCSafetypin");
    elseif metal == 54 then
		player:getInventory():AddItem("Hydrocraft.HCBathtoweldirty");
    elseif metal == 53 then
		player:getInventory():AddItem("Hydrocraft.HCClothespin");
    elseif metal == 52 then	
		player:getInventory():AddItem("Hydrocraft.HCWoodhanger");
    elseif metal == 51 then
		player:getInventory():AddItem("Hydrocraft.HCWirehanger");
    elseif metal == 50 then
		player:getInventory():AddItem("Hydrocraft.HCPlastichanger");
    elseif metal == 49 then
		player:getInventory():AddItem("Base.Headphones");
    elseif metal == 48 then
		player:getInventory():AddItem("Hydrocraft.HCBookcover");
    elseif metal == 47 then
		player:getInventory():AddItem("Hydrocraft.HCRazorblade");
    elseif metal == 46 then
		player:getInventory():AddItem("Hydrocraft.HCTampon");
    elseif metal == 45 then
		player:getInventory():AddItem("Hydrocraft.HCMenstrualpadDirty");
    elseif metal == 44 then
		player:getInventory():AddItem("Hydrocraft.HCDiaperDirty");
    elseif metal == 43 then
		player:getInventory():AddItem("Hydrocraft.HCDeodorantspray");
    elseif metal == 42 then	
		player:getInventory():AddItem("Hydrocraft.HCDeodorantstick");
    elseif metal == 41 then
		player:getInventory():AddItem("Hydrocraft.HCChapstick");
    elseif metal == 40 then
		player:getInventory():AddItem("Hydrocraft.HCWashclothwet");
    elseif metal == 39 then
		player:getInventory():AddItem("Hydrocraft.HCQtip");
    elseif metal == 38 then
		player:getInventory():AddItem("Hydrocraft.HCHairdryer");
    elseif metal == 37 then
		player:getInventory():AddItem("Hydrocraft.HCHubcap");
    elseif metal == 36 then
		player:getInventory():AddItem("Hydrocraft.HCSparkplug");
    elseif metal == 35 then
		player:getInventory():AddItem("Hydrocraft.HCAirfreshener");
    elseif metal == 34 then
		player:getInventory():AddItem("Hydrocraft.HCBatterylargedead");
    elseif metal == 33 then
		player:getInventory():AddItem("Hydrocraft.HCBatterymediumdead");
    elseif metal == 32 then
		player:getInventory():AddItem("Hydrocraft.HCBatteryempty");
    elseif metal == 31 then
	    player:getInventory():AddItem("Hydrocraft.HCBatterysmalldead");
    elseif metal == 30 then
	    player:getInventory():AddItem("Base.VideoGame");
    elseif metal == 29 then
	    player:getInventory():AddItem("Base.KitchenKnife");
    elseif metal == 28 then
	    player:getInventory():AddItem("Base.Hairspray");
    elseif metal == 27 then
	    player:getInventory():AddItem("Base.CordlessPhone");
    elseif metal == 26 then
	    player:getInventory():AddItem("Base.Hammer");
    elseif metal == 25 then
	    player:getInventory():AddItem("Base.Aluminum");
    elseif metal == 24 then
	    player:getInventory():AddItem("Base.Screws");
    elseif metal == 23 then
	    player:getInventory():AddItem("Base.LetterOpener");
    elseif metal == 22 then
	    player:getInventory():AddItem("Base.Sparklers");
    elseif metal == 21 then
        player:getInventory():AddItem("Base.Tissue");
    elseif metal == 20 then
        player:getInventory():AddItem("Base.ScrapMetal");
    elseif metal == 19 then
        player:getInventory():AddItem("Base.RubberBand");
    elseif metal == 18 then
        player:getInventory():AddItem("Base.ToyCar");
    elseif metal == 17 then
        player:getInventory():AddItem("Base.WeddingRing_Woman");
    elseif metal == 16 then
        player:getInventory():AddItem("Base.Coldpack");
    elseif metal == 15 then
        player:getInventory():AddItem("Base.Paperclip");
    elseif metal == 14 then
        player:getInventory():AddItem("Base.EmptySandbag");
    elseif metal == 13 then
        player:getInventory():AddItem("Base.BathTowelWet");
    elseif metal == 12 then
        player:getInventory():AddItem("Base.Fork");
    elseif metal == 11 then
        player:getInventory():AddItem("Base.TentPeg");
    elseif metal == 10 then
        player:getInventory():AddItem("Base.Spoon");
    elseif metal == 9 then
        player:getInventory():AddItem("Base.Button");
    elseif metal == 8 then
        player:getInventory():AddItem("Base.Newspaper");
    elseif metal == 7 then
        player:getInventory():AddItem("Hydrocraft.HCSyringeempty");
    elseif metal == 6 then
        player:getInventory():AddItem("Base.WhiskeyEmpty");
    elseif metal == 5 then
        player:getInventory():AddItem("Base.ElectronicsScrap");
    elseif metal == 4 then
        player:getInventory():AddItem("Base.Wire");
    elseif metal == 3 then
        player:getInventory():AddItem("Base.RippedSheetsDirty");
    elseif metal == 2 then
        player:getInventory():AddItem("Base.LightBulb");
    elseif metal == 1 then
        player:getInventory():AddItem("Base.SheetPaper");
    elseif metal == 0 then
        player:getInventory():AddItem("Base.Wire");
    end
end

function hcjunksearchmedium(items, result, player)
    local metal = ZombRand(91);
    
    if metal == 90 then
	    player:getInventory():AddItem("Base.EngineParts");
    elseif metal == 89 then
	    player:getInventory():AddItem("Base.ModernCarMuffler1");
    elseif metal == 88 then
	    player:getInventory():AddItem("Base.ModernCarMuffler2");
    elseif metal == 87 then
	    player:getInventory():AddItem("Base.ModernCarMuffler3");
    elseif metal == 86 then
	    player:getInventory():AddItem("Base.NormalCarMuffler1");
    elseif metal == 85 then
	    player:getInventory():AddItem("Base.NormalCarMuffler2");
    elseif metal == 84 then
	    player:getInventory():AddItem("Base.NormalCarMuffler3");
    elseif metal == 83 then
	    player:getInventory():AddItem("Base.OldCarMuffler1");
    elseif metal == 82 then
	    player:getInventory():AddItem("Base.OldCarMuffler2");
    elseif metal == 81 then	
	    player:getInventory():AddItem("Base.OldCarMuffler3");
    elseif metal == 80 then
	    player:getInventory():AddItem("Base.GloveBox1");
    elseif metal == 79 then
	    player:getInventory():AddItem("Base.GloveBox2");
    elseif metal == 78 then
	    player:getInventory():AddItem("Base.GloveBox3");
    elseif metal == 77 then	
	    player:getInventory():AddItem("Base.CarBattery1");
    elseif metal == 76 then
	    player:getInventory():AddItem("Base.CarBattery2");
    elseif metal == 75 then	
	    player:getInventory():AddItem("Base.CarBattery3");
    elseif metal == 74 then
	    player:getInventory():AddItem("Base.BigGasTank1");
    elseif metal == 73 then
	    player:getInventory():AddItem("Base.BigGasTank2");
    elseif metal == 72 then
	    player:getInventory():AddItem("Base.BigGasTank3");
    elseif metal == 71 then	
	    player:getInventory():AddItem("Base.NormalGasTank1");
    elseif metal == 70 then
	    player:getInventory():AddItem("Base.NormalGasTank2");
    elseif metal == 69 then
	    player:getInventory():AddItem("Base.NormalGasTank3");
    elseif metal == 68 then
	    player:getInventory():AddItem("Base.SmallGasTank1");
    elseif metal == 67 then
	    player:getInventory():AddItem("Base.SmallGasTank2");		
    elseif metal == 66 then
	    player:getInventory():AddItem("Base.SmallGasTank3");
    elseif metal == 65 then		
	    player:getInventory():AddItem("Base.ModernSuspension1");
    elseif metal == 64 then
	    player:getInventory():AddItem("Base.ModernSuspension2");
    elseif metal == 63 then
	    player:getInventory():AddItem("Base.ModernSuspension3");
    elseif metal == 62 then
	    player:getInventory():AddItem("Base.NormalSuspension1");
    elseif metal == 61 then
	    player:getInventory():AddItem("Base.NormalSuspension2");
    elseif metal == 60 then
	    player:getInventory():AddItem("Base.NormalSuspension3");
    elseif metal == 59 then	
	    player:getInventory():AddItem("Base.ModernBrake1");
    elseif metal == 58 then
	    player:getInventory():AddItem("Base.ModernBrake2");
    elseif metal == 57 then	
	    player:getInventory():AddItem("Base.ModernBrake3");
    elseif metal == 56 then
	    player:getInventory():AddItem("Base.NormalBrake1");
    elseif metal == 55 then
	    player:getInventory():AddItem("Base.NormalBrake2");
    elseif metal == 54 then
	    player:getInventory():AddItem("Base.NormalBrake3");
    elseif metal == 53 then		
	    player:getInventory():AddItem("Base.OldBrake1");
    elseif metal == 52 then
	    player:getInventory():AddItem("Base.OldBrake2");
    elseif metal == 51 then
	    player:getInventory():AddItem("Base.OldBrake3");
    elseif metal == 50 then
	    player:getInventory():AddItem("Base.CarBatteryCharger");
    elseif metal == 49 then	
		player:getInventory():AddItem("Base.OldTire1");
    elseif metal == 48 then	
		player:getInventory():AddItem("Base.OldTire2");
    elseif metal == 47 then	
		player:getInventory():AddItem("Base.OldTire3");
    elseif metal == 46 then	
		player:getInventory():AddItem("Base.NormalTire1");
    elseif metal == 45 then	
		player:getInventory():AddItem("Base.NormalTire2");
    elseif metal == 44 then
		player:getInventory():AddItem("Base.NormalTire3");
    elseif metal == 43 then		
		player:getInventory():AddItem("Base.ModernTire1");
    elseif metal == 42 then	
		player:getInventory():AddItem("Base.ModernTire2");
    elseif metal == 41 then	
		player:getInventory():AddItem("Base.ModernTire3");		
    elseif metal == 40 then	
		player:getInventory():AddItem("Hydrocraft.HCDrillcordless");
    elseif metal == 39 then		
		player:getInventory():AddItem("Hydrocraft.HCComputerPSU");
    elseif metal == 38 then		
	    player:getInventory():AddItem("Hydrocraft.HCLever");
    elseif metal == 37 then		
	    player:getInventory():AddItem("Hydrocraft.HCBicyclewheel");
    elseif metal == 36 then	
	    player:getInventory():AddItem("Hydrocraft.HCWiper");
    elseif metal == 35 then
	    player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 34 then	
	    player:getInventory():AddItem("Hydrocraft.HCRotor");
    elseif metal == 33 then
	    player:getInventory():AddItem("Hydrocraft.HCRadiator");
    elseif metal == 32 then
	    player:getInventory():AddItem("Hydrocraft.HCOilfilter");
    elseif metal == 31 then
	    player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 30 then
	    player:getInventory():AddItem("Hydrocraft.HCFanbelt");
    elseif metal == 29 then
	    player:getInventory():AddItem("Hydrocraft.HCDrumbreak");
    elseif metal == 28 then
	    player:getInventory():AddItem("Hydrocraft.HCClutch");
    elseif metal == 27 then
	    player:getInventory():AddItem("Hydrocraft.HCCamshaft");
    elseif metal == 26 then
	    player:getInventory():AddItem("Hydrocraft.HCBreakpads");
    elseif metal == 25 then
	    player:getInventory():AddItem("Hydrocraft.HCAirfilter");
    elseif metal == 24 then	
	    player:getInventory():AddItem("Hydrocraft.OldTire1");
    elseif metal == 23 then
        player:getInventory():AddItem("Hydrocraft.HCChain");
    elseif metal == 22 then
        player:getInventory():AddItem("Hydrocraft.HCDynamo");
    elseif metal == 21 then
        player:getInventory():AddItem("Hydrocraft.HCChickenwire");
    elseif metal == 20 then
        player:getInventory():AddItem("Base.Pipe");
    elseif metal == 19 then
        player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    elseif metal == 18 then
        player:getInventory():AddItem("Base.Speaker");
    elseif metal == 17 then
        player:getInventory():AddItem("Base.Kettle");
    elseif metal == 16 then
        player:getInventory():AddItem("Hydrocraft.HCMetalbox");
    elseif metal == 15 then
        player:getInventory():AddItem("Hydrocraft.UmbrellaClosed");
    elseif metal == 14 then
        player:getInventory():AddItem("Hydrocraft.HCCooler");
    elseif metal == 13 then
        player:getInventory():AddItem("Hydrocraft.HCMag");
    elseif metal == 12 then
        player:getInventory():AddItem("Base.Pot");
    elseif metal == 11 then
        player:getInventory():AddItem("Base.BakingPan");
    elseif metal == 10 then
        player:getInventory():AddItem("Hydrocraft.HCPowercord");
    elseif metal == 9 then
        player:getInventory():AddItem("Hydrocraft.HCTennisracket");
    elseif metal == 8 then
        player:getInventory():AddItem("Hydrocraft.HCJuicer2");
    elseif metal == 7 then
        player:getInventory():AddItem("Hydrocraft.HCToaster");
    elseif metal == 6 then
        player:getInventory():AddItem("Hydrocraft.HCBlenderdead");
    elseif metal == 5 then
        player:getInventory():AddItem("Hydrocraft.HCRicecookerdead");
    elseif metal == 4 then
        player:getInventory():AddItem("Hydrocraft.HCXmaslights");
    elseif metal == 3 then
        player:getInventory():AddItem("Hydrocraft.HCPlasticbin");
    elseif metal == 2 then
        player:getInventory():AddItem("Hydrocraft.HCPlasticbin2");
    elseif metal == 1 then
        player:getInventory():AddItem("Hydrocraft.HCRaccoonfemale");
    elseif metal == 0 then
        player:getInventory():AddItem("Hydrocraft.HCRaccoonmale");
    end
end


function hcjunksearchlarge(items, result, player)
    local metal = ZombRand(59);
    
    if metal == 58 then
	    player:getInventory():AddItem("Base.SportCarSeat1");
    elseif metal == 57 then	
	    player:getInventory():AddItem("Base.SportCarSeat2");
    elseif metal == 56 then	
	    player:getInventory():AddItem("Base.SportCarSeat3");
    elseif metal == 55 then	
	    player:getInventory():AddItem("Base.BigCarSeat1");
    elseif metal == 54 then	
	    player:getInventory():AddItem("Base.BigCarSeat2");
    elseif metal == 53 then	
	    player:getInventory():AddItem("Base.BigCarSeat3");
    elseif metal == 52 then		
	    player:getInventory():AddItem("Base.NormalCarSeat1");
    elseif metal == 51 then	
	    player:getInventory():AddItem("Base.NormalCarSeat2");
    elseif metal == 50 then	
	    player:getInventory():AddItem("Base.NormalCarSeat3");
    elseif metal == 49 then		
	    player:getInventory():AddItem("Base.TrunkDoor1");
    elseif metal == 48 then	
	    player:getInventory():AddItem("Base.TrunkDoor2");
    elseif metal == 47 then	
	    player:getInventory():AddItem("Base.TrunkDoor3");
    elseif metal == 46 then		
	    player:getInventory():AddItem("Base.EngineDoor1");
    elseif metal == 45 then	
	    player:getInventory():AddItem("Base.EngineDoor2");
    elseif metal == 44 then	
	    player:getInventory():AddItem("Base.EngineDoor3");
    elseif metal == 43 then		
	    player:getInventory():AddItem("Base.RearCarDoorDouble1");
    elseif metal == 42 then	
	    player:getInventory():AddItem("Base.RearCarDoorDouble2");
    elseif metal == 41 then	
	    player:getInventory():AddItem("Base.RearCarDoorDouble3");
    elseif metal == 40 then	
	    player:getInventory():AddItem("Base.RearCarDoor1");
    elseif metal == 39 then	
	    player:getInventory():AddItem("Base.RearCarDoor2");
    elseif metal == 38 then	
	    player:getInventory():AddItem("Base.RearCarDoor3");
    elseif metal == 37 then	
	    player:getInventory():AddItem("Base.FrontCarDoor1");
    elseif metal == 36 then	
	    player:getInventory():AddItem("Base.FrontCarDoor2");
    elseif metal == 35 then		
	    player:getInventory():AddItem("Base.FrontCarDoor3");
    elseif metal == 34 then	
	    player:getInventory():AddItem("Base.BigTrunk1");
    elseif metal == 33 then	
	    player:getInventory():AddItem("Base.BigTrunk2");
    elseif metal == 32 then	
	    player:getInventory():AddItem("Base.BigTrunk3");
    elseif metal == 31 then	
	    player:getInventory():AddItem("Base.NormalTrunk1");
    elseif metal == 30 then	
	    player:getInventory():AddItem("Base.NormalTrunk2");
    elseif metal == 29 then	
	    player:getInventory():AddItem("Base.NormalTrunk3");
    elseif metal == 28 then	
	    player:getInventory():AddItem("Base.SmallTrunk1");
    elseif metal == 27 then	
	    player:getInventory():AddItem("Base.SmallTrunk2");
    elseif metal == 26 then	
	    player:getInventory():AddItem("Base.SmallTrunk3");
    elseif metal == 25 then		
	    player:getInventory():AddItem("Hydrocraft.HCComputer");
    elseif metal == 24 then	
        player:getInventory():AddItem("Hydrocraft.HCBarrelblueempty");
    elseif metal == 23 then	
        player:getInventory():AddItem("Hydrocraft.HCSteelbeam");
    elseif metal == 22 then
        player:getInventory():AddItem("Hydrocraft.HCRaftrubber");
    elseif metal == 21 then
        player:getInventory():AddItem("Hydrocraft.HCJunkmicro");
    elseif metal == 20 then
        player:getInventory():AddItem("Hydrocraft.HCSteelpipe");
    elseif metal == 19 then
        player:getInventory():AddItem("Base.SheetMetal");
    elseif metal == 18 then
        player:getInventory():AddItem("Hydrocraft.HCLargesheetmetal");
    elseif metal == 17 then
        player:getInventory():AddItem("Hydrocraft.HCBarrelmetalempty");
    elseif metal == 16 then
        player:getInventory():AddItem("Hydrocraft.HCJunkbicycle");
    elseif metal == 15 then
        player:getInventory():AddItem("Hydrocraft.HCSteelsheet");
    elseif metal == 14 then
        player:getInventory():AddItem("Hydrocraft.HCSteelsheetlarge");
    elseif metal == 13 then
        player:getInventory():AddItem("Hydrocraft.HCJunkmicro");
    elseif metal == 12 then
        player:getInventory():AddItem("Hydrocraft.HCFishtank");
    elseif metal == 11 then
        player:getInventory():AddItem("Hydrocraft.HCVacuum");
    elseif metal == 10 then
        player:getInventory():AddItem("Hydrocraft.HCVac");
    elseif metal == 9 then
        player:getInventory():AddItem("Hydrocraft.HCShopvac");
    elseif metal == 8 then
        player:getInventory():AddItem("Hydrocraft.HCPrinter");
    elseif metal == 7 then
        player:getInventory():AddItem("Hydrocraft.HCComputermonitor");
    elseif metal == 6 then
        player:getInventory():AddItem("Hydrocraft.HCFaxmachine");
    elseif metal == 5 then
        player:getInventory():AddItem("Hydrocraft.HCScaner");
    elseif metal == 4 then
        player:getInventory():AddItem("Hydrocraft.HCShoppingcart");
    elseif metal == 3 then
        player:getInventory():AddItem("Hydrocraft.HCToywagon");
    elseif metal == 2 then
        player:getInventory():AddItem("Hydrocraft.HCIcechest");
    elseif metal == 1 then
        player:getInventory():AddItem("Hydrocraft.HCPropanetankempty");
    elseif metal == 0 then
        player:getInventory():AddItem("Base.EmptyPetrolCan");
    end
end

function hcjunksearchmagnet(items, result, player)
    local metal = ZombRand(10);
    
    if metal == 9 then
	    player:getInventory():AddItem("Hydrocraft.HCWaterheater");
	elseif metal == 8 then
	    player:getInventory():AddItem("Hydrocraft.HCBedsprings");
	elseif metal == 7 then
	    player:getInventory():AddItem("Hydrocraft.HCRadiator2");
	elseif metal == 6 then	
	    player:getInventory():AddItem("Hydrocraft.HCJunkdryer");
	elseif metal == 5 then
        player:getInventory():AddItem("Hydrocraft.HCJunktv");
	elseif metal == 4 then
        player:getInventory():AddItem("Hydrocraft.HCJunkfridge");	
    elseif metal == 3 then
        player:getInventory():AddItem("Hydrocraft.HCJunktredmill");
    elseif metal == 2 then
        player:getInventory():AddItem("Hydrocraft.HCJunkwash");
    elseif metal == 1 then
        player:getInventory():AddItem("Hydrocraft.HCJunkbicycle");
    elseif metal == 0 then
        player:getInventory():AddItem("Hydrocraft.HCBarrelmetalempty");
    end
    
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCBatteryhugedead");

end

-- Randomize findings for scavange.
function hcmetalsearch(items, result, player)
    local metal = ZombRand(134);

    if metal == 133 then
		player:getInventory():AddItem("Hydrocraft.HCWhippedcreamcanempty");
    elseif metal == 132 then	
		player:getInventory():AddItem("Hydrocraft.HCPop6trash");
    elseif metal == 131 then	
		player:getInventory():AddItem("Hydrocraft.HCCoffeelargeempty");
    elseif metal == 130 then
		player:getInventory():AddItem("Hydrocraft.HCCannedspaghettiringsopenempty");
    elseif metal == 129 then
		player:getInventory():AddItem("Hydrocraft.HCCannedravioliopenempty");
    elseif metal == 128 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpiefillingblueberryopenempty");
    elseif metal == 127 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpiefillingcherryopenempty");
    elseif metal == 126 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedpiefillingappleopenempty");
    elseif metal == 125 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedmacncheeseopenempty");
    elseif metal == 124 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentporkopenempty");
    elseif metal == 123 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentchickenopenempty");
    elseif metal == 122 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentbreadopenempty");
    elseif metal == 121 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedgovermentbeefopenempty");
    elseif metal == 120 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedfruitcocktailopenempty");
    elseif metal == 119 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedchickenbreastopenempty");
    elseif metal == 118 then	
		player:getInventory():AddItem("Hydrocraft.HCCannedcheesesauceopenempty");
    elseif metal == 117 then	
		player:getInventory():AddItem("Hydrocraft.HCCanbangedupopenempty");
    elseif metal == 116 then		
		player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 115 then
		player:getInventory():AddItem("Base.EngineParts");
    elseif metal == 114 then
		player:getInventory():AddItem("Base.TirePump");
    elseif metal == 113 then
		player:getInventory():AddItem("Base.LugWrench");
    elseif metal == 112 then
		player:getInventory():AddItem("Base.Spanner");
    elseif metal == 111 then
		player:getInventory():AddItem("Base.Jack");
    elseif metal == 110 then	
		player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 109 then			
	    player:getInventory():AddItem("Hydrocraft.HCSawcircularblade"); 
    elseif metal == 108 then	
	    player:getInventory():AddItem("Hydrocraft.HCChiselhead"); 
    elseif metal == 107 then		
	    player:getInventory():AddItem("Hydrocraft.HCLever"); 
    elseif metal == 106 then	
	    player:getInventory():AddItem("Hydrocraft.HCIcesaw"); 
    elseif metal == 105 then	
	    player:getInventory():AddItem("Hydrocraft.HCInkroller"); 
    elseif metal == 104 then		
	    player:getInventory():AddItem("Hydrocraft.HCGlasscutter"); 
    elseif metal == 103 then		
	    player:getInventory():AddItem("Hydrocraft.HCPipebender"); 
    elseif metal == 102 then				
	    player:getInventory():AddItem("Hydrocraft.HCPitchfork"); 
    elseif metal == 101 then		
	    player:getInventory():AddItem("Hydrocraft.HCValve"); 
    elseif metal == 100 then		
	    player:getInventory():AddItem("Hydrocraft.HCPaintcan"); 
    elseif metal == 99 then	
	    player:getInventory():AddItem("Base.Lighter"); 
    elseif metal == 98 then
	    player:getInventory():AddItem("Base.Torch"); 
    elseif metal == 97 then
	    player:getInventory():AddItem("Base.CDplayer"); 
    elseif metal == 96 then
	    player:getInventory():AddItem("Base.DigitalWatch"); 
    elseif metal == 95 then
	    player:getInventory():AddItem("Base.VideoGame"); 
    elseif metal == 94 then
	    player:getInventory():AddItem("Hydrocraft.HCIronore"); 
    elseif metal == 93 then
	    player:getInventory():AddItem("Hydrocraft.HCMeteorite"); 
    elseif metal == 92 then
	    player:getInventory():AddItem("Hydrocraft.HCMagnetite"); 
    elseif metal == 91 then
	    player:getInventory():AddItem("Base.ElectronicsScrap"); 
    elseif metal == 90 then
	    player:getInventory():AddItem("Hydrocraft.HCChain"); 
    elseif metal == 89 then
        player:getInventory():AddItem("Hydrocraft.HCMeatcleaver"); 
    elseif metal == 88 then
        player:getInventory():AddItem("Base.Battery"); 
    elseif metal == 87 then
        player:getInventory():AddItem("Hydrocraft.HCBattery9volt"); 
    elseif metal == 86 then
        player:getInventory():AddItem("Hydrocraft.HCBatteryhuge"); 
    elseif metal == 85 then
        player:getInventory():AddItem("Hydrocraft.HCBatterylarge"); 
    elseif metal == 84 then
        player:getInventory():AddItem("Hydrocraft.HCBatterymedium"); 
    elseif metal == 83 then
        player:getInventory():AddItem("Hydrocraft.HCBatterysmall"); 
    elseif metal == 82 then
        player:getInventory():AddItem("Hydrocraft.HCCalculator"); 
    elseif metal == 81 then
        player:getInventory():AddItem("Hydrocraft.HCBoxcutter"); 
    elseif metal == 80 then
        player:getInventory():AddItem("Base.BlowTorch"); 
    elseif metal == 79 then
        player:getInventory():AddItem("Base.WeldingMask"); 
    elseif metal == 78 then
        player:getInventory():AddItem("Hydrocraft.HCWeldingtank"); 
    elseif metal == 77 then
        player:getInventory():AddItem("Hydrocraft.HCFuelcanister"); 
    elseif metal == 76 then
        player:getInventory():AddItem("Hydrocraft.HCPickaxe"); 
    elseif metal == 75 then
        player:getInventory():AddItem("Hydrocraft.HCNailgunammo"); 
    elseif metal == 74 then
        player:getInventory():AddItem("Hydrocraft.HCPortableminingmachine"); 
    elseif metal == 73 then
        player:getInventory():AddItem("Hydrocraft.HCDrillhead"); 
    elseif metal == 72 then
        player:getInventory():AddItem("Hydrocraft.HCDogwhistle"); 
    elseif metal == 71 then	
        player:getInventory():AddItem("Base.Sledgehammer"); 
    elseif metal == 70 then
        player:getInventory():AddItem("Base.Padlock"); 
    elseif metal == 69 then
        player:getInventory():AddItem("Base.JarLid"); 
    elseif metal == 68 then
        player:getInventory():AddItem("Hydrocraft.UmbrellaClosed"); 
    elseif metal == 67 then
        player:getInventory():AddItem("Hydrocraft.HCChickenwire"); 
    elseif metal == 66 then
        player:getInventory():AddItem("Hydrocraft.HCTincan"); 
    elseif metal == 65 then
        player:getInventory():AddItem("Hydrocraft.HCShears"); 
    elseif metal == 64 then
        player:getInventory():AddItem("Hydrocraft.HCDustpan"); 
    elseif metal == 63 then
        player:getInventory():AddItem("Hydrocraft.HCCopperpipe"); 
    elseif metal == 62 then
        player:getInventory():AddItem("Hydrocraft.HCSteelpipe"); 
    elseif metal == 61 then	
        player:getInventory():AddItem("Hydrocraft.HCCombatknife"); 
    elseif metal == 60 then
        player:getInventory():AddItem("Hydrocraft.HCMachete"); 
    elseif metal == 59 then
        player:getInventory():AddItem("Hydrocraft.HCSurvivalaxe"); 
    elseif metal == 58 then
        player:getInventory():AddItem("Hydrocraft.HCMetalbox"); 
    elseif metal == 57 then
        player:getInventory():AddItem("Hydrocraft.HCLunchbox"); 
    elseif metal == 56 then
        player:getInventory():AddItem("Hydrocraft.HCMedicalbox"); 
    elseif metal == 55 then
        player:getInventory():AddItem("Hydrocraft.HCWirehanger"); 
    elseif metal == 54 then
        player:getInventory():AddItem("Hydrocraft.HCHarmonica"); 
    elseif metal == 53 then
        player:getInventory():AddItem("Hydrocraft.HCMonkeywrench"); 
    elseif metal == 52 then
        player:getInventory():AddItem("Hydrocraft.HCAuger"); 
    elseif metal == 51 then
        player:getInventory():AddItem("Hydrocraft.HCColander"); 
    elseif metal == 50 then	
        player:getInventory():AddItem("Hydrocraft.HCBottleopener"); 
    elseif metal == 49 then
        player:getInventory():AddItem("Hydrocraft.HCHedgetrimmer"); 
    elseif metal == 48 then	
        player:getInventory():AddItem("Hydrocraft.HCRake"); 
    elseif metal == 47 then		
        player:getInventory():AddItem("Hydrocraft.HCToolbox"); 
    elseif metal == 46 then		
        player:getInventory():AddItem("Hydrocraft.HCJackknife"); 
    elseif metal == 45 then		
        player:getInventory():AddItem("Hydrocraft.HCRustyshards"); 
    elseif metal == 44 then		
        player:getInventory():AddItem("Hydrocraft.HCTennisracket"); 
    elseif metal == 43 then		
        player:getInventory():AddItem("Hydrocraft.HCAluminiumbat"); 
    elseif metal == 42 then		
        player:getInventory():AddItem("Hydrocraft.HCPliers"); 
    elseif metal == 41 then		
        player:getInventory():AddItem("Base.Tongs"); 
    elseif metal == 40 then			
        player:getInventory():AddItem("Hydrocraft.HCBatterysmalldead"); 
    elseif metal == 39 then		
        player:getInventory():AddItem("Hydrocraft.HCBatterymediumdead"); 
    elseif metal == 38 then		
        player:getInventory():AddItem("Hydrocraft.HCBatterylargedead"); 
    elseif metal == 37 then		
        player:getInventory():AddItem("Hydrocraft.HCBarrelmetalempty"); 
    elseif metal == 36 then		
        player:getInventory():AddItem("Hydrocraft.HCBrokenmicro"); 
    elseif metal == 35 then	
        player:getInventory():AddItem("Hydrocraft.HCJunkbicycle"); 
    elseif metal == 34 then	
        player:getInventory():AddItem("Hydrocraft.HCCablecopper"); 
    elseif metal == 33 then	
        player:getInventory():AddItem("Hydrocraft.HCWrench"); 
    elseif metal == 32 then	
        player:getInventory():AddItem("Base.Scissors"); 
    elseif metal == 31 then	
        player:getInventory():AddItem("Base.Axe"); 
    elseif metal == 30 then	
        player:getInventory():AddItem("Base.Golfclub"); 
    elseif metal == 29 then	
        player:getInventory():AddItem("Base.Crowbar"); 
    elseif metal == 28 then	
        player:getInventory():AddItem("Base.Tweezers"); 
    elseif metal == 27 then	
        player:getInventory():AddItem("farming.Shovel"); 
    elseif metal == 26 then	
	     player:getInventory():AddItem("farming.HandShovel"); 
    elseif metal == 25 then
        player:getInventory():AddItem("farming.WateredCan"); 
    elseif metal == 24 then
        player:getInventory():AddItem("farming.GardeningSprayEmpty"); 		
    elseif metal == 23 then
        player:getInventory():AddItem("Base.HuntingKnife"); 
    elseif metal == 22 then
        player:getInventory():AddItem("Base.SheetMetal");
    elseif metal == 21 then
        player:getInventory():AddItem("Base.Pipe");
    elseif metal == 20 then
        player:getInventory():AddItem("Base.Earrings");
    elseif metal == 19 then
        player:getInventory():AddItem("Base.Ring");
    elseif metal == 18 then
        player:getInventory():AddItem("Base.WeddingRing_Man");
    elseif metal == 17 then
        player:getInventory():AddItem("Base.WeddingRing_Woman");
    elseif metal == 16 then
        player:getInventory():AddItem("Base.Extinguisher");
    elseif metal == 15 then
        player:getInventory():AddItem("Base.Doorknob");
    elseif metal == 14 then
        player:getInventory():AddItem("Base.Hinge");
    elseif metal == 13 then
        player:getInventory():AddItem("Base.Saw");
    elseif metal == 12 then
        player:getInventory():AddItem("Base.Hammer");
    elseif metal == 11 then
        player:getInventory():AddItem("Base.Screwdriver");
    elseif metal == 10 then
        player:getInventory():AddItem("Base.308Bullets");
    elseif metal == 9 then
        player:getInventory():AddItem("Base.223Bullets");
    elseif metal == 8 then
        player:getInventory():AddItem("Base.ShotgunShells");
    elseif metal == 7 then
        player:getInventory():AddItem("Base.Bullets9mm");
    elseif metal == 6 then
        player:getInventory():AddItem("Base.CombinationPadlock");
    elseif metal == 5 then
        player:getInventory():AddItem("Base.Needle");
    elseif metal == 4 then
        player:getInventory():AddItem("Base.Wire");
    elseif metal == 3 then
        player:getInventory():AddItem("Base.BarbedWire");
    elseif metal == 2 then
        player:getInventory():AddItem("Base.Screws");
    elseif metal == 1 then
        player:getInventory():AddItem("Base.Nails");
    elseif metal == 0 then
        player:getInventory():AddItem("Base.Paperclip");
    end
end