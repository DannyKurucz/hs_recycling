cfg = {

    blip = {
        ['blipposition'] = vector3(56.0931, 6471.5054, 31.4253),
        ['blipname'] = "Brigade",
    },

    settings = {
        ['sprite'] = 68,
        ['color'] = 1
    },

    translations = {
        ["start"] = '<FONT FACE="Fire Sans">[E] Open Laptop',
        ['laptop'] = "Starting Laptop...",
        ["teleportto"] = '<FONT FACE="Fire Sans">[E] Go inside',
        ["teleportout"] = '<FONT FACE="Fire Sans">[E] Go outside',
        ["search"] = '<FONT FACE="Fire Sans">[E] You put it down and search the box',
        ["searching"] = 'Searching Box....',
        ["pickup"] = '<FONT FACE="Fire Sans">[E] Pick up the box',
        ["pickupingbox"] = 'Pickuping Box....',

    },

    zones = {
        ["start"] = vector3(1049.0580, -3100.4272, -39.0000),
        ["teleportto"] = vector3(56.0931, 6471.5054, 31.4253),
        ["teleportout"] = vector3(1072.9773, -3103.8337, -39.0000),
        ["search"] = vector3(1048.4323, -3096.8621, -38.9999),
    },

    object = { --props coords
        {objects = vector3(1053.0111, -3101.6865, -39.9999)},
        {objects = vector3(1055.4946, -3101.8230, -39.9999)},
        {objects = vector3(1057.8109, -3102.1604, -39.9999)},
        {objects = vector3(1060.2048, -3101.9944, -39.9999)},
        {objects = vector3(1062.6942, -3102.2607, -39.9999)},
        {objects = vector3(1065.1027, -3102.0969, -39.9999)},
        {objects = vector3(1067.6853, -3102.1511, -39.9999)},
        {objects = vector3(1053.2157, -3095.8064, -39.9999)},
        {objects = vector3(1055.5157, -3095.8064, -39.9999)},
        {objects = vector3(1057.9157, -3095.8064, -39.9999)},
        {objects = vector3(1060.3157, -3095.8064, -39.9999)},
        {objects = vector3(1062.7157, -3095.8064, -39.9999)},
        {objects = vector3(1065.1157, -3095.8064, -39.9999)},
        {objects = vector3(1067.5157, -3095.8064, -39.9999)},
        {objects = vector3(1053.2350, -3109.4656, -39.9999)},
        {objects = vector3(1055.4015, -3109.6719, -39.9999)},
        {objects = vector3(1057.7015, -3109.6719, -39.9999)},
        {objects = vector3(1060.2015, -3109.6719, -39.9999)},
        {objects = vector3(1062.7015, -3109.6719, -39.9999)},
        {objects = vector3(1065.2015, -3109.6719, -39.9999)},
        {objects = vector3(1067.7015, -3109.6719, -39.9999)},
    
    },

    chance = { --in %  1% - 100%
        ["firstitem"] = 10,
        ["secounditem"] = 10,
    },
    chanceitem = { --items for random
        ["item"] = "cryptousb",
        ["item2"] = "WEAPON_COMBATPISTOL",
    },
    chanceitemcount = { -- count of chance items
        ["item"] = 1,
        ["item2"] = 1,
    },

    item = { -- If you want more items or few items go to server.lua on line 31.
        ["item0"] = "copper",
        ["item1"] = "diamond",
        ["item2"] = "phone",
        ["item3"] = "dalekohled",
        ["item4"] = "contract",
        ["item5"] = "iron",

    },

}
