
LockCrafting = {}
LockCrafting = {}
LockCrafting.version = "1.0";
LockCrafting.author = "Nolan";
LockCrafting.modName = "LockCrafting";

LockCrafting.OnClientCommand = function(module, command, player, args)
	if not isServer() then return end
	if module ~= "LockCrafting" then return end; 
	
 	if command == "Say" then       
	
		player:Say(args.saythis);
	
	elseif command == "RemoveCar" then       
	
		
	
	elseif command == "KillZombie" then       
	
		
	
	end
	
end
	
	
Events.OnClientCommand.Add(LockCrafting.OnClientCommand);
