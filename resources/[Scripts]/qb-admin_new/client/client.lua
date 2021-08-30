local LoggedIn = true

Framework = nil

TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(500, function()
     TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
      Citizen.Wait(150)
      LoggedIn = true
    end)
end)

-- Code

-- // Events \\ --

RegisterNetEvent('qb-admin:client:open:menu')
AddEventHandler('qb-admin:client:open:menu', function()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'openadmin'})
end)

RegisterNetEvent('qb-admin:client:open:target:inventory')
AddEventHandler('qb-admin:client:open:target:inventory', function(TargetId)
  TriggerServerEvent("qb-inventory:server:OpenInventory", "otherplayer", TargetId)
end)

RegisterNetEvent('qb-admin:client:kill:player')
AddEventHandler('qb-admin:client:kill:player', function()
  SetEntityHealth(PlayerPedId(), 0.0)
end)

-- // Callbacks \\ --

RegisterNUICallback('GetPlayers', function(data, cb)
    Framework.Functions.TriggerCallback('qb-admin:server:get:players', function(Players)
        cb(Players)
    end)
end)

RegisterNUICallback('FreezePlayer', function(data)

end)

RegisterNUICallback('NoclipPlayer', function(data)

end)

RegisterNUICallback('OpenInventoryPlayer', function(data)
  Citizen.SetTimeout(450, function()
     TriggerServerEvent('qb-admin:server:open:inventory', data.serverid)
  end)
end)

RegisterNUICallback('ClothingMenuPlayer', function(data)
  Citizen.SetTimeout(450, function()
    TriggerServerEvent('qb-admin:server:give:clothing', data.serverid)
  end)
end)

RegisterNUICallback('KillPlayer', function(data)
  Citizen.SetTimeout(450, function()
    TriggerServerEvent('qb-admin:server:kill:player', data.serverid)
  end)
end)

RegisterNUICallback('RevivePlayer', function(data)
  Citizen.SetTimeout(450, function()
    TriggerServerEvent('qb-admin:server:revive:player', data.serverid)
  end)
end)

RegisterNUICallback('KickPlayer', function(data)
  Citizen.SetTimeout(450, function()
    TriggerServerEvent('qb-admin:server:kick:player', data.serverid)
  end)
end)








RegisterNUICallback('CloseNui', function(data, cb)
  SetNuiFocus(false, false)
end)