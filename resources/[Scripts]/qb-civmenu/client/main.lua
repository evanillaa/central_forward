Framework = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if Framework == nil then
            TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
            Citizen.Wait(200)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
    local currentItemIndex = 1
    local selectedItemIndex = 1
    local checkbox = true
    local src = source
    local Player = GetPlayerPed(-1)


    WarMenu.CreateMenu('civmenu', 'Player Menu')
    WarMenu.CreateSubMenu('houseMenu', 'civmenu', 'Are you sure?')
     WarMenu.CreateSubMenu('testMenu', 'civmenu', 'Are you sure?')

    
      while true do
        if WarMenu.IsMenuOpened('civmenu') then

          if WarMenu.Button('Open Inventory') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerServerEvent('inventory:server:OpenInventory')
                   WarMenu.CloseMenu()

           elseif WarMenu.Button('Check Chop List') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerEvent('SB-GetList', source)
                   WarMenu.CloseMenu()

            elseif WarMenu.Button('Give Phone Number') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerEvent('qb-phone:client:GiveContactDetails')
                   WarMenu.CloseMenu()

                -- Do your stuff here
            elseif WarMenu.Button('Kidnap') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerEvent('police:client:KidnapPlayer')
                   WarMenu.CloseMenu()


            elseif WarMenu.Button('Rob Person') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerEvent('police:client:RobPlayer')
                   WarMenu.CloseMenu()

            elseif WarMenu.Button('Take Hostage') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerEvent('A5:Client:TakeHostage')
                   WarMenu.CloseMenu()


            elseif WarMenu.Button('Escort Player') then
                   local PlayerPed = GetPlayerPed(-1)
                   TriggerEvent('police:client:EscortPlayer')
                   WarMenu.CloseMenu()

                    -- Do your stuff here if current index was changed (don't forget to check it)


        elseif WarMenu.MenuButton('House', 'houseMenu') then
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('houseMenu') then
            if WarMenu.Button('Toggle Locks') then
            local PlayerData = Framework.Functions.GetPlayerData()
            TriggerEvent('qb-houses:client:toggleDoorlock')
            WarMenu.CloseMenu()

           elseif WarMenu.Button('Give House Key') then
            local PlayerPed = GetPlayerPed(-1)
            TriggerEvent('qb-houses:client:giveHouseKey')
            WarMenu.CloseMenu()

        elseif WarMenu.Button('Remove House Key') then
          local PlayerPed = GetPlayerPed(-1)
            TriggerEvent('qb-houses:client:removeHouseKey')
            WarMenu.CloseMenu()

        elseif WarMenu.Button('Decorate House') then
          local PlayerPed = GetPlayerPed(-1)
            TriggerEvent('qb-houses:client:decorate')
            WarMenu.CloseMenu()
          end
      
     

            WarMenu.Display()
        elseif IsControlJustReleased(0, 20) then -- M by default
            WarMenu.OpenMenu('civmenu')
        end

        Citizen.Wait(0)
    end
end
end)