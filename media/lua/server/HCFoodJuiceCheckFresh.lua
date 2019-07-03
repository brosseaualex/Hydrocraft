-- ***********************************************************
-- **	              DemolitionDerby 2019              	**
-- **		         Juice OnTest Functions					**
-- ***********************************************************

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
