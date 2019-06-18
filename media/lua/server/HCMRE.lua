--Open MRE Package
function recipe_HCMRE_OpenPackage(items, result, player)
	player:getInventory():AddItem("Hydrocraft.HCMREmeal");
	player:getInventory():AddItem("Hydrocraft.HCMREmealside");
	player:getInventory():AddItem("Hydrocraft.HCMREFRH");
	player:getInventory():AddItem("Hydrocraft.HCMREdrinkpacket");
	player:getInventory():AddItem("Hydrocraft.HCMREcrackers");
	player:getInventory():AddItem("Hydrocraft.HCMREbread");
	player:getInventory():AddItem("Hydrocraft.HCSaltpacket");
	player:getInventory():AddItem("Hydrocraft.HCPepperpacket");
	player:getInventory():AddItem("Hydrocraft.Matches");
	player:getInventory():AddItem("Hydrocraft.AlcoholWipes");
    local getsA = ZombRand(1);
    local itemSetA = {"Hydrocraft.HCCandymnm", "Hydrocraft.HCCandyrainbow", "Hydrocraft.HCCandycorn", "Hydrocraft.HCGum", "Hydrocraft.HCGum1", "Hydrocraft.HCGum2", "Hydrocraft.HCGum3", "Base.Chocolate", "Hydrocraft.HCGummyworms", "Hydrocraft.HCChocolatedark", "Hydrocraft.HCGummybears", "Hydrocraft.HCJellybeans", "Hydrocraft.HCTaffy", "Hydrocraft.HCEnergybar"};
    for x=0, getsA do
        HCItemGet(player, itemSetA);
  end
end

--Heat MRE With FRH
function recipe_HCMRE_HeatPackage(items, result, player)
    local getsA = ZombRand(1);
    local itemSetA = {"Hydrocraft.HCMREmealprepedA", "Hydrocraft.HCMREmealprepedB", "Hydrocraft.HCMREmealprepedC", "Hydrocraft.HCMREmealprepedD", "Hydrocraft.HCMREmealprepedE", "Hydrocraft.HCMREmealprepedF", "Hydrocraft.HCMREmealprepedG", "Hydrocraft.HCMREmealprepedH"};
    for x=0, getsA do
        HCItemGet(player, itemSetA);
end
    local getsB = ZombRand(1);
    local itemSetB = {"Hydrocraft.HCMREmealsideprepedA", "Hydrocraft.HCMREmealsideprepedB", "Hydrocraft.HCMREmealsideprepedC", "Hydrocraft.HCMREmealsideprepedD", "Hydrocraft.HCMREmealsideprepedE", "Hydrocraft.HCMREmealsideprepedF", "Hydrocraft.HCMREmealsideprepedG", "Hydrocraft.HCMREmealsideprepedH"};
    for x=0, getsB do
        HCItemGet(player, itemSetB);
end
	HCAddManySameItem("Hydrocraft.HCMREmealtrash", 0, player);
	HCAddManySameItem("Hydrocraft.HCMREmealsidetrash", 0, player);
end

--Pour MRE Drink Packet into Water Bottle
function recipe_HCMRE_MixDrinkWaterBottle(items, result, player)
	
    local gets = ZombRand(1);
    local itemSet = {"Hydrocraft.HCWaterbottleapplejuice", "Hydrocraft.HCWaterbottlecarrotjuice", "Hydrocraft.HCWaterbottlegrapejuice", "Hydrocraft.HCWaterbottlelemonjuice", "Hydrocraft.HCWaterbottleorangejuice", "Hydrocraft.HCWaterbottlelimejuice", "Hydrocraft.HCWaterbottlestrawberryjuice", "Hydrocraft.HCWaterbottletomatojuice", "Hydrocraft.HCWaterbottlewatermelonjuice", "Hydrocraft.HCWaterbottlepineapplejuice", "Hydrocraft.HCWaterbottleblueberryjuice", "Hydrocraft.HCWaterbottleblackberryjuice", "Hydrocraft.HCWaterbottlewildberryjuice", "Hydrocraft.HCWaterbottlecherryjuice"};
    for x=0, gets do
        HCItemGet(player, itemSet);
end
end

--Pour MRE Drink Packet into Pop Bottle
function recipe_HCMRE_MixDrinkPopBottle(items, result, player)
	
    local gets = ZombRand(1);
    local itemSet = {"Hydrocraft.HCPopbottleapplejuice", "Hydrocraft.HCPopbottlecarrotjuice" , "Hydrocraft.HCPopbottlegrapejuice" , "Hydrocraft.HCPopbottlelemonjuice" , "Hydrocraft.HCPopbottleorangejuice" , "Hydrocraft.HCPopbottlelimejuice" , "Hydrocraft.HCPopbottlestrawberryjuice" , "Hydrocraft.HCPopbottletomatojuice" , "Hydrocraft.HCPopbottlewatermelonjuice" , "Hydrocraft.HCPopbottlepineapplejuice" , "Hydrocraft.HCPopbottleblueberryjuice" , "Hydrocraft.HCPopbottleblackberryjuice" , "Hydrocraft.HCPopbottlewildberryjuice" , "Hydrocraft.HCPopbottlecherryjuice" };
    for x=0, gets do
        HCItemGet(player, itemSet);
end
end