require 'Farming/farming_vegetableconf'

-----------------------------------------------------
-- Hydrocraft Patch Farming Fix by DemolitionDerby --
-----------------------------------------------------

HCfarming_vegetableconf = {};

-- Corn
-- Need 10 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 35 and 65
-- Grow in 17 days (68h per phase)
HCfarming_vegetableconf.growCorn = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting.rottenThis(planting);
	end
	return planting;
end

-- Leek
-- Need 9 seeds
-- Water lvl over 85
-- Need 4 weeks to grow (112h per phase)
HCfarming_vegetableconf.growLeek = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Lettuce
-- Need 6 seeds
-- Water lvl over 85
-- Need 4 weeks to grow (112h per phase)
HCfarming_vegetableconf.growLettuce = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Onions
-- Need 4 seeds
-- Water lvl over 65
-- Need 3 weeks (84h per phase)
HCfarming_vegetableconf.growOnion = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Peanut
-- Need 4 seeds
-- Water lvl over 65
-- Need 3 weeks (84h per phase)
HCfarming_vegetableconf.growPeanut = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Pumpkin
-- Need 4 seeds
-- Water lvl over 65
-- Need 3 weeks (84h per phase)
HCfarming_vegetableconf.growPumpkin = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Watermelon
-- Need 4 seeds
-- Water lvl over 65
-- Need 3 weeks (84h per phase)
HCfarming_vegetableconf.growWatermelon = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Zucchini
-- Need 12 seeds
-- Water lvl over 65
-- Need 3 weeks (84h per phase)
HCfarming_vegetableconf.growZucchini = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

--Adding icons from existing Farmoid Texturepack included in Hydrocraft
farming_vegetableconf.icons["Corn"] = "Item_Corn";
farming_vegetableconf.icons["Leek"] = "Item_Leek";
farming_vegetableconf.icons["Lettuce"] = "Item_Lettuce";
farming_vegetableconf.icons["Onion"] = "Item_Onion";
farming_vegetableconf.icons["Peanut"] = "Item_Peanut";
farming_vegetableconf.icons["Pumpkin"] = "Item_Pumpkin";
farming_vegetableconf.icons["Watermelon"] = "Item_Watermelon";
farming_vegetableconf.icons["Zucchini"] = "Item_Zucchini";

-- Corn (12 to 16 weeks to grow)
farming_vegetableconf.props["Corn"] = {};
farming_vegetableconf.props["Corn"].seedsRequired = 10;
farming_vegetableconf.props["Corn"].texture = "vegetation_farming_01_78";
farming_vegetableconf.props["Corn"].waterLvl = 60;
farming_vegetableconf.props["Corn"].timeToGrow = ZombRand(46, 52);
farming_vegetableconf.props["Corn"].minVeg = 4;
farming_vegetableconf.props["Corn"].maxVeg = 9;
farming_vegetableconf.props["Corn"].minVegAutorized = 11;
farming_vegetableconf.props["Corn"].maxVegAutorized = 15;
farming_vegetableconf.props["Corn"].vegetableName = "Base.Corn";
farming_vegetableconf.props["Corn"].seedName = "Hydrocraft.HCCornseeds";
farming_vegetableconf.props["Corn"].seedPerVeg = 3;
farming_vegetableconf.props["Corn"].growCode ="HCfarming_vegetableconf.growCorn";

-- Leek (6 to 8 weeks to grow)
farming_vegetableconf.props["Leek"] = {};
farming_vegetableconf.props["Leek"].seedsRequired = 9;
farming_vegetableconf.props["Leek"].texture = "FarmoidTiles02_13";
farming_vegetableconf.props["Leek"].waterLvl = 85;
farming_vegetableconf.props["Leek"].timeToGrow = ZombRand(46, 52);
farming_vegetableconf.props["Leek"].minVeg = 3;
farming_vegetableconf.props["Leek"].maxVeg = 6;
farming_vegetableconf.props["Leek"].minVegAutorized = 10;
farming_vegetableconf.props["Leek"].maxVegAutorized = 15;
farming_vegetableconf.props["Leek"].vegetableName = "Base.Leek";
farming_vegetableconf.props["Leek"].seedName = "Hydrocraft.HCLeekseeds";
farming_vegetableconf.props["Leek"].seedPerVeg = 3;
farming_vegetableconf.props["Leek"].growCode ="HCfarming_vegetableconf.growLeek";

