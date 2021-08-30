Framework = nil

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Citizen.CreateThread(function()
	while Framework == nil do
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)  
		Citizen.Wait(0)
	end
end)

local robberyAlert = false

local isLoggedIn = true

local firstAlarm = false

local requiredItemsShowed = false
local ExplosiveNeeded = false
local copsCalled = false
local LockDownEnded = false
local ExplosiveRange = false
local deuropen = false
local SmokeAlpha = 1.0
local LockPicking = false
local pctjuhgekraakt = false
local SmokePfx = nil
local PlayerJob = {}

CurrentCops = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60 * 5)
        if copsCalled then
            copsCalled = false
        end
    end
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    PlayerJob = Framework.Functions.GetPlayerData().job
    Framework.Functions.TriggerCallback('qb-humanlabs:server:GetConfig', function(config)
        Config = config
    end)
    onDuty = true
end)

Citizen.CreateThread(function()
    Wait(500)
    if Framework.Functions.GetPlayerData() ~= nil then
        PlayerJob = Framework.Functions.GetPlayerData().job
        onDuty = true
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local requiredItems = {
        [1] = {name = Framework.Shared.Items["electronickit"]["name"], image = Framework.Shared.Items["electronickit"]["image"]},
        [2] = {name = Framework.Shared.Items["trojan_usb"]["name"], image = Framework.Shared.Items["trojan_usb"]["image"]},
    }
    while true do
        local pos = GetEntityCoords(PlayerPedId())

        if Framework ~= nil then
                if not Config.Lab["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Lab["coords"]["x"], Config.Lab["coords"]["y"], Config.Lab["coords"]["z"], true)
                    if dist < 1.0 then
                        DrawMarker(2, Config.Lab["coords"].x, Config.Lab["coords"].y, Config.Lab["coords"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)

                        if not requiredItemsShowed then
                            requiredItemsShowed = true
                            TriggerEvent('qb-inventory:client:requiredItems', requiredItems, true)
                        end
                    else
                        if requiredItemsShowed then
                            requiredItemsShowed = false
                            TriggerEvent('qb-inventory:client:requiredItems', requiredItems, false)
                        end
                    end
                end
                if Config.Lab["isOpened"] then
                    for k, v in pairs(Config.Lab["lockers"]) do
                        local lockerDist = GetDistanceBetweenCoords(pos, Config.Lab["lockers"][k].x, Config.Lab["lockers"][k].y, Config.Lab["lockers"][k].z)
                        if not Config.Lab["lockers"][k]["isBusy"] then
                            if not Config.Lab["lockers"][k]["isOpened"] then
                                if lockerDist < 5 then
                                    DrawMarker(2, Config.Lab["lockers"][k].x, Config.Lab["lockers"][k].y, Config.Lab["lockers"][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                                    if lockerDist < 0.5 then
                                        DrawText3Ds(Config.Lab["lockers"][k].x, Config.Lab["lockers"][k].y, Config.Lab["lockers"][k].z + 0.3, '~g~E~s~ - Spullen Stelen')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            if CurrentCops >= Config.LabPolice then
                                                openLocker(k)
                                            else
                                                Framework.Functions.Notify("Niet genoeg politie.. (4 nodig)", "error")
                                        end
                                    end
                                end
                             end
                        end
                     end
                end
            end
        end
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local ExplosiveItem = {
        [1] = {name = Framework.Shared.Items["explosive"]["name"], image = Framework.Shared.Items["explosive"]["image"]},
    }
    while true do 
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if not deuropen then
            if GetDistanceBetweenCoords(pos, Config.Lab["explosive"]["x"], Config.Lab["explosive"]["y"], Config.Lab["explosive"]["z"], true) < 2.5 then
                ExplosiveRange = true
                if not Config.Lab["explosive"]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.Lab["explosive"]["x"], Config.Lab["explosive"]["y"], Config.Lab["explosive"]["z"], true)
                    if dist < 1 then
                        if not ExplosiveNeeded then
                            ExplosiveNeeded = true
                            TriggerEvent('qb-inventory:client:requiredItems', ExplosiveItem, true)
                        end
                    else
                        if ExplosiveNeeded then
                            ExplosiveNeeded = false
                            TriggerEvent('qb-inventory:client:requiredItems', ExplosiveItem, false)
                        end
                    end
                end
            else
                ExplosiveRange = false
            end
        end
    end
end)

RegisterNetEvent('electronickit:UseElectronickit')
AddEventHandler('electronickit:UseElectronickit', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Lab["coords"]["x"], Config.Lab["coords"]["y"], Config.Lab["coords"]["z"], true)
                    if dist < 1.5 then
                        if CurrentCops >= Config.LabPolice then
                            if not Config.Lab["isOpened"] then 
                                Framework.Functions.TriggerCallback('Framework:HasItem', function(result)
                                    if result then 
                                        TriggerEvent('qb-inventory:client:requiredItems', requiredItems, false)
                                        StartMiniGame()
                                    else
                                        Framework.Functions.Notify("Je mist een item..", "error")
                                    end
                                end, "trojan_usb")
                            else
                                Framework.Functions.Notify("Het lijkt erop dat je deze computer niet kan hacken..", "error")
                            end
                        else
                            Framework.Functions.Notify("Niet genoeg politie.. (4 nodig)", "error")
                     end
            end
end)

RegisterNetEvent('explosive:UseExplosive')
AddEventHandler('explosive:UseExplosive', function()
local Positie = GetEntityCoords(PlayerPedId())
     if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
         TriggerServerEvent("evidence:server:CreateFingerDrop", Positie)
     end
	 		 --deuren = false
            --deuropen = false
     if CurrentCops >= Config.LabPolice then
        if ExplosiveRange then
        Framework.Functions.TriggerCallback('qb-humanlabs:server:isRobberyActive', function(isBusy)
         if not isBusy then
         TriggerEvent('qb-inventory:client:busy:status', true)
         GiveWeaponToPed(PlayerPedId(), GetHashKey("weapon_stickybomb"), 1, false, true)
         Citizen.Wait(1000)
         TaskPlantBomb(PlayerPedId(), Positie.x, Positie.y, Positie.z, 218.5)
         TriggerServerEvent("Framework:Server:RemoveItem", "explosive", 1)
         TriggerServerEvent('qb-humanlabs:server:DoSmokePfx')
         TriggerEvent('qb-inventory:client:busy:status', false)
         local time = 5
         local coords = GetEntityCoords(PlayerPedId())
         while time > 0 do 
             --Framework.Functions.Notify("Ontploffing over " .. time .. "..")
             Citizen.Wait(1000)
             time = time - 1
         end
         AddExplosion(Config.Lab["explosive"]["x"], Config.Lab["explosive"]["y"], Config.Lab["explosive"]["z"], EXPLOSION_STICKYBOMB, 4.0, true, false, 20.0)
         Framework.Functions.Notify("De deur is open geknald ga snel naar binnen!!", "success")
         deuren = true
         deuropen = true
         TriggerServerEvent('qb-doorlock:server:updateState', 14, false)
         TriggerServerEvent('qb-humanlabs:server:setfirstState', true)
         LockDownStart()
         
         Framework.Functions.TriggerCallback('qb-humanlabs:server:PoliceAlertMessage', function(result)
         end, "Humane Labs Melding", Positie, true)
        else
            Framework.Functions.Notify("Lockdown actief openbreken niet mogelijk!", "error", 5500)
        end
        end)
        else
            Framework.Functions.Notify("Je kan hier geen explosief gebruiken", "error")
        end
        else
         Framework.Functions.Notify("Niet genoeg politie.. (4 nodig)", "error")
		 
            TriggerServerEvent('qb-scoreboard:server:SetActivityBusy', "humanelabs", false)
     end
end)


RegisterNetEvent('qb-humanlabs:client:PoliceAlertMessage')
AddEventHandler('qb-humanlabs:client:PoliceAlertMessage', function(title, coords, blip)
    if blip then
        TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = title,
            details = {
                [1] = {
                    icon = '<i class="fas fa-gem"></i>',
                    detail = "Humane Labs Melding",
                },
                [2] = {
                    icon = '<i class="fas fa-video"></i>',
                    detail = "Nvt",
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = "Chianski Passage",
                },
            },
            callSign = Framework.Functions.GetPlayerData().metadata["callsign"],
        })
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 100
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("112 - Verdachte situatie Humane Labs")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    else
        if not robberyAlert then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
                timeOut = 5000,
                alertTitle = title,
                details = {
                    [1] = {
                        icon = '<i class="fas fa-gem"></i>',
                        detail = "Humane Labs Overval",
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = "Nvt",
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = "Humane Labs Overval",
                    },
                },
                callSign = Framework.Functions.GetPlayerData().metadata["callsign"],
            })
            robberyAlert = true
        end
    end
