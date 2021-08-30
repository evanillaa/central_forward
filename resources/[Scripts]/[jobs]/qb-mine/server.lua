Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
--[[
RegisterServerEvent('qb-mine:getItem')
AddEventHandler('qb-mine:getItem', function()
    local xPlayer, randomItem = Framework.Functions.GetPlayer(source), Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        xPlayer.Functions.AddItem(randomItem, 1)
        TriggerClientEvent("inventory:client:ItemBox", source, Framework.Shared.Items[randomItem], "add")
        TriggerClientEvent("Framework:Notify", source, "Je hebt een ".. randomItem .." los gemined", "success", 10000)
    end
end)
]]--


RegisterServerEvent('qb-mine:getItem')
AddEventHandler('qb-mine:getItem', function()
	local xPlayer, randomItem = Framework.Functions.GetPlayer(source), Config.Items[math.random(1, #Config.Items)]
	
	if math.random(0, 100) <= Config.ChanceToGetItem then
		local Item = xPlayer.Functions.GetItemByName(randomItem)
		if Item == nil then
			xPlayer.Functions.AddItem(randomItem, 1)
            TriggerClientEvent('qb-inventory:client:ItemBox', xPlayer.PlayerData.source, Framework.Shared.Items[randomItem], 'add')
		else	
		if Item.amount < 35 then
        
        xPlayer.Functions.AddItem(randomItem, 1)
        TriggerClientEvent('qb-inventory:client:ItemBox', xPlayer.PlayerData.source, Framework.Shared.Items[randomItem], 'add')
		else
			TriggerClientEvent('Framework:Notify', source, 'Inventory is full', "error")  
		end
	    end
    end
end)



RegisterServerEvent('qb-mine:sell')
AddEventHandler('qb-mine:sell', function()
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    
if Player ~= nil then

    if Player.Functions.RemoveItem("steel", 1) then
        TriggerClientEvent("Framework:Notify", src, "You sold 1 steel", "success", 1000)
        Player.Functions.AddMoney("cash", Config.pricexd.steel)
        Citizen.Wait(200)
        TriggerClientEvent('qb-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['steel'], 'remove')
    else
        TriggerClientEvent("Framework:Notify", src, "You dont have items to sell", "error", 1000)
    end
        Citizen.Wait(1000)
    if Player.Functions.RemoveItem("iron", 1) then
        TriggerClientEvent("Framework:Notify", src, "You sold 1 iron", "success", 1000)
        Player.Functions.AddMoney("cash", Config.pricexd.iron)
        Citizen.Wait(200)
        TriggerClientEvent('qb-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['iron'], 'remove')
    else
        TriggerClientEvent("Framework:Notify", src, "You dont have items to sell", "error", 1000)
    end
        Citizen.Wait(1000)
    if Player.Functions.RemoveItem("copper", 1) then
        TriggerClientEvent("Framework:Notify", src, "You sold 1 copper", "success", 1000)
        Player.Functions.AddMoney("cash", Config.pricexd.copper)
        Citizen.Wait(200)
        TriggerClientEvent('qb-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['copper'], 'remove')
    else
        TriggerClientEvent("Framework:Notify", src, "You dont have items to sell", "error", 1000)
    end
        Citizen.Wait(1000)
    if Player.Functions.RemoveItem("diamond", 1) then
        TriggerClientEvent("Framework:Notify", src, "You sold 1 diamond", "success", 1000)
        Player.Functions.AddMoney("cash", Config.pricexd.diamond)
        Citizen.Wait(200)
        TriggerClientEvent('qb-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['diamond'], 'remove')
    else
        TriggerClientEvent("Framework:Notify", src, "You dont have items to sell", "error", 1000)
    end
        Citizen.Wait(1000)
    if Player.Functions.RemoveItem("emerald", 1) then
        TriggerClientEvent("Framework:Notify", src, "You sold 1 emerald", "success", 1000)
        Player.Functions.AddMoney("cash", Config.pricexd.emerald)
        Citizen.Wait(200)
        TriggerClientEvent('qb-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['emerald'], 'remove')
    else
        TriggerClientEvent("Framework:Notify", src, "You dont have items to sell", "error", 1000)
    end
end
end)
