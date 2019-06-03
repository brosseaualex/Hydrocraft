-----------------------------------------------------------------------
--                        Project Farmoid                            --
--                  ORIGINAL CODE BY ROBERT JOHNSON                  --
--                        Adapted by Kurogo                          --
-----------------------------------------------------------------------


trellis_vegetableconf = {};

function getNbOfSeed(nbOfSeed, typeOfVine, container)
	local result = 0;
	for i = 0, container:getItems():size() - 1 do
		local item = container:getItems():get(i);
		if item:getType() == typeOfVine then
			result = result + nbOfSeed;
		end
	end
	return result;
end

function getVegetablesNumber(min, max, minAutorized, maxAutorized, vine)
	local healthModifier = math.floor((vine.health - 50) /10);
	if healthModifier < 0 then
		healthModifier = 0;
    end

    local vegModifier = 0;
    if SandboxVars.PlantAbundance == 1 then
        vegModifier = -4;
    elseif SandboxVars.PlantAbundance == 2 then
        vegModifier = -2;
    elseif SandboxVars.PlantAbundance == 4 then
        vegModifier = 3;
    elseif SandboxVars.PlantAbundance == 5 then
        vegModifier = 5;
    end

	local minV = min + healthModifier + vegModifier;
	local maxV = max + healthModifier + vegModifier;
	if minV > (minAutorized + vegModifier) then
		minV = minAutorized + vegModifier;
	end
	if maxV > (maxAutorized  + vegModifier) then
		maxV = maxAutorized + vegModifier;
	end
	local nbOfVegetable = ZombRand(minV, maxV + 1);
	local aphidModifier = math.floor(vine.aphidLvl/10);
	nbOfVegetable = nbOfVegetable - aphidModifier;
	return nbOfVegetable;
end


function calcNextGrowing(nextGrowing, nextTime)
	if nextGrowing then
		return nextGrowing;
	end
    if SandboxVars.Farming == 1 then
        nextTime = nextTime / 3;
    end
    if SandboxVars.Farming == 2 then
        nextTime = nextTime / 1.5;
    end
    if SandboxVars.Farming == 4 then
        nextTime = nextTime * 1.5;
    end
    if SandboxVars.Farming == 5 then
        nextTime = nextTime * 3;
    end
	return trellisFarming.hoursElapsed + nextTime;
end

function growNext(vineplanting, typeOfTile, nameOfTile, nextGrowing, howManyTime)
	vineplanting.nextGrowing = calcNextGrowing(nextGrowing, howManyTime)
	vineplanting:setObjectName(nameOfTile)
	vineplanting:setSpriteName(typeOfTile)
	return vineplanting
end

trellis_vegetableconf.calcWater = function(waterMin, waterLvl)
	if waterLvl and waterMin then
		if waterLvl >= waterMin then
			return 0;
		elseif waterLvl >= math.floor(waterMin /  1.10) then
			return waterMin - waterLvl;
		elseif waterLvl >= math.floor(waterMin /  1.30) then
			return -1;
		else
			return -2;
		end
	else
		return 0;
	end
end

trellis_vegetableconf.calcDisease = function(diseaseLvl)
	if diseaseLvl > 0 then
		if diseaseLvl < 10 then
			return 0;
		elseif diseaseLvl < 30 then
			return diseaseLvl;
		elseif diseaseLvl < 60 then
			return -1;
		else
			return -2;
		end
	end
	return 0;
end


