Config = {}

Config.Keys = {
 ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
 ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
 ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
 ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
 ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
 ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
 ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
 ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
 ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config.Blips = {
    -- // Police \\ --
    [1] = {['Name'] = 'Police Station', ['SpriteId'] = 60, ['Color'] = 38, ['Scale'] = 0.55, ['X'] = 441.0297,  ['Y'] = -988.7299, ['Z'] = 30.61336},
    [2] = {['Name'] = 'Police Sandy Shores', ['SpriteId'] = 60, ['Color'] = 38, ['Scale'] = 0.55, ['X'] = 1854.047,  ['Y'] = 3685.172,  ['Z'] = 34.26703},
    [3] = {['Name'] = 'Police Paleto Bay',   ['SpriteId'] = 60, ['Color'] = 38, ['Scale'] = 0.55, ['X'] = -446.2518, ['Y'] = 6013.378,  ['Z'] = 31.71639},
    -- // Ambulance \\ --
    [4] = {['Name'] = 'Hospital Phillbox Hill', ['SpriteId'] = 61, ['Color'] = 82, ['Scale'] = 0.55, ['X'] = 301.4674, ['Y'] = -585.3647, ['Z'] = 42.92797},
    -- // Taxi \\ --
    [5] = {['Name'] = 'Taxi', ['SpriteId'] = 198, ['Color'] = 5, ['Scale'] = 0.55, ['X'] = 903.2086, ['Y'] = -173.8609, ['Z'] = 74.07558},
    -- // Bank \\ --
    [6] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = 150.3254, ['Y'] = -1039.767, ['Z'] = 29.36798},
    [7] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = 314.4396, ['Y'] = -277.7154, ['Z'] = 54.16474},
    [8] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = -1213.453, ['Y'] = -329.8271, ['Z'] = 37.78094},
    [9] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = -2963.802, ['Y'] = 483.0118, ['Z'] = 15.69698},
    [10] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = -109.326, ['Y'] = 6464.429, ['Z'] = 31.62672},
    [11] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = -350.5362, ['Y'] = -48.27618, ['Z'] = 49.04624},
    -- // Garage Blips \\ --
    [12] = {['Name'] = 'Benny\'s Garage', ['SpriteId'] = 72, ['Color'] = 0, ['Scale'] = 0.5, ['X'] = -210.857, ['Y'] = -1322.504, ['Z'] = 30.8904},
    [13] = {['Name'] = 'Auto Garage', ['SpriteId'] = 544, ['Color'] = 0, ['Scale'] = 0.75, ['X'] = 110.7452, ['Y'] = 6626.432, ['Z'] = 31.78723},
    [14] = {['Name'] = 'Auto Garage', ['SpriteId'] = 544, ['Color'] = 0, ['Scale'] = 0.75, ['X'] = 1175.112, ['Y'] = 2640.771, ['Z'] = 37.75383},
    [15] = {['Name'] = 'Auto Garage', ['SpriteId'] = 544, ['Color'] = 0, ['Scale'] = 0.75, ['X'] = 731.4356, ['Y'] = -1089.1, ['Z'] = 22.16904},
    [16] = {['Name'] = 'Auto Garage', ['SpriteId'] = 544, ['Color'] = 0, ['Scale'] = 0.75, ['X'] = -340.9484, ['Y'] = -137.457, ['Z'] = 39.00962},
    -- // Shops \\ --
    [17] = {['Name'] = 'LTD Gasoline', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -48.44, ['Y'] = -1757.86, ['Z'] = 29.42},
    [18] = {['Name'] = 'LTD Gasoline', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -707.41, ['Y'] = -912.83, ['Z'] = 19.21},
    [19] = {['Name'] = 'LTD Gasoline', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -1820.33, ['Y'] = 792.66, ['Z'] = 138.1},
    [20] = {['Name'] = 'LTD Gasoline', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 1163.7, ['Y'] = -323.92, ['Z'] = 69.2},
    [21] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 25.7, ['Y'] = -1347.3, ['Z'] = 29.49},
    [22] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -3038.71, ['Y'] = 585.9, ['Z'] = 7.9},
    [23] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -3241.47, ['Y'] = 1001.14, ['Z'] = 12.83},
    [24] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 1728.66, ['Y'] = 6414.16, ['Z'] = 35.03},
    [25] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 1697.99, ['Y'] = 4924.4, ['Z'] = 42.06},
    [26] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 1961.48, ['Y'] = 3739.96, ['Z'] = 32.34},
    [27] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 547.79, ['Y'] = 2671.79, ['Z'] = 42.15},
    [28] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 2679.25, ['Y'] = 3280.12, ['Z'] = 55.24},
    [29] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 2557.94, ['Y'] = 382.05, ['Z'] = 108.62},
    [30] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 162.06, ['Y'] = 6641.05, ['Z'] = 31.69},
    [31] = {['Name'] = '24/7 Shop', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 374.08, ['Y'] = 326.64, ['Z'] = 103.56},
    [32] = {['Name'] = 'Rob\'s Liqour', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -1222.77, ['Y'] = -907.19, ['Z'] = 12.32},
    [33] = {['Name'] = 'Rob\'s Liqour', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -1487.7, ['Y'] = -378.53, ['Z'] = 40.16},
    [34] = {['Name'] = 'Rob\'s Liqour', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -2967.79, ['Y'] = 391.64, ['Z'] = 15.04},
    [35] = {['Name'] = 'Rob\'s Liqour', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 1165.28, ['Y'] = 2709.4, ['Z'] = 338.15},
    [36] = {['Name'] = 'Rob\'s Liqour', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 1135.79, ['Y'] = -981.91, ['Z'] = 46.41},
    [37] = {['Name'] = 'Rob\'s Liqour', ['SpriteId'] = 52, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -160.02, ['Y'] = 6322.44, ['Z'] = 31.58},
    [38] = {['Name'] = 'Locksmith', ['SpriteId'] = 134, ['Color'] = 0, ['Scale'] = 0.68, ['X'] = 170.14, ['Y'] = -1799.22, ['Z'] = 29.31},
    [39] = {['Name'] = 'Hardware Store', ['SpriteId'] = 566, ['Color'] = 0, ['Scale'] = 0.48, ['X'] = 44.74, ['Y'] = -1748.21, ['Z'] = 29.52},
    [40] = {['Name'] = 'Hardware Store', ['SpriteId'] = 566, ['Color'] = 0, ['Scale'] = 0.48, ['X'] = 2748.84, ['Y'] = 3472.50, ['Z'] = 55.67},
    -- // Car Wash \\ --
    [41] = {['Name'] = 'Car wash', ['SpriteId'] = 100, ['Color'] = 0, ['Scale'] = 0.53, ['X'] = 47.71, ['Y'] = -1391.89, ['Z'] = 29.56},
    -- // Garages \\ --
    [42] = {['Name'] = 'Garage', ['SpriteId'] = 357, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 215.412, ['Y'] = -805.607, ['Z'] = 30.804},
    [43] = {['Name'] = 'Garage', ['SpriteId'] = 357, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 278.581, ['Y'] = -345.742, ['Z'] = 44.919},
    [44] = {['Name'] = 'Garage', ['SpriteId'] = 357, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -330.159, ['Y'] = -780.161, ['Z'] = 33.964},
    [45] = {['Name'] = 'Garage', ['SpriteId'] = 357, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = -1159.089, ['Y'] = -740.023, ['Z'] = 19.889},
    [46] = {['Name'] = 'Garage', ['SpriteId'] = 357, ['Color'] = 3, ['Scale'] = 0.48, ['X'] = 82.576, ['Y'] = 6421.771, ['Z'] = 31.681},
    -- // Miscs \\ --
    [47] = {['Name'] = 'Vanilla Unicorn', ['SpriteId'] = 121, ['Color'] = 27, ['Scale'] = 0.43, ['X'] = 127.82, ['Y'] = -1296.91, ['Z'] = 29.56},
    [48] = {['Name'] = 'Vangelico Jewellery', ['SpriteId'] = 617, ['Color'] = 26, ['Scale'] = 0.43, ['X'] = -630.5, ['Y'] = -237.13, ['Z'] = 38.08},
    [49] = {['Name'] = 'QBCore Depot', ['SpriteId'] = 67, ['Color'] = 44, ['Scale'] = 0.43, ['X'] = 491.03, ['Y'] = -1313.82, ['Z'] = 29.25},
    [50] = {['Name'] = 'Prison', ['SpriteId'] = 253, ['Color'] = 0, ['Scale'] = 0.43, ['X'] = 1680.23, ['Y'] = 2559.30, ['Z'] = 45.56},
    [51] = {['Name'] = 'Premium Deluxe Motorsport', ['SpriteId'] = 225, ['Color'] = 3, ['Scale'] = 0.43, ['X'] = -44.61, ['Y'] = -1097.74, ['Z'] = 26.42},
    [52] = {['Name'] = 'Cityhall', ['SpriteId'] = 590, ['Color'] = 0, ['Scale'] = 0.43, ['X'] = -548.03, ['Y'] = -198.78, ['Z'] = 38.41},
    [53] = {['Name'] = 'Smoke On The Water', ['SpriteId'] = 140, ['Color'] = 11, ['Scale'] = 0.43, ['X'] = -1171.89, ['Y'] = -1572.03, ['Z'] = 4.66},
    [54] = {['Name'] = 'Sea World', ['SpriteId'] = 59, ['Color'] = 3, ['Scale'] = 0.43, ['X'] = -1686.52, ['Y'] = -1072.51, ['Z'] = 13.15},
    [55] = {['Name'] = 'Scrapyard', ['SpriteId'] = 643, ['Color'] = 1, ['Scale'] = 0.53, ['X'] = 2349.58, ['Y'] = 3133.89, ['Z'] = 48.20},
    [56] = {['Name'] = 'Boat Rental', ['SpriteId'] = 356, ['Color'] = 3, ['Scale'] = 0.43, ['X'] = 1551.37, ['Y'] = 3799.74, ['Z'] = 34.41},
    [57] = {['Name'] = 'PDM Quick Sell', ['SpriteId'] = 434, ['Color'] = 3, ['Scale'] = 0.43, ['X'] = -45.04, ['Y'] = -1081.94, ['Z'] = 26.68},
    [58] = {['Name'] = 'Lottery', ['SpriteId'] = 500, ['Color'] = 2, ['Scale'] = 0.43, ['X'] = -1679.74, ['Y'] = -1111.39, ['Z'] = 13.15},
    [59] = {['Name'] = 'Recycleer Centre', ['SpriteId'] = 467, ['Color'] = 69, ['Scale'] = 0.43, ['X'] = 55.98, ['Y'] = 6471.58, ['Z'] = 31.42},
    [60] = {['Name'] = 'Cardealer', ['SpriteId'] = 523, ['Color'] = 3, ['Scale'] = 0.43, ['X'] = 118.89, ['Y'] = -147.62, ['Z'] = 54.86},
    [61] = {['Name'] = 'Burgershot', ['SpriteId'] = 106, ['Color'] = 1, ['Scale'] = 0.43, ['X'] = -1190.44, ['Y'] = -889.13, ['Z'] = 13.99},
    [62] = {['Name'] = 'Bank', ['SpriteId'] = 276, ['Color'] = 11, ['Scale'] = 0.6, ['X'] = 236.37, ['Y'] = 217.25, ['Z'] = 106.28},
}

