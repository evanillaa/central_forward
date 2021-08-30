Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

Framework.Commands.Add("binds", "Open commandbinding menu", {}, false, function(source, args)
	TriggerClientEvent("qb-binds:client:openUI", source)
end)

RegisterServerEvent('qb-binds:server:setKeyMeta')
AddEventHandler('qb-binds:server:setKeyMeta', function(keyMeta)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("commandbinds", keyMeta)
end)