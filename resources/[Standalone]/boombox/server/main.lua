local speakers = {}

local coords = {}
Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Functions.CreateUseableItem("boombox", function(source, item)
    local Player = Framework.Functions.GetPlayer(source)
	TriggerClientEvent('qb-boombox:place', source)
	
end)

RegisterServerEvent('qb-boombox:loadSpeaker')
AddEventHandler('qb-boombox:loadSpeaker', function(speaker)
    speakers[speaker.speaker] = speaker
    speakers[speaker.speaker].switch = false
    speakers[speaker.speaker].volchange = false
    speakers[speaker.speaker].volval = 100
    speaker.switch = false
    speaker.volchange = false
    speaker.volval = 100
    TriggerClientEvent('qb-boombox:loadSpeakerClient', -1, speaker)
end)

local id = 0

RegisterServerEvent('qb-boombox:removeSpeaker')
AddEventHandler('qb-boombox:removeSpeaker', function(speaker)
    id = id - 1
    TriggerClientEvent("qb-boombox:removeClient", -1, speaker)
end)


RegisterServerEvent('qb-boombox:placedSpeaker')
AddEventHandler('qb-boombox:placedSpeaker', function(spawncoords, speakerid)
    id = id + 1
    local speaker = {}
    speaker.speakerid = speakerid
    speaker.coords = spawncoords
    speaker.speaker = id
    table.insert(speakers, speaker)
    TriggerClientEvent('qb-boombox:loadSpeakerClient', -1, speaker)
end)

RegisterServerEvent('qb-boombox:joined')
AddEventHandler('qb-boombox:joined', function()
    local src = source
    for i=1, #speakers do
        --print(speakers[i].coords)
        --print(speakers[i].speaker)
        --print(speakers[i].volchange)
        --print(speakers[i].videoStatus)
        --print(speakers[i].time)
    end
    TriggerClientEvent("qb-boombox:joined", src, speakers)
end)



RegisterServerEvent('qb-boombox:switchVideo')
AddEventHandler('qb-boombox:switchVideo', function(id, videoStatus, time)
    local src = source
    TriggerClientEvent("qb-boombox:switchVideoClient", -1, id, videoStatus, time)
    speakers[id].switch = true
    speakers[id].videoStatus = videoStatus
    speakers[id].time = time - speakers[id].time
end)



RegisterServerEvent('qb-boombox:changeVol')
AddEventHandler('qb-boombox:changeVol', function(id, vol)
    local src = source
    speakers[id].volval = vol
    TriggerClientEvent("qb-boombox:changeVolClient", -1, id, vol)
end)