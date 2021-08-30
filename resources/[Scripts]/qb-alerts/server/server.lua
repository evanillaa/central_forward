Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

RegisterServerEvent('qb-alerts:server:send:alert')
AddEventHandler('qb-alerts:server:send:alert', function(data, forBoth)
    forBoth = forBoth ~= nil and forBoth or false
    TriggerClientEvent('qb-alerts:client:send:alert', -1, data, forBoth)
end)