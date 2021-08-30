RegisterServerEvent('qb-sound:server:play')
AddEventHandler('qb-sound:server:play', function(clientNetId, soundFile, soundVolume)
    TriggerClientEvent('qb-sound:client:play', clientNetId, soundFile, soundVolume)
end)

RegisterServerEvent('qb-sound:server:play:source')
AddEventHandler('qb-sound:server:play:source', function(soundFile, soundVolume)
    TriggerClientEvent('qb-sound:client:play', source, soundFile, soundVolume)
end)

RegisterServerEvent('qb-sound:server:play:distance')
AddEventHandler('qb-sound:server:play:distance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('qb-sound:client:play:distance', -1, source, maxDistance, soundFile, soundVolume)
end)