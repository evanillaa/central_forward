notWhitelisted = "You don't have a whitelist ..."
noDiscord = "You must have discord open to join the server."

roles = {
    "Burger",
}

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    deferrals.defer()
    deferrals.update("Checking Permissions")

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        for i = 1, #roles do
            if exports.discord_perms:IsRolePresent(src, roles[i]) then
                deferrals.done()
            else
                deferrals.done(notWhitelisted)
            end
        end
    else
        deferrals.done(noDiscord)
    end
end)