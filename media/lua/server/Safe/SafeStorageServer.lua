
SafeStorage = {}
SafeStorage = {}
SafeStorage.version = "1.0";
SafeStorage.author = "Nolan";
SafeStorage.modName = "SafeStorage";

SafeStorage.OnClientCommand = function(module, command, player, args)
	if not isServer() then return end
	if module ~= "SafeStorage" then return end; 
	
 	if command == "Say" then       
	
		player:Say(args.saythis);
		
	elseif command == "SetSafeWeight" then       
		
		local square = getWorld():getCell():getGridSquare(args.x,args.y,args.z);
		local Objs = square:getWorldObjects();
		
		for i=0, Objs:size()-1 do
			if Objs:get(i):getItem():getKeyId() == args.id then
				local safe = Objs:get(i):getItem():getItemContainer():getItemFromType("MetalSafe");
				safe:setActualWeight(1000.0);
				break;
			end
		end
		
	end
	
end
	
	
Events.OnClientCommand.Add(SafeStorage.OnClientCommand);
