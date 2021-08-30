local DoingSomething = false
local currentVest = nil
local currentVestTexture = nil
Framework = nil

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
 Citizen.SetTimeout(1250, function()
     TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
	 Citizen.Wait(250)
 end)
end)

-- Code

RegisterNetEvent('qb-items:client:drink')
AddEventHandler('qb-items:client:drink', function(ItemName, PropName)
	if not exports['qb-progressbar']:GetTaskBarStatus() then
		if not DoingSomething then
		DoingSomething = true
    	 	Citizen.SetTimeout(1000, function()
    			exports['qb-assets']:AddProp(PropName)
    			TriggerEvent('qb-inventory:client:set:busy', true)
    			exports['qb-assets']:RequestAnimationDict("amb@world_human_drinking@coffee@male@idle_a")
    			TaskPlayAnim(PlayerPedId(), 'amb@world_human_drinking@coffee@male@idle_a', "idle_c", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    	 		Framework.Functions.Progressbar("drink", "Drinking..", 10000, false, true, {
    	 			disableMovement = false,
    	 			disableCarMovement = false,
    	 			disableMouse = false,
    	 			disableCombat = true,
    			 }, {}, {}, {}, function() -- Done
					 DoingSomething = false
    				 exports['qb-assets']:RemoveProp()
    				 TriggerEvent('qb-inventory:client:set:busy', false)
    				 TriggerServerEvent('Framework:Server:RemoveItem', ItemName, 1)
    				 TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items[ItemName], "remove")
    				 StopAnimTask(PlayerPedId(), 'amb@world_human_drinking@coffee@male@idle_a', "idle_c", 1.0)
    				 TriggerServerEvent("Framework:Server:SetMetaData", "thirst", Framework.Functions.GetPlayerData().metadata["thirst"] + math.random(20, 35))
    			 end, function()
					DoingSomething = false
    				exports['qb-assets']:RemoveProp()
    				TriggerEvent('qb-inventory:client:set:busy', false)
    	 			Framework.Functions.Notify("Canceled..", "error")
    				StopAnimTask(PlayerPedId(), 'amb@world_human_drinking@coffee@male@idle_a', "idle_c", 1.0)
    	 		end)
    	 	end)
		end
	end
end)

RegisterNetEvent('qb-items:client:drink:slushy')
AddEventHandler('qb-items:client:drink:slushy', function()
	if not exports['qb-progressbar']:GetTaskBarStatus() then
		if not DoingSomething then
		DoingSomething = true
    		Citizen.SetTimeout(1000, function()
    			exports['qb-assets']:AddProp('Cup')
    			exports['qb-assets']:RequestAnimationDict("amb@world_human_drinking@coffee@male@idle_a")
    			TaskPlayAnim(PlayerPedId(), 'amb@world_human_drinking@coffee@male@idle_a', "idle_c", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    			TriggerEvent('qb-inventory:client:set:busy', true)
    			Framework.Functions.Progressbar("drink", "Drinking..", 10000, false, true, {
    				disableMovement = false,
    				disableCarMovement = false,
    				disableMouse = false,
    				disableCombat = true,
    			 }, {}, {}, {}, function() -- Done
					DoingSomething = false
    				 exports['qb-assets']:RemoveProp()
    				 TriggerEvent('qb-inventory:client:set:busy', false)
    				 TriggerServerEvent('qb-hud:server:remove:stress', math.random(12, 20))
    				 TriggerServerEvent('Framework:Server:RemoveItem', 'slushy', 1)
    				 TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items['slushy'], "remove")
    				 StopAnimTask(PlayerPedId(), 'amb@world_human_drinking@coffee@male@idle_a', "idle_c", 1.0)
    				 TriggerServerEvent("Framework:Server:SetMetaData", "thirst", Framework.Functions.GetPlayerData().metadata["thirst"] + math.random(20, 35))
    			 end, function()
					DoingSomething = false
    				exports['qb-assets']:RemoveProp()
    				TriggerEvent('qb-inventory:client:set:busy', false)
    				Framework.Functions.Notify("Canceled..", "error")
    				StopAnimTask(PlayerPedId(), 'amb@world_human_drinking@coffee@male@idle_a', "idle_c", 1.0)
    			end)
    		end)
		end
	end
end)

