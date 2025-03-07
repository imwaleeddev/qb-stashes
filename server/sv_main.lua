QBCore.Functions.CreateCallback('qb-policeshop:server:removeMoney', function(source, cb, total, cart, type)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    total = tonumber(total)
    if xPlayer then
        if xPlayer.Functions.RemoveMoney(type, total, 'buy From Shop') then
            for k, v in pairs(cart) do
                if v and v.item and QBCore.Shared.Items[v.item] then
                    v.amount = tonumber(v.amount)
                    if QBCore.Shared.Items[v.item].type == 'weapon' then
                        for i = 1, v.amount, 1 do
                            xPlayer.Functions.AddItem(v.item, 1)
                            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.item], 'Add')
                        end
                    else
                        xPlayer.Functions.AddItem(v.item, v.amount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.item], 'Add', v.amount)
                    end
                end
            end
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)
