Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

RegisterServerEvent('qb-hud:server:gain:stress')
AddEventHandler('qb-hud:server:gain:stress', function(Amount)
    local Player = Framework.Functions.GetPlayer(source)
	local NewStress = nil
	if Player ~= nil then
	  NewStress = Player.PlayerData.metadata["stress"] + Amount
	  if NewStress <= 0 then NewStress = 0 end
	  if NewStress > 105 then NewStress = 100 end
	  Player.Functions.SetMetaData("stress", NewStress)
      TriggerClientEvent("qb-hud:client:update:stress", Player.PlayerData.source, NewStress)
	end
end)

RegisterServerEvent('qb-hud:server:remove:stress')
AddEventHandler('qb-hud:server:remove:stress', function(Amount)
    local Player = Framework.Functions.GetPlayer(source)
	local NewStress = nil
	if Player ~= nil then
	  NewStress = Player.PlayerData.metadata["stress"] - Amount
	  if NewStress <= 0 then NewStress = 0 end
	  if NewStress > 105 then NewStress = 100 end
	  Player.Functions.SetMetaData("stress", NewStress)
      TriggerClientEvent("qb-hud:client:update:stress", Player.PlayerData.source, NewStress)
	end
end)

Framework.Commands.Add("cash", "Check how much money you have with you", {}, false, function(source, args)
	TriggerClientEvent('qb-hud:client:show:money', source, "cash")
end)