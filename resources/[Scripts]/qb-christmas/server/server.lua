Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

Framework.Functions.CreateUseableItem("kerstkado", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-christmas:client:use:kado', source)
    end
end)

Framework.Commands.Add("christmas", "Geef iedereen een kerst kado", {}, false, function(source, args)
    local src = source
    for k, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil then
         Player.Functions.AddItem('kerstkado', 1)
         TriggerClientEvent('Framework:Notify', v, "Merry Christmas and a Happy New Year!", "info", 15000)
         TriggerClientEvent('qb-inventory:client:ItemBox', v, Framework.Shared.Items['kerstkado'], "add")
        end
    end
end, 'god')

RegisterServerEvent('qb-christmas:server:get:kado:prize')
AddEventHandler('qb-christmas:server:get:kado:prize', function()
	local Player = Framework.Functions.GetPlayer(source)
    local RandomValue = math.random(1,75)
    Player.Functions.AddItem('lsd-strip', 1)
    Player.Functions.AddMoney('cash', math.random(1000, 2500), "Christmas Gift")
    TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['lsd-strip'], "add")
    if RandomValue >= 1 and RandomValue < 15 then
        Player.Functions.AddItem('health-pack', 1, false)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['health-pack'], "add")
    elseif RandomValue > 15 and RandomValue < 30 then
        local info = {quality = 100.0}
        Player.Functions.AddItem('weapon_molotov', 1, false, info)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['weapon_molotov'], "add")
    elseif RandomValue > 30 and RandomValue < 45 then
        Player.Functions.AddItem('diamond-blue', math.random(2,4))
        TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['diamond-blue'], "add")
    elseif RandomValue > 45 and RandomValue < 60 then
        Player.Functions.AddItem('pistol_extendedclip', 1)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['pistol_extendedclip'], "add")
    elseif RandomValue > 60 and RandomValue < 75 then
        Player.Functions.AddItem('pistol_suppressor', 1)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['pistol_suppressor'], "add")
    end
end)