trellis_vegetableconf.getObjectName = function(vine)
	if vine.state == "trellised" then return getText("Farming_Trellised_Land") end
	if vine.state == "destroy" then return getText("Farming_Destroyed") .. " " .. getText("Farming_" .. vine.typeOfSeed) end
	if vine.state == "dry" then return getText("Farming_Receding") .. " " .. getText("Farming_" .. vine.typeOfSeed) end
	if vine.state == "rotten" then return getText("Farming_Rotten") .. " " .. getText("Farming_" .. vine.typeOfSeed) end
	if vine.nbOfVineGrow < 1 then
		return getText("Farming_Seedling") .. " " .. getText("Farming_" ..vine.typeOfSeed);
	elseif vine.nbOfVineGrow == 1 then
		return getText("Farming_" ..vine.typeOfSeed) .. " " .. getText("Farming_Sprout");
	elseif vine.nbOfVineGrow <= 4 then
		return getText("Farming_Young") .. " " .. getText("Farming_" ..vine.typeOfSeed);
	elseif vine.nbOfVineGrow == 5 then
        if vine.typeOfSeed == "Bean" or vine.typeOfSeed == "BellPepper" or vine.typeOfSeed == "Eggplant" or vine.typeOfSeed == "Grape" or vine.typeOfSeed == "Pea" then
            return getText("Farming_Ready_for_Harvest") .. " " .. getText("Farming_" ..vine.typeOfSeed);
        end
	elseif vine.nbOfVineGrow == 6 then
		return getText("Farming_Seed-bearing") .. " " .. getText("Farming_" ..vine.typeOfSeed);
	end
	return "Mystery vine"
end

trellis_vegetableconf.getSpriteName = function(vine)
	if vine.state == "trellised" then return "TrellisStart" end
	if vine.nbOfVineGrow < 1 then
		return trellis_vegetableconf.sprite[vine.typeOfSeed][1]	
	elseif vine.nbOfVineGrow <= 4 then
		return trellis_vegetableconf.sprite[vine.typeOfSeed][1 + vine.nbOfVineGrow]
	elseif vine.nbOfVineGrow == 5 then
		return trellis_vegetableconf.sprite[vine.typeOfSeed][6]
	elseif vine.nbOfVineGrow == 6 then
		return trellis_vegetableconf.sprite[vine.typeOfSeed][7]
	else
		return trellis_vegetableconf.sprite[vine.typeOfSeed][8]
	end
end