RegisterNetEvent('qb-items:client:eat')
AddEventHandler('qb-items:client:eat', function(ItemName, PropName)
	if not exports['qb-progressbar']:GetTaskBarStatus() then
		if not DoingSomething then
		DoingSomething = true
 			Citizen.SetTimeout(1000, function()
				exports['qb-assets']:AddProp(PropName)
				TriggerEvent('qb-inventory:client:set:busy', true)
				exports['qb-assets']:RequestAnimationDict("mp_player_inteat@burger")
				TaskPlayAnim(PlayerPedId(), 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
 				Framework.Functions.Progressbar("eat", "Eating..", 10000, false, true, {
 					disableMovement = false,
 					disableCarMovement = false,
 					disableMouse = false,
 					disableCombat = true,
				 }, {}, {}, {}, function() -- Done
					 DoingSomething = false
					 exports['qb-assets']:RemoveProp()
					 TriggerEvent('qb-inventory:client:set:busy', false)
					 TriggerServerEvent('qb-hud:server:remove:stress', math.random(6, 10))
					 TriggerServerEvent('Framework:Server:RemoveItem', ItemName, 1)
					 StopAnimTask(PlayerPedId(), 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 1.0)
					 TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items[ItemName], "remove")
					 if ItemName == 'burger-heartstopper' then
						TriggerServerEvent("Framework:Server:SetMetaData", "hunger", Framework.Functions.GetPlayerData().metadata["hunger"] + math.random(40, 50))
					 else
						TriggerServerEvent("Framework:Server:SetMetaData", "hunger", Framework.Functions.GetPlayerData().metadata["hunger"] + math.random(20, 35))
					 end
				 	end, function()
					DoingSomething = false
					exports['qb-assets']:RemoveProp()
					TriggerEvent('qb-inventory:client:set:busy', false)
 					Framework.Functions.Notify("Canceled..", "error")
					StopAnimTask(PlayerPedId(), 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 1.0)
 				end)
 			end)
		end
	end
end)

RegisterNetEvent('qb-items:client:use:armor')
AddEventHandler('qb-items:client:use:armor', function()
	if not exports['qb-progressbar']:GetTaskBarStatus() then
 		local CurrentArmor = GetPedArmour(PlayerPedId())
 		if CurrentArmor <= 100 and CurrentArmor + 50 <= 100 then
			local NewArmor = CurrentArmor + 50
			if CurrentArmor + 33 >= 100 or CurrentArmor >= 100 then NewArmor = 100 end
			 TriggerEvent('qb-inventory:client:set:busy', true)
 		    Framework.Functions.Progressbar("vest", "Put on the vest..", 10000, false, true, {
 		    	disableMovement = false,
 		    	disableCarMovement = false,
 		    	disableMouse = false,
 		    	disableCombat = true,
 		    }, {}, {}, {}, function() -- Done
 		  	 	 SetPedArmour(PlayerPedId(), NewArmor)
				 TriggerEvent('qb-inventory:client:set:busy', false)
				 TriggerServerEvent('Framework:Server:RemoveItem', 'armor', 1)
 		   	 TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items['armor'], "remove")
				 TriggerServerEvent('qb-hospital:server:save:health:armor', GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()))
 		    	 Framework.Functions.Notify("Success", "success")
 		    end, function()
				TriggerEvent('qb-inventory:client:set:busy', false)
 		    	Framework.Functions.Notify("Canceled..", "error")
 		    end)
 		else
			Framework.Functions.Notify("You already have a vest on..", "error")
 		end
	end
end)

