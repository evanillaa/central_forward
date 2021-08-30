local LoggedIn = false

Framework = nil

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
  Citizen.SetTimeout(650, function()
      TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)   
      Citizen.Wait(200)
      Framework.Functions.TriggerCallback('qb-field:server:GetConfig', function(config)
          Config = config
      end) 
      LoggedIn = true
  end)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    LoggedIn = false
end)

-- Code

RegisterNetEvent('qb-field:client:set:plant:busy')
AddEventHandler('qb-field:client:set:plant:busy',function(PlantId, bool)
    Config.Plants['planten'][PlantId]['IsBezig'] = bool
end)

RegisterNetEvent('qb-field:client:set:picked:state')
AddEventHandler('qb-field:client:set:picked:state',function(PlantId, bool)
    Config.Plants['planten'][PlantId]['Geplukt'] = bool
end)

RegisterNetEvent('qb-field:client:set:dry:busy')
AddEventHandler('qb-field:client:set:dry:busy',function(DryRackId, bool)
    Config.Plants['drogen'][DryRackId]['IsBezig'] = bool
end)

RegisterNetEvent('qb-field:client:set:pack:busy')
AddEventHandler('qb-field:client:set:pack:busy',function(PackerId, bool)
    Config.Plants['verwerk'][PackerId]['IsBezig'] = bool
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LoggedIn then
         local PlayerCoords = GetEntityCoords(PlayerPedId())
            NearAnything = false
            for k, v in pairs(Config.Plants["planten"]) do
                local PlantDistance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Plants["planten"][k]['x'], Config.Plants["planten"][k]['y'], Config.Plants["planten"][k]['z'], true)
                if PlantDistance < 1.2 then
                NearAnything = true
                 if IsControlJustPressed(0, Config.Keys['E']) then
                    if not Config.Plants['planten'][k]['IsBezig'] then
                        if not Config.Plants['planten'][k]['Geplukt'] then
                          PickPlant(k)
                        else
                          Framework.Functions.Notify("It seems like this strain has already been plucked..", "error")
                      end
                    else
                     Framework.Functions.Notify("Someone else is already on this strain..", "error")
                 end
            end
            end
            end

            for k, v in pairs(Config.Plants["drogen"]) do
                local PlantDistance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Plants["drogen"][k]['x'], Config.Plants["drogen"][k]['y'], Config.Plants["drogen"][k]['z'], true)
                if PlantDistance < 1.2 then
                 NearAnything = true
                 DrawMarker(2, Config.Plants["drogen"][k]['x'], Config.Plants["drogen"][k]['y'], Config.Plants["drogen"][k]['z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 67, 156, 77, 255, false, false, false, 1, false, false, false)
                 if IsControlJustPressed(0, Config.Keys['E']) then
                  if not Config.Plants['drogen'][k]['IsBezig'] then
                    Framework.Functions.TriggerCallback('qb-field:server:has:takken', function(HasTak)
                      if HasTak then
                          DryPlant(k)
                      else
                          Framework.Functions.Notify("You are missing something..", "error")
                      end
                  end)
              else
                  Framework.Functions.Notify("Someone is already dryin..", "error")
              end
            end
            end
            end

            for k, v in pairs(Config.Plants["verwerk"]) do
                local PlantDistance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Plants["verwerk"][k]['x'], Config.Plants["verwerk"][k]['y'], Config.Plants["verwerk"][k]['z'], true)
                if PlantDistance < 1.2 then
                NearAnything = true
                 DrawMarker(2, Config.Plants["verwerk"][k]['x'], Config.Plants["verwerk"][k]['y'], Config.Plants["verwerk"][k]['z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 67, 156, 77, 255, false, false, false, 1, false, false, false)
                 if IsControlJustPressed(0, Config.Keys['E']) then
                  if not Config.Plants['verwerk'][k]['IsBezig'] then
                    Framework.Functions.TriggerCallback('qb-field:server:has:nugget', function(HasNugget)
                      if HasNugget then
                          PackagePlant(k)
                      else
                          Framework.Functions.Notify("You are missing something..", "error")
                      end
                  end)
              else
                  Framework.Functions.Notify("Someone is already packing...", "error")
              end
            end
            end
            end
            if not NearAnything then
                Citizen.Wait(2500)
            end
        end
    end
end)


-- Functions 

function PickPlant(PlantId)
    TriggerServerEvent('qb-field:server:set:plant:busy', PlantId, true)
    Framework.Functions.Progressbar("pick_plant", "Plucking..", math.random(3500, 6500), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('qb-field:server:set:plant:busy', PlantId, false)
        TriggerServerEvent('qb-field:server:set:picked:state', PlantId, true)
        TriggerServerEvent('qb-field:server:give:tak')
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        Framework.Functions.Notify("Success", "success")
    end, function() -- Cancel
        TriggerServerEvent('qb-field:server:set:plant:busy', PlantId, false)
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        Framework.Functions.Notify("Cancelled..", "error")
    end)
end

function DryPlant(DryRackId)
    TriggerServerEvent('qb-field:server:remove:item', 'wet-tak', 2)
    TriggerServerEvent('qb-field:server:set:dry:busy', DryRackId, true)
    Framework.Functions.Progressbar("pick_plant", "Dryin..", math.random(6000, 11000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('qb-field:server:add:item', 'wet-bud', math.random(1,3))
        TriggerServerEvent('qb-field:server:set:dry:busy', DryRackId, false)
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        Framework.Functions.Notify("Success", "success")
    end, function() -- Cancel
        TriggerServerEvent('qb-field:server:set:dry:busy', DryRackId, false)
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        Framework.Functions.Notify("Cancelled..", "error")
    end) 
end

function PackagePlant(PackerId)
    local WeedItems = Config.WeedSoorten[math.random(#Config.WeedSoorten)]
    TriggerServerEvent('qb-field:server:remove:item', 'wet-bud', 2)
    TriggerServerEvent('qb-field:server:remove:item', 'plastic-bag', 1)
    TriggerServerEvent('qb-field:server:set:pack:busy', PackerId, true)
    Framework.Functions.Progressbar("pick_plant", "Packing..", math.random(3500, 6500), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('qb-field:server:add:item', WeedItems, 1)
        TriggerServerEvent('qb-field:server:set:pack:busy', PackerId, false)
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        Framework.Functions.Notify("Success", "success")
    end, function() -- Cancel
        TriggerServerEvent('qb-field:server:set:pack:busy', PackerId, false)
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        Framework.Functions.Notify("Cancelled..", "error")
    end) 
end