Framework = nil
   
RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
     TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
    end) 
end)


RegisterNetEvent('qb-judge:client:toggle')
AddEventHandler('qb-judge:client:toggle', function()
  exports['qb-assets']:AddProp('Tablet')
  exports['qb-assets']:RequestAnimationDict('amb@code_human_in_bus_passenger_idles@female@tablet@base')
  TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
  Citizen.SetTimeout(500, function()
   SetNuiFocus(true, true)
   SendNUIMessage({
       type = "tablet",
   })
  end)
end)

RegisterNetEvent('qb-judge:client:lawyer:add:closest')
AddEventHandler('qb-judge:client:lawyer:add:closest', function()
local Player, Distance = Framework.Functions.GetClosestPlayer()
 if Player ~= -1 and Distance < 1.5 then
  local ServerId = GetPlayerServerId(Player)
  TriggerServerEvent('qb-judge:lawyer:add', ServerId)
 end
end)

RegisterNetEvent("qb-judge:client:show:pass")
AddEventHandler("qb-judge:client:show:pass", function(SourceId, data)
    local SourceCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(SourceId)), false)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), false)
    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, SourceCoords.x, SourceCoords.y, SourceCoords.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Pas-ID:</strong> {1} <br><strong>Voornaam:</strong> {2} <br><strong>Achternaam:</strong> {3} <br><strong>BSN:</strong> {4} </div></div>',
            args = {'Advocatenpas', data.id, data.firstname, data.lastname, data.citizenid}
        })
    end
end)

RegisterNUICallback("closetablet", function()
  SetNuiFocus(false, false)
  if exports['qb-assets']:GetPropStatus() then
    exports['qb-assets']:RemoveProp()
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
  end
end)