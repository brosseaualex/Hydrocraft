require "XpSystem/XpUpdate";

function HCNoExpGain(recipe, ingredients, result, player)
	-- Intentionally does nothing.
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCOneExpGain(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Woodwork, 1);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

--Get XP Specific

function MakeEphedrin_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function BBBuildBatpack_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function Healdog_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

--Get XP General

function HCCooking_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)
end

function HCDoctor_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCElectricity_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)
end

function HCFarming_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)
end

function HCFishing_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Fishing, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)
end

function HCPlantScavenging_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.PlantScavenging, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCMechanics_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCMechanicsElectricity_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 2);
    player:getXp():AddXP(Perks.Electricity, 2);	
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCMechanicsFarming_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 2);
    player:getXp():AddXP(Perks.Farming, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCMechanicsWelding_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 2);
    player:getXp():AddXP(Perks.MetalWelding, 2);	
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCMechanicsWoodwork_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 2);
    player:getXp():AddXP(Perks.Woodwork, 2);	
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCEMW_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 2);	
    player:getXp():AddXP(Perks.Mechanics, 2);
    player:getXp():AddXP(Perks.MetalWelding, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCSmithing_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Blacksmith, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCTrapping_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Trapping, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)
end

function HCWelding_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCWoodwork_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCHunger_OnGiveXP(recipe, ingredients, result, player)
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)
end