end)

RegisterNetEvent('qb-humanlabs:client:setLabState')
AddEventHandler('qb-humanlabs:client:setLabState', function(state)
    Config.Lab["isOpened"] = state
end)

RegisterNetEvent('qb-humanlabs:client:setfirstState')
AddEventHandler('qb-humanlabs:client:setfirstState', function(state)
    Config.Lab["explosive"]["isOpened"] = state
    TriggerServerEvent('qb-humanlabs:server:setTimeout')
end)

RegisterNetEvent('qb-humanlabs:client:setLockerState')
AddEventHandler('qb-humanlabs:client:setLockerState', function(lockerId, state, bool)
    Config.Lab["lockers"][lockerId][state] = bool
end)

RegisterNetEvent('qb-humanlabs:client:updateLabState')
AddEventHandler('qb-humanlabs:client:updateLabState', function()
    Config.Lab["isOpened"] = false
    Config.Lab["explosive"]["isOpened"] = false
    for _, v in pairs(Config.Lab['lockers']) do 
        v["isOpened"] = false
    end
    ClearAreaOfVehicles(3616.771, 3738.20, 28.69, 50.0)
end)

RegisterNetEvent('qb-humanlabs:client:DoSmokePfx')
AddEventHandler('qb-humanlabs:client:DoSmokePfx', function()
    if SmokePfx == nil then
        loadParticleDict("des_vaultdoor")
        UseParticleFxAssetNextCall("des_vaultdoor")
        SmokePfx = StartParticleFxLoopedOnEntity("ent_ray_pro1_residual_smoke", GetClosestObjectOfType(Config.Lab["explosive"]["x"], Config.Lab["explosive"]["y"], Config.Lab["explosive"]["z"], 2.0, GetHashKey('v_ilev_bl_doorpool'), false, false, false), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, false, false, false)
        SetTimeout(30000, function()
            for i = 1, 1000, 1 do
                SetParticleFxLoopedAlpha(SmokePfx, SmokeAlpha)
                SmokeAlpha = SmokeAlpha - 0.005
                if SmokeAlpha - 0.005 < 0 then
                    RemoveParticleFx(SmokePfx, 0)
                    RemoveParticleFxFromEntity(GetClosestObjectOfType(Config.Lab["explosive"]["x"], Config.Lab["explosive"]["y"], Config.Lab["explosive"]["z"], 2.0, GetHashKey('v_ilev_bl_doorpool'), false, false, false))
                    SmokeAlpha = 1.0
                    SmokePfx = nil
                    break
                end
                Wait(25)
            end
        end)
    end
end)

