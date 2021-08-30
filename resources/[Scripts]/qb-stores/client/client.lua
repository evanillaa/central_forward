local NearShop = false
local isLoggedIn = true
local CurrentShop = nil

Framework = nil

TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    

   
RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
 Citizen.SetTimeout(1250, function()
   TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
    Citizen.Wait(250)
    Framework.Functions.TriggerCallback("qb-stores:server:GetConfig", function(config)
      Config = config
    end)
   isLoggedIn = true
 end)
end)

-- Code

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if isLoggedIn then
            NearShop = false
            for k, v in pairs(Config.Shops) do
                local PlayerCoords = GetEntityCoords(PlayerPedId())
                local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], true)
                if Distance < 2.5 then
                    NearShop = true
                    CurrentShop = k
                end
            end
            if not NearShop then
                Citizen.Wait(1000)
                CurrentShop = nil
            end
        end
    end
end)

RegisterNetEvent('qb-stores:server:open:shop')
AddEventHandler('qb-stores:server:open:shop', function()
  Citizen.SetTimeout(350, function()
      if CurrentShop ~= nil then 
        local Shop = {label = Config.Shops[CurrentShop]['Name'], items = Config.Shops[CurrentShop]['Product'], slots = 30}
        TriggerServerEvent("qb-inventory:server:OpenInventory", "shop", "Itemshop_"..CurrentShop, Shop)
      end
  end)
end)

RegisterNetEvent('qb-stores:client:update:store')
AddEventHandler('qb-stores:client:update:store', function(ItemData, Amount)
    --TriggerServerEvent('qb-stores:server:update:store:items', CurrentShop, ItemData, Amount)
end)

RegisterNetEvent('qb-stores:client:set:store:items')
AddEventHandler('qb-stores:client:set:store:items', function(ItemData, Amount, ShopId)
    Config.Shops[ShopId]["Product"][ItemData.slot].amount = Config.Shops[ShopId]["Product"][ItemData.slot].amount - Amount
end)

-- // Function \\ --

function IsNearShop()
    return NearShop
end