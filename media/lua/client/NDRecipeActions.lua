
--Сохраняем имя при изменении состояния объекта
function recipe_saveOldName(item, result, player)
	if item then
		local oldName=item:getName()
			if oldName and item:isCustomName() then
				result:setName(oldName)
			end
	end
end
--Сохраняем страницы блокнота при изменении состояния объекта
function recipe_saveOldPages(items, result, player)
	if items then
		local item=items:get(0)
		recipe_saveOldName(item, result, player)
		
		if string.find(item:getCategory(),"Literature") then
			local oldData=item:getCustomPages()
			result:setCustomPages(oldData)
		end
	end
end
