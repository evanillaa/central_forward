Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

RegisterServerEvent('qb-assets:server:tackle:player')
AddEventHandler('qb-assets:server:tackle:player', function(playerId)
    TriggerClientEvent("qb-assets:client:get:tackeled", playerId)
end)

RegisterServerEvent('qb-assets:server:display:text')
AddEventHandler('qb-assets:server:display:text', function(Text)
	TriggerClientEvent('qb-assets:client:me:show', -1, Text, source)
end)

RegisterServerEvent('qb-assets:server:drop')
AddEventHandler('qb-assets:server:drop', function()
	--if not Framework.Functions.HasPermission(source, 'admin') then
		TriggerEvent("qb-logs:server:SendLog", "anticheat", "Nui Devtools", "red", "**".. GetPlayerName(source).. "** Tryd opening devtools.")
		DropPlayer(source, 'Do not open DevTools.')
	--end
end)

Framework.Commands.Add("id", "What id my id?", {}, false, function(source, args)
    TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "ID: "..source)
end)
Framework.Commands.Add("shuffle", "Shuffle seats", {}, false, function(source, args)
 TriggerClientEvent('qb-assets:client:seat:shuffle', source)
end)

Framework.Commands.Add("me", "Perform a text on ped", {}, false, function(source, args)
  local Text = table.concat(args, ' ')
  TriggerClientEvent('qb-assets:client:me:show', -1, Text, source)
end)