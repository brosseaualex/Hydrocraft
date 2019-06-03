
Trap = {}
Trap = {}
Trap.version = "1.0";
Trap.author = "Nolan";
Trap.modName = "Trap";

Trap.OnClientCommand = function(module, command, player, args)
	if not isServer() then return end
	if module ~= "Trap" then return end; 
	
 	if command == "Say" then       
	
		player:Say(args.saythis);
		
	elseif command == "SetTrap" then       
		
		local sq = getWorld():getCell():getGridSquare(args.x,args.y,args.z);
		sq:getModData().isTrapSet = true;
		
		local Objs = sq:getWorldObjects();
		
		for i=0, Objs:size()-1 do
			if (Objs:get(i):getKeyId() == args.trapid) then 
				Objs:get(i):getModData().isSet = true;
				Objs:get(i):getItem():getModData().isSet = true;
			end
		end		
		
		player:Say("It's set");
	end
	
end
	
	
Events.OnClientCommand.Add(Trap.OnClientCommand);
