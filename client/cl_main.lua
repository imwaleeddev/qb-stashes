local PlayerData = {}


Citizen.CreateThread(function()
    for k, v in pairs(Config.Target) do
        exports['qb-target']:AddBoxZone(v.name, v.coords, v.info1, v.info2, {
            name = "stashes" .. v.name,
            heading = v.heading,
            debugPoly = v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ
        }, {
            options = {
                {
                    type = v.type,
                    event = v.event,
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                    params = v.params,
                    canInteract = v.canInteract,
                }
            },
            distance = v.distance,
        })
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerData.gang = GangInfo
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('qb-policeshop:client:openshop', function()
    if PlayerData.job.name then
        local Job = Config.Jobs[PlayerData.job.name]
        if Job and QBCore.Shared.Jobs[PlayerData.job.name] then
            SendNUIMessage({
                action = 'show',
                job = QBCore.Shared.Jobs[PlayerData.job.name],
                Items = QBCore.Shared.Items,
                items = Job,
                PlayerData = PlayerData
            })
            SetNuiFocus(true, true)
        else
            QBCore.Functions.Notify('You Are Not Allowed', 'error')
        end
    end
end)


RegisterNuiCallback('buyWuth', function(data, cb)
    local type = data.type
    local cart = data.cart
    local total = data.total
    QBCore.Functions.TriggerCallback('qb-policeshop:server:removeMoney', function(done)
        if done then
            SetNuiFocus(false, false)
            cb(true)
        end
    end, total, cart, type)
    cb(true)
end)

RegisterNuiCallback('closeFucs', function(data, cb)
    SetNuiFocus(false, false)
    cb(true)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = QBCore.Functions.GetPlayerData()
    end
end)