-- Functions

function LockDownStart()
    Citizen.Wait(12000)
    if not copsCalled then
        if Config.Lab["alarm"] then
            --TriggerServerEvent("qb-humanlabs:server:callCops", GetEntityCoords(PlayerPedId()))
            copsCalled = true
        end
    end
    SpawnSecurity()
    StartLockDownEscape()
    CreateHumanLabsVehicles()
    TriggerServerEvent('qb-doorlock:server:updateState', 14, true)
    TriggerServerEvent('qb-doorlock:server:updateState', 15, true)
    TriggerServerEvent('qb-doorlock:server:updateState', 16, true)
    --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 80.0, "Lock-Down", 0.1)
end

function openLocker(lockerId)
    local pos = GetEntityCoords(PlayerPedId())
    LockPick()
    TriggerServerEvent('qb-humanlabs:server:setLockerState', lockerId, 'isBusy', true)
     Framework.Functions.Progressbar("open_locker", "Kastje Doorzoeken..", math.random(24000, 38000), false, true, {
         disableMovement = true,
         disableCarMovement = true,
         disableMouse = false,
         disableCombat = true,
     }, {}, {}, {}, function() -- Done
         StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
         TriggerServerEvent('qb-humanlabs:server:setLockerState', lockerId, 'isOpened', true)
         TriggerServerEvent('qb-humanlabs:server:setLockerState', lockerId, 'isBusy', false)
         TriggerServerEvent('qb-humanlabs:server:recieveItem')
         LockPicking = false
     end, function() -- Cancel
         StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
         TriggerServerEvent('qb-humanlabs:server:setLockerState', lockerId, 'isBusy', false)
         Framework.Functions.Notify("Canceled..", "error")
         LockPicking = false
     end)
     Citizen.CreateThread(function()
        while LockPicking do
            TriggerServerEvent('qb-hud:server:gain:stress', math.random(1, 2))
            Citizen.Wait(10000)
        end
    end)