RegisterNetEvent("qb-items:client:use:heavy")
AddEventHandler("qb-items:client:use:heavy", function()
	if not exports['qb-progressbar']:GetTaskBarStatus() then
    	local Sex = "Man"
    	if Framework.Functions.GetPlayerData().charinfo.gender == 1 then
    	  Sex = "Vrouw"
    	end
		TriggerEvent('qb-inventory:client:set:busy', true)
    	Framework.Functions.Progressbar("use_heavyarmor", "Put on the vest..", 5000, false, true, {
    	disableMovement = false,
    	disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			TriggerEvent('qb-inventory:client:set:busy', false)
			TriggerServerEvent('Framework:Server:RemoveItem', 'heavy-armor', 1)
			TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items['heavy-armor'], "remove")
    	    if Sex == 'Man' then
    	    currentVest = GetPedDrawableVariation(PlayerPedId(), 9)
    	    currentVestTexture = GetPedTextureVariation(PlayerPedId(), 9)
    	    if GetPedDrawableVariation(PlayerPedId(), 9) == 7 then
    	        SetPedComponentVariation(PlayerPedId(), 9, 19, GetPedTextureVariation(PlayerPedId(), 9), 2)
    	    else
    	        SetPedComponentVariation(PlayerPedId(), 9, 5, 0, 2)
    	    end
    	    SetPedArmour(PlayerPedId(), 100)
    	  else
    	    currentVest = GetPedDrawableVariation(PlayerPedId(), 9)
    	    currentVestTexture = GetPedTextureVariation(PlayerPedId(), 9)
    	    if GetPedDrawableVariation(PlayerPedId(), 9) == 7 then
    	        SetPedComponentVariation(PlayerPedId(), 9, 20, GetPedTextureVariation(PlayerPedId(), 9), 2)
    	    else
    	        SetPedComponentVariation(PlayerPedId(), 9, 5, 0, 2)
    	    end
			SetPedArmour(PlayerPedId(), 100)
			TriggerServerEvent('qb-hospital:server:save:health:armor', GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()))
    	  end
		end, function() -- Cancel
    	    TriggerEvent('qb-inventory:client:set:busy', false)
    	    Framework.Functions.Notify("Canceled..", "error")
    	end)
	end
end)

RegisterNetEvent("qb-items:client:reset:armor")
AddEventHandler("qb-items:client:reset:armor", function()
	if not exports['qb-progressbar']:GetTaskBarStatus() then
    	local ped = PlayerPedId()
    	if currentVest ~= nil and currentVestTexture ~= nil then 
    	    Framework.Functions.Progressbar("remove-armor", "Take off your vest..", 2500, false, false, {
    	        disableMovement = false,
    	        disableCarMovement = false,
    	        disableMouse = false,
    	        disableCombat = true,
    	    }, {}, {}, {}, function() -- Done
    	        SetPedComponentVariation(PlayerPedId(), 9, currentVest, currentVestTexture, 2)
    	        SetPedArmour(PlayerPedId(), 0)
				TriggerServerEvent('qb-items:server:giveitem', 'heavy-armor', 1)
				TriggerServerEvent('qb-hospital:server:save:health:armor', GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()))
				currentVest, currentVestTexture = nil, nil
    	    end)
    	else
    	    Framework.Functions.Notify("You are not wearing a vest .", "error")
    	end
	end
end)

