local MOD_ID = "ChainSaw";

local timeDown = 0;

function chainsaw_swing(owner, weapon)
	
	if owner:getPrimaryHandItem() and owner:getPrimaryHandItem():getType() == "ChainSaw" then	
		
		getSoundManager():PlayWorldSound('cs_hit', true, owner:getCurrentSquare(), 0, 4, 1, false);
	
	end
end

function chainsaw_hit(wielder, weapon, damage)
	local player = wielder;
	
end

function chainsaw_equip(leftHandItem)
	
	if getPlayer():getPrimaryHandItem() then
		if getPlayer():getPrimaryHandItem():getType() == "ChainSaw" then
			getSoundManager():PlayWorldSoundWav('cs_start', false, getPlayer():getSquare(), 0, 0, 0, true);
			if(getPlayer():getPrimaryHandItem():getModData().gasUse == nil) then
				getPlayer():getPrimaryHandItem():getModData().gasUse = 100;
			end
		elseif getPlayer():getPrimaryHandItem():getType() == "ChainSawNoGas" then
			if(getPlayer():getPrimaryHandItem():getModData().gasUse == nil) then
				getPlayer():getPrimaryHandItem():getModData().gasUse = 0;
			end
		end

	end

end



function chainsaw_func(player)
	if player:getPrimaryHandItem() then
		local weapon = player:getPrimaryHandItem();
		if weapon:getType() == "ChainSaw" then
			timeDown = timeDown + 1;
			
			if(player:getPrimaryHandItem():getModData().gasUse == nil) then
				player:getPrimaryHandItem():getModData().gasUse = 100;
			end
				
			if timeDown % 25 == 0 then
				getSoundManager():PlayWorldSoundWav('cs_idle', false, player:getSquare(), 0, 0, 0, false);
				addSound(player, player:getX(), player:getY(), player:getZ(), 35, 35);
			end
			
			if(weapon:getModData().gasUse <= 0) then
				
				player:getInventory():Remove(weapon);
				weapon = player:getInventory():AddItem("Hydrocraft.ChainSawNoGas");
				weapon:getModData().gasUse = 0;
				player:setPrimaryHandItem(weapon);
				player:setSecondaryHandItem(weapon); 
				
			elseif timeDown % 200 == 0 then
				weapon:getModData().gasUse = weapon:getModData().gasUse - 1;
				player:Say("ChainSaw Gas:" .. tostring(weapon:getModData().gasUse) .. "%");
			end
			-- print(timeDown);
		
		end
	end
end

function chainsaw_add(player, square)
	player:getInventory():AddItem("Hydrocraft.ChainSawNoGas");
	player:getInventory():AddItem("Base.PetrolCan");
	--player:getInventory():AddItem("Hydrocraft.HCBattleaxebronze");
	--player:getInventory():AddItem("ORGM.BenelliM3PASO");

end

function chainsaw_init() -- probably not needed anymore
	if(getPlayer() ~= nil) then
		if(getPlayer():getPrimaryHandItem() ~= nil) then
			if(getPlayer():getPrimaryHandItem():getType() == "ChainSaw") then
				if(getPlayer():getPrimaryHandItem():getModData().gasUse == nil) then
					getPlayer():getPrimaryHandItem():getModData().gasUse = 100;
				end
			end
		end
	end
end

function chainsaw_loadModel()

	-- The directory of the mod folder. 
	dir = getDir("ChainSaw");
		
	name = "chainsaw";
	locationModel = dir .. "/media/models/weapons_chainsaw.txt";
	locationTexture = dir .. "/media/textures/Objects_chainsaw.png"; 
	--                    (model name        , modelLocation, textureLocation )
	if( loadStaticZomboidModel("weapons_chainsaw", locationModel, locationTexture ) ) then
		print("chainsaw: ("..dir..") Did model loader loading with model loader");
	else
		print("chainsaw: error could not load model");
	end

end

Events.OnGameBoot.Add(chainsaw_loadModel);
Events.OnEquipPrimary.Add(chainsaw_equip);
Events.OnWeaponSwing.Add(chainsaw_swing);
--Events.OnWeaponHitCharacter.Add(chainsaw_hit);
--Events.OnWeaponHitTree.Add(chainsaw_hit);
Events.OnPlayerUpdate.Add(chainsaw_func);
--Events.OnNewGame.Add(chainsaw_add);
Events.OnGameStart.Add(chainsaw_init);

