Framework = nil

TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)


RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(450, function()
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)
    end) 
end)

RegisterNetEvent('qb-christmas:client:use:kado')
AddEventHandler('qb-christmas:client:use:kado', function()
    Framework.Functions.Progressbar("christmas-present", "Open Gift..", math.random(20000, 30000), false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done   
        TriggerServerEvent('Framework:Server:RemoveItem', 'kerstkado', 1)
        TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items['kerstkado'], "remove")
        Framework.Functions.Notify("WOW!!!!", "success")
        TriggerServerEvent('qb-christmas:server:get:kado:prize')
    end, function() -- Cancel
        Framework.Functions.Notify("Or not..", "error")
    end)
end)