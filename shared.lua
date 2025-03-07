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
            grades = { 0, 20 }, -- {Minimum Grade, Maximum Grade} -- يعني رقم اقل رتبه واعلى رتبه يشوفون الايتم
        },
        [3] = {
            name = "weapon_combatpistol",
            price = 14,
            grades = { 0, 20 }
        },
        [4] = {
            name = "weapon_stungun",
            price = 7,
            grades = { 0, 20 }
        },
        [5] = {
            name = "weapon_nightstick",
            price = 5,
            grades = { 0, 20 }
        },
        [6] = {
            name = "pistol_ammo",
            price = 1,
            grades = { 0, 20 }
        },
        [7] = {
            name = "smg_ammo",
            price = 2,
            grades = { 0, 20 }
        },
        [8] = {
            name = "rifle_ammo",
            price = 2,
            grades = { 0, 20 }
        },
        [9] = {
            name = "handcuffs",
            price = 10,
            grades = { 0, 20 }
        },
        [10] = {
            name = "weapon_flashlight",
            price = 10,
            grades = { 0, 20 }
        },
        [11] = {
            name = "empty_evidence_bag",
            price = 10,
            grades = { 0, 20 }
        },
        [12] = {
            name = "police_stormram",
            price = 10,
            grades = { 0, 20 }
        },
        [13] = {
            name = "armor",
            price = 4,
            grades = { 0, 20 }
        },
        [14] = {
            name = "diving_gear",
            price = 10,
            grades = { 0, 20 }
        },
        [15] = {
            name = "weapon_fireextinguisher",
            price = 17,
            grades = { 0, 20 }
        },
        [16] = {
            name = "weapon_pistol50",
            price = 17,
            grades = { 0, 20 }
        },
        [17] = {
            name = "dslrcamera",
            price = 17,
            grades = { 0, 20 }
        },
        [18] = {
            name = "drone_flyer_7",
            price = 65,
            grades = { 0, 20 }
        },
        [19] = {
            name = "Tracker",
            price = 200,
            grades = { 0, 20 }
        },
        [20] = {
            name = "bodycam",
            price = 15,
            grades = { 0, 20 }
        },

        [21] = {
            name = "dashcam",
            price = 15,
            grades = { 0, 20 }
        },
        [22] = {
            name = "badge",
            price = 1,
            grades = { 0, 20 }
        },
        [23] = {
            name = "evidencebox",
            price = 0,
            grades = { 0, 20 }
        },
        [24] = {
            name = "WEAPON_RADARGUN",
            price = 14,
            grades = { 0, 20 }
        },
        [25] = {
            name = "mdt",
            price = 10,
            grades = { 0, 20 }
        },
    },
}

Config.Target = {
    ["policeArmory"] = {
        coords = vector3(427.45, -974.36, 21.56),
        name = "policeArmory",
        heading = 1,
        info1 = 0.8,
        info2 = 5.4,
        minZ = 20.56,
        maxZ = 23.56,
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
