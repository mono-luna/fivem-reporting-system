RegisterCommand("report", function(source, args)
    local msg = table.concat(args, " ")
    local pName = GetPlayerName(source)
    local pID = source
    if msg == "" then
        TriggerClientEvent("chatMessage", source, "^1^*[Reporting System] ^r^1ERROR^0: Please fill out the report!")
    else
        TriggerClientEvent("chatMessage", source, "^1^*[Reporting System] ^r^4SUCCESS^0: Your report has been submitted!")
        TriggerEvent("sendReport", pName, pID, msg)
    end
end, false)

RegisterNetEvent("sendReport", function(pName, pID, msg)
    Citizen.CreateThread(function()
        for _, player in ipairs(GetPlayers()) do
            if IsPlayerAceAllowed(player, "2030.staff") then
                TriggerClientEvent("chatMessage", -1, "^1^*[REPORT INCOMING] ^4[" .. pName .. " | ID: " .. pID .. "] ^r" .. msg)
            end
        end
    end)
end)
