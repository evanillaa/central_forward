local TotalGoldBars = 0

Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

Framework.Functions.CreateCallback('qb-pawnshop:server:has:gold', function(source, cb)
    local Player = Framework.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("gold-necklace") ~= nil or Player.Functions.GetItemByName("gold-rolex") or Player.Functions.GetItemByName("diamond-ring") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-pawnshop:server:sell:gold:items')
AddEventHandler('qb-pawnshop:server:sell:gold:items', function()
  local Player = Framework.Functions.GetPlayer(source)
  local Price = 0
  if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
     for k, v in pairs(Player.PlayerData.items) do
         if Config.ItemPrices[Player.PlayerData.items[k].name] ~= nil then
            Price = Price + (Config.ItemPrices[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
            Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
         end
     end
     if Price > 0 then
       Player.Functions.AddMoney("cash", Price, "sold-pawn-items")
       TriggerClientEvent('Framework:Notify', source, "You sold your gold")
     end
  end
end)

RegisterServerEvent('qb-pawnshop:server:sell:gold:bars')
AddEventHandler('qb-pawnshop:server:sell:gold:bars', function()
    local Player = Framework.Functions.GetPlayer(source)
    local GoldItem = Player.Functions.GetItemByName("gold-bar")
    Player.Functions.RemoveItem('gold-bar', GoldItem.amount)
    TriggerClientEvent("qb-inventory:client:ItemBox", source, Framework.Shared.Items['gold-bar'], "remove")
    Player.Functions.AddMoney("cash", math.random(3500, 5000) * GoldItem.amount, "sold-pawn-items")
end)

RegisterServerEvent('qb-pawnshop:server:smelt:gold')
AddEventHandler('qb-pawnshop:server:smelt:gold', function()
    local Player = Framework.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Config.SmeltItems[Player.PlayerData.items[k].name] ~= nil then
               local ItemAmount = (Player.PlayerData.items[k].amount / Config.SmeltItems[Player.PlayerData.items[k].name])
                if ItemAmount >= 1 then
                    ItemAmount = math.ceil(Player.PlayerData.items[k].amount / Config.SmeltItems[Player.PlayerData.items[k].name])
                    if Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k) then
                        TriggerClientEvent("qb-inventory:client:ItemBox", source, Framework.Shared.Items[Player.PlayerData.items[k].name], "remove")
                        TotalGoldBars = TotalGoldBars + ItemAmount
                        if TotalGoldBars > 0 then
                          TriggerClientEvent('qb-pawnshop:client:start:process', -1)
                        else
                            TriggerClientEvent('Framework:Notify', source, "Not enough items (16/26)")
                        end
                    end
                end
            end
        end
     end
end)

-- RegisterServerEvent('qb-pawnshop:server:redeem:gold:bars')
-- AddEventHandler('qb-pawnshop:server:redeem:gold:bars', function()
--     local Player = Framework.Functions.GetPlayer(source)
--     Player.Functions.AddItem("gold-bar", TotalGoldBars)
--     TriggerClientEvent("qb-inventory:client:ItemBox", source, Framework.Shared.Items["gold-bar"], "add")
--     TriggerClientEvent('qb-pawnshop:server:reset:smelter', -1)
-- end)

RegisterServerEvent('qb-pawnshop:server:redeem:gold:bars')
AddEventHandler('qb-pawnshop:server:redeem:gold:bars', function()
    local Player = Framework.Functions.GetPlayer(source)
    if TotalGoldBars > 0 then
        if Player.Functions.AddItem("gold-bar", TotalGoldBars) then
            TotalGoldBars = 0
            TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items["gold-bar"], "add")
            TriggerClientEvent('qb-pawnshop:server:reset:smelter', -1)
        end
    end
end)