Config.DiscordSettings = {
    ['AppId'] = 738421731617931376,
    ['Text'] = 'QBCORE IS THE BEST',
}

Config.PropList = {
    -- Casual Props
    ['Drill'] = {
        ['name'] = 'Drill Boor',
        ['prop'] = 'hei_prop_heist_drill',
        ['hash'] = GetHashKey('hei_prop_heist_drill'),
        ['bone-index'] = {
            ['bone'] = 57005,
            ['X'] = 0.14,
            ['Y'] = 0.0,
            ['Z'] = -0.01,
            ['XR'] = 90.0,
            ['YR'] = -90.0,
            ['ZR'] = 180.0,
        },
    },
    ['Duffel'] = {
        ['name'] = 'DuffelBag',
        ['prop'] = 'xm_prop_x17_bag_01a',
        ['hash'] = GetHashKey('xm_prop_x17_bag_01a'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.27,
            ['Y'] = 0.15,
            ['Z'] = 0.05,
            ['XR'] = 35.0,
            ['YR'] = -125.0,
            ['ZR'] = 50.0,
        },
    },
    ['Cup'] = {
        ['name'] = 'Paper Cup',
        ['prop'] = 'prop_cs_paper_cup',
        ['hash'] = GetHashKey('prop_cs_paper_cup'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.0,
            ['Y'] = 0.0,
            ['Z'] = 0.0,
            ['XR'] = 0.0,
            ['YR'] = 0.0,
            ['ZR'] = 0.0,
        },
    },
    ['FishingRod'] = {
        ['name'] = 'Fishing rod',
        ['prop'] = 'prop_fishing_rod_01',
        ['hash'] = GetHashKey('prop_fishing_rod_01'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.08,
            ['Y'] = 0.0,
            ['Z'] = 0.0,
            ['XR'] = -100.0,
            ['YR'] = 0.0,
            ['ZR'] = -20.0,
        },
    },
    ['Boombox'] = {
        ['name'] = 'Boombox',
        ['prop'] = 'prop_boombox_01',
        ['hash'] = GetHashKey('prop_boombox_01'),
        ['bone-index'] = {
            ['bone'] = 1,
            ['X'] = 1,
            ['Y'] = 1,
            ['Z'] = 1,
            ['XR'] = 1,
            ['YR'] = 1,
            ['ZR'] = 1,
        },
    },
    ['Pills'] = {
        ['name'] = 'Pills',
        ['prop'] = 'prop_cs_pills',
        ['hash'] = GetHashKey('prop_cs_pills'),
        ['bone-index'] = {
            ['bone'] = 1,
            ['X'] = 1,
            ['Y'] = 1,
            ['Z'] = 1,
            ['XR'] = 1,
            ['YR'] = 1,
            ['ZR'] = 1,
        },
    },
    ['ShoppingBag'] = {
        ['name'] = 'Shop Bag',
        ['prop'] = 'prop_shopping_bags01', 
        ['hash'] = GetHashKey('prop_shopping_bags01'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.05,
            ['Y'] = 0.0,
            ['Z'] = 0.0,
            ['XR'] = 35.0,
            ['YR'] = -125.0,
            ['ZR'] = 0.0,
        },
    },
    ['CrackPipe'] = {
        ['name'] = 'Crack Pipe',
        ['prop'] = 'prop_cs_crackpipe',
        ['hash'] = GetHashKey('prop_cs_crackpipe'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.0,
            ['Y'] = 0.05,
            ['Z'] = 0.0,
            ['XR'] = 135.0,
            ['YR'] = -100.0,
            ['ZR'] = 0.0,
        },
    },
    ['Bong'] = {
        ['name'] = 'Bong',
        ['prop'] = 'prop_bong_01',
        ['hash'] = GetHashKey('prop_bong_01'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.11,
            ['Y'] = -0.23,
            ['Z'] = 0.01,
            ['XR'] = -90.0,
            ['YR'] = 0.0,
            ['ZR'] = 0.0,
        },
    },
    ['HealthPack'] = {
        ['name'] = 'HealthPack',
        ['prop'] = 'prop_ld_health_pack',
        ['hash'] = GetHashKey('prop_ld_health_pack'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.15,
            ['Y'] = 0.08,
            ['Z'] = 0.1,
            ['XR'] = 180.0,
            ['YR'] = 220.0,
            ['ZR'] = 0.0,
        },
    },
    ['ReporterCam'] = {
        ['name'] = 'Weazel News Camera',
        ['prop'] = 'prop_v_cam_01',
        ['hash'] = GetHashKey('prop_v_cam_01'),
        ['bone-index'] = {
            ['bone'] = 57005,
            ['X'] = 0.13,
            ['Y'] = 0.25,
            ['Z'] = -0.03,
            ['XR'] = -85.0,
            ['YR'] = 0.0,
            ['ZR'] = -80.0,
        },
    },
    ['ReporterMic'] = {
        ['name'] = 'Weazel News Mic',
        ['prop'] = 'p_ing_microphonel_01',
        ['hash'] = GetHashKey('p_ing_microphonel_01'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.1,
            ['Y'] = 0.05,
            ['Z'] = 0.0,
            ['XR'] = -85.0,
            ['YR'] = -80.0,
            ['ZR'] = -80.0,
        },
    },
    ['BriefCase'] = {
        ['name'] = 'BriefCase',
        ['prop'] = 'prop_ld_case_01',
        ['hash'] = GetHashKey('prop_ld_case_01'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.09,
            ['Y'] = -0.012,
            ['Z'] = 0.01,
            ['XR'] = 320.0,
            ['YR'] = -100.0,
            ['ZR'] = 0.0,
        },
    },
    ['GunCase'] = {
        ['name'] = 'A weapon case',
        ['prop'] = 'prop_box_guncase_01a',
        ['hash'] = GetHashKey('prop_box_guncase_01a'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.18,
            ['Y'] = 0.05,
            ['Z'] = 0.0,
            ['XR'] = 215.0,
            ['YR'] = -175.0,
            ['ZR'] = 100.0,
        },
    },
    ['Tablet'] = {
        ['name'] = 'Tablet',
        ['prop'] = 'prop_cs_tablet',
        ['hash'] = GetHashKey('prop_cs_tablet'),
        ['bone-index'] = {
            ['bone'] = 60309,
            ['X'] = 0.03,
            ['Y'] = 0.002,
            ['Z'] = -0.0,
            ['XR'] = 0.0,
            ['YR'] = 160.0,
            ['ZR'] = 0.0,
        },
    }, 
    ['StolenTv'] = {
        ['name'] = 'StolenTv',
        ['prop'] = 'prop_tv_flat_02',
        ['hash'] = GetHashKey('prop_tv_flat_02'),
        ['bone-index'] = {
            ['bone'] = 57005,
            ['X'] = 0.15,
            ['Y'] = 0.10,
            ['Z'] = -0.20,
            ['XR'] = -50.00,
            ['YR'] = 250.00,
            ['ZR'] = 10.00,
        },
    },
    ['StolenPc'] = {
        ['name'] = 'StolenPc',
        ['prop'] = 'prop_dyn_pc_02',
        ['hash'] = GetHashKey('prop_dyn_pc_02'),
        ['bone-index'] = {
            ['bone'] = 57005,
            ['X'] = 0.15,
            ['Y'] = 0.10,
            ['Z'] = -0.22,
            ['XR'] = -80.00,
            ['YR'] = -15.00,
            ['ZR'] = -60.00,
        },
    },
    ['StolenMicro'] = {
        ['name'] = 'StolenMicro',
        ['prop'] = 'prop_microwave_1',
        ['hash'] = GetHashKey('prop_microwave_1'),
        ['bone-index'] = {
            ['bone'] = 57005,
            ['X'] = 0.30,
            ['Y'] = 0.15,
            ['Z'] = -0.20,
            ['XR'] = -50.00,
            ['YR'] = 250.00,
            ['ZR'] = 10.00,
        },
    },
    -- Food Props
    ['hamburger'] = {
        ['name'] = 'Hamburger',
        ['prop'] = 'prop_cs_burger_01',
        ['hash'] = GetHashKey('prop_cs_burger_01'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.13,
            ['Y'] = 0.07,
            ['Z'] = 0.02,
            ['XR'] = 120.0,
            ['YR'] = 16.0,
            ['ZR'] = 60.0,
        },
    },
    ['sandwich'] = {
        ['name'] = 'Sandwich',
        ['prop'] = 'prop_sandwich_01',
        ['hash'] = GetHashKey('prop_sandwich_01'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.13,
            ['Y'] = 0.05,
            ['Z'] = 0.02,
            ['XR'] = -50.0,
            ['YR'] = 16.0,
            ['ZR'] = 60.0,
        },
    },
    ['chocolade'] = {
        ['name'] = 'Chocolade',
        ['prop'] = 'prop_choc_meto',
        ['hash'] = GetHashKey('prop_choc_meto'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.13,
            ['Y'] = 0.05,
            ['Z'] = 0.02,
            ['XR'] = -50.0,
            ['YR'] = 16.0,
            ['ZR'] = 60.0,
        },
    },
    ['donut'] = {
        ['name'] = 'Donut',
        ['prop'] = 'prop_amb_donut',
        ['hash'] = GetHashKey('prop_amb_donut'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.13,
            ['Y'] = 0.05,
            ['Z'] = 0.02,
            ['XR'] = -50.0,
            ['YR'] = 16.0,
            ['ZR'] = 60.0,
        },
    },
    ['taco'] = {
        ['name'] = 'taco',
        ['prop'] = 'prop_taco_01',
        ['hash'] = GetHashKey('prop_taco_01'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.13,
            ['Y'] = 0.07,
            ['Z'] = 0.02,
            ['XR'] = 160.0,
            ['YR'] = 0.0,
            ['ZR'] = -50.0,
        },
    },
    ['burger-fries'] = {
        ['name'] = 'burger fries',
        ['prop'] = 'prop_food_bs_chips',
        ['hash'] = GetHashKey('prop_food_bs_chips'),
        ['bone-index'] = {
            ['bone'] = 18905,
            ['X'] = 0.12,
            ['Y'] = 0.04,
            ['Z'] = 0.05,
            ['XR'] = 130.0,
            ['YR'] = 8.0,
            ['ZR'] = 200.0,
        },
    },
    -- Drink Props
    ['water'] = {
        ['name'] = ' Water',
        ['prop'] = 'prop_ld_flow_bottle',
        ['hash'] = GetHashKey('prop_ld_flow_bottle'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.0,
            ['Y'] = 0.0,
            ['Z'] = 0.0,
            ['XR'] = 0.0,
            ['YR'] = 0.0,
            ['ZR'] = 0.0,
        },
    },
    ['coffee'] = {
        ['name'] = 'coffee',
        ['prop'] = 'p_amb_coffeecup_01',
        ['hash'] = GetHashKey('p_amb_coffeecup_01'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.0,
            ['Y'] = 0.0,
            ['Z'] = 0.0,
            ['XR'] = 0.0,
            ['YR'] = 0.0,
            ['ZR'] = 0.0,
        },
    },
    ['cola'] = {
        ['name'] = 'cola',
        ['prop'] = 'prop_ecola_can',
        ['hash'] = GetHashKey('prop_ecola_can'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.0,
            ['Y'] = 0.0,
            ['Z'] = 0.0,
            ['XR'] = 0.0,
            ['YR'] = 0.0,
            ['ZR'] = 0.0,
        },
    },
    ['burger-soft'] = {
        ['name'] = 'Soft Drink',
        ['prop'] = 'ng_proc_sodacup_01a',
        ['hash'] = GetHashKey('ng_proc_sodacup_01a'),
        ['bone-index'] = {
            ['bone'] = 28422,
            ['X'] = 0.0,
            ['Y'] = 0.0,
            ['Z'] = -0.07,
            ['XR'] = 0.0,
            ['YR'] = 0.0,
            ['ZR'] = 0.0,
        },
    },
}

