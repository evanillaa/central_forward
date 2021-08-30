local DutyVehicles = {}
HasHandCuffs = false

Config = Config or {}

Config.Keys = {["F1"] = 288}

Config.Menu = {
 [1] = {
    id = "citizen",
    displayName = "Citizen",
    icon = "#citizen-action",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            return true
        end
    end,
    subMenus = {"citizen:escort", 'citizen:steal', 'citizen:contact', 'citizen:vehicle:getout', 'citizen:vehicle:getin', 'citizen:corner:selling'}
 },
 [2] = {
    id = "animations",
    displayName = "Walkstyle",
    icon = "#walking",
    enableMenu = function()
       if not exports['qb-hospital']:GetDeathStatus() then
           return true
        end
    end,
    subMenus = { "animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien" }
 },
 [3] = {
     id = "expressions",
     displayName = "Facial Expressies",
     icon = "#expressions",
     enableMenu = function()
         if not exports['qb-hospital']:GetDeathStatus() then
            return true
         end
     end,
     subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
 },
 [4] = {
    id = "police",
    displayName = "Police",
    icon = "#police-action",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
            return true
        end
    end,
    subMenus = {"police:panic", "police:search", "police:tablet", "police:impound", "police:impoundhard", "police:resetdoor", "police:enkelband"}
 },
 [5] = {
    id = "police",
    displayName = "Police Objects",
    icon = "#police-action",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
            return true
        end
    end,
    subMenus = {"police:object:cone", "police:object:barrier", "police:object:tent", "police:object:light", "police:object:schot", "police:object:delete"}
 },
 [6] = {
    id = "police-down",
    displayName = "10-13A",
    icon = "#police-down",
    close = true,
    functiontype = "client",
    functionParameters = 'Urgent',
    functionName = "qb-radialmenu:client:send:down",
    enableMenu = function()
        if exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
            return true
        end
    end,
 },
 [7] = {
    id = "police-down",
    displayName = "10-13B",
    icon = "#police-down",
    close = true,
    functiontype = "client",
    functionParameters = 'Normal',
    functionName = "qb-radialmenu:client:send:down",
    enableMenu = function()
        if exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
            return true
        end
    end,
 },
 [8] = {
    id = "ambulance",
    displayName = "Ambulance",
    icon = "#ambulance-action",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'ambulance' and Framework.Functions.GetPlayerData().job.onduty then
            return true
        end
    end,
    subMenus = {"ambulance:heal", "ambulance:revive", "police:panic", "ambulance:blood"}
 },
 [9] = {
    id = "vehicle",
    displayName = "Vehicle",
    icon = "#citizen-action-vehicle",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
            if Vehicle ~= 0 and Distance < 2.3 then
                return true
            end
        end
    end,
    subMenus = {"vehicle:flip", "vehicle:key"}
 },
 [10] = {
    id = "vehicle-doors",
    displayName = "Vehicle Doors",
    icon = "#citizen-action-vehicle",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if IsPedSittingInAnyVehicle(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) and not IsPedInAnyHeli(PlayerPedId()) and not IsPedOnAnyBike(PlayerPedId()) then
                return true
            end
        end
    end,
    subMenus = {"vehicle:door:motor", "vehicle:door:left:front", "vehicle:door:right:front", "vehicle:door:trunk", "vehicle:door:right:back", "vehicle:door:left:back"}
 },
 [11] = {
    id = "police-garage",
    displayName = "Police Garage",
    icon = "#citizen-action-garage",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-police']:GetGarageStatus() then
                return true
            end
        end
    end,
    subMenus = {"police:garage:taxi", "vehicle:delete"}
 },
 [12] = {
    id = "garage",
    displayName = "Garage",
    icon = "#citizen-action-garage",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-garages']:IsNearGarage() then
                return true
            end
        end
    end,
    subMenus = {"garage:putin", "garage:getout"}
 },
 [13] = {
    id = "door",
    displayName = "Doorlock",
    icon = "#global-doors",
    close = true,
    functiontype = "client",
    functionName = "qb-doorlock:client:toggle:locks",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-doorlock']:CanOpenDoor() then
                return true
            end
        end
  end,
 },
 [14] = {
    id = "atm",
    displayName = "ATM",
    icon = "#global-card",
    close = true,
    functiontype = "client",
    functionName = "qb-banking:client:open:atm",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-banking']:IsNearAtm() then
                return true
            end
        end
  end,
 },
 [15] = {
    id = "atm",
    displayName = "Bank",
    icon = "#global-bank",
    close = true,
    functiontype = "client",
    functionName = "qb-banking:client:open:bank",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-banking']:IsNearAnyBank() then
                return true
            end
        end
  end,
 },
 [16] = {
    id = "shop",
    displayName = "Shop",
    icon = "#global-store",
    close = true,
    functiontype = "client",
    functionName = "qb-stores:server:open:shop",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-stores']:IsNearShop() then
                return true
            end
        end
  end,
 },
 [17] = {
    id = "appartment",
    displayName = "Go Inside",
    icon = "#global-appartment",
    close = true,
    functiontype = "client",
    functionParameters = false,
    functionName = "qb-appartments:client:enter:appartment",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-appartments']:IsNearHouse() then
                return true
            end
        end
  end,
 },
 [18] = {
    id = "depot",
    displayName = "Depot",
    icon = "#global-depot",
    close = true,
    functiontype = "client",
    functionParameters = false,
    functionName = "qb-garages:client:open:depot",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-garages']:IsNearDepot() then
                return true
            end
        end
  end,
 },
 [19] = {
    id = "housing",
    displayName = "Go Inside",
    icon = "#global-appartment",
    close = true,
    functiontype = "client",
    functionParameters = false,
    functionName = "qb-housing:client:enter:house",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-housing']:EnterNearHouse() then
                return true
            end
        end
  end,
 },
 [20] = {
    id = "housing-options",
    displayName = "House Options",
    icon = "#citizen-action-garage",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-housing']:HasEnterdHouse() then
                return true
            end
        end
    end,
    subMenus = {"house:setstash", "house:setlogout", "house:setclothes", "house:givekey", "house:decorate" }
 },
 [21] = {
    id = "judge-actions",
    displayName = "Judge",
    icon = "#judge-actions",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'judge' then
            return true
        end
    end,
    subMenus = {"judge:tablet", "judge:job", "police:tablet"}
 },
 [22] = {
    id = "ambulance-garage",
    displayName = "Ambulance Garage",
    icon = "#citizen-action-garage",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'ambulance' and Framework.Functions.GetPlayerData().job.onduty then
            if exports['qb-hospital']:NearGarage() then
                return true
            end
        end
    end,
    subMenus = {"ambulance:garage:sprinter", "ambulance:garage:touran", "ambulance:garage:heli", "vehicle:delete"}
 },
 [23] = {
    id = "scrapyard",
    displayName = "Scrap Vehicle",
    icon = "#police-action-vehicle-spawn",
    close = true,
    functiontype = "client",
    functionName = "qb-materials:client:scrap:vehicle",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
          if exports['qb-materials']:IsNearScrapYard() then
            return true
          end
        end
  end,
 },
 [24] = {
    id = "trash",
    displayName = "Search Bin",
    icon = "#global-trash",
    close = true,
    functiontype = "client",
    functionName = "qb-materials:client:search:trash",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
          if exports['qb-materials']:GetBinStatus() then
            return true
          end
        end
  end,
 },
  [25] = {
    id = "cityhall",
    displayName = "Cityhall",
    icon = "#global-cityhall",
    close = true,
    functiontype = "client",
    functionName = "qb-cityhall:client:open:nui",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-cityhall']:CanOpenCityHall() then
                return true
            end
        end
  end,
 },
 [26] = {
    id = "dealer",
    displayName = "Dealer Shop",
    icon = "#global-dealer",
    close = true,
    functiontype = "client",
    functionName = "qb-dealers:client:open:dealer",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-dealers']:CanOpenDealerShop() then
                return true
            end
        end
  end,
 },
 [27] = {
    id = "traphouse",
    displayName = "Traphouse",
    icon = "#global-appartment",
    close = true,
    functiontype = "client",
    functionName = "qb-traphouse:client:enter",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() then
            if exports['qb-traphouse']:CanPlayerEnterTraphouse() then
                return true
            end
        end
  end,
 },
 [28] = {
    id = "tow-menu",
    displayName = "Tow Actions",
    icon = "#citizen-action-garage",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'tow' then
            return true
        end
    end,
    subMenus = {"tow:hook", "tow:npc"}
--  },
--  [29] = {
--     id = "police-impound",
--     displayName = "Police Impound",
--     icon = "#citizen-action-garage",
--     enableMenu = function()
--         if not exports['qb-hospital']:GetDeathStatus() then
--             if exports['qb-police']:GetImpoundStatus() then
--                 return true
--             end
--         end
--     end,
--     subMenus = {}
 },
 [30] = {
    id = "taxi",
    displayName = "Taxi",
    icon = "#taxi-action",
    enableMenu = function()
        if Framework.Functions.GetPlayerData().job.name == 'taxi' then
            return true
        end
    end,
    subMenus = {"taxi:togglemeter", "taxi:mouse", "taxi:npc"}
 },
 
 [31] = {
    id = "cuff",
    displayName = "Cuff",
    icon = "#citizen-action-cuff",
    close = true,
    functiontype = "client",
    functionName = "qb-police:client:cuff:closest",
    enableMenu = function()
        if not exports['qb-hospital']:GetDeathStatus() and HasHandCuffs then
          return true
        end
  end,
 }
}

