Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

RegisterServerEvent('qb-field:server:set:plant:busy')
AddEventHandler('qb-field:server:set:plant:busy', function(PlantId, bool)
    Config.Plants['planten'][PlantId]['IsBezig'] = bool
    TriggerClientEvent('qb-field:client:set:plant:busy', -1, PlantId, bool)
end)

RegisterServerEvent('qb-field:server:set:picked:state')
AddEventHandler('qb-field:server:set:picked:state', function(PlantId, bool)
    Config.Plants['planten'][PlantId]['Geplukt'] = bool
    TriggerClientEvent('qb-field:client:set:picked:state', -1, PlantId, bool)
end)

RegisterServerEvent('qb-field:server:set:dry:busy')
AddEventHandler('qb-field:server:set:dry:busy', function(DryRackId, bool)
    Config.Plants['drogen'][DryRackId]['IsBezig'] = bool
    TriggerClientEvent('qb-field:client:set:dry:busy', -1, DryRackId, bool)
end)

RegisterServerEvent('qb-field:server:set:pack:busy')
AddEventHandler('qb-field:server:set:pack:busy', function(PackerId, bool)
    Config.Plants['verwerk'][PackerId]['IsBezig'] = bool
    TriggerClientEvent('qb-field:client:set:pack:busy', -1, PackerId, bool)
end)

RegisterServerEvent('qb-field:server:add:cash')
AddEventHandler('qb-field:server:add:cash', function()
    local Player = Framework.Functions.GetPlayer(source)
    local RandomAmount = math.random(10,34)
    Player.Functions.AddMoney('cash', RandomAmount, "dried-bud-sell")
end)

RegisterServerEvent('qb-field:server:give:tak')
AddEventHandler('qb-field:server:give:tak', function()
    local Player = Framework.Functions.GetPlayer(source)
    Player.Functions.AddItem('wet-tak', math.random(2,4))
    TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items['wet-tak'], "add")
end)

RegisterServerEvent('qb-field:server:add:item')
AddEventHandler('qb-field:server:add:item', function(Item, Amount)
    local Player = Framework.Functions.GetPlayer(source)
    Player.Functions.AddItem(Item, Amount)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items[Item], "add")
end)

RegisterServerEvent('qb-field:server:remove:item')
AddEventHandler('qb-field:server:remove:item', function(Item, Amount)
    local Player = Framework.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Item, Amount)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items[Item], "remove")
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        for k, v in pairs(Config.Plants['planten']) do
         if Config.Plants['planten'][k]['Geplukt'] then
             Citizen.Wait(30000)
             Config.Plants['planten'][k]['Geplukt'] = false
             TriggerClientEvent('qb-field:client:set:picked:state', -1, k, false)
         end
      end
  end
end)

-- Functions

Framework.Functions.CreateCallback('qb-field:server:GetConfig', function(source, cb)
    cb(Config)
end)

Framework.Functions.CreateCallback('qb-field:server:has:takken', function(source, cb)
    local Player = Framework.Functions.GetPlayer(source)
    local ItemTak = Player.Functions.GetItemByName("wet-tak")
	if ItemTak ~= nil then
        if ItemTak.amount >= 2 then
            cb(true)
		else
            cb(false)
		end
	   else
        cb(false)
	end
end)

Framework.Functions.CreateCallback('qb-field:server:has:nugget', function(source, cb)
    local Player = Framework.Functions.GetPlayer(source)
    local ItemNugget = Player.Functions.GetItemByName("wet-bud")
    local ItemBag = Player.Functions.GetItemByName("plastic-bag")
	if ItemNugget ~= nil and ItemBag ~= nil then
        if ItemNugget.amount >= 2 and ItemBag.amount >= 1 then
            cb(true)
		else
            cb(false)
		end
	   else
        cb(false)
	end
end)