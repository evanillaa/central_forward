Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Functions.CreateCallback('qb-emergencylights:server:get:config', function(source, cb)
    cb(Config)
end)

RegisterServerEvent('qb-emergencylights:server:setup:first:time')
AddEventHandler('qb-emergencylights:server:setup:first:time', function(Plate)
    Config.ButtonData[Plate] = {
        ['Blue'] = false,
        ['Orange'] = false,
        ['Green'] = false,
        ['Stop'] = false,
        ['Follow'] = false,
        ['Siren'] = false,
        ['Pit'] = false,
    }
    TriggerClientEvent('qb-emergencylights:client:setup:first:time', -1, Plate)
end)

RegisterServerEvent('qb-emergencylights:server:update:button')
AddEventHandler('qb-emergencylights:server:update:button', function(Data, Plate)
    Config.ButtonData[Plate][Data.Type] = Data.State
    TriggerClientEvent('qb-emergencylights:client:update:button', -1, Data, Plate)
end)

RegisterServerEvent('qb-emergencylights:server:toggle:sounds')
AddEventHandler('qb-emergencylights:server:toggle:sounds', function(State)
    TriggerClientEvent('qb-emergencylights:client:toggle:sounds', -1, source, State)
end)

RegisterServerEvent('qb-emergencylights:server:set:sounds:disabled')
AddEventHandler('qb-emergencylights:server:set:sounds:disabled', function()
    TriggerClientEvent('qb-emergencylights:client:set:sounds:disabled', -1, source)
end)