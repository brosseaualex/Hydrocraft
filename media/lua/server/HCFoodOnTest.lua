-- ***********************************************************
-- **	              DemolitionDerby 2019              	**
-- **			      Food OnTest Functions					**
-- ***********************************************************

-- ****** FOOD ONTEST START ******

--Food Cookies OnTest

function RemoveCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCHomemadecookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveChocolateChipCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCChipcookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveWhiteChocolateCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCookiewhitetray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemovePeanutButterCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCookiepeanutbuttertray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveChocolateCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCChocolatecookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveDoubleChocolateCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDoublechocolatecookietray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveGingerbreadManCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCGingerbreadmantray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveChristmasCookies_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCChristmascookietray" then
        return sourceItem:isCooked()
    end
    return true
end

-- Food Jello OnTest

function RemoveAppleJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJelloappleprep" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveBlueberryJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJelloblueberryprep" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveCherryJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJellocherryprep" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveLemonJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJellolemonprep" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveOrangeJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJelloorangeprep" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveLimeJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJellolimeprep" then
        return sourceItem:isCooked()
    end
    return true
end
function RemoveWatermelonJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJellowatermelonprep" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveStrawberryJello_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJellostrawberryprep" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Pizza OnTest

function CutBoringPizza_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCBoringpizza" then
        return sourceItem:isCooked()
    end
    return true
end

function CutHCSimplePizza_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCSimplepizza" then
        return sourceItem:isCooked()
    end
    return true
end

function CutTastyPizza_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCTastypizza" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Flour OnTest

function RemovePumpkinBread_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPumpkinbreadpan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveRaisinBread_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCRaisinbreadpan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveCornBread_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCornbreadpan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemovePancakeFromPan_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPancakeshomemadepan" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Pastry OnTest

function RemoveHoneyBun_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCHoneybuntray" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveCupcakes_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCupcakeshomemadepan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveFruitCake_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCFruitcakepan" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Pies OnTest

function RemoveApplePie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPieapplepan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveBlueberryPie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPieblueberrypan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemovePeachPie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPiepeachpan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemovePearPie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPiepearpan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemovePumpkinPie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPiepumpkinpan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveCherryPie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPiecherrypan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveBlackberryPie_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCPieblackberrypan" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveQuiche_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCQuichepan" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Dried Fruits OnTest

function StoreDriedApples_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedapplestray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedPeach_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedpeachtray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedOrange_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedorangetray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedLemon_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedlemontray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedLime_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedlimetray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedBanana_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedbananachipstray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedStrawberry_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedstrawberrytray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedBerries_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedberriestray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedTomato_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedtomatotray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedPumpkinSeeds_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedpumpkinseedstray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedRaisins_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedrasinstray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedCrasins_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedcrasinstray" then
        return sourceItem:isCooked()
    end
    return true
end

function StoreDriedFruits_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCDriedfruittray" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Jam OnTest

function MakeGrapeJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamgrapepot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeAppleJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamapplepot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeOrangeJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamorangepot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakePeachJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJampeachpot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakePearJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJampearpot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeWatermelonJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamwatermelonpot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakePineappleJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJampineapplepot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeCherryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamcherrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeStrawberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamstrawberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeBlueberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamblueberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeBlackberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamblackberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeWildberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamwildberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeHuckleberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamhuckleberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeCranberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamcranberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

function MakeRaspberryJam_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJamraspberrypot" then
        return sourceItem:isCooked()
    end
    return true
end

--Food Jarred Fruits OnTest

function MakeAppleSauce_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredapplepot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarWatermelon_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredmelonpot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarApple_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredapplepot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarPeach_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredpeachpot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarAppleSauce_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredapplesaucepot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarOrange_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredorangepot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarLemons_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredlemonpot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarLimes_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredlimepot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarGrapes_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredgrapespot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarBerries_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCJarredberriespot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarLemonCurd_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCurdlemonpot" then
        return sourceItem:isCooked()
    end
    return true
end

function JarLimeCurd_CheckIfCooked(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCCurdlimepot" then
        return sourceItem:isCooked()
    end
    return true
end

-- ****** FOOD ONTEST END ******

-- ****** JUICES ONTEST START ******

function MakeLimeJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.HCLime" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeLemonJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Hydrocraft.Lemon" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeAppleJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Apple" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeCarrotJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Carrots" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeGrapeJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Grapes" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeOrangeJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Orange" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeStrawberryJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Strewberrie" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeTomatoJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Tomato" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeWatermelonFullJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Watermelon" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeWatermelonSliceJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "WatermelonSliced" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeWatermelonSmashedJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "WatermelonSmashed" then
        return sourceItem:isFresh()
    end
    return true
end

function MakePineappleJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Pineapple" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryBlueJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryBlue" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryBlackJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryBlack" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryGeneric1Juice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryGeneric1" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryGeneric2Juice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryGeneric2" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryGeneric3Juice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryGeneric3" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryGeneric4Juice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryGeneric4" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeBerryGeneric5Juice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "BerryGeneric5" then
        return sourceItem:isFresh()
    end
    return true
end

function MakeCherryJuice_CheckIfFresh(sourceItem, result)
    if sourceItem:getFullType() == "Cherry" then
        return sourceItem:isFresh()
    end
    return true
end

-- ****** JUICES ONTEST END ******