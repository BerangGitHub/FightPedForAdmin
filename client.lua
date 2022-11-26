RegisterCommand("cord", function(source, args, rowcommand)
    local pos = GetEntityCoords(PlayerPedId())
    print(pos.x..", "..pos.y..", "..pos.z)
end, false)

Citizen.CreateThread(function()
	while true do
        local interval = 1
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(730.68, 1272.80, 360.29)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 30 then
            local interval = 200
        else
            local interval = 1
            local posDrawMarker = vector3(730.68, 1272.80, 360.29)
            DrawMarker(2, posDrawMarker.x, posDrawMarker.y, posDrawMarker.y, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
            if distance < 30 then
                AddTextEntry(("HELP"), "Appuyez sur ~INPUT_CONTEXT~ ~s~pour revive.")
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    local ped = PlayerPedId()
                    TriggerClientEvent('GF:ReviveClient', target)
                end
            end
        end

        Citizen.Wait(interval)
	end
end)

RegisterCommand("kill", function(source, args, rowcommand)
    local ped = PlayerPedId()
    SetEntityHealth(ped, 0)
end, false)

RegisterNetEvent('GF:ReviveClient')
AddEventHandler('GF:ReviveClient', function()
    SetEntityRagdoll = false
    TriggerServerEvent('GF:ReviveServer', false)
    print("Player : ".. GetPlayerName(PlayerId()) .." revive !")
end)