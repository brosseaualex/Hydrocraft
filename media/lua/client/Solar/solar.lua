--Solar Generator
--By Nolan Ritchie

function HCRemoveSolarGen(items, result, player)
    for i=0, items:size()-1 do
        if(items:get(i):getType() == "HCSolargen2") then
                           
            local NewGenerator = IsoGenerator.new(nil,player:getCell(),player:getCurrentSquare());
                                        
            NewGenerator:setConnected(false);
            NewGenerator:setFuel(0);
            NewGenerator:setCondition(0);
            NewGenerator:setActivated(false);
			NewGenerator:setSurroundingElectricity();
            NewGenerator:remove();
                       
        
            break;
        end
    end
end

function HCSetSolarGen(items, result, player)
    
    if(player:isOutside()) then
    
        for i=0, items:size()-1 do
            if(items:get(i):getType() == "HCSolargen") then
                
                local NewGenerator = IsoGenerator.new(nil,player:getCell(),player:getCurrentSquare());
                NewGenerator:setConnected(true);
                NewGenerator:setFuel(100);
                NewGenerator:setCondition(100);
                NewGenerator:setActivated(true);
				NewGenerator:setSurroundingElectricity();
                NewGenerator:remove();
                player:getCurrentSquare():AddWorldInventoryItem( "Hydrocraft.HCSolargen2" ,0.5,0.5,0);
                              
                break;
                
            end
        end
    else
        player:Say("Must set Outside");
		player:getInventory():AddItem("Hydrocraft.HCSolargen");
    end
end
 