end

function LockPick()
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
    LockPicking = true
    Citizen.CreateThread(function()
        while LockPicking do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000)
        end
    end)
end

function SpawnSecurity()
    RequestModel("ig_casey")
    while not HasModelLoaded("ig_casey") do
        Wait(10)
    end
    for k, v in pairs(Config.Lab["peds"]) do
        local Yew = CreatePed(5, 'ig_casey', v.x, v.y, v.z, v.h, 1, 1)
        SetPedShootRate(Yew,  750)
        SetPedCombatAttributes(Yew, 46, true)
        SetPedFleeAttributes(Yew, 0, 0)
        SetPedAsEnemy(Yew,true)
        SetPedMaxHealth(Yew, 900)
        SetPedAlertness(Yew, 3)
        SetPedCombatRange(Yew, 0)
        SetPedCombatMovement(Yew, 3)
        TaskCombatPed(Yew, PlayerPedId(), 0,16)
        GiveWeaponToPed(Yew, GetHashKey("WEAPON_SMG"), 5000, true, true)
        SetPedRelationshipGroupHash( Yew, GetHashKey("HATES_PLAYER"))
        SetPedDropsWeaponsWhenDead(Yew, false)
    end
       RequestModel("cs_orleans")
       while not HasModelLoaded("cs_orleans") do
           Wait(10)
       end
       CreatePed(5, 'cs_orleans', 3554.24, 3685.30, 28.12, 0.0, false, false)
       CreatePed(5, 'cs_orleans', 3557.38, 3659.92, 28.12, 0.0, false, false)
end

function CreateHumanLabsVehicles()
    RequestModel("boxville3")
    while not HasModelLoaded("boxville3") do
        Wait(10)
    end
    for k,v in pairs(Config.Lab['trucks']) do
    local Voertuig = CreateVehicle(GetHashKey("boxville3"), v.x, v.y, v.z, v.h, true, false)
     SetVehicleNumberPlateText(Voertuig, "HUMAN"..tostring(math.random(100, 999)))
     SetVehicleEngineOn(Voertuig, true, true)
     Citizen.Wait(6000)
 end
end

function StartMiniGame()
    exports['minigame-phone']:ShowHack()
    exports['minigame-phone']:StartHack(math.random(3,5), math.random(15,22), function(Success)
        if Success then
            
        TriggerServerEvent('qb-doorlock:server:updateState', 14, false)
        TriggerServerEvent('qb-doorlock:server:updateState', 15, false)
        TriggerServerEvent('qb-doorlock:server:updateState', 16, false)
        TriggerServerEvent('qb-humanlabs:server:setLabState', true)
        LockDownEnded = true
        pctjuhgekraakt = true

        TriggerServerEvent("Framework:Server:RemoveItem", "electronickit", 1)
        TriggerServerEvent("Framework:Server:RemoveItem", "trojan_usb", 1)

            TriggerEvent('qb-inventory:client:set:busy', false)
        else
            Framework.Functions.Notify("Je hebt gefaalt..", "error")
            --TriggerServerEvent('qb-jewellery:server:set:cooldown', false)
            TriggerEvent('qb-inventory:client:set:busy', false)
        end
        exports['minigame-phone']:HideHack()
    end)
end

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function StartLockDownEscape()
    Citizen.SetTimeout(17 * 60 * 1000, function()
        if not LockDownEnded then
            TriggerServerEvent('qb-doorlock:server:updateState', 15, true)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "noob-lockdown", 1.0)
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

function loadParticleDict(ParticleDict)
    RequestNamedPtfxAsset("des_vaultdoor")
    while not HasNamedPtfxAssetLoaded("des_vaultdoor") do
        Citizen.Wait(0)
    end
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


Citizen.CreateThread(function()
    Labs = AddBlipForCoord(3614.39, 3734.42, 28.69)
    SetBlipSprite (Labs, 96)
    SetBlipDisplay(Labs, 4)
    SetBlipScale  (Labs, 0.6)
    SetBlipAsShortRange(Labs, true)
    SetBlipColour(Labs, 78)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Humane Labs & Research")
    EndTextCommandSetBlipName(Labs)
end)