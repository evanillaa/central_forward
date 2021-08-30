local HouseData, OffSets = nil, nil
local HouseBlips = {}
Currenthouse = nil
IsNearHouse = false
local HouseCam = nil
IsInHouse = false
HasKey = false

local StashLocation = nil
local ClothingLocation = nil
local LogoutLocation = nil
local Other = nil
local LoggedIn = false

Framework = nil

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)
        Citizen.Wait(125)
        Framework.Functions.TriggerCallback("qb-housing:server:get:config", function(config)
           Config = config
        end)
        Citizen.Wait(145)
        AddBlipForHouse()
        LoggedIn = true
    end) 
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    RemoveHouseBlip()
    LoggedIn = false
end)

-- Code

-- // Loops \\

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if LoggedIn then
            if not IsInHouse then
                 IsNearHouse = false
                 for k, v in pairs(Config.Houses) do
                     local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
                     local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['Coords']['Enter']['X'], v['Coords']['Enter']['Y'], v['Coords']['Enter']['Z'], true)
                     if Distance < 3.0 then
                         IsNearHouse = true
                         Currenthouse = k
                         Framework.Functions.TriggerCallback('qb-housing:server:has:house:key', function(HasHouseKey)
                             HasKey = HasHouseKey
                         end, k)
                         Citizen.Wait(10)
                     end
                 end
                 if not IsNearHouse and not IsInHouse then
                     Citizen.Wait(3500)
                     Currenthouse = nil
                 end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LoggedIn then
            if Currenthouse ~= nil then

                local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
                
                if not IsInHouse then
                    if not Config.Houses[Currenthouse]['Owned'] then
                      if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'], true) < 3.0) then
                        DrawText3D(Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'], '~g~E~w~ - View House')
                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent('qb-housing:server:view:house', Currenthouse)
                        end
                      end
                    end
                end


                  -- // Verlaten \\ --
        if IsInHouse then
           if OffSets ~= nil then



                if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, true) < 2.0) then
                  DrawMarker(2, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                  DrawText3D(Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z + 0.12, '~g~E~s~ - Leave')
                     if IsControlJustReleased(0, 38) then
                         LeaveHouse()
                     end
                end

                -- // Stash \\ --

                if CurrentBell ~= nil then
                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, true) < 2.0) then
                        DrawMarker(2, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                        DrawText3D(Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z + 0.32, '~g~G~s~ - Open Door')
                        if IsControlJustReleased(0, 47) then
                            TriggerServerEvent("qb-housing:server:open:door", CurrentBell, Currenthouse)
                            CurrentBell = nil
                        end
                    end
                end
                    
                if StashLocation ~= nil then
                     if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, StashLocation['X'], StashLocation['Y'], StashLocation['Z'], true) < 1.65) then
                      DrawMarker(2, StashLocation['X'], StashLocation['Y'], StashLocation['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                      DrawText3D(StashLocation['X'], StashLocation['Y'], StashLocation['Z'], '~g~E~s~ - Stash')
                         if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-inventory:client:SetCurrentStash", Currenthouse)
                            TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", Currenthouse, Other)
                            TriggerEvent("qb-sound:client:play", "stash-open", 0.4)
                         end
                     end
                end

                if ClothingLocation ~= nil then
                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, ClothingLocation['X'], ClothingLocation['Y'], ClothingLocation['Z'], true) < 1.65) then
                     DrawMarker(2, ClothingLocation['X'], ClothingLocation['Y'], ClothingLocation['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                     DrawText3D(ClothingLocation['X'], ClothingLocation['Y'], ClothingLocation['Z'], '~g~E~s~ - Outfits')
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent('qb-clothing:client:openOutfitMenu')
                        end
                    end
                end

                if LogoutLocation ~= nil then
                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, LogoutLocation['X'], LogoutLocation['Y'], LogoutLocation['Z'], true) < 1.65) then
                     DrawMarker(2, LogoutLocation['X'], LogoutLocation['Y'], LogoutLocation['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                     DrawText3D(LogoutLocation['X'], LogoutLocation['Y'], LogoutLocation['Z'], '~g~E~s~ - Logout')
                        if IsControlJustReleased(0, 38) then
                            LogoutPlayer()
                        end
                    end
                end



                end  
            end
        end


        end
    end
end)

-- // Events \\ --

RegisterNetEvent('qb-housing:client:enter:house')
AddEventHandler('qb-housing:client:enter:house', function()
    local Housing = {}
    local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
    local CoordsTable = {x = Config.Houses[Currenthouse]['Coords']['Enter']['X'], y = Config.Houses[Currenthouse]['Coords']['Enter']['Y'], z = Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - 35.0}
    IsInHouse = true
    TriggerEvent("qb-sound:client:play", "house-door-open", 0.1)
    OpenDoorAnim()
    Citizen.Wait(350)
    SetHouseLocations()
    if Config.Houses[Currenthouse]['Tier'] == 1 then
        Other = {maxweight = 650000, slots = 25}
        Housing = exports['qb-interiors']:HouseTierOne(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 2 then
        Other = {maxweight = 650000, slots = 25}
        Housing = exports['qb-interiors']:HouseTierTwo(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 3 then
        Other = {maxweight = 650000, slots = 25}
        Housing = exports['qb-interiors']:HouseTierThree(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 4 then
        Other = {maxweight = 950000, slots = 35}
        Housing = exports['qb-interiors']:HouseTierFour(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 5 then
        Other = {maxweight = 1200000, slots = 45}
        Housing = exports['qb-interiors']:HouseTierFive(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 6 then
        Other = {maxweight = 1200000, slots = 45}
        Housing = exports['qb-interiors']:HouseTierSix(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 7 then
        Other = {maxweight = 1350000, slots = 50}
        Housing = exports['qb-interiors']:GarageTierOne(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 8 then
        Other = {maxweight = 1550000, slots = 55}
        Housing = exports['qb-interiors']:GarageTierTwo(CoordsTable)
    end
    LoadDecorations(Currenthouse)
    TriggerEvent('qb-weathersync:client:DisableSync')
    HouseData, OffSets = Housing[1], Housing[2]
end)

RegisterNetEvent('qb-housing:client:add:to:config')
AddEventHandler('qb-housing:client:add:to:config', function(Name, Owner, CoordsTable, Owned, Tier, Price, DoorLocked, KeyHolder, Label)
    Config.Houses[Name] = {
        ['Coords'] = CoordsTable,
        ['Owned'] = Owned,
        ['Owner'] = Owner,
        ['Tier'] = Tier,
        ['Price'] = Price,
        ['Door-Lock'] = DoorLocked,
        ['Adres'] = Label,
        ['Key-Holders'] = KeyHolder,
        ['Decorations'] = {}
    }
end)

RegisterNetEvent('qb-housing:client:set:owned')
AddEventHandler('qb-housing:client:set:owned', function(HouseId, Owned, CitizenId)
    Config.Houses[HouseId]['Owner'] = CitizenId
    Config.Houses[HouseId]['Owned'] = Owned
    Config.Houses[HouseId]['Key-Holders'] = {
        [1] = CitizenId
    }
end)

RegisterNetEvent('qb-housing:client:create:house')
AddEventHandler('qb-housing:client:create:house', function(Price, Tier)
    local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
    local PlayerHeading = GetEntityHeading(GetPlayerPed(-1))
    local StreetNative = Citizen.InvokeNative(0x2EB41072B4C1E4C0, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local StreetName = GetStreetNameFromHashKey(StreetNative)
    local CoordsTable = {
        ['Enter'] = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z, ['H'] = PlayerHeading},
        ['Cam'] = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z, ['H'] = PlayerHeading, ['Yaw'] = -10.0},
    }
    TriggerServerEvent('qb-housing:server:add:new:house', StreetName:gsub("%-", " "), CoordsTable, Price, Tier)
end)

RegisterNetEvent('qb-housing:client:view:house')
AddEventHandler('qb-housing:client:view:house', function(houseprice, brokerfee, bankfee, taxes, firstname, lastname)
    SetHouseCam(Config.Houses[Currenthouse]['Coords']['Cam'], Config.Houses[Currenthouse]['Coords']['Cam']['H'], Config.Houses[Currenthouse]['Coords']['Cam']['Yaw'])
    Citizen.Wait(500)
    OpenHouseContract(true)
    SendNUIMessage({
        type = "setupContract",
        firstname = firstname,
        lastname = lastname,
        street = Config.Houses[Currenthouse]['Adres'],
        houseprice = houseprice,
        brokerfee = brokerfee,
        bankfee = bankfee,
        taxes = taxes,
        totalprice = (houseprice + brokerfee + bankfee + taxes)
    })
end)

RegisterNetEvent('qb-housing:client:set:location')
AddEventHandler('qb-housing:client:set:location', function(Type)
 local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
 local CoordsTable = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z}
 if IsInHouse then
     if HasKey then
         if Type == 'stash' then
          TriggerServerEvent('qb-housing:server:set:location', Currenthouse, CoordsTable, 'stash')
         elseif Type == 'clothes' then
          TriggerServerEvent('qb-housing:server:set:location', Currenthouse, CoordsTable, 'clothes')
        elseif Type == 'logout' then
          TriggerServerEvent('qb-housing:server:set:location', Currenthouse, CoordsTable, 'logout')
        end
     end
 end
end)

RegisterNetEvent('qb-housing:client:refresh:location')
AddEventHandler('qb-housing:client:refresh:location', function(HouseId, CoordsTable, Type)
 if HouseId == Currenthouse then
    if IsInHouse then
         if Type == 'stash' then
            StashLocation = CoordsTable
         elseif Type == 'clothes' then
            ClothingLocation = CoordsTable
        elseif Type == 'logout' then
            LogoutLocation = CoordsTable
        end
    end
 end
end)

RegisterNetEvent('qb-housing:client:give:keys')
AddEventHandler('qb-housing:client:give:keys', function()
  local Player, Distance = Framework.Functions.GetClosestPlayer()
  if Player ~= -1 and Distance < 1.5 then  
    Framework.Functions.GetPlayerData(function(PlayerData)
      if Config.Houses[Currenthouse]['Owner'] == PlayerData.citizenid then
         TriggerServerEvent('qb-housing:server:give:keys', Currenthouse, GetPlayerServerId(Player))
      else
        Framework.Functions.Notify("You are not the owner of this property..", "error")
      end
    end)
  else
    Framework.Functions.Notify("Nobody close enough", "error")
  end
end)

RegisterNetEvent('qb-housing:client:ring:door')
AddEventHandler('qb-housing:client:ring:door', function()
    if Currenthouse ~= nil then
      TriggerServerEvent('qb-housing:server:ring:door', Currenthouse)
    end
end)

RegisterNetEvent('qb-housing:client:ringdoor')
AddEventHandler('qb-housing:client:ringdoor', function(Player, HouseId)
    if Currenthouse == HouseId and IsInHouse then
        CurrentBell = Player
        TriggerEvent("qb-sound:client:play", "house-doorbell", 0.1)
        Framework.Functions.Notify("Someone is ringing the door bell..")
    end
end)

RegisterNetEvent('qb-housing:client:set:in:house')
AddEventHandler('qb-housing:client:set:in:house', function(House)
    local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[House]['Coords']['Enter']['X'], Config.Houses[House]['Coords']['Enter']['Y'], Config.Houses[House]['Coords']['Enter']['Z'], true) < 5.0) then
        TriggerEvent('qb-housing:client:enter:house')
    end
end)

RegisterNetEvent('qb-housing:client:set:new:key:holders')
AddEventHandler('qb-housing:client:set:new:key:holders', function(HouseId, HouseKeys)
    Config.Houses[HouseId]['Key-Holders'] = HouseKeys
end)

RegisterNetEvent('qb-housing:client:set:house:door')
AddEventHandler('qb-housing:client:set:house:door', function(HouseId, bool)
    Config.Houses[HouseId]['Door-Lock'] = bool
end)

RegisterNetEvent('qb-housing:client:reset:house:door')
AddEventHandler('qb-housing:client:reset:house:door', function()
    if IsNearHouse then
        if not Config.Houses[Currenthouse]['Door-Lock'] then
            OpenDoorAnim()
            TriggerServerEvent('qb-sound:server:play:source', 'doorlock-keys', 0.4)
            TriggerServerEvent('qb-housing:server:set:house:door', Currenthouse, true)
        else
            Framework.Functions.Notify("Door is already closed..", 'error')
        end
    else
        Framework.Functions.Notify("No house found", 'error')
    end
end)

RegisterNetEvent('qb-housing:client:breaking:door')
AddEventHandler('qb-housing:client:breaking:door', function()
    if IsNearHouse then
        if Config.Houses[Currenthouse]['Door-Lock'] then
            RamAnimation(true)
            Framework.Functions.Progressbar("bonk-door", "Deur Bonken..", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                RamAnimation(false)
                TriggerServerEvent('qb-housing:server:set:house:door', Currenthouse, false)
            end, function() -- Cancel
                RamAnimation(false)
            end)
        else
            Framework.Functions.Notify("Door is already open..", 'error')
        end
    else
        Framework.Functions.Notify("No house found", 'error')
    end
end)

-- // Functions \\ --

function LeaveHouse()
    TriggerEvent("qb-sound:client:play", "house-door-open", 0.1)
    OpenDoorAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    exports['qb-interiors']:DespawnInterior(HouseData, function()
        SetEntityCoords(GetPlayerPed(-1), Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'])
        TriggerEvent('qb-weathersync:client:EnableSync')
        UnloadDecorations()
        Citizen.Wait(1000)
        IsInHouse = false
        Other = nil
        Currenthouse = nil
        StashLocation, ClothingLocation, LogoutLocation = nil, nil, nil
        HouseData, OffSets = nil, nil
        DoScreenFadeIn(1000)
        TriggerEvent("qb-sound:client:play", "house-door-close", 0.1)
    end)
end

function LogoutPlayer()
    TriggerEvent("qb-sound:client:play", "house-door-open", 0.1)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    exports['qb-interiors']:DespawnInterior(HouseData, function()
        SetEntityCoords(GetPlayerPed(-1), Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'])
        TriggerEvent('qb-weathersync:client:EnableSync')
        UnloadDecorations()
        Citizen.Wait(1000)
        IsInHouse = false
        Other = nil
        Currenthouse = nil
        StashLocation, ClothingLocation, LogoutLocation = nil, nil, nil
        HouseData, OffSets = nil, nil
        TriggerEvent("qb-sound:client:play", "house-door-close", 0.1)
        Citizen.Wait(450)
        TriggerServerEvent('qb-housing:server:logout')
    end)
  end

function SetHouseLocations()
  if Currenthouse ~= nil then
      Framework.Functions.TriggerCallback('qb-housing:server:get:locations', function(result)
          if result ~= nil then
              if result.stash ~= nil then
                StashLocation = json.decode(result.stash)
              end  
              if result.outfit ~= nil then
                ClothingLocation = json.decode(result.outfit)
              end  
              if result.logout ~= nil then
                LogoutLocation = json.decode(result.logout)
              end
          end
      end, Currenthouse)
  end
end

function RamAnimation(bool)
    if bool then
      exports['qb-assets']:RequestAnimationDict("missheistfbi3b_ig7")
      TaskPlayAnim(GetPlayerPed(-1), "missheistfbi3b_ig7", "lift_fibagent_loop", 8.0, 8.0, -1, 1, -1, false, false, false)
    else
      exports['qb-assets']:RequestAnimationDict("missheistfbi3b_ig7")
      TaskPlayAnim(GetPlayerPed(-1), "missheistfbi3b_ig7", "exit", 8.0, 8.0, -1, 1, -1, false, false, false)
    end
end

function EnterNearHouse()
    if IsNearHouse and HasKey or IsNearHouse and not Config.Houses[Currenthouse]['Door-Lock'] then
        if not IsInHouse then
            return true
        end
    end
end

function HasEnterdHouse()
    if IsInHouse and HasKey then
        return true
    end
end

function OpenDoorAnim()
  exports['qb-assets']:RequestAnimationDict('anim@heists@keycard@')
  TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
  Citizen.Wait(400)
  ClearPedTasks(GetPlayerPed(-1))
end

function SetHouseCam(coords, h, yaw)
    HouseCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords['X'], coords['Y'], coords['Z'], yaw, 0.00, h, 80.00, false, 0)
    SetCamActive(HouseCam, true)
    RenderScriptCams(true, true, 500, true, true)
end

function OpenHouseContract(bool)
  SetNuiFocus(bool, bool)
  SendNUIMessage({
      type = "toggle",
      status = bool,
  })
end

function AddBlipForHouse()
    Framework.Functions.GetPlayerData(function(PlayerData)
      for k, v in pairs(Config.Houses) do
         if Config.Houses[k]['Owner'] == PlayerData.citizenid then
            Blips = AddBlipForCoord(Config.Houses[k]['Coords']['Enter']['X'], Config.Houses[k]['Coords']['Enter']['Y'], Config.Houses[k]['Coords']['Enter']['Z'])
            SetBlipSprite (Blips, 40)
            SetBlipDisplay(Blips, 4)
            SetBlipScale  (Blips, 0.48)
            SetBlipAsShortRange(Blips, true)
            SetBlipColour(Blips, 26)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Houses[k]['Adres'])
            EndTextCommandSetBlipName(Blips)
            table.insert(HouseBlips, Blips)
         end
      end
    end)
end

function RemoveHouseBlip()
    if HouseBlips ~= nil then
      for k, v in pairs(HouseBlips) do
          RemoveBlip(v)
      end
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

-- // NUI \\ --

RegisterNUICallback('buy', function()
  OpenHouseContract(false)
  if DoesCamExist(HouseCam) then
   RenderScriptCams(false, true, 500, true, true)
   SetCamActive(HouseCam, false)
   DestroyCam(HouseCam, true)
  end
  TriggerServerEvent('qb-housing:server:buy:house', Currenthouse)
end)

RegisterNUICallback('exit', function()
  OpenHouseContract(false)
  if DoesCamExist(HouseCam) then
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(HouseCam, false)
    DestroyCam(HouseCam, true)
  end
end)