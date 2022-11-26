RegisterNetEvent('GF:ReviveServer')
AddEventHandler('GF:ReviveServer', function(value)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if value then
        if not PlayerIsDead[xPlayer.source] then
            PlayerIsDead[xPlayer.source] = {}
            PlayerIsDead[xPlayer.source].isDead = 1 
        else
            PlayerIsDead[xPlayer.source] = {}
            PlayerIsDead[xPlayer.source].isDead = 1 
        end
    else
        if not PlayerIsDead[xPlayer.source] then
            PlayerIsDead[xPlayer.source] = {}
            PlayerIsDead[xPlayer.source].isDead = 0
        else
            PlayerIsDead[xPlayer.source] = nil
        end
    end
end)