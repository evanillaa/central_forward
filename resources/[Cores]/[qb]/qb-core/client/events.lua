-- // Register Player Data in client \\ --
RegisterNetEvent('Framework:Player:SetPlayerData')
AddEventHandler('Framework:Player:SetPlayerData', function(val)
	Framework.PlayerData = val
end)

RegisterNetEvent('Framework:Player:UpdatePlayerData')
AddEventHandler('Framework:Player:UpdatePlayerData', function()
	local data = {}
	data.position = Framework.Functions.GetCoords(PlayerPedId())
	TriggerServerEvent('Framework:UpdatePlayer', data)
end)

RegisterNetEvent('Framework:Player:Salary')
AddEventHandler('Framework:Player:Salary', function()
	TriggerServerEvent('Framework:Salary')
end)

-- // Framework Command Events \\ --

RegisterNetEvent('Framework:Command:TeleportToPlayer')
AddEventHandler('Framework:Command:TeleportToPlayer', function(othersource)
	local coords = Framework.Functions.GetCoords(GetPlayerPed(GetPlayerFromServerId(othersource)))
	local entity = PlayerPedId()
	if IsPedInAnyVehicle(entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end
	SetEntityCoords(entity, coords.x, coords.y, coords.z)
	SetEntityHeading(entity, coords.a)
end)

RegisterNetEvent('Framework:Command:TeleportToCoords')
AddEventHandler('Framework:Command:TeleportToCoords', function(x, y, z)
	local entity = PlayerPedId()
	if IsPedInAnyVehicle(entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end
	SetEntityCoords(entity, x, y, z)
end)

RegisterNetEvent('Framework:Command:SpawnVehicle')
AddEventHandler('Framework:Command:SpawnVehicle', function(model)
	Framework.Functions.SpawnVehicle(model, function(vehicle)
	 TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
	 exports['qb-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
	 Citizen.Wait(100)
	 exports['qb-fuel']:SetFuelLevel(vehicle, GetVehicleNumberPlateText(vehicle), 100, true)
	 Framework.Functions.Notify('Vehicle spawned', 'success')
	end, nil, true, true)
end)

RegisterNetEvent('Framework:Command:DeleteVehicle')
AddEventHandler('Framework:Command:DeleteVehicle', function()
	if IsPedInAnyVehicle(PlayerPedId()) then
		Framework.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
	else
		local vehicle = Framework.Functions.GetClosestVehicle()
		Framework.Functions.DeleteVehicle(vehicle)
	end
	Framework.Functions.Notify('Vehicle deleted', 'error')
end)

RegisterNetEvent('Framework:Command:Revive')
AddEventHandler('Framework:Command:Revive', function()
	local coords = Framework.Functions.GetCoords(PlayerPedId())
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z+0.2, coords.a, true, false)
	SetPlayerInvincible(PlayerPedId(), false)
	ClearPedBloodDamage(PlayerPedId())
end)

RegisterNetEvent('Framework:Command:GoToMarker')
AddEventHandler('Framework:Command:GoToMarker', function()
	Citizen.CreateThread(function()
		local entity = PlayerPedId()
		if IsPedInAnyVehicle(entity, false) then
			entity = GetVehiclePedIsUsing(entity)
		end
		local success = false
		local blipFound = false
		local blipIterator = GetBlipInfoIdIterator()
		local blip = GetFirstBlipInfoId(8)

		while DoesBlipExist(blip) do
			if GetBlipInfoIdType(blip) == 4 then
				cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())) --GetBlipInfoIdCoord(blip)
				blipFound = true
				break
			end
			blip = GetNextBlipInfoId(blipIterator)
		end

		if blipFound then
			DoScreenFadeOut(250)
			while IsScreenFadedOut() do
				Citizen.Wait(250)
			end
			local groundFound = false
			local yaw = GetEntityHeading(entity)
			
			for i = 0, 1000, 1 do
				SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
				SetEntityRotation(entity, 0, 0, 0, 0 ,0)
				SetEntityHeading(entity, yaw)
				SetGameplayCamRelativeHeading(0)
				Citizen.Wait(0)
				--groundFound = true
				if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then --GetGroundZFor3dCoord(cx, cy, i, 0, 0) GetGroundZFor_3dCoord(cx, cy, i)
					cz = ToFloat(i)
					groundFound = true
					break
				end
			end
			if not groundFound then
				cz = -300.0
			end
			success = true
		end

		if success then
			SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
			SetGameplayCamRelativeHeading(0)
			if IsPedSittingInAnyVehicle(PlayerPedId()) then
				if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
					SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
				end
			end
			DoScreenFadeIn(250)
		end
	end)
end)

-- Other stuff
RegisterNetEvent('Framework:Client:LocalOutOfCharacter')
AddEventHandler('Framework:Client:LocalOutOfCharacter', function(playerId, playerName, message)
	local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId)), false)
    local pos = GetEntityCoords(PlayerPedId(), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 20.0) then
		TriggerEvent("chatMessage", "OOC | " .. playerName, "normal", message)
    end
end)

RegisterNetEvent('Framework:Notify')
AddEventHandler('Framework:Notify', function(text, type, length)
	Framework.Functions.Notify(text, type, length)
end)

RegisterNetEvent('qb-core:client:closenui')
AddEventHandler('qb-core:client:closenui', function()
	SetNuiFocus(false, false)
end)

RegisterNetEvent('qb-core:client:opennui')
AddEventHandler('qb-core:client:opennui', function()
	SetNuiFocus(true, true)
end)
RegisterNUICallback("devtoolOpening", function()
    TriggerServerEvent("DevMode")
end)

RegisterNetEvent('Framework:Client:TriggerCallback')
AddEventHandler('Framework:Client:TriggerCallback', function(name, ...)
	if Framework.ServerCallbacks[name] ~= nil then
		Framework.ServerCallbacks[name](...)
		Framework.ServerCallbacks[name] = nil
	end
end)

RegisterNetEvent("Framework:Client:UseItem")
AddEventHandler('Framework:Client:UseItem', function(item)
	TriggerServerEvent("Framework:Server:UseItem", item)
end)