Config.RemoveObjects = {
    [1] = {['X'] = 145.4186, ['Y'] = -1041.813, ['Z'] = 29.64255, ['Model'] = 'v_ilev_gb_teldr'},
    [2] = {['X'] = 309.7491, ['Y'] = -280.1797, ['Z'] = 54.43926, ['Model'] = 'v_ilev_gb_teldr'},
    [3] = {['X'] = -355.3892, ['Y'] = -51.06768, ['Z'] = 49.31105, ['Model'] = 'v_ilev_gb_teldr'},
    [4] = {['X'] = -1214.906, ['Y'] = -334.7281, ['Z'] = 38.05551, ['Model'] = 'v_ilev_gb_teldr'},
    [5] = {['X'] = -2960.176, ['Y'] = 479.0105, ['Z'] = 15.97156, ['Model'] = 'v_ilev_gb_teldr'},
    [6] = {['X'] = -108.9147, ['Y'] = 6469.104, ['Z'] = 31.91028, ['Model'] = 'v_ilev_cbankcountdoor01'},
    [7] = {['X'] = 206.5274, ['Y'] = -803.4797, ['Z'] = 30.95355, ['Model'] = 'prop_sec_barrier_ld_01a'},
    [8] = {['X'] = 230.9218, ['Y'] = -816.153, ['Z'] = 30.16897, ['Model'] = 'prop_sec_barrier_ld_01a'},
    [9] = {['X'] = 261.89, ['Y'] = 223.14, ['Z'] = 106.28, ['Model'] = 'hei_prop_hei_securitypanel'},
    [10] = {['X'] = 1101.84, ['Y'] = -3198.12, ['Z'] = -38.99, ['Model'] = 'bkr_prop_coke_boxeddoll'},
    [11] = {['X'] = -1195.76, ['Y'] = -898.06, ['Z'] = 13.99, ['Model'] = 'bs_cj_int_door_24'},
    [12] = {['X'] = -1194.39, ['Y'] = -894.78, ['Z'] = 13.99, ['Model'] = 'prop_food_bs_tray_02'},
}

