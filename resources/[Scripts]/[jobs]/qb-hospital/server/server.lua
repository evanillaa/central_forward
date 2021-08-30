Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

-- Code

Framework.Functions.CreateCallback('qb-hospital:server:pay:hospital', function(source, cb)
	local Player = Framework.Functions.GetPlayer(source)
	local CurrentCash = Player.PlayerData.money['cash']
	if CurrentCash >= Config.BedPayment then
		Player.Functions.RemoveMoney('cash', Config.BedPayment, 'Hospital')
		cb(true)
	else
		TriggerClientEvent('Framework:Notify', source, "You dont have enough cash..", "error", 4500)
		cb(false)
	end

end)

RegisterServerEvent('qb-hospital:server:set:state')
AddEventHandler('qb-hospital:server:set:state', function(type, state)
	local src = source
	local Player = Framework.Functions.GetPlayer(src)
	if Player ~= nil then
		Player.Functions.SetMetaData(type, state)
	end
end)

RegisterServerEvent('qb-hospital:server:dead:respawn')
AddEventHandler('qb-hospital:server:dead:respawn', function()
	local Player = Framework.Functions.GetPlayer(source)
	Player.Functions.ClearInventory()
	Citizen.SetTimeout(250, function()
		Player.Functions.Save()
	end)
	Player.Functions.RemoveMoney('bank', Config.RespawnPrice, 'respawn-fund')
end)

RegisterServerEvent('qb-hospital:server:save:health:armor')
AddEventHandler('qb-hospital:server:save:health:armor', function(PlayerHealth, PlayerArmor)
	local Player = Framework.Functions.GetPlayer(source)
	if Player ~= nil then
		Player.Functions.SetMetaData('health', PlayerHealth)
		Player.Functions.SetMetaData('armor', PlayerArmor)
	end
end)

RegisterServerEvent('qb-hospital:server:revive:player')
AddEventHandler('qb-hospital:server:revive:player', function(PlayerId)
	local TargetPlayer = Framework.Functions.GetPlayer(PlayerId)
	if TargetPlayer ~= nil then
		TriggerClientEvent('qb-hospital:client:revive', TargetPlayer.PlayerData.source, true, true)
	end
end)

RegisterServerEvent('qb-hospital:server:heal:player')
AddEventHandler('qb-hospital:server:heal:player', function(TargetId)
	local TargetPlayer = Framework.Functions.GetPlayer(TargetId)
	if TargetPlayer ~= nil then
		TriggerClientEvent('qb-hospital:client:heal', TargetPlayer.PlayerData.source)
	end
end)

RegisterServerEvent('qb-hospital:server:take:blood:player')
AddEventHandler('qb-hospital:server:take:blood:player', function(TargetId)
	local src = source
	local SourcePlayer = Framework.Functions.GetPlayer(src)
	local TargetPlayer = Framework.Functions.GetPlayer(TargetId)
	if TargetPlayer ~= nil then
	 local Info = {vialid = math.random(11111,99999), vialname = TargetPlayer.PlayerData.charinfo.firstname..' '..TargetPlayer.PlayerData.charinfo.lastname, bloodtype = TargetPlayer.PlayerData.metadata['bloodtype'], vialbsn = TargetPlayer.PlayerData.citizenid}
	 SourcePlayer.Functions.AddItem('bloodvial', 1, false, Info)
	 TriggerClientEvent('qb-inventory:client:ItemBox', SourcePlayer.PlayerData.source, Framework.Shared.Items['bloodvial'], "add")
	end
end)

RegisterServerEvent('qb-hospital:server:set:bed:state')
AddEventHandler('qb-hospital:server:set:bed:state', function(BedData, bool)
	Config.Beds[BedData]['Busy'] = bool
	TriggerClientEvent('qb-hospital:client:set:bed:state', -1 , BedData, bool)
end)

Framework.Commands.Add("revive", "Revive a player or yourself", {{name="id", help="Player ID (can be empty)"}}, false, function(source, args)
	if args[1] ~= nil then
		local Player = Framework.Functions.GetPlayer(tonumber(args[1]))
		if Player ~= nil then
			TriggerClientEvent('qb-hospital:client:revive', Player.PlayerData.source, true, true)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
		end
	else
		TriggerClientEvent('qb-hospital:client:revive', source, true, true)
	end
end, "user")

Framework.Commands.Add("setems", "Hire someone as ems", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)
    local TargetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))
    if Player.PlayerData.metadata['ishighcommand'] then
      if TargetPlayer ~= nil then
          TriggerClientEvent('Framework:Notify', TargetPlayer.PlayerData.source, 'You have been hired as an EMS congrats!', 'success')
          TriggerClientEvent('Framework:Notify', Player.PlayerData.source, 'You have hired'..TargetPlayer.PlayerData.charinfo.firstname..' '..TargetPlayer.PlayerData.charinfo.lastname..' as EMS!', 'success')
          TargetPlayer.Functions.SetJob('ambulance')
      end
    end
end)

Framework.Commands.Add("fireems", "Fire a ems personal", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)
    local TargetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))
    if Player.PlayerData.metadata['ishighcommand'] then
      if TargetPlayer ~= nil then
          TriggerClientEvent('Framework:Notify', TargetPlayer.PlayerData.source, 'You are fired from your last job!', 'error')
          TriggerClientEvent('Framework:Notify', Player.PlayerData.source, 'You have fired '..TargetPlayer.PlayerData.charinfo.firstname..' '..TargetPlayer.PlayerData.charinfo.lastname..'!', 'success')
          TargetPlayer.Functions.SetJob('unemployed')
      end
    end
end)