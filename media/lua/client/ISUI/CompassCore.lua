

--         _______________________________________________________________________
--        |                                                                         |
--        |    -----------------------------------------------------------------    |
--        |    -----------------------------------------------------------------    |
--        |    ----                                                         ----    |
--        |    ----     ________               __     ______                ----    |
--        |    ----    / ____/ /_  ___  ____ _/ /_   / ____/___  ________   ----    |
--        |    ----   / /   / __ \/ _ \/ __ `/ __/  / /   / __ \/ ___/ _ \  ----    |
--        |    ----  / /___/ / / /  __/ /_/ / /_   / /___/ /_/ / /  /  __/  ----    |
--        |    ----  \____/_/ /_/\___/\__,_/\__/   \____/\____/_/   \___/   ----    |
--        |    ----                                                         ----    |
--        |    ----                                                              ----    |
--        |    -----------------------------------------------------------------    |
--        |    -----------------------------------------------------------------    |
--        |_______________________________________________________________________|


CompassCore = {}

CompassCore.doRound = function(number)
    return number % 1 >= 0.5 and math.ceil(number) or math.floor(number)
end

CompassCore.readFile = function(modID, fileName, numberOfLines, optionalMatchLine)
    if CompassCore.fileTable == nil then
        CompassCore.fileTable = {}
    end
    local readFile = getModFileReader(modID, fileName, true)
    if numberOfLines ~= nil then
        for i = 1,numberOfLines do
            local scanLine = readFile:readLine()
            if scanLine ~= nil then
                CompassCore.fileTable = scanLine
            else
                CompassCore.fileTable = " "
            end
        end
        readFile:close()
    else
        local count = 0
        local function keepScanning()
            local scanLine = readFile:readLine()
            if scanLine ~= nil then
                count = count + 1
                if optionalMatchLine == nil then
                    CompassCore.fileTable[count] = scanLine
                else
                    if scanLine ~= optionalMatchLine then
                        keepScanning()
                    else
                        return scanLine
                    end
                end
                keepScanning()
            else
                print("no results found")
            end
        end
        keepScanning()
    end
end

CompassCore.setHome = function(homeNumber)
    loadstring("CompassCore.Home"..tostring(homeNumber).."X = "..CompassCore.doRound(getPlayer():getX()))()
    loadstring("CompassCore.Home"..tostring(homeNumber).."Y = "..CompassCore.doRound(getPlayer():getY()))()
    local returnX = loadstring("return CompassCore.Home"..tostring(homeNumber).."X")
    local returnY = loadstring("return CompassCore.Home"..tostring(homeNumber).."Y")
    CompassCore.readFile("Hydrocraft", "SavedHomes.txt", 5)
    CompassCore.fileTable[homeNumber] = "Home"..tostring(homeNumber).." "..returnX().." "..returnY()
    CompassCore.writeFile(CompassCore.fileTable, "Hydrocraft", "SavedHomes.txt")
end

CompassCore.writeFile = function(tableToWrite, modID, fileName)
    local writeFile = getModFileWriter(modID, fileName, true, false)
    for i = 1,#tableToWrite - 1 do
        writeFile:write(tableToWrite.."\r\n");
    end
    writeFile:close();
end

CompassCore.checkCoords = function(number1, number2)
    local doRound = CompassCore.doRound(number2)
    if doRound >= number1 then
        return doRound - number1
    else
        return number1 - doRound
    end
end

CompassCore.updateCompass = function()
    local newText = "";
    for i,v in ipairs(ISCompassWindow.compassLines) do
        if i == #ISCompassWindow.compassLines then
            v = string.gsub(v, " <LINE> $", "")
        end
        newText = newText .. v;
    end
    ISCompassWindow.HomeWindow.text = newText
    ISCompassWindow.HomeWindow:paginate()
end

CompassCore.returnDirection = function()
    local wx, wy = getPlayer():getX(), getPlayer():getY()
    wx = math.floor(wx);
    wy = math.floor(wy);
    local cell = getWorld():getCell();
    local sq = cell:getGridSquare(wx, wy, getPlayer():getZ());
    local sqObjs;
        if(sq ~= nil) then
            sqObjs = sq:getObjects();
        else
            sq = cell:getGridSquare(wx, wy, 0);
            sqObjs = sq:getObjects();
        end
    local sqSize = sqObjs:size();
    for i = sqSize-1, 0, -1 do
        local obj = sqObjs:get(i);
        local direction = tostring(IsoDirections.fromAngle(getPlayer():getAngle()))
        local completedString;
        local directions = {
          N  = "North",
          NE = "North East",
          NW = "North West",
          S  = "South",
          SW = "South West",
          SE = "South East",
          W  = "West",
          E  = "East"
        }
        return directions[direction] or "ERROR"
    end
end

CompassCore.updateCoords = function()
    if ISCompassWindow:getIsVisible() then
        local inv = getPlayer():getInventory()
        for i = 1,#ISCompassWindow.compassLines do
            table.remove(ISCompassWindow.compassLines, i)
        end
        if inv:FindAndReturn("HCCompass") and inv:FindAndReturn("HCMap") or inv:FindAndReturn("HCGPS") then
            ISCompassWindow.compassLines[2] = "-------------Your Coords-------------".." <LINE> ".."X: "..CompassCore.doRound(getPlayer():getX()).." Y: "..CompassCore.doRound(getPlayer():getY()).." <LINE> "
        end
        if CompassCore.MarkedX ~= nil and CompassCore.MarkedY ~= nil then
            if inv:FindAndReturn("HCCompass") and inv:FindAndReturn("HCMap") or inv:FindAndReturn("HCGPS") or inv:FindAndReturn("HCMap") and not inv:FindAndReturn("HCCompass") then
                ISCompassWindow.compassLines[1] = "-----"..CompassCore.DisplayName.." Coords-----".." <LINE> ".."X: "..CompassCore.MarkedX.." Y: "..CompassCore.MarkedY.." <LINE> "
            end
            if inv:FindAndReturn("HCCompass") and inv:FindAndReturn("HCMap") or inv:FindAndReturn("HCGPS") then
                ISCompassWindow.compassLines[3] = "-----Distance to Destination-----".." <LINE> ".."X: "..CompassCore.checkCoords(tonumber(CompassCore.MarkedX), getPlayer():getX()).." Y: "..CompassCore.checkCoords(tonumber(CompassCore.MarkedY), getPlayer():getY()).." <LINE> "
            end
        end
        if inv:FindAndReturn("HCCompass") or inv:FindAndReturn("HCGPS") then
            ISCompassWindow.compassLines[#ISCompassWindow.compassLines+1] = "-----Current Direction----- <LINE> "..CompassCore.returnDirection().." <LINE> "
        end
        CompassCore.updateCompass()
    end
end

CompassCore.markHome = function(homeNumber, optionalDestinationName, optionalX, optionalY, optionalDoTeleport, isDoCompass, isOnlyCompass)
    local splitTable = {}
    local tableKey = 0
    if homeNumber ~= nil and homeNumber ~= 0 then
        CompassCore.readFile("Hydrocraft", "SavedHomes.txt", 5)
        for i in string.gmatch(CompassCore.fileTable[homeNumber], "%S+") do
            splitTable[tableKey] = i
            tableKey = tableKey + 1
        end
        CompassCore.DisplayName = "Home"..homeNumber
        CompassCore.MarkedX = splitTable[1]
        CompassCore.MarkedY = splitTable[2]
        CompassCore.updateCoords()
    elseif homeNumber == 0 or homeNumber == nil then
        if optionalX ~= nil and optionalY ~= nil then
            CompassCore.DisplayName = optionalDestinationName
            CompassCore.MarkedX = optionalX
            CompassCore.MarkedY = optionalY
        end
        if isDoCompass == true and isOnlyCompass ~= true then
            CompassCore.CurrentDirection = true
        elseif isOnlyCompass == true then
            CompassCore.IsOnlyCompass = true
        end
        CompassCore.updateCoords()
    end
    if optionalDoTeleport ~= true and not ISCompassWindow:getIsVisible() then
        ISCompassWindow:setVisible(true);
        CompassCore.updateCoords()
    elseif optionalDoTeleport == true then
        getPlayer():setX(tonumber(CompassCore.MarkedX));
        getPlayer():setY(tonumber(CompassCore.MarkedY));
        getPlayer():setZ(0);
        getPlayer():setLx(getPlayer():getX());
        getPlayer():setLy(getPlayer():getY());
        getPlayer():setLz(getPlayer():getZ());
    end
end
Events.OnPlayerUpdate.Add(CompassCore.updateCoords);