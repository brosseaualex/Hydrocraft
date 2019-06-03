
Armor = {}
Armor = {}
Armor.version = "1.0";
Armor.author = "Nolan";
Armor.modName = "Armor";

Armor.OnClientCommand = function(module, command, player, args)
	if not isServer() then return end
	if module ~= "Armor" then return end; 
	
 	if command == "Say" then       
	
		player:Say(args.saythis);
	
	elseif command == "RemoveCar" then       
	
		
	
	elseif command == "KillZombie" then       
	
		
	
	end
	
end
	
	
Events.OnClientCommand.Add(Armor.OnClientCommand);