RegisterNetEvent('qb-items:client:use:repairkit')
AddEventHandler('qb-items:client:use:repairkit', function()
	if not exports['qb-progressbar']:GetTaskBarStatus() then
		local PlayerCoords = GetEntityCoords(PlayerPedId())
		local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
		if GetVehicleEngineHealth(Vehicle) < 1000.0 then
			NewHealth = GetVehicleEngineHealth(Vehicle) + 250.0
			if GetVehicleEngineHealth(Vehicle) + 250.0 > 1000.0 then 
				NewHealth = 1000.0 
			end
			if Distance < 4.0 and not IsPedInAnyVehicle(PlayerPedId()) then
				local EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, 2.5, 0)
				if IsBackEngine(GetEntityModel(Vehicle)) then
				  EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, -2.5, 0)
				end
			if GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, EnginePos) < 4.0 then
				local VehicleDoor = nil
				if IsBackEngine(GetEntityModel(Vehicle)) then
					VehicleDoor = 5
				else
					VehicleDoor = 4
				end
				SetVehicleDoorOpen(Vehicle, VehicleDoor, false, false)
				Citizen.Wait(450)
				TriggerEvent('qb-inventory:client:set:busy', true)
				Framework.Functions.Progressbar("repair_vehicle", "Tinkering..", math.random(10000, 20000), false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mini@repair",
					anim = "fixing_a_player",
					flags = 16,
				}, {}, {}, function() -- Done
					if math.random(1,50) < 10 then
					  TriggerServerEvent('Framework:Server:RemoveItem', 'repairkit', 1)
					  TriggerEvent("qb-inventory:client:ItemBox", Framework.Shared.Items['repairkit'], "remove")
					end
					TriggerEvent('qb-inventory:client:set:busy', false)
					SetVehicleDoorShut(Vehicle, VehicleDoor, false)
					StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
					Framework.Functions.Notify("Vehicle made!")
					SetVehicleEngineHealth(Vehicle, NewHealth) 
					for i = 1, 6 do
					 SetVehicleTyreFixed(Vehicle, i)
					end
				end, function() -- Cancel
					TriggerEvent('qb-inventory:client:set:busy', false)
					StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
					Framework.Functions.Notify("Failed!", "error")
					SetVehicleDoorShut(Vehicle, VehicleDoor, false)
				end)
			end
		 else
			Framework.Functions.Notify("No vehicle?", "error")
		end
		end	
	end
end)

RegisterNetEvent('qb-items:client:dobbel')
AddEventHandler('qb-items:client:dobbel', function(Amount, Sides)
	local DiceResult = {}
	for i = 1, Amount do
		table.insert(DiceResult, math.random(1, Sides))
	end
	local RollText = CreateRollText(DiceResult, Sides)
	TriggerEvent('qb-items:client:dice:anim')
	Citizen.SetTimeout(1900, function()
		TriggerServerEvent('qb-sound:server:play:distance', 2.0, 'dice', 0.5)
		TriggerServerEvent('qb-assets:server:display:text', RollText)
	end)
end)

RegisterNetEvent('qb-items:client:coinflip')
AddEventHandler('qb-items:client:coinflip', function()
	local CoinFlip = {}
	local Random = math.random(1,2)
     if Random <= 1 then
		CoinFlip = 'Coinflip: ~g~Kop'
     else
		CoinFlip = 'Coinflip: ~y~Munt'
	 end
	 TriggerEvent('qb-items:client:dice:anim')
	 Citizen.SetTimeout(1900, function()
		TriggerServerEvent('qb-sound:server:play:distance', 2.0, 'coin', 0.5)
		TriggerServerEvent('qb-assets:server:display:text', CoinFlip)
	 end)
end)

RegisterNetEvent('qb-items:client:dice:anim')
AddEventHandler('qb-items:client:dice:anim', function()
	exports['qb-assets']:RequestAnimationDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(PlayerPedId(), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Citizen.Wait(1500)
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('qb-items:client:use:duffel-bag')
AddEventHandler('qb-items:client:use:duffel-bag', function(BagId)
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", 'tas_'..BagId, {maxweight = 25000, slots = 3})
    TriggerEvent("qb-inventory:client:SetCurrentStash", 'tas_'..BagId)
end)

--  // Functions \\ --

function IsBackEngine(Vehicle)
    for _, model in pairs(Config.BackEngineVehicles) do
        if GetHashKey(model) == Vehicle then
            return true
        end
    end
    return false
end

function CreateRollText(rollTable, sides)
    local s = "~g~Gedobbled~s~: "
    local total = 0
    for k, roll in pairs(rollTable, sides) do
        total = total + roll
        if k == 1 then
            s = s .. roll .. "/" .. sides
        else
            s = s .. " | " .. roll .. "/" .. sides
        end
    end
    s = s .. " | (Total: ~g~"..total.."~s~)"
    return s
end