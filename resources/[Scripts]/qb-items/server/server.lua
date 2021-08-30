Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

-- // Lockpick \\ --
Framework.Functions.CreateUseableItem("advancedlockpick", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:lockpick', source, true)
    end
end)

Framework.Functions.CreateUseableItem("lockpick", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:lockpick', source, false)
    end
end)

Framework.Functions.CreateUseableItem("drill", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:drill', source)
    end
end)

-- // Eten \\ --

Framework.Functions.CreateUseableItem("water", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink', source, 'water', 'water')
    end
end)

Framework.Functions.CreateUseableItem("ecola", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink', source, 'ecola', 'cola')
    end
end)

Framework.Functions.CreateUseableItem("sprunk", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink', source, 'sprunk', 'cola')
    end
end)

Framework.Functions.CreateUseableItem("slushy", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink:slushy', source)
    end
end)

Framework.Functions.CreateUseableItem("sandwich", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'sandwich', 'sandwich')
    end
end)

Framework.Functions.CreateUseableItem("chocolade", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'chocolade', 'chocolade')
    end
end)

Framework.Functions.CreateUseableItem("420-choco", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, '420-choco', 'chocolade')
    end
end)

Framework.Functions.CreateUseableItem("donut", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'donut', 'donut')
    end
end)

Framework.Functions.CreateUseableItem("coffee", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink', source, 'coffee', 'coffee')
    end
end)

-- BurgerShot

Framework.Functions.CreateUseableItem("burger-bleeder", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'burger-bleeder', 'hamburger')
    end
end)

Framework.Functions.CreateUseableItem("burger-moneyshot", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'burger-moneyshot', 'hamburger')
    end
end)

Framework.Functions.CreateUseableItem("burger-torpedo", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'burger-torpedo', 'hamburger')
    end
end)

Framework.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'burger-heartstopper', 'hamburger')
    end
end)

Framework.Functions.CreateUseableItem("burger-softdrink", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink', source, 'burger-softdrink', 'burger-soft')
    end
end)

Framework.Functions.CreateUseableItem("burger-fries", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:eat', source, 'burger-fries', 'burger-fries')
    end
end)

Framework.Functions.CreateUseableItem("burger-box", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-burgershot:client:open:box', source, item.info.boxid)
    end
end)

Framework.Functions.CreateUseableItem("burger-coffee", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:drink', source, 'burger-coffee', 'coffee')
    end
end)

-- // Other \\ --

Framework.Functions.CreateUseableItem("duffel-bag", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:duffel-bag', source, item.info.bagid)
    end
end)

Framework.Functions.CreateUseableItem("armor", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:armor', source)
    end
end)

Framework.Functions.CreateUseableItem("heavy-armor", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:heavy', source)
    end
end)

Framework.Functions.CreateUseableItem("repairkit", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:repairkit', source)
    end
end)

Framework.Functions.CreateUseableItem("bandage", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-hospital:client:use:bandage', source)
    end
end)

Framework.Functions.CreateUseableItem("health-pack", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-hospital:client:use:health-pack', source)
    end
end)

Framework.Functions.CreateUseableItem("painkillers", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-hospital:client:use:painkillers', source)
    end
end)

Framework.Functions.CreateUseableItem("joint", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:joint', source)
    end
end)

Framework.Functions.CreateUseableItem("coke-bag", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:use:coke', source)
    end
end)

Framework.Functions.CreateUseableItem("lsd-strip", function(source, item)
    local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-items:client:use:lsd", source)
    end
end)

Framework.Functions.CreateUseableItem("coin", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-items:client:coinflip', source)
    end
end)

-- Weed

Framework.Functions.CreateUseableItem("weed-nutrition", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:feed:plants', source)
    end
end)

Framework.Functions.CreateUseableItem("white-widow-seed", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:plant', source, 'White Widow', 'White-Widow', 'white-widow-seed')
    end
end)

Framework.Functions.CreateUseableItem("skunk-seed", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:plant', source, 'Skunk', 'Skunk', 'skunk-seed')
    end
end)

Framework.Functions.CreateUseableItem("purple-haze-seed", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:plant', source, 'Purple Haze', 'Purple-Haze', 'purple-haze-seed')
    end
end)

Framework.Functions.CreateUseableItem("og-kush-seed", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:plant', source, 'Og Kush', 'Og-Kush', 'og-kush-seed')
    end
end)

Framework.Functions.CreateUseableItem("amnesia-seed", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:plant', source, 'Amnesia', 'Amnesia', 'amnesia-seed')
    end
end)

Framework.Functions.CreateUseableItem("ak47-seed", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-houseplants:client:plant', source, 'AK47', 'AK47', 'ak47-seed')
    end
end)

-- // Coke \\ --

Framework.Functions.CreateUseableItem("packed-coke-brick", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-illegal:client:unpack:coke', source)
    end
end)

Framework.Functions.CreateUseableItem("burner-phone", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-illegal:client:start:burner-call', source)
    end
end)

-- // Sleutels \\ --

Framework.Functions.CreateUseableItem("key-a", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-illegal:client:use:key', source, 'key-a')
    end
end)

Framework.Functions.CreateUseableItem("key-b", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-illegal:client:use:key', source, 'key-b')
    end
end)

Framework.Functions.CreateUseableItem("key-c", function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-illegal:client:use:key', source, 'key-c')
    end
end)

Framework.Commands.Add("double", "Nice dice", {{name="number", help="Anumber of dice"}, {name="zijdes", help="Number of sides of die"}}, true, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)
    local DiceItems = Player.Functions.GetItemByName("dice")
    if args[1] ~= nil and args[2] ~= nil then 
      local Amount = tonumber(args[1])
      local Sides = tonumber(args[2])
      if DiceItems ~= nil then
         if (Sides > 0 and Sides <= 20) and (Amount > 0 and Amount <= 5) then 
             TriggerClientEvent('qb-items:client:dobbel', source, Amount, Sides)
         else
             TriggerClientEvent('Framework:Notify', source, "Too many sides or 0 (max: 5) or too many dice or 0 (max: 20)", "error", 3500)
         end
      else
        TriggerClientEvent('Framework:Notify', source, "YOU don't even have dice..", "error", 3500)
      end
  end
end)

Framework.Commands.Add("vestoff", "Take off your vest", {}, false, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("qb-items:client:reset:armor", source)
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "This command is for emergency services!")
    end
end)

RegisterServerEvent('qb-items:server:giveitem')
AddEventHandler('qb-items:server:giveitem', function(ItemName, Amount)
    local Player = Framework.Functions.GetPlayer(source)
    Player.Functions.AddItem(ItemName, Amount)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, Framework.Shared.Items[ItemName], "add")
end)