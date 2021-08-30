local rob = false
local robbers = {}
Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

RegisterServerEvent('qb-sub:server:reward')
AddEventHandler('qb-sub:server:reward', function()

local xPlayer = Framework.Functions.GetPlayer(source)
local reward = math.random(5000 , 10000)

		--xPlayer.addMoney(reward)
		TriggerClientEvent('notification', source, ' Recieved € ' ..reward)
	
end)

Framework.Functions.CreateCallback("qb-sub:server:checkjammer",function(source,cb)
	local xPlayer = Framework.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName("key-c").count >= 1 then
		cb(true)
	else
		cb(false)
		TriggerClientEvent('notification', source, 'You need a key-c to stop the alarm')
	end
end)



Framework.Functions.CreateCallback("qb-sub:server:checkknife",function(source,cb)
	local xPlayer = Framework.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName("knife").count >= 1 then
		cb(true)
	else
		cb(false)
		TriggerClientEvent('notification', source, 'You need a knife to cut the cable.')
	end
end)


Framework.Functions.CreateCallback("qb-sub:server:checkcard",function(source,cb)
	local xPlayer = Framework.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName("green-card").count >= 1 then
		cb(true)
	else
		cb(false)
		TriggerClientEvent('notification', source, 'You need a green card to start the robbery.')
	end
end)
