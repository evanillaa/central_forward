Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

Framework.Functions.CreateCallback('qb-carwash:server:can:wash', function(source, cb, price)
    local CanWash = false
    local Player = Framework.Functions.GetPlayer(source)
    if Player.Functions.RemoveMoney("cash", price, "car-wash") then
        CanWash = true
    else 
        CanWash = false
    end
    cb(CanWash)
end)

RegisterServerEvent('qb-carwash:server:set:busy')
AddEventHandler('qb-carwash:server:set:busy', function(CarWashId, bool)
 Config.CarWashLocations[CarWashId]['Busy'] = bool
 TriggerClientEvent('qb-carwash:client:set:busy', -1, CarWashId, bool)
end)

RegisterServerEvent('qb-carwash:server:sync:wash')
AddEventHandler('qb-carwash:server:sync:wash', function(Vehicle)
 TriggerClientEvent('qb-carwash:client:sync:wash', -1, Vehicle)
end)

RegisterServerEvent('qb-carwash:server:sync:water')
AddEventHandler('qb-carwash:server:sync:water', function(WaterId)
 TriggerClientEvent('qb-carwash:client:sync:water', -1, WaterId)
end)

RegisterServerEvent('qb-carwash:server:stop:water')
AddEventHandler('qb-carwash:server:stop:water', function(WaterId)
 TriggerClientEvent('qb-carwash:client:stop:water', -1, WaterId)
end)
