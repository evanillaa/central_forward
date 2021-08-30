local CurrentVehicle, IsNearVehicle = nil, nil
local InRange = false
local ActiveVehicles = {}
local CanBuy = false
local isLoggedIn = false

Framework = nil   

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
  Citizen.SetTimeout(1250, function()
      TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
      Citizen.Wait(100)
      Framework.Functions.TriggerCallback("qb-vehicleshop:server:get:config", function(config)
        Config = config
      end)
      Citizen.Wait(15)
      isLoggedIn = true
  end)
end)

-- Code

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if isLoggedIn then
            DisableControlAction(0, 161, true)
            DisableControlAction(0, 162, true)
            IsNearVehicle = false
            for k,v in pairs(Config.Vehicles) do
              local PlayerCoords = GetEntityCoords(PlayerPedId())
              local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], true)
              if Distance < 3.0 then
                 if not CanBuy then
                   CurrentVehicle, IsNearVehicle  = k, true
                   DrawText3D(v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'] + 1.2, '~g~€~s~ '..Config.VehicleClasses[Config.Vehicles[CurrentVehicle]['current-vehicle']]['Price']..' - '..Config.VehicleClasses[Config.Vehicles[CurrentVehicle]['current-vehicle']]['Name']..'\n~g~E~s~ - Kopen')
                   if IsControlJustReleased(0, 38) then
                       CanBuy = true
                   end
                 elseif CanBuy then
                   CurrentVehicle, IsNearVehicle  = k, true
                   DrawText3D(v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'] + 1.2, 'Press [~g~ 7 ~s~] to confirm the purchase Press [~r~ 8 ~s~] to cancel the purchase')
                   if IsDisabledControlJustPressed(0, 161) and CanBuy then
                       CanBuy = false
                       TriggerServerEvent('qb-vehicleshop:server:buy:vehicle', Config.Vehicles[CurrentVehicle]['current-vehicle'], Config.VehicleClasses[Config.Vehicles[CurrentVehicle]['current-vehicle']]['Price'])
                   end
                   if IsDisabledControlJustPressed(0, 162) and CanBuy then
                     CanBuy = false
                   end
               end
              end
            end
            if not IsNearVehicle then
                Citizen.Wait(1500)
            end
        end
    end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(4)
    if isLoggedIn then
       NearVehicleSell = false
       local PlayerCoords = GetEntityCoords(PlayerPedId())
       local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Sell['X'], Config.Sell['Y'], Config.Sell['Z'], true)
         if Distance < 5.0 and IsPedSittingInAnyVehicle(PlayerPedId()) then
           NearVehicleSell = true
           DrawText3D(Config.Sell['X'], Config.Sell['Y'], Config.Sell['Z'], '~g~E~w~ - Sell ​​vehicle')
           if IsControlJustReleased(0, 38) then
             local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
             local VehicleModel = GetDisplayNameFromVehicleModel(GetEntityModel(Vehicle))
             local Plate = GetVehicleNumberPlateText(Vehicle)
             Framework.Functions.TriggerCallback('qb-vehicleshop:server:check:owner', function(IsOwner)
                 if IsOwner then
                  print(VehicleModel:lower())
                    if Config.VehicleClasses[VehicleModel]['Price'] ~= nil then
                      TriggerServerEvent('qb-vehicleshop:server:sell:vehicle', Plate, Config.VehicleClasses[VehicleModel]['Price'])
                      Framework.Functions.DeleteVehicle(Vehicle)
                    else
                      Framework.Functions.Notify('Sorry, we cannot buy this vehicle from you...', 'error', 5500)
                    end
                 else
                   Framework.Functions.Notify('This vehicle is not yours...', 'error', 5500)
                 end
             end, Plate)
           end
        end
       if not NearVehicleSell then
         Citizen.Wait(1500)
       end
    end
  end
end)

Citizen.CreateThread(function()
    Citizen.Wait(3000)
    while true do
        Citizen.Wait(4)
        if isLoggedIn then
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, -47.15, -1096.64, 26.42, true)
            InRange = false
            if Distance < 45.0 then
                InRange = true
                if not Config.HasSpawned then
                    Config.HasSpawned = true
                    SetupVehicles()
                end
            end
            if not InRange then
                if Config.HasSpawned then
                 RemoveVehicles()
                 Config.HasSpawned = false
                end
                Citizen.Wait(1500)
            end

        end
    end
end)

-- // Events \\ --

RegisterNetEvent('qb-vehicleshop:client:spawn:bought:vehicle')
AddEventHandler('qb-vehicleshop:client:spawn:bought:vehicle', function(VehicleName, Plate)
    local CoordTable = {x = Config.Spawn['X'], y = Config.Spawn['Y'], z = Config.Spawn['Z'], a = Config.Spawn['H']}
    Framework.Functions.SpawnVehicle(VehicleName, function(Vehicle)
      TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
      SetVehicleNumberPlateText(Vehicle, Plate)
      Citizen.Wait(25)
      exports['qb-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(Vehicle), true)
      exports['qb-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 100.0, false)
     end, CoordTable, true, true)
end)

RegisterNetEvent('qb-vehicleshop:client:set:vehicles')
AddEventHandler('qb-vehicleshop:client:set:vehicles', function(RandomSport, RandomSedan, RandomMotor, RandomMuscle, RandomVans, RandomAddon)
  if InRange then
    RemoveVehicles()
  end
  Citizen.SetTimeout(1500, function()
    Config.Vehicles[1]['current-vehicle'] = RandomSport
    Config.Vehicles[2]['current-vehicle'] = RandomSedan
    Config.Vehicles[3]['current-vehicle'] = RandomMotor
    Config.Vehicles[4]['current-vehicle'] = RandomMuscle
    Config.Vehicles[5]['current-vehicle'] = RandomVans
    Config.Vehicles[6]['current-vehicle'] = RandomAddon
    Citizen.Wait(850)
    if InRange then
      SetupVehicles()
    end
  end)    
end)

-- // Function \\ --

function SetupVehicles()
  for k, v in pairs(Config.Vehicles) do
      local Model = GetHashKey(Config.Vehicles[k]['current-vehicle'])
      RequestModel(Model)
      while not HasModelLoaded(Model) do
          Citizen.Wait(250)
      end
      local ShowroomCar = CreateVehicle(Model, Config.Vehicles[k]['Coords']['X'], Config.Vehicles[k]['Coords']['Y'], Config.Vehicles[k]['Coords']['Z'], false, false)
      SetModelAsNoLongerNeeded(Model)
      SetVehicleOnGroundProperly(ShowroomCar)
      SetEntityInvincible(ShowroomCar, true)
      SetEntityHeading(ShowroomCar, Config.Vehicles[k]['Coords']['H'])
      SetVehicleDoorsLocked(ShowroomCar, 3)
      FreezeEntityPosition(ShowroomCar, true)
      SetVehicleNumberPlateText(ShowroomCar, k .. "CARSALE")
      table.insert(ActiveVehicles, ShowroomCar)
      Citizen.Wait(50)
  end
end

function RemoveVehicles()
    for k, v in ipairs(ActiveVehicles) do
        Framework.Functions.DeleteVehicle(v)
    end
end

function DrawText3D(x, y, z, text)
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(true)
  AddTextComponentString(text)
  SetDrawOrigin(x,y,z, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()
end

Citizen.CreateThread(function()
  RequestIpl('shr_int')
  local interiorID = 7170
  LoadInterior(interiorID)
  EnableInteriorProp(interiorID, 'csr_beforeMission')
  RefreshInterior(interiorID)
end)