Config.SubMenus = {
    ['taxi:togglemeter'] = {
     title = "Show/Hide Meter",
     icon = "#taxi-meter",
     close = true,
     functiontype = "client",
     functionName = "qb-taxi:client:toggleMeter"
    },
    ['taxi:mouse'] = {
     title = "Start/Stop Meter",
     icon = "#taxi-start",
     close = true,
     functiontype = "client",
     functionName = "qb-taxi:client:enableMeter"
    },
    ['taxi:npc'] = {
     title = "NPC Missions",
     icon = "#taxi-npc",
     close = true,
     functiontype = "client",
    functionName = "qb-taxi:client:DoTaxiNpc"
    },
    ['police:panic'] = {
     title = "Emergency",
     icon = "#police-action-panic",
     close = true,
     functiontype = "client",
     functionName = "qb-radialmenu:client:send:panic:button"
    },
    ['police:tablet'] = {
     title = "MEOS Tablet",
     icon = "#police-action-tablet",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:show:tablet"
    },
    ['police:impound'] = {
     title = "Remove Vehicle",
     icon = "#police-action-vehicle",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:impound:closest"
    },
    ['police:impoundhard'] = {
        title = "Impound",
        icon = "#police-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "qb-police:client:impound:hard:closest"
       },
    ['police:search'] = {
     title = "Search",
     icon = "#police-action-search",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:search:closest"
    },
    ['police:resetdoor'] = {
     title = "Reset House Door",
     icon = "#global-appartment",
     close = true,
     functiontype = "client",
     functionName = "qb-housing:client:reset:house:door"
    },
    ['police:enkelband'] = {
     title = "Location",
     icon = "#police-action-enkelband",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:enkelband:closest"
    },
    ['police:vehicle:touran'] = {
     title = "Police Touran",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'PolitieTouran',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:klasse'] = {
     title = "Police B-Klasse",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'PolitieKlasse',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:vito'] = {
     title = "Police Vito",
     icon = "#police-action-vehicle-spawn-bus",
     close = true,
     functionParameters = 'PolitieVito',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:audi'] = {
     title = "Police Audi",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'PolitieRS6',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:velar'] = {
     title = "Police Unmarked Velar",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'PolitieVelar',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    -- ['police:vehicle:range'] = {
    --     title = "Police Range Rover",
    --     icon = "#police-action-vehicle-spawn",
    --     close = true,
    --     functionParameters = 'PolitieRange',
    --     functiontype = "client",
    --     functionName = "qb-police:client:spawn:vehicle"
    --    },
    ['police:vehicle:bmw'] = {
     title = "Police Unmarked M5",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'PolitieBmw',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:unmaked:audi'] = {
     title = "Police Unmarked A6",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'PolitieAudiUnmarked',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:heli'] = {
     title = "Police Zulu",
     icon = "#police-action-vehicle-spawn-heli",
     close = true,
     functionParameters = 'PolitieZulu',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:vehicle:motor'] = {
     title = "Police Motor",
     icon = "#police-action-vehicle-spawn-motor",
     close = true,
     functionParameters = 'PolitieMotor',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['police:object:cone'] = {
     title = "Cone",
     icon = "#global-box",
     close = true,
     functionParameters = 'cone',
     functiontype = "client",
     functionName = "qb-police:client:spawn:object"
    },
    ['police:object:barrier'] = {
     title = "Barrier",
     icon = "#global-box",
     close = true,
     functionParameters = 'barrier',
     functiontype = "client",
     functionName = "qb-police:client:spawn:object"
    },
    ['police:object:schot'] = {
     title = "Fence",
     icon = "#global-box",
     close = true,
     functionParameters = 'schot',
     functiontype = "client",
     functionName = "qb-police:client:spawn:object"
    },
    ['police:object:tent'] = {
     title = "Tent",
     icon = "#global-tent",
     close = true,
     functionParameters = 'tent',
     functiontype = "client",
     functionName = "qb-police:client:spawn:object"
    },
    ['police:object:light'] = {
     title = "Light",
     icon = "#global-box",
     close = true,
     functionParameters = 'light',
     functiontype = "client",
     functionName = "qb-police:client:spawn:object"
    },
    ['police:object:delete'] = {
     title = "Delete Object",
     icon = "#global-delete",
     close = false,
     functiontype = "client",
     functionName = "qb-police:client:delete:object"
    },
    ['ambulance:heal'] = {
      title = "Heal",
      icon = "#ambulance-action-heal",
      close = true,
      functiontype = "client",
      functionName = "qb-hospital:client:heal:closest"
    },
    ['ambulance:revive'] = {
      title = "Revive",
      icon = "#ambulance-action-heal",
      close = true,
      functiontype = "client",
      functionName = "qb-hospital:client:revive:closest"
    },
    ['ambulance:blood'] = {
      title = "Take Bloodsample",
      icon = "#ambulance-action-blood",
      close = true,
      functiontype = "client",
      functionName = "qb-hospital:client:take:blood:closest"
    },
    ['ambulance:garage:heli'] = {
      title = "Ambulance Heli",
      icon = "#police-action-vehicle-spawn",
      close = true,
      functionParameters = 'AmbulanceHeli',
      functiontype = "client",
      functionName = "qb-hospital:client:spawn:vehicle"
    },
    ['ambulance:garage:touran'] = {
     title = "Ambulance Touran",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'AmbulanceTouran',
     functiontype = "client",
     functionName = "qb-hospital:client:spawn:vehicle"
    },
    ['ambulance:garage:sprinter'] = {
     title = "Ambulance Sprinter",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'AmbulanceSprinter',
     functiontype = "client",
     functionName = "qb-hospital:client:spawn:vehicle"
    },
    ['police:garage:taxi'] = {
     title = "Taxi",
     icon = "#police-action-vehicle-spawn",
     close = true,
     functionParameters = 'taxi',
     functiontype = "client",
     functionName = "qb-police:client:spawn:vehicle"
    },
    ['vehicle:delete'] = {
     title = "Delete Vehicle",
     icon = "#police-action-vehicle-delete",
     close = true,
     functiontype = "client",
     functionName = "Framework:Command:DeleteVehicle"
    },
    ['judge:tablet'] = {
     title = "Judge Tablet",
     icon = "#police-action-tablet",
     close = true,
     functiontype = "client",
     functionName = "qb-judge:client:toggle"
    },
    ['judge:job'] = {
     title = "Hire Lawyer",
     icon = "#judge-actions",
     close = true,
     functiontype = "client",
     functionName = "qb-judge:client:lawyer:add:closest"
    },
    ['citizen:contact'] = {
     title = "Share Contact",
     icon = "#citizen-contact",
     close = true,
     functiontype = "client",
     functionName = "qb-phone:client:GiveContactDetails"
    },
    ['citizen:escort'] = {
     title = "Escort",
     icon = "#citizen-action-escort",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:escort:closest"
    },
    ['citizen:steal'] = {
     title = "Rob",
     icon = "#citizen-action-steal",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:steal:closest"
    },
    ['citizen:vehicle:getout'] = {
     title = "Out Vehicle",
     icon = "#citizen-put-out-veh",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:SetPlayerOutVehicle"
    },
    ['citizen:vehicle:getin'] = {
     title = "In Vehicle",
     icon = "#citizen-put-in-veh",
     close = true,
     functiontype = "client",
     functionName = "qb-police:client:PutPlayerInVehicle"
    },
    ['vehicle:flip'] = {
     title = "Flip Vehicle",
     icon = "#citizen-action-vehicle",
     close = true,
     functiontype = "client",
     functionName = "qb-radialmenu:client:flip:vehicle"
    },
    ['vehicle:key'] = {
     title = "Give Keys",
     icon = "#citizen-action-vehicle-key",
     close = true,
     functiontype = "client",
     functionName = "qb-vehiclekeys:client:give:key"
    },

    ['vehicle:door:left:front'] = {
     title = "Left Front",
     icon = "#global-arrow-left",
     close = true,
     functionParameters = 0,
     functiontype = "client",
     functionName = "qb-radialmenu:client:open:door"
    },
    ['vehicle:door:motor'] = {
     title = "Hood",
     icon = "#global-arrow-up",
     close = true,
     functionParameters = 4,
     functiontype = "client",
     functionName = "qb-radialmenu:client:open:door"
    },
    ['vehicle:door:right:front'] = {
     title = "Right Front",
     icon = "#global-arrow-right",
     close = true,
     functionParameters = 1,
     functiontype = "client",
     functionName = "qb-radialmenu:client:open:door"
    },
    ['vehicle:door:right:back'] = {
     title = "Right Back",
     icon = "#global-arrow-right",
     close = true,
     functionParameters = 3,
     functiontype = "client",
     functionName = "qb-radialmenu:client:open:door"
    },
    ['vehicle:door:trunk'] = {
     title = "Trunk",
     icon = "#global-arrow-down",
     close = true,
     functionParameters = 5,
     functiontype = "client",
     functionName = "qb-radialmenu:client:open:door"
    },
    ['vehicle:door:left:back'] = {
     title = "Left Back",
     icon = "#global-arrow-left",
     close = true,
     functionParameters = 2,
     functiontype = "client",
     functionName = "qb-radialmenu:client:open:door"
    },


    ['tow:hook'] = {
     title = "Tow Vehicle",
     icon = "#citizen-action-vehicle",
     close = true,
     functiontype = "client",
     functionName = "qb-tow:client:hook:car"
    },
    ['tow:npc'] = {
     title = "Toggle NPC",
     icon = "#citizen-action",
     close = true,
     functiontype = "client",
     functionName = "qb-tow:client:toggle:npc"
    },
    ['citizen:corner:selling'] = {
        title = "Cornersell",
        icon = "#citizen-action-cornerselling",
        close = true,
        functiontype = "client",
        functionName = "qb-illegal:client:toggle:corner:selling"
       },
    ['garage:putin'] = {
     title = "In Garage",
     icon = "#citizen-put-in-veh",
     close = true,
     functiontype = "client",
     functionName = "qb-garages:client:check:owner"
    },
    ['garage:getout'] = {
     title = "Out Garage",
     icon = "#citizen-put-out-veh",
     close = true,
     functiontype = "client",
     functionName = "qb-garages:client:set:vehicle:out:garage"
    }, 
    ['house:setstash'] = {
     title = "Set Stash",
     icon = "#citizen-put-out-veh",
     close = true,
     functionParameters = 'stash',
     functiontype = "client",
     functionName = "qb-housing:client:set:location"
    },
    ['house:setlogout'] = {
     title = "Set Logout",
     icon = "#citizen-put-out-veh",
     close = true,
     functionParameters = 'logout',
     functiontype = "client",
     functionName = "qb-housing:client:set:location"
    },
    ['house:setclothes'] = {
     title = "Set Wardrobe",
     icon = "#citizen-put-out-veh",
     close = true,
     functionParameters = 'clothes',
     functiontype = "client",
     functionName = "qb-housing:client:set:location"
    },
    ['house:givekey'] = {
     title = "Give Keys",
     icon = "#citizen-action-vehicle-key",
     close = true,
     functiontype = "client",
     functionName = "qb-housing:client:give:keys"
    },
    ['house:decorate'] = {
     title = "Decorate",
     icon = "#global-box",
     close = true,
     functiontype = "client",
     functionName = "qb-housing:client:decorate"
    },
    -- // Anims and Expression \\ --
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        close = true,
        functionName = "AnimSet:Brave",
        functiontype = "client",
    },
    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-hurry",
        close = true,
        functionName = "AnimSet:Hurry",
        functiontype = "client",
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        close = true,
        functionName = "AnimSet:Business",
        functiontype = "client",
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        close = true,
        functionName = "AnimSet:Tipsy",
        functiontype = "client",
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        close = true,
        functionName = "AnimSet:Injured",
        functiontype = "client",
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        close = true,
        functionName = "AnimSet:ToughGuy",
        functiontype = "client",
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        close = true,
        functionName = "AnimSet:Sassy",
        functiontype = "client",
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        close = true,
        functionName = "AnimSet:Sad",
        functiontype = "client",
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        close = true,
        functionName = "AnimSet:Posh",
        functiontype = "client",
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        close = true,
        functionName = "AnimSet:Alien",
        functiontype = "client",
    },
    ['animations:nonchalant'] =
    {
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        close = true,
        functionName = "AnimSet:NonChalant",
        functiontype = "client",
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        close = true,
        functionName = "AnimSet:Hobo",
        functiontype = "client",
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        close = true,
        functionName = "AnimSet:Money",
        functiontype = "client",
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        close = true,
        functionName = "AnimSet:Swagger",
        functiontype = "client",
    },
    ['animations:shady'] = {
        title = "Shady",
        icon = "#animation-shady",
        close = true,
        functionName = "AnimSet:Shady",
        functiontype = "client",
    },
    ['animations:maneater'] = {
        title = "Man Eater",
        icon = "#animation-maneater",
        close = true,
        functionName = "AnimSet:ManEater",
        functiontype = "client",
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        close = true,
        functionName = "AnimSet:ChiChi",
        functiontype = "client",
    },
    ['animations:default'] = {
        title = "Default",
        icon = "#animation-default",
        close = true,
        functionName = "AnimSet:default",
        functiontype = "client",
    },
    ["expressions:angry"] = {
        title="Angry",
        icon="#expressions-angry",
        close = true,
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" },
        functiontype = "client",
    },
    ["expressions:drunk"] = {
        title="Drunk",
        icon="#expressions-drunk",
        close = true,
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" },
        functiontype = "client",
    },
    ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        close = true,
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" },
        functiontype = "client",
    },
    ["expressions:electrocuted"] = {
        title="Electrocuted",
        icon="#expressions-electrocuted",
        close = true,
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" },
        functiontype = "client",
    },
    ["expressions:grumpy"] = {
        title="Grumpy",
        icon="#expressions-grumpy",
        close = true,
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" },
        functiontype = "client",
    },
    ["expressions:happy"] = {
        title="Happy",
        icon="#expressions-happy",
        close = true,
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" },
        functiontype = "client",
    },
    ["expressions:injured"] = {
        title="Injured",
        icon="#expressions-injured",
        close = true,
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" },
        functiontype = "client",
    },
    ["expressions:joyful"] = {
        title="Joyful",
        icon="#expressions-joyful",
        close = true,
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" },
        functiontype = "client",
    },
    ["expressions:mouthbreather"] = {
        title="Mouthbreather",
        icon="#expressions-mouthbreather",
        close = true,
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" },
        functiontype = "client",
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        close = true,
        functionName = "expressions:clear",
        functiontype = "client",
    },
    ["expressions:oneeye"]  = {
        title="One Eye",
        icon="#expressions-oneeye",
        close = true,
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" },
        functiontype = "client",
    },
    ["expressions:shocked"]  = {
        title="Shocked",
        icon="#expressions-shocked",
        close = true,
        functionName = "expressions",
        functionParameters = { "shocked_1" },
        functiontype = "client",
    },
    ["expressions:sleeping"]  = {
        title="Sleeping",
        icon="#expressions-sleeping",
        close = true,
        functionName = "expressions",
        functionParameters = { "dead_1" },
        functiontype = "client",
    },
    ["expressions:smug"]  = {
        title="Smug",
        icon="#expressions-smug",
        close = true,
        functionName = "expressions",
        functionParameters = { "mood_smug_1" },
        functiontype = "client",
    },
    ["expressions:speculative"]  = {
        title="Speculative",
        icon="#expressions-speculative",
        close = true,
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" },
        functiontype = "client",
    },
    ["expressions:stressed"]  = {
        title="Stressed",
        icon="#expressions-stressed",
        close = true,
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" },
        functiontype = "client",
    },
    ["expressions:sulking"]  = {
        title="Sulking",
        icon="#expressions-sulking",
        close = true,
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
        functiontype = "client",
    },
    ["expressions:weird"]  = {
        title="Weird",
        icon="#expressions-weird",
        close = true,
        functionName = "expressions",
        functionParameters = { "effort_2" },
        functiontype = "client",
    },
    ["expressions:weird2"]  = {
        title="Weird 2",
        icon="#expressions-weird2",
        close = true,
        functionName = "expressions",
        functionParameters = { "effort_3" },
        functiontype = "client",
    }
}
