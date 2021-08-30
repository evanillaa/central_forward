Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Commands.Add("fix", "Repair a vehicle", {}, false, function(source, args)
    TriggerClientEvent('qb-vehiclefailure:client:fix:veh', source)
end, "admin")