Config.BlacklistedScenarios = {
 ['TYPES'] = {
     "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
     "WORLD_VEHICLE_MILITARY_PLANES_BIG",
 },
 ['GROUPS'] = {
     2017590552,
     2141866469,
     1409640232,
     `ng_planes`,
 }
}

Config.BlacklistedVehs = {
 [`SHAMAL`] = true,
 [`LUXOR`] = true,
 [`LUXOR2`] = true,
 [`JET`] = true,
 [`LAZER`] = true,
 [`BUZZARD`] = true,
 [`BUZZARD2`] = true,
 [`ANNIHILATOR`] = true,
 [`SAVAGE`] = true,
 [`TITAN`] = true,
 [`RHINO`] = true,
 [`POLICE`] = true,
 [`POLICE2`] = true,
 [`POLICE3`] = true,
 [`POLICE4`] = true,
 [`POLICEB`] = true,
 [`POLICET`] = true,
 [`SHERIFF`] = true,
 [`SHERIFF2`] = true,
 [`FIRETRUK`] = true,
 [`AMBULANCE`] = true,
 [`MULE`] = true,
 [`POLMAV`] = true,
 [`MAVERICK`] = true,
 [`BLIMP`] = true,
 [`CARGOBOB`] = true,   
 [`CARGOBOB2`] = true,   
 [`CARGOBOB3`] = true,   
 [`CARGOBOB4`] = true,   
}

Config.BlacklistedPeds = {
 [`s_m_y_ranger_01`] = true,
 [`s_m_y_sheriff_01`] = true,
 [`s_m_y_cop_01`] = true,
 [`s_f_y_sheriff_01`] = true,
 [`s_f_y_cop_01`] = true,
 [`s_m_y_hwaycop_01`] = true,
}