-- Lettuce (6 to 8 weeks to grow)
farming_vegetableconf.props["Lettuce"] = {};
farming_vegetableconf.props["Lettuce"].seedsRequired = 6;
farming_vegetableconf.props["Lettuce"].texture = "FarmoidTiles02_21";
farming_vegetableconf.props["Lettuce"].waterLvl = 85;
farming_vegetableconf.props["Lettuce"].timeToGrow = ZombRand(46, 52);
farming_vegetableconf.props["Lettuce"].minVeg = 4;
farming_vegetableconf.props["Lettuce"].maxVeg = 6;
farming_vegetableconf.props["Lettuce"].minVegAutorized = 9;
farming_vegetableconf.props["Lettuce"].maxVegAutorized = 11;
farming_vegetableconf.props["Lettuce"].vegetableName = "Base.Lettuce";
farming_vegetableconf.props["Lettuce"].seedName = "Hydrocraft.HCLettuceseeds";
farming_vegetableconf.props["Lettuce"].seedPerVeg = 3;
farming_vegetableconf.props["Lettuce"].growCode ="HCfarming_vegetableconf.growLettuce";

-- Onion (16 to 20 weeks to grow)
farming_vegetableconf.props["Onion"] = {};
farming_vegetableconf.props["Onion"].seedsRequired = 4;
farming_vegetableconf.props["Onion"].texture = "FarmoidTiles02_5";
farming_vegetableconf.props["Onion"].waterLvl = 65;
farming_vegetableconf.props["Onion"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Onion"].minVeg = 3;
farming_vegetableconf.props["Onion"].maxVeg = 6;
farming_vegetableconf.props["Onion"].minVegAutorized = 10;
farming_vegetableconf.props["Onion"].maxVegAutorized = 15;
farming_vegetableconf.props["Onion"].vegetableName = "Base.Onion";
farming_vegetableconf.props["Onion"].seedName = "Hydrocraft.HCOnionseeds";
farming_vegetableconf.props["Onion"].seedPerVeg = 3;
farming_vegetableconf.props["Onion"].growCode ="HCfarming_vegetableconf.growOnion";

-- Peanuts (16 to 20 weeks to grow)
farming_vegetableconf.props["Peanut"] = {};
farming_vegetableconf.props["Peanut"].seedsRequired = 4;
farming_vegetableconf.props["Peanut"].texture = "FarmoidTiles02_29";
farming_vegetableconf.props["Peanut"].waterLvl = 70;
farming_vegetableconf.props["Peanut"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Peanut"].minVeg = 3;
farming_vegetableconf.props["Peanut"].maxVeg = 4;
farming_vegetableconf.props["Peanut"].minVegAutorized = 5;
farming_vegetableconf.props["Peanut"].maxVegAutorized = 9;
farming_vegetableconf.props["Peanut"].vegetableName = "Base.Peanuts";
farming_vegetableconf.props["Peanut"].seedName = "Hydrocraft.HCPeanutseeds";
farming_vegetableconf.props["Peanut"].seedPerVeg = 2;
farming_vegetableconf.props["Peanut"].growCode ="HCfarming_vegetableconf.growPeanut";

-- Pumpkin (16 to 20 weeks to grow)
farming_vegetableconf.props["Pumpkin"] = {};
farming_vegetableconf.props["Pumpkin"].seedsRequired = 4;
farming_vegetableconf.props["Pumpkin"].texture = "FarmoidTiles01_14";
farming_vegetableconf.props["Pumpkin"].waterLvl = 65;
farming_vegetableconf.props["Pumpkin"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Pumpkin"].minVeg = 2;
farming_vegetableconf.props["Pumpkin"].maxVeg = 4;
farming_vegetableconf.props["Pumpkin"].minVegAutorized = 4;
farming_vegetableconf.props["Pumpkin"].maxVegAutorized = 6;
farming_vegetableconf.props["Pumpkin"].vegetableName = "Hydrocraft.HCPumpkin";
farming_vegetableconf.props["Pumpkin"].seedName = "Hydrocraft.HCPumpkinseeds";
farming_vegetableconf.props["Pumpkin"].seedPerVeg = 3;
farming_vegetableconf.props["Pumpkin"].growCode ="HCfarming_vegetableconf.growPumpkin";

-- Watermelon (16 to 20 weeks to grow)
farming_vegetableconf.props["Watermelon"] = {};
farming_vegetableconf.props["Watermelon"].seedsRequired = 4;
farming_vegetableconf.props["Watermelon"].texture = "FarmoidTiles01_30";
farming_vegetableconf.props["Watermelon"].waterLvl = 65;
farming_vegetableconf.props["Watermelon"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Watermelon"].minVeg = 2;
farming_vegetableconf.props["Watermelon"].maxVeg = 4;
farming_vegetableconf.props["Watermelon"].minVegAutorized = 4;
farming_vegetableconf.props["Watermelon"].maxVegAutorized = 6;
farming_vegetableconf.props["Watermelon"].vegetableName = "Base.Watermelon";
farming_vegetableconf.props["Watermelon"].seedName = "Hydrocraft.HCWatermelonseeds";
farming_vegetableconf.props["Watermelon"].seedPerVeg = 3;
farming_vegetableconf.props["Watermelon"].growCode ="HCfarming_vegetableconf.growWatermelon";

-- Zucchini (6 to 8 weeks to grow)
farming_vegetableconf.props["Zucchini"] = {};
farming_vegetableconf.props["Zucchini"].seedsRequired = 6;
farming_vegetableconf.props["Zucchini"].texture = "FarmoidTiles01_22";
farming_vegetableconf.props["Zucchini"].waterLvl = 65;
farming_vegetableconf.props["Zucchini"].waterLvlMax = 85;
farming_vegetableconf.props["Zucchini"].timeToGrow = ZombRand(56, 62);
farming_vegetableconf.props["Zucchini"].minVeg = 4;
farming_vegetableconf.props["Zucchini"].maxVeg = 6;
farming_vegetableconf.props["Zucchini"].minVegAutorized = 9;
farming_vegetableconf.props["Zucchini"].maxVegAutorized = 11;
farming_vegetableconf.props["Zucchini"].vegetableName = "Base.Zucchini";
farming_vegetableconf.props["Zucchini"].seedName = "Hydrocraft.HCZucchiniseeds";
farming_vegetableconf.props["Zucchini"].seedPerVeg = 2;
farming_vegetableconf.props["Zucchini"].growCode ="HCfarming_vegetableconf.growZucchini";

farming_vegetableconf.sprite["Corn"] = {
"vegetation_farming_01_72",
"vegetation_farming_01_73",
"vegetation_farming_01_74",
"vegetation_farming_01_75",
"vegetation_farming_01_76",
"vegetation_farming_01_77",
"vegetation_farming_01_78",
"vegetation_farming_01_79"
}
farming_vegetableconf.sprite["Leek"] = {
"FarmoidTiles02_8",
"FarmoidTiles02_9",
"FarmoidTiles02_10",
"FarmoidTiles02_11",
"FarmoidTiles02_12",
"FarmoidTiles02_14",
"FarmoidTiles02_13",
"FarmoidTiles02_15"
}
farming_vegetableconf.sprite["Lettuce"] = {
"FarmoidTiles02_16",
"FarmoidTiles02_17",
"FarmoidTiles02_18",
"FarmoidTiles02_19",
"FarmoidTiles02_20",
"FarmoidTiles02_21",
"FarmoidTiles02_22",
"FarmoidTiles02_23"
}
farming_vegetableconf.sprite["Onion"] = {
"FarmoidTiles02_0",
"FarmoidTiles02_1",
"FarmoidTiles02_2",
"FarmoidTiles02_3",
"FarmoidTiles02_4",
"FarmoidTiles02_6",
"FarmoidTiles02_5",
"FarmoidTiles02_7"
}
farming_vegetableconf.sprite["Peanut"] = {
"FarmoidTiles02_24",
"FarmoidTiles02_25",
"FarmoidTiles02_26",
"FarmoidTiles02_27",
"FarmoidTiles02_28",
"FarmoidTiles02_29",
"FarmoidTiles02_30",
"FarmoidTiles02_31"
}
farming_vegetableconf.sprite["Pumpkin"] = {
"FarmoidTiles01_8",
"FarmoidTiles01_9",
"FarmoidTiles01_10",
"FarmoidTiles01_11",
"FarmoidTiles01_12",
"FarmoidTiles01_13",
"FarmoidTiles01_14",
"FarmoidTiles01_15"
}
farming_vegetableconf.sprite["Watermelon"] = {
"FarmoidTiles01_24",
"FarmoidTiles01_25",
"FarmoidTiles01_26",
"FarmoidTiles01_27",
"FarmoidTiles01_28",
"FarmoidTiles01_29",
"FarmoidTiles01_30",
"FarmoidTiles01_31"
}
farming_vegetableconf.sprite["Zucchini"] = {
"FarmoidTiles01_16",
"FarmoidTiles01_17",
"FarmoidTiles01_18",
"FarmoidTiles01_19",
"FarmoidTiles01_20",
"FarmoidTiles01_21",
"FarmoidTiles01_22",
"FarmoidTiles01_23"
}