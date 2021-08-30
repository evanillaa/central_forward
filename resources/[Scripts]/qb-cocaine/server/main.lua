Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

local hiddenprocess = vector3(2431.57,4971.2,42.35) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords
local hiddenstart = vector3(2122.2004394531,4784.7919921875,40.970275878906) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

RegisterNetEvent('coke:updateTable')
AddEventHandler('coke:updateTable', function(bool)
    TriggerClientEvent('coke:syncTable', -1, bool)
end)

Framework.Functions.CreateUseableItem('coke', function(source, item)
	local Player = Framework.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
 		TriggerClientEvent('coke:onUse', source)
	end
end)


Framework.Functions.CreateCallback('coke:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

Framework.Functions.CreateCallback('coke:startcoords', function(source, cb)
    cb(hiddenstart)
end)

Framework.Functions.CreateCallback('coke:pay', function(source, cb)
	local src = source
	local Player = Framework.Functions.GetPlayer(src)
	local amount = Config.amount
	local cashamount = Player.PlayerData.money["cash"]
    local toamount = tonumber(amount)
   
	if cashamount >= amount then
		Player.Functions.RemoveMoney('cash', amount) 
    	cb(true)
	else
		TriggerClientEvent("Framework:Notify", src, "You dont have enough Money to Start", "error", 4000)
		cb(false)
	end
end)

RegisterServerEvent("coke:processed")
AddEventHandler("coke:processed", function(x,y,z)
  	local src = source
  	local Player = Framework.Functions.GetPlayer(src)
	local pick = Config.randBrick
        if 	TriggerClientEvent("Framework:Notify", src, "Making a Coke Bag!!", "Success", 1) then
			Player.Functions.RemoveItem('coke_brick', 1) 
			TriggerClientEvent("inventory:client:ItemBox", source, Framework.Shared.Items['coke_brick'], "remove")
		end
	end)
	

RegisterServerEvent("coke:processeda")
AddEventHandler("coke:processeda", function(x,y,z)
  	local src = source
  	local Player = Framework.Functions.GetPlayer(src)
	local pick = Config.randBrick
	
	if 	TriggerClientEvent("Framework:Notify", src, "Made a Coke Bag!!", "Success", 1) then
			Player.Functions.AddItem('cokebaggy', 8)
			TriggerClientEvent("inventory:client:ItemBox", source, Framework.Shared.Items['cokebaggy'], "add")
		end

	
	
	end)	

Framework.Functions.CreateCallback('coke:process', function(source, cb)
	local src = source
	local Player = Framework.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "coke_brick" then
					cb(true)
			    else
					TriggerClientEvent("Framework:Notify", src, "You do not have any coke bricks", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)

RegisterServerEvent("coke:GiveItem")
AddEventHandler("coke:GiveItem", function()
  	local src = source
	  local Player = Framework.Functions.GetPlayer(src)
	  local price = Config.price
	  local brick = Config.randBrick
	Player.Functions.AddMoney('cash', price)
	Player.Functions.AddItem('coke_brick', brick)
	TriggerClientEvent('inventory:client:ItemBox', src, Framework.Shared.Items['coke_brick'], "add")
end)
