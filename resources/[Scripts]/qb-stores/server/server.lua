Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Functions.CreateCallback('qb-stores:server:GetConfig', function(source, cb)
    cb(Config)
end)

RegisterServerEvent('qb-stores:server:update:store:items')
AddEventHandler('qb-stores:server:update:store:items', function(Shop, ItemData, Amount)
    Config.Shops[Shop]["Product"][ItemData.slot].amount = Config.Shops[Shop]["Product"][ItemData.slot].amount - Amount
    TriggerClientEvent('qb-stores:client:set:store:items', -1, ItemData, Amount, Shop)
end)