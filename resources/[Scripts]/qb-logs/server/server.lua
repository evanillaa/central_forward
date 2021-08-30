Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

RegisterServerEvent('qb-logs:server:SendLog')
AddEventHandler('qb-logs:server:SendLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone ~= nil and tagEveryone or false
    local webHook = Config.Webhooks[name] ~= nil and Config.Webhooks[name] or Config.Webhooks["default"]
    local embedData = {
        {
         ["title"] = title,
         ["color"] = Config.Colors[color] ~= nil and Config.Colors[color] or Config.Colors["default"],
         ["footer"] = {
         ["text"] = os.date("%c"),
         },
         ["description"] = message,
        }
    }
    Citizen.Wait(100)
    if tag then
      PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = "Millenium Logs", content = "@everyone"}), { ['Content-Type'] = 'application/json' })
    else
      PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = "Millenium Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
    end
end)

AddEventHandler('chatMessage', function(author, color, message)
    if source ~= nil then
      TriggerEvent("qb-logs:server:SendLog", "chat", "Player Chat", "blue", "**".. GetPlayerName(author) .. "** says: **" ..message.."**")
    end
end)