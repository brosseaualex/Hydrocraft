--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Farming/trellisFarming"

local Commands = {}
local noise = trellisFarming.noise

function Commands.cureFlies(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine and vine.fliesLvl > 0 then
		trellisFarming.cureFlies(vine, nil, args.uses)
	elseif not vine then
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.cureMildew(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine and vine.mildewLvl > 0 then
		trellisFarming.cureMildew(vine, nil, args.uses)
	elseif not vine then
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.fertilize(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine then
		trellisFarming.fertilize(null, vine)
	else
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.vineharvest(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine and vine:canHarvest() then
		trellisFarming.vineharvest(vine, player)
	else
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.build(player, args)
	local gridSquare = getCell():getGridSquare(args.x, args.y, args.z)
	if gridSquare then
		local vine = trellisFarming.getVineOnSquare(gridSquare)
		if vine then
			trellisFarming.removeVine(vine)
		end
		trellisFarming.build(gridSquare)
	else
		noise('no gridSquare at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.removeVine(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine then
		trellisFarming.removeVine(vine)
	else
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.seed(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine and vine.state == "trellised" then
		trellisFarming.seed(args.typeOfSeed, vine)
	elseif not vine then
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	else
		noise('ignored, vine not plowed at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.water(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine then
		trellisFarming.water(vine, null, args.uses)
	else
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function Commands.cheat(player, args)
	local vine = trellisFarming.getVineAt(args.x, args.y, args.z)
	if vine then
		vine[args.var] = vine[args.var] + args.count
		if vine[args.var] < 0 then vine[args.var] = 0 end
		if vine[args.var] > 100 then vine[args.var] = 100 end
		trellisFarming.saveData(vine)
	else
		noise('no vine found at '..args.x..','..args.y..','..args.z)
	end
end

function trellisFarming.OnClientCommand(module, command, player, args)
	if module ~= 'trellis' then return end
	if Commands[command] then
		local argStr = ''
		for k,v in pairs(args) do argStr = argStr..' '..k..'='..v end
		noise('OnClientCommand '..module..' '..command..argStr)
		Commands[command](player, args)
	end
end

function trellisFarming.OnServerCommand(module, command, args)
	if not isClient() then return end
	if module ~= 'trellis' then return end
	local argStr = ''
	for k,v in pairs(args) do argStr = argStr..' '..k..'='..v end
	noise('OnServerCommand '..module..' '..command..argStr)
	if command == "hoursElapsed" then
		trellisFarming.hoursElapsed = args.hoursElapsed
	end
end

Events.OnServerCommand.Add(trellisFarming.OnServerCommand)

if isServer() then
	Events.OnClientCommand.Add(trellisFarming.OnClientCommand)
end
