Framework = nil 
local alarm = false
soundid = GetSoundId()
step = 0
local step2 = true
local step3 = false
local step4 = false

Citizen.CreateThread(function()
	while Framework == nil do
		TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
		Citizen.Wait(0)
	end

	while Framework.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	Framework.Functions.GetPlayerData(function(PlayerData)
		PlayerJob, onDuty = PlayerData.job, PlayerData.job.onduty 
		isLoggedIn = true 
	end)
	PlayerData = Framework.Functions.GetPlayerData()
end)


RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(500, function()
     TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
      Citizen.Wait(450)
      Framework.Functions.GetPlayerData(function(PlayerData)
      PlayerJob, onDuty = PlayerData.job, PlayerData.job.onduty 
      if PlayerJob.name == 'police' and PlayerData.job.onduty then
       TriggerEvent('qb-radialmenu:client:update:duty:vehicles')
       TriggerEvent('qb-police:client:set:radio')
       TriggerServerEvent("qb-police:server:UpdateBlips")
       TriggerServerEvent("qb-police:server:UpdateCurrentCops")
      end
      isLoggedIn = true 
      end)
    end)
end)


function DrawText3D(x,y,z,text,size)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35,0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 100)
end

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(5)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local texttodraw = "~r~[E]~w~ Cut Cable"
    local x, y, z = 528.24,-3194.32,11.39
	local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,x,y,z, false)
	if step2 then
		
       		 if distance <= 1.5 then
       		     DrawText3D(x,y,z, texttodraw)
					if IsControlJustReleased(0, 86) then
							
						Framework.Functions.TriggerCallback('Framework:HasItem', function(result)
						if result then
								TriggerEvent('qb-sub:client:alarm')
							step3 = true
							ExecuteCommand('e mechanic')
							--exports["np-taskbar"]:taskBar(7500,"Kablolar Kesiliyor...")
							PlaySoundFromCoord(soundid, "VEHICLES_HORNS_AMBULANCE_WARNING", pos.x,pos.y,pos.z)
							step2 = false	
						else
		
							TriggerEvent("DoShortHudText", "You have a knife", 2)
						end
					end, 'knife')
					
       		     end
				
       		 else
       		     if distance > 10.0 then
       		         Citizen.Wait(2000)
       		     end
				end
	end
    end
end)

RegisterNetEvent("qb-sub:client:alarm")
AddEventHandler("qb-sub:client:alarm", function(name)
    local PlayerData = Framework.Functions.GetPlayerData()
    local blip = nil

    while PlayerData.job == nil do
        Citizen.Wait(1)
    end
    if PlayerJob.name == 'police' then
		Framework.Functions.Notify("Under the sea alarms have been activated!", "inform", 4500)
		if not DoesBlipExist(blip) then
            blip = AddBlipForCoord(528.24,-3194.32,11.39)
            SetBlipSprite(blip, 161)
            SetBlipScale(blip, 2.0)
            SetBlipColour(blip, 1)

            PulseBlip(blip)
            Citizen.Wait(240000)
            RemoveBlip(blip)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(5)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
	local texttodraw = "~r~[E]~w~ Stop the alarm"
    local x, y, z = 526.47,-3223.9,11.38
	local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,x,y,z, false)
	if step3 then
        if distance <= 1.5 then
			DrawText3D(x,y,z, texttodraw)
			
			if IsControlJustReleased(0, 86) then
				Framework.Functions.TriggerCallback('Framework:HasItem', function(result)
					if result then
					--exports["np-taskbar"]:taskBar(7500,"Alarm durdurluyor...")	
					step3 = false
					step4 = true
					ExecuteCommand('e mechanic')
					--exports["datacrack"]:Start(4.7)
				else
		
					TriggerEvent("DoShortHudText", "You have a jammer", 2)
				end
			end, 'knife')
            end
        
        else
            if distance > 10.0 then
                Citizen.Wait(2000)
            end
		end
	end
    end
end)


Citizen.CreateThread(function()
    while true do
    Citizen.Wait(5)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
	local texttodraw = "~r~[E]~w~ Start the hack"
    local x, y, z = 528.11,-3235.86,11.38
	local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,x,y,z, false)
	if step4 then
        if distance <= 2.5 then
            DrawText3D(x,y,z, texttodraw)
			if IsControlJustReleased(0, 86) then
				Framework.Functions.TriggerCallback('Framework:HasItem', function(result)
					if result then
					TaskPlayAnim(player,animDict,animName,3.0,0.5,-1,31,1.0,0,0)
					TaskStartScenarioInPlace(player, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
					StartMiniGame()	
					step4 = false
				else
		
					TriggerEvent("DoShortHudText", "You have a electronickit", 2)
				end
			end, 'electronickit')
			
            end
        
        	else
            if distance > 10.0 then
                Citizen.Wait(2000)
            end
		end
	end
    end
end)



function StartMiniGame()
    exports['minigame-phone']:ShowHack()
    exports['minigame-phone']:StartHack(math.random(1,4), math.random(8,12), function(Success)
        if Success then
			Framework.Functions.Notify("Hacking Successful!", "success", 4500)
			TriggerServerEvent('qb-sub:server:reward')
        else
			Framework.Functions.Notify("Hack Attempt Failed!", "error", 2500)
			step2 = true
        end
        exports['minigame-phone']:HideHack()
    end)
end

function gemihack(success)
	local player = PlayerPedId()
    FreezeEntityPosition(player,false)
    if success then
		Framework.Functions.Notify("Hacking Successful!", "success", 4500)
		TriggerServerEvent('qb-sub:server:reward')
    else
		Framework.Functions.Notify("Hack Attempt Failed!", "error", 2500)
		step2 = true
	end
	ClearPedTasks(player)
	ClearPedSecondaryTask(player)	

end