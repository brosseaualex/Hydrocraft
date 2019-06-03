HCObjects = {};

HCObjects.isPillar = function(object)
	if not object then return nil end
	return object:getName() == "Stone Pillar";
end

HCObjects.isLPillar = function(object)
	if not object then return nil end
	return object:getName() == "Log Pillar";
end

HCObjects.isBPillar = function(object)
	if not object then return nil end
	return object:getName() == "Brick Pillar";
end

HCObjects.isBePillar = function(object)
	if not object then return nil end
	return object:getName() == "Beam Pillar";
end

HCObjects.isLBarricade = function(object)
	if not object then return nil end
	return object:getName() == "Log Barricade";
end

HCObjects.isBWBarricade = function(object)
	if not object then return nil end
	return object:getName() == "Barbed Wire Barricade";
end

HCObjects.isCWBarricade = function(object)
	if not object then return nil end
	return object:getName() == "Concertina Wire Barricade";
end

HCObjects.isSBBarricade = function(object)
	if not object then return nil end
	return object:getName() == "Sand Bag Barricade";
end

HCObjects.findPillar = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isPillar(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findLPillar = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isLPillar(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findBPillar = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isBPillar(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findBePillar = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isBePillar(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findLBarricade = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isLBarricade(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findBWBarricade = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isBWBarricade(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findCWBarricade = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isCWBarricade(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.findSBBarricade = function(square)
	if not square then return nil end
	local items = square:getObjects();
	for x=0, items:size()-1 do
		local item = items:get(x);
		if HCObjects.isSBBarricade(item) then
			return item;
		end
	end
	return nil;
end

HCObjects.OnLoadGridSquare = function(square)
	local object = HCObjects.findPillar(square);
	if object ~= nil then
		object:setSprite("media/textures/Object_HCStonepillar.png");
	end
	
	object = HCObjects.findLPillar(square);
	if object ~= nil then
		object:setSprite("media/textures/Object_HCLogpillar.png");
	end
	
	object = HCObjects.findBPillar(square);
	if object ~= nil then
		object:setSprite("media/textures/Object_HCBrickpillar.png");
	end
	
	object = HCObjects.findBePillar(square);
	if object ~= nil then
		object:setSprite("media/textures/Object_HCBeampillar.png");
	end
	
	object = HCObjects.findLBarricade(square);
	if object ~= nil then
		if object:getNorth() then
			object:setSprite("media/textures/Object_HCLogbarricadeR.png");
		else
			object:setSprite("media/textures/Object_HCLogbarricadeL.png");
		end
	end
	
	object = HCObjects.findBWBarricade(square);
	if object ~= nil then
		if object:getNorth() then
			object:setSprite("media/textures/Object_HCBarbedwirebarricadeR.png");
		else
			object:setSprite("media/textures/Object_HCBarbedwirebarricadeL.png");
		end
	end
	
	object = HCObjects.findCWBarricade(square);
	if object ~= nil then
		if object:getNorth() then
			object:setSprite("media/textures/Object_HCConcertinawirebarricadeR.png");
		else
			object:setSprite("media/textures/Object_HCConcertinawirebarricadeL.png");
		end
	end
	
	object = HCObjects.findSBBarricade(square);
	if object ~= nil then
		if object:getNorth() then
			object:setSprite("media/textures/Object_HCSandbagbarricadeR.png");
		else
			object:setSprite("media/textures/Object_HCSandbagbarricadeL.png");
		end
	end
end

--Events.LoadGridsquare.Add(HCObjects.OnLoadGridSquare);