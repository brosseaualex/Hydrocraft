function recipe_NDPlantsHarvest(items, result, player)
	local plant=nil;
	local plantName = "";
	local namespace = "";
	local altName = "";
	local altSeedName = "";
	local extraItem = "";
	local prodCount = 0;
	local seedCount = 0;
	local extraCount = 0;
	
    for i=0, items:size()-1 do
        if string.find(items:get(i):getType(),"HCPotted") then
			plant=items:get(i);
		end
    end
	
	plantName = plant:getType();
	--Formatting
	plantName = string.gsub(plantName, "HCPotted", "");
	plantName = string.gsub(plantName, "ready", "");
	plantName = string.gsub(plantName, "tree", "");
	plantName = string.gsub(plantName, "bush", "");
	plantName = string.gsub(plantName, "stalk", "");
	plantName = string.gsub(plantName, "vine", "");
	plantName = plantName:sub(1,1):upper()..plantName:sub(2);
	
	--Get namespace
	if plantName == "Apple" or plantName == "Banana" or plantName == "Blackberry" or plantName == "Blueberry" or plantName == "Grape" or plantName == "Lemon" or plantName == "Orange" or plantName == "Peach" or plantName == "Watermelon" or plantName == "Bellpepper" or plantName == "Corn" or plantName == "Eggplant" or plantName == "Leek" or plantName == "Lettuce" or plantName == "Onion" or plantName == "Peanutplant" or plantName == "Avocado" or plantName == "Cherry" or plantName == "Pineapple" or plantName == "Zucchini" then
		namespace = "Base.";
	elseif plantName == "Cabbage" or plantName == "Strawberry" or plantName == "Broccoli" or plantName == "Carrots" or plantName == "Potato" or plantName == "Radish" or plantName == "Tomato" then
		namespace = "farming.";
		altSeedName = namespace..plantName.."Seed";
	else
		namespace = "Hydrocraft.HC";
	end
	
	--Get Alternative Name and Alternative Seed Name if applicable
	if plantName == "Agaveblue" then
		altName = "AgaveblueCut";
	elseif plantName == "Artichokes" then
		altName = "Artichoke";
	elseif plantName == "Basil" then
		altName = "Basilleaf";
	elseif plantName == "Oregano" then
		altName = "Oreganoleaf";	
	elseif plantName == "Beets" then
		altName = "Beet"
	elseif plantName == "Bellpepper" then
		altName = "BellPepper";
	elseif plantName == "Blackberry" then
		altName = "BerryBlack";
	elseif plantName == "Blueberry" then
		altName = "BerryBlue";
	elseif plantName == "Cactus" then
		altName = "Cactusfruit";
	elseif plantName == "Chilipepperplant" then
		altName = "Chilipepper";
		altSeedName = "Hydrocraft.HCChilipepperseeds";
	elseif plantName == "Cottonplant" then
		altName = "Cottonraw";
		altSeedName = "Hydrocraft.HCCottonseeds";
	elseif plantName == "PeaPlant" then
		altName = "Peapod";
	elseif plantName == "Jute" then
		altName = "Jutestems";
	elseif plantName == "Peanutplant" then
		altName = "Peanuts";
		altSeedName = "Hydrocraft.HCPeanutseeds";
	elseif plantName == "Hemp" then
		altName = "Hempbudfresh";
	elseif plantName == "Poppy" then
		altName = "Poppyflower";
	elseif plantName == "Pricklypearcactus" then
		altName = "Pricklypearfruit";
		altSeedName = "Hydrocraft.HCPricklypearseeds";
	elseif plantName == "Radish" then
		altName = "RedRadish";
		altSeedName = "farming.RedRadishSeed";
	elseif plantName == "Rice" then
		altName = "Riceraw";
	elseif plantName == "Strawberry" then
		altName = "Strewberrie";
		altSeedName = "farming.StrewberrieSeed";
	elseif plantName == "Tobacco" then
		altName = "Tobaccoleaffresh";
	elseif plantName == "Tomatilloplant" then
		altName = "Tomatillo";
		altSeedName = "Hydrocraft.HCTomatilloseeds";
	elseif plantName == "Grape" then
		altname = "Grapes";
	end
	
	--Main product counts
	if plantName == "Pricklypearcactus" or plantName == "Watermelon" or plantName == "Pineapple" or plantName == "Pumpkin" or plantName == "Pumpkingreen" or plantName == "Puumpkinwhite" or plantName == "Pumpkinlarge" or plantName == "Pumpkinbuskin" or plantName == "Alfalfa" then
		prodCount = 3;
	elseif plantName == "Bellpepper" or plantName == "Blackberry" or plantName == "Blueberry" or plantName == "Peaplant" or plantName == "Peanutplant" or plantName == "Radish" or plantName == "Strawberry" or plantName == "Apple" or plantName == "Banana" or plantName == "Grape" or plantName == "Lemon" or plantName == "Orange" or plantName == "Peach" or plantName == "Corn" or plantName == "Eggplant" or plantName == "Leek" or plantName == "Lettuce" or plantName == "Onion" or plantName == "Cherry" or plantName == "Zucchini" or plantName == "Cabbage" or plantName == "Broccoli" or plantName == "Carrots" or	plantName == "Potato" or plantName == "Tomato" or plantName == "Kiwi" or plantName == "Plum" or plantName == "Persimmon" or plantName == "Date" or plantName == "Fig" or plantName == "Beans" or plantName == "Grapesgreen" or plantName == "Lime" or plantName == "Bellpeppergreen" or plantName == "Bellpepperyellow" or plantName == "Pear" or plantName == "Tomatocherry" or plantName == "Apricot" then
		prodCount = 10;
	else
		prodCount = 5;
	end
	
	--Seed counts
	if plantName == "Beets" or plantName == "Shiitake" or plantName == "Portobello" or plantName == "Beetsugar" or plantName == "Wheat" then
		seedCount = 0;
	else
		seedCount = 3;
	end
	
	--Extra Item
	print (plantName);
	if plantName == "Grape" or plantName == "Grapesgreen" then
		extraItem = "Base.GrapeLeaves";
		extraCount = 5;
	elseif plantName == "Mulberry" then
		extraItem = "Hydrocraft.HCMulberryleaf";
		extraCount = 3;
	elseif plantName == "Wheat" then
		extraItem = "Hydrocraft.HCStraw";
		extraCount = 3;
	elseif plantName == "Hemp" then
		extraItem = "Hydrocraft.HCPlantfibers";
		extraCount = 4;
	end
	
	--Special fixes
	if plantName == "Rubber" then
		prodCount = 0;
		altSeedName = "Hydrocraft.HCRubbertreeseeds";
	elseif plantName == "Carrots" then
		altSeedName = "farming.CarrotSeed";
	end

	--Item giving
	--Main produce
	local counter = 0;
	while counter < prodCount do
		if altName ~= "" then
			player:getInventory():AddItem(namespace..altName);
		else
			player:getInventory():AddItem(namespace..plantName);
		end
		counter = counter + 1;
	end
	
	--Seeds
	local counter = 0;
	while counter < seedCount do
		if altSeedName ~= "" then
			player:getInventory():AddItem(altSeedName);
		else
			player:getInventory():AddItem("Hydrocraft.HC"..plantName.."seeds");
		end
		counter = counter + 1;
	end
	
	--Extra items
	if extraItem ~= "" then
		counter = 0;
		while counter < extraCount do
			player:getInventory():AddItem(extraItem);
			counter = counter + 1;
		end
	end
	
end