local MOD_ID = "HydroCombat";


local function HydroCombatOnHitZombie(zombie,player,bodyType,weapon)
if player:getPrimaryHandItem() then

local gun=player:getPrimaryHandItem():getType();

if gun=="HCCrossbow" or gun=="HCLongbow" or gun=="HCLongbowMag" then
if ZombRand(5) > 1 then

if gun=="HCCrossbow" then zombie:addItemToSpawnAtDeath(InventoryItemFactory.CreateItem("Hydrocraft.HCXbowbolt"));
end

if gun=="HCLongbow" or gun=="HCLongbowMag" then zombie:addItemToSpawnAtDeath(InventoryItemFactory.CreateItem("Hydrocraft.HCArrow"));
end

end --rand
end --is bolt or arrow?
end --has prim Handitem?
end -- end function


Events.OnHitZombie.Add(HydroCombatOnHitZombie);
