Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

RegisterServerEvent('qb-judge:lawyer:add')
AddEventHandler('qb-judge:lawyer:add', function(TagetId)
local SelfPlayer = Framework.Functions.GetPlayer(source)
local TagetPlayer = Framework.Functions.GetPlayer(TagetId)
local LawyerInfo = {id = math.random(100000, 999999), firstname = TagetPlayer.PlayerData.charinfo.firstname, lastname = TagetPlayer.PlayerData.charinfo.lastname, citizenid = TagetPlayer.PlayerData.citizenid}
 if TagetPlayer ~= nil and SelfPlayer ~= nil then
    TagetPlayer.Functions.SetJob('lawyer')
    TagetPlayer.Functions.AddItem("lawyerpass", 1, false, LawyerInfo)
    TriggerClientEvent('qb-inventory:client:ItemBox', TagetPlayer.PlayerData.source, Framework.Shared.Items["lawyerpass"], "add")
    TriggerClientEvent('Framework:Notify', SelfPlayer.PlayerData.source, 'You have '..TagetPlayer.PlayerData.charinfo.firstname..' '..TagetPlayer.PlayerData.charinfo.lastname..' hired !')
    TriggerClientEvent('Framework:Notify', TagetPlayer.PlayerData.source, 'Gefeliciteerd je bent aangenomen als advocaat')
 end
end)

Framework.Functions.CreateUseableItem("lawyerpass", function(source, item)
 local Player = Framework.Functions.GetPlayer(source)
  if Player.Functions.GetItemBySlot(item.slot) ~= nil then
    TriggerClientEvent("qb-judge:client:show:pass", -1, source, item.info)
  end
end)