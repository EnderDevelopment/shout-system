local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand(Config.ShoutCommand, function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Play sound
    PlaySoundFrontend(-1, Config.ShoutSound, 'rcm_barry1a_sounds', true)

    -- Play animation
    RequestAnimDict(Config.ShoutAnimation)
    while not HasAnimDictLoaded(Config.ShoutAnimation) do
        Citizen.Wait(0)
    end

    TaskPlayAnim(playerPed, Config.ShoutAnimation, 'shout_01', 8.0, -8.0, -1, 0, 0, false, false, false)

    -- Broadcast message to nearby players
    TriggerServerEvent('ShoutSystem:Shout', table.concat(args, ' '))

    -- Remove animation after duration
    Citizen.Wait(Config.ShoutDuration)
    ClearPedTasks(playerPed)
end, false)

RegisterNetEvent('ShoutSystem:PlayShout')
AddEventHandler('ShoutSystem:PlayShout', function(message)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(source)))

    if #(playerCoords - targetCoords) <= Config.ShoutDistance then
        PlaySoundFrontend(-1, Config.ShoutSound, 'rcm_barry1a_sounds', true)
        ESX.ShowNotification(message)
    end
end)