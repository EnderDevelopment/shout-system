local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('ShoutSystem:Shout')
AddEventHandler('ShoutSystem:Shout', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        local playerName = xPlayer.getName()
        local playerId = xPlayer.source

        -- Log shout to database
        MySQL.Async.execute('INSERT INTO shout_logs (player_id, player_name, shout_time, shout_message) VALUES (@player_id, @player_name, NOW(), @shout_message)', {
            ['@player_id'] = playerId,
            ['@player_name'] = playerName,
            ['@shout_message'] = message
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('ShoutSystem:PlayShout', -1, message)
                xPlayer.showNotification(Config.Locale['shout_success'])
            else
                xPlayer.showNotification(Config.Locale['shout_failed'])
            end
        end)
    end
end)