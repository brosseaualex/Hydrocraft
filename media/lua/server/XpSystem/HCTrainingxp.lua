
--Archery Target
function HCTrainArcheryTarget_Trainingxp1(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 1);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCTrainArcheryTarget_Trainingxp2(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCTrainArcheryTarget_Trainingxp3(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 3);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp4(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 4);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp5(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 5);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp6(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 6);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp8(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 8);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end


--Punching Bag
function HCTrainPunchingBag_Trainingxp(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Nimble, 10);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end

function HCTrainPunchingBag_Trainingxp2(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Nimble, 300);
end

--Weights
function HCTrainWeights_Trainingxp(player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Strength, 50);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end


function HCTrainWeights_Trainingxp2(player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Strength, 900);
end


--Tredmill
function HCTrainTredmill_Trainingxp(player)
	local pl = getPlayer();
    pl:getXp():AddXP(Perks.Sprinting, 50);
    pl:getXp():AddXP(Perks.Fitness, 10);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end

function HCTrainTredmill_Trainingxp2(player)
	local pl = getPlayer();
    pl:getXp():AddXP(Perks.Sprinting, 100);
    pl:getXp():AddXP(Perks.Fitness, 900);   
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end
