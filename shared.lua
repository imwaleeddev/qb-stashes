Config = {}
QBCore = exports['qb-core']:GetCoreObject()

Config.Jobs = {
    ['police'] = {
        [1] = {
            name = 'radio',
            price = 11,
            grades = { 1, 12 }, -- {Minimum Grade, Maximum Grade} -- يعني رقم اقل رتبه واعلى رتبه يشوفون الايتم
        },
        [2] = {
            name = 'weapon_heavypistol',
            price = 11,
            grades = { 1, 12 }, -- {Minimum Grade, Maximum Grade} -- يعني رقم اقل رتبه واعلى رتبه يشوفون الايتم
        },
    },
}

Config.Target = {
    ["policeArmory"] = {
        coords = vector3(-814.55, 176.94, 72.16),
        name = "policeArmory",
        heading = 111,
        info1 = 1.8,
        info2 = 1.0,
        minZ = 71.16,
        maxZ = 72.96,
        debugPoly = false,
        distance = 1.5,
        type = "client",
        event = "qb-policeshop:client:openshop",
        icon = 'fas fa-example',
        label = 'Open Armory',
        job = "police",
        params = { id = 0 },
        canInteract = function(entity)
            return true
        end,
    },
}