trellis_vegetableconf.growBean = function(vineplanting, nextGrowing, updateNbOfGrow)
	local nbOfVineGrow = vineplanting.nbOfVineGrow;
	local water = trellis_vegetableconf.calcWater(vineplanting.waterNeeded, vineplanting.waterLvl);
	local waterMax = trellis_vegetableconf.calcWater(vineplanting.waterLvl, vineplanting.waterNeededMax);
	local diseaseLvl = trellis_vegetableconf.calcDisease(vineplanting.mildewLvl);
	if nbOfVineGrow == 0 then
		vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		vineplanting.waterNeeded = 70;
	elseif (nbOfVineGrow == 1) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow <= 4) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 5) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 6) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
			vineplanting.hasSeed = true;
		else
			badVine(water, waterMax, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (vineplanting.state ~= "rotten") then
		trellisFarming.rottenThis(vineplanting);
	end
	return vineplanting;
end


trellis_vegetableconf.growBellPepper = function(vineplanting, nextGrowing, updateNbOfGrow)
	local nbOfVineGrow = vineplanting.nbOfVineGrow;
	local water = trellis_vegetableconf.calcWater(vineplanting.waterNeeded, vineplanting.waterLvl);
	local waterMax = trellis_vegetableconf.calcWater(vineplanting.waterLvl, vineplanting.waterNeededMax);
	local diseaseLvl = trellis_vegetableconf.calcDisease(vineplanting.mildewLvl);
	if nbOfVineGrow == 0 then
		vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		vineplanting.waterNeeded = 70;
	elseif (nbOfVineGrow == 1) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow <= 4) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 5) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 6) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
			vineplanting.hasSeed = true;
		else
			badVine(water, waterMax, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (vineplanting.state ~= "rotten") then
		trellisFarming.rottenThis(vineplanting);
	end
	return vineplanting;
end


trellis_vegetableconf.growEggplant = function(vineplanting, nextGrowing, updateNbOfGrow)
	local nbOfVineGrow = vineplanting.nbOfVineGrow;
	local water = trellis_vegetableconf.calcWater(vineplanting.waterNeeded, vineplanting.waterLvl);
	local waterMax = trellis_vegetableconf.calcWater(vineplanting.waterLvl, vineplanting.waterNeededMax);
	local diseaseLvl = trellis_vegetableconf.calcDisease(vineplanting.mildewLvl);
	if nbOfVineGrow == 0 then
		vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		vineplanting.waterNeeded = 70;
	elseif (nbOfVineGrow == 1) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow <= 4) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 5) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 6) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
			vineplanting.hasSeed = true;
		else
			badVine(water, waterMax, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (vineplanting.state ~= "rotten") then
		trellisFarming.rottenThis(vineplanting);
	end
	return vineplanting;
end


trellis_vegetableconf.growGrape = function(vineplanting, nextGrowing, updateNbOfGrow)
	local nbOfVineGrow = vineplanting.nbOfVineGrow;
	local water = trellis_vegetableconf.calcWater(vineplanting.waterNeeded, vineplanting.waterLvl);
	local waterMax = trellis_vegetableconf.calcWater(vineplanting.waterLvl, vineplanting.waterNeededMax);
	local diseaseLvl = trellis_vegetableconf.calcDisease(vineplanting.mildewLvl);
	if nbOfVineGrow == 0 then 
		vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		vineplanting.waterNeeded = 70;
	elseif (nbOfVineGrow == 1) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow <= 4) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 5) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 6) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
			vineplanting.hasSeed = true;
		else
			badVine(water, waterMax, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (vineplanting.state ~= "rotten") then
		trellisFarming.rottenThis(vineplanting);
	end
	return vineplanting;
end


trellis_vegetableconf.growPea = function(vineplanting, nextGrowing, updateNbOfGrow)
	local nbOfVineGrow = vineplanting.nbOfVineGrow;
	local water = trellis_vegetableconf.calcWater(vineplanting.waterNeeded, vineplanting.waterLvl);
	local waterMax = trellis_vegetableconf.calcWater(vineplanting.waterLvl, vineplanting.waterNeededMax);
	local diseaseLvl = trellis_vegetableconf.calcDisease(vineplanting.mildewLvl);
	if nbOfVineGrow == 0 then
		vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		vineplanting.waterNeeded = 70;
	elseif (nbOfVineGrow == 1) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow <= 4) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting = growNext(vineplanting, trellis_vegetableconf.getSpriteName(vineplanting), trellis_vegetableconf.getObjectName(vineplanting), nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting.waterNeeded = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvl;
			vineplanting.waterNeededMax = trellis_vegetableconf.props[vineplanting.typeOfSeed].waterLvlMax;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 5) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, trellis_vegetableconf.props[vineplanting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
		else
			badVine(water, nil, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfVineGrow == 6) then
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			vineplanting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			vineplanting:setObjectName(trellis_vegetableconf.getObjectName(vineplanting))
			vineplanting:setSpriteName(trellis_vegetableconf.getSpriteName(vineplanting))
			vineplanting.hasVegetable = true;
			vineplanting.hasSeed = true;
		else
			badVine(water, waterMax, diseaseLvl, vineplanting, nextGrowing, updateNbOfGrow);
		end
	elseif (vineplanting.state ~= "rotten") then
		trellisFarming.rottenThis(vineplanting);
	end
	return vineplanting;
end


function badVine(water, waterMax, diseaseLvl, vine, nextGrowing, updateNbOfGrow)
	if not waterMax then
		waterMax = 1;
	end
	if water <= -1 or waterMax <= -1 then
		vine.badCare = true;
    end

    if diseaseLvl == -2 then
        trellisFarming.dryThis(vine);
        return;
    end

	if water == -1 or waterMax == -1 or diseaseLvl == -1 then
		vine.nextGrowing = calcNextGrowing(nextGrowing, 30);
		if updateNbOfGrow then
			vine.nbOfVineGrow = vine.nbOfVineGrow -1;
        end
        return;
    end

    vine.nextGrowing = calcNextGrowing(nextGrowing, 50);
    vine.health = vine.health - 4;
    if updateNbOfGrow then
        vine.nbOfVineGrow = vine.nbOfVineGrow -1;
    end
end

trellis_vegetableconf.icons = {}
trellis_vegetableconf.icons["Bean"] = "Item_PFBeans";
trellis_vegetableconf.icons["BellPepper"] = "Item_BellPepper";
trellis_vegetableconf.icons["Eggplant"] = "Item_Eggplant";
trellis_vegetableconf.icons["Grape"] = "Item_Grapes";
trellis_vegetableconf.icons["Pea"] = "Item_Peas";


trellis_vegetableconf.props = {};
trellis_vegetableconf.props["Bean"] = {};
trellis_vegetableconf.props["Bean"].seedsRequired = 4;
trellis_vegetableconf.props["Bean"].trellisRequired = "Yes";
trellis_vegetableconf.props["Bean"].texture = "FarmoidTiles01_5";
trellis_vegetableconf.props["Bean"].waterLvl = 70;
trellis_vegetableconf.props["Bean"].timeToGrow = ZombRand(54, 68);
trellis_vegetableconf.props["Bean"].minVeg = 4;
trellis_vegetableconf.props["Bean"].maxVeg = 5;
trellis_vegetableconf.props["Bean"].minVegAutorized = 10;
trellis_vegetableconf.props["Bean"].maxVegAutorized = 15;
trellis_vegetableconf.props["Bean"].vegetableName = "Hydrocraft.HCBeans";
trellis_vegetableconf.props["Bean"].seedName = "Hydrocraft.HCBeanseed";
trellis_vegetableconf.props["Bean"].seedPerVeg = 2;
trellis_vegetableconf.props["BellPepper"] = {};
trellis_vegetableconf.props["BellPepper"].seedsRequired = 4;
trellis_vegetableconf.props["BellPepper"].trellisRequired = "Yes";
trellis_vegetableconf.props["BellPepper"].texture = "FarmoidTiles01_46";
trellis_vegetableconf.props["BellPepper"].waterLvl = 70;
trellis_vegetableconf.props["BellPepper"].timeToGrow = ZombRand(54, 68);
trellis_vegetableconf.props["BellPepper"].minVeg = 4;
trellis_vegetableconf.props["BellPepper"].maxVeg = 5;
trellis_vegetableconf.props["BellPepper"].minVegAutorized = 6;
trellis_vegetableconf.props["BellPepper"].maxVegAutorized = 10;
trellis_vegetableconf.props["BellPepper"].vegetableName = "Base.BellPepper";
trellis_vegetableconf.props["BellPepper"].seedName = "Hydrocraft.HCBellpepperredseeds";
trellis_vegetableconf.props["BellPepper"].seedPerVeg = 3;
trellis_vegetableconf.props["Eggplant"] = {};
trellis_vegetableconf.props["Eggplant"].seedsRequired = 4;
trellis_vegetableconf.props["Eggplant"].trellisRequired = "Yes";
trellis_vegetableconf.props["Eggplant"].texture = "FarmoidTiles01_62";
trellis_vegetableconf.props["Eggplant"].waterLvl = 70;
trellis_vegetableconf.props["Eggplant"].timeToGrow = ZombRand(54, 68);
trellis_vegetableconf.props["Eggplant"].minVeg = 4;
trellis_vegetableconf.props["Eggplant"].maxVeg = 5;
trellis_vegetableconf.props["Eggplant"].minVegAutorized = 6;
trellis_vegetableconf.props["Eggplant"].maxVegAutorized = 10;
trellis_vegetableconf.props["Eggplant"].vegetableName = "Base.Eggplant";
trellis_vegetableconf.props["Eggplant"].seedName = "Hydrocraft.HCEggplantseeds";
trellis_vegetableconf.props["Eggplant"].seedPerVeg = 2;
trellis_vegetableconf.props["Grape"] = {};
trellis_vegetableconf.props["Grape"].seedsRequired = 4;
trellis_vegetableconf.props["Grape"].trellisRequired = "Yes";
trellis_vegetableconf.props["Grape"].texture = "FarmoidTiles01_54";
trellis_vegetableconf.props["Grape"].waterLvl = 70;
trellis_vegetableconf.props["Grape"].timeToGrow = ZombRand(54, 68);
trellis_vegetableconf.props["Grape"].minVeg = 4;
trellis_vegetableconf.props["Grape"].maxVeg = 5;
trellis_vegetableconf.props["Grape"].minVegAutorized = 6;
trellis_vegetableconf.props["Grape"].maxVegAutorized = 10;
trellis_vegetableconf.props["Grape"].vegetableName = "Base.Grapes";
trellis_vegetableconf.props["Grape"].seedName = "Hydrocraft.HCGrapeseeds";
trellis_vegetableconf.props["Grape"].seedPerVeg = 2;
trellis_vegetableconf.props["Pea"] = {};
trellis_vegetableconf.props["Pea"].seedsRequired = 4;
trellis_vegetableconf.props["Pea"].trellisRequired = "Yes";
trellis_vegetableconf.props["Pea"].texture = "FarmoidTiles01_37";
trellis_vegetableconf.props["Pea"].waterLvl = 70;
trellis_vegetableconf.props["Pea"].timeToGrow = ZombRand(54, 68);
trellis_vegetableconf.props["Pea"].minVeg = 4;
trellis_vegetableconf.props["Pea"].maxVeg = 5;
trellis_vegetableconf.props["Pea"].minVegAutorized = 6;
trellis_vegetableconf.props["Pea"].maxVegAutorized = 10;
trellis_vegetableconf.props["Pea"].vegetableName = "Hydrocraft.HCPeapod";
trellis_vegetableconf.props["Pea"].seedName = "Hydrocraft.HCPeaseeds";
trellis_vegetableconf.props["Pea"].seedPerVeg = 2;


trellis_vegetableconf.sprite = {}
trellis_vegetableconf.sprite["Bean"] = {
"FarmoidTiles01_0",
"FarmoidTiles01_1",
"FarmoidTiles01_2",
"FarmoidTiles01_3",
"FarmoidTiles01_4",
"FarmoidTiles01_6",
"FarmoidTiles01_5",
"FarmoidTiles01_7"
}
trellis_vegetableconf.sprite["BellPepper"] = {
"FarmoidTiles01_40",
"FarmoidTiles01_41",
"FarmoidTiles01_42",
"FarmoidTiles01_43",
"FarmoidTiles01_44",
"FarmoidTiles01_45",
"FarmoidTiles01_46",
"FarmoidTiles01_47"
}
trellis_vegetableconf.sprite["Eggplant"] = {
"FarmoidTiles01_56",
"FarmoidTiles01_57",
"FarmoidTiles01_58",
"FarmoidTiles01_59",
"FarmoidTiles01_60",
"FarmoidTiles01_61",
"FarmoidTiles01_62",
"FarmoidTiles01_63"
}
trellis_vegetableconf.sprite["Grape"] = {
"FarmoidTiles01_48",
"FarmoidTiles01_49",
"FarmoidTiles01_50",
"FarmoidTiles01_51",
"FarmoidTiles01_52",
"FarmoidTiles01_53",
"FarmoidTiles01_54",
"FarmoidTiles01_55"
}
trellis_vegetableconf.sprite["Pea"] = {
"FarmoidTiles01_32",
"FarmoidTiles01_33",
"FarmoidTiles01_34",
"FarmoidTiles01_35",
"FarmoidTiles01_36",
"FarmoidTiles01_37",
"FarmoidTiles01_38",
"FarmoidTiles01_39"
}
