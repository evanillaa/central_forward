Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Functions.CreateCallback("qb-admin:server:get:players", function(source, cb)
    local PlayersTable = {} 
    for k, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
          Data = {
            Citizenid = Player.PlayerData.citizenid,
            Steam = Player.PlayerData.name,
            Name = Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname,
            Serverid = Player.PlayerData.source,
            DeathState = Player.PlayerData.metadata['isdead'],
            Job = Player.PlayerData.job.label,
          }
          table.insert(PlayersTable, Data)
    end
    cb(PlayersTable)
end)

Framework.Commands.Add("admin2", "Open admin menu", {}, false, function(source, args)
  TriggerClientEvent('qb-admin:client:open:menu', source)
end, "admin")

RegisterServerEvent('qb-admin:server:open:inventory')
AddEventHandler('qb-admin:server:open:inventory', function(TagetId)
  if Framework.Functions.HasPermission(source, 'admin') then
    TriggerClientEvent('qb-admin:client:open:target:inventory', source, TagetId)
  else
    TriggerClientEvent('Framework:Notify', source, "You do not have permission for this", 'error')
  end
end)

RegisterServerEvent('qb-admin:server:give:clothing')
AddEventHandler('qb-admin:server:give:clothing', function(TargetId)
  if Framework.Functions.HasPermission(source, 'admin') then
    TriggerClientEvent("qb-clothing:client:openMenu", TargetId)
  else
    TriggerClientEvent('Framework:Notify', source, "You do not have permission for this", 'error')
  end
end)

RegisterServerEvent('qb-admin:server:kick:player')
AddEventHandler('qb-admin:server:kick:player', function(TargetId)
  if Framework.Functions.HasPermission(source, 'admin') then
    DropPlayer(TargetId, "\n\n🛑 You have been kicked. 🛑\n")
  else
    TriggerClientEvent('Framework:Notify', source, "You do not have permission for this", 'error')
  end
end)

RegisterServerEvent('qb-admin:server:revive:player')
AddEventHandler('qb-admin:server:revive:player', function(TargetId)
  if Framework.Functions.HasPermission(source, 'admin') then
    TriggerClientEvent('qb-hospital:client:revive', TargetId, true, true)
  else
    TriggerClientEvent('Framework:Notify', source, "You do not have permission for this", 'error')
  end
end)

RegisterServerEvent('qb-admin:server:kill:player')
AddEventHandler('qb-admin:server:kill:player', function(TargetId)
  if Framework.Functions.HasPermission(source, 'admin') then
    if source ~= TargetId then
      TriggerClientEvent('qb-admin:client:kill:player', TargetId)
    else
      TriggerClientEvent('Framework:Notify', source, "You cant kill yourself.", 'error')
    end
  else
    TriggerClientEvent('Framework:Notify', source, "You do not have permission for this", 'error')
  end
end)

