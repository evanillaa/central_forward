Config = Config or {}

Config.Inverval = 1000

Config.PoliceNeeded = 0

Config.ResetTime = ((1000 * 60) * 10)

Config.SpecialItems = {
   'blue-card', 
   'red-card', 
   'green-card', 
   'purple-card', 
}

Config.Registers = {
  [1] =  {['X'] = -47.24,   ['Y'] = -1757.65, ['Z'] = 29.53,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 1},
  [2] =  {['X'] = -48.58,   ['Y'] = -1759.21, ['Z'] = 29.59,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 1},
  [3] =  {['X'] = -1486.26, ['Y'] = -378.00,  ['Z'] = 40.16,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 2},
  [4] =  {['X'] = -1222.03, ['Y'] = -908.32,  ['Z'] = 12.32,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 3},
  [5] =  {['X'] = -706.08,  ['Y'] = -915.42,  ['Z'] = 19.21,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 4},
  [6] =  {['X'] = -706.16,  ['Y'] = -913.50,  ['Z'] = 19.21,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 4},
  [7] =  {['X'] = 24.47,    ['Y'] = -1344.99, ['Z'] = 29.49,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 5},
  [8] =  {['X'] = 24.45,    ['Y'] = -1347.37, ['Z'] = 29.59,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 5},
  [9] =  {['X'] = 1134.15,  ['Y'] = -982.53,  ['Z'] = 46.41,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 6},
  [10] = {['X'] = 1165.05,  ['Y'] = -324.49,  ['Z'] = 69.2,    ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 7},
  [11] = {['X'] = 1164.7,   ['Y'] = -322.58,  ['Z'] = 69.2,    ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 7},
  [12] = {['X'] = 373.14,   ['Y'] = 328.62,   ['Z'] = 103.56,  ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 8},
  [13] = {['X'] = 372.57,   ['Y'] = 326.42,   ['Z'] = 103.56,  ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 8},
  [14] = {['X'] = -1818.9,  ['Y'] = 792.9,    ['Z'] = 138.08,  ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 9},
  [15] = {['X'] = -1820.17, ['Y'] = 794.28,   ['Z'] = 138.08,  ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 9},
  [16] = {['X'] = -2966.46, ['Y'] = 390.89,   ['Z'] = 15.04,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 10},
  [17] = {['X'] = -3041.14, ['Y'] = 583.87,   ['Z'] = 7.9,     ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 11},
  [18] = {['X'] = -3038.92, ['Y'] = 584.5,    ['Z'] = 7.9,     ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 11},
  [19] = {['X'] = -3244.56, ['Y'] = 1000.14,  ['Z'] = 12.83,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 12},
  [20] = {['X'] = -3242.24, ['Y'] = 999.98,   ['Z'] = 12.83,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 12},
  [21] = {['X'] = 549.42,   ['Y'] = 2669.06,  ['Z'] = 42.15,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 13},
  [22] = {['X'] = 549.05,   ['Y'] = 2671.39,  ['Z'] = 42.15,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 13},
  [23] = {['X'] = 1165.9,   ['Y'] = 2710.81,  ['Z'] = 38.15,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 14},
  [24] = {['X'] = 2676.02,  ['Y'] = 3280.52,  ['Z'] = 55.24,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 15},
  [25] = {['X'] = 2678.07,  ['Y'] = 3279.39,  ['Z'] = 55.24,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 15},
  [26] = {['X'] = 1958.96,  ['Y'] = 3741.98,  ['Z'] = 32.34,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 16},
  [27] = {['X'] = 1960.13,  ['Y'] = 3740.0,   ['Z'] = 32.34,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 16},
  [28] = {['X'] = 1728.86,  ['Y'] = 6417.26,  ['Z'] = 35.03,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 17},
  [29] = {['X'] = 1727.85,  ['Y'] = 6415.14,  ['Z'] = 35.03,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 17},
  [30] = {['X'] = -161.07,  ['Y'] = 6321.23,  ['Z'] = 31.5,    ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 18},
  [31] = {['X'] = 160.52,   ['Y'] = 6641.74,  ['Z'] = 31.6,    ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 19},
  [32] = {['X'] = 162.16,   ['Y'] = 6643.22,  ['Z'] = 31.6,    ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 19},
  [33] = {['X'] = 1696.63,  ['Y'] = 4923.93,  ['Z'] = 42.06,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 20},
  [34] = {['X'] = 1698.10,  ['Y'] = 4922.83,  ['Z'] = 42.06,   ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 20},
  [35] = {['X'] = 2557.13,  ['Y'] = 380.84,   ['Z'] = 108.62,  ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 21},
  [36] = {['X'] = 2554.84,  ['Y'] = 380.88,   ['Z'] = 108.62,  ['Robbed'] = false, ['Busy'] = false, ['Time'] = 0, ['SafeKey'] = 21},
}

Config.Safes = {
  [1] =  {['X'] = -43.43,    ['Y'] = -1748.3,  ['Z'] = 29.42,  ['Robbed'] = false, ['Busy'] = false},
  [2] =  {['X'] = -1478.94,  ['Y'] = -375.5,   ['Z'] = 39.16,  ['Robbed'] = false, ['Busy'] = false},
  [3] =  {['X'] = -1220.85,  ['Y'] = -916.05,  ['Z'] = 11.32,  ['Robbed'] = false, ['Busy'] = false},
  [4] =  {['X'] = -709.74,   ['Y'] = -904.15,  ['Z'] = 19.21,  ['Robbed'] = false, ['Busy'] = false},
  [5] =  {['X'] = 28.21,     ['Y'] = -1339.14, ['Z'] = 29.49,  ['Robbed'] = false, ['Busy'] = false},
  [6] =  {['X'] = 1126.77,   ['Y'] = -980.1,   ['Z'] = 45.41,  ['Robbed'] = false, ['Busy'] = false},
  [7] =  {['X'] = 1159.46,   ['Y'] = -314.05,  ['Z'] = 69.2,   ['Robbed'] = false, ['Busy'] = false},
  [8] =  {['X'] = 378.17,    ['Y'] = 333.44,   ['Z'] = 103.56, ['Robbed'] = false, ['Busy'] = false},
  [9] =  {['X'] = -1829.27,  ['Y'] = 798.76,   ['Z'] = 138.19, ['Robbed'] = false, ['Busy'] = false},
  [10] = {['X'] = -2959.64,  ['Y'] = 387.08,   ['Z'] = 14.04,  ['Robbed'] = false, ['Busy'] = false},
  [11] = {['X'] = -3047.88,  ['Y'] = 585.61,   ['Z'] = 7.9,    ['Robbed'] = false, ['Busy'] = false},
  [12] = {['X'] = -3250.02,  ['Y'] = 1004.43,  ['Z'] = 12.83,  ['Robbed'] = false, ['Busy'] = false},
  [13] = {['X'] = 546.41,    ['Y'] = 2662.8,   ['Z'] = 42.15,  ['Robbed'] = false, ['Busy'] = false},
  [14] = {['X'] = 1169.31,   ['Y'] = 2717.79,  ['Z'] = 37.15,  ['Robbed'] = false, ['Busy'] = false},
  [15] = {['X'] = 2672.69,   ['Y'] = 3286.63,  ['Z'] = 55.24,  ['Robbed'] = false, ['Busy'] = false},
  [16] = {['X'] = 1959.26,   ['Y'] = 3748.92,  ['Z'] = 32.34,  ['Robbed'] = false, ['Busy'] = false},
  [17] = {['X'] = 1734.78,   ['Y'] = 6420.84,  ['Z'] = 35.03,  ['Robbed'] = false, ['Busy'] = false},
  [18] = {['X'] = -168.40,   ['Y'] = 6318.80,  ['Z'] = 30.58,  ['Robbed'] = false, ['Busy'] = false},
  [19] = {['X'] = 168.95,    ['Y'] = 6644.74,  ['Z'] = 31.70,  ['Robbed'] = false, ['Busy'] = false},
  [20] = {['X'] = 1707.88,   ['Y'] = 4920.41,  ['Z'] = 42.06,  ['Robbed'] = false, ['Busy'] = false},
  [21] = {['X'] = 2549.19,   ['Y'] = 384.90,   ['Z'] = 108.62, ['Robbed'] = false, ['Busy'] = false},
}

Config.MaleNoHandshoes = {
  [0] = true,
  [1] = true,
  [2] = true,
  [3] = true,
  [4] = true,
  [5] = true,
  [6] = true,
  [7] = true,
  [8] = true,
  [9] = true,
  [10] = true,
  [11] = true,
  [12] = true,
  [13] = true,
  [14] = true,
  [15] = true,
  [18] = true,
  [26] = true,
  [52] = true,
  [53] = true,
  [54] = true,
  [55] = true,
  [56] = true,
  [57] = true,
  [58] = true,
  [59] = true,
  [60] = true,
  [61] = true,
  [62] = true,
  [112] = true,
  [113] = true,
  [114] = true,
  [118] = true,
  [125] = true,
  [132] = true,
}

Config.FemaleNoHandshoes = {
  [0] = true,
  [1] = true,
  [2] = true,
  [3] = true,
  [4] = true,
  [5] = true,
  [6] = true,
  [7] = true,
  [8] = true,
  [9] = true,
  [10] = true,
  [11] = true,
  [12] = true,
  [13] = true,
  [14] = true,
  [15] = true,
  [19] = true,
  [59] = true,
  [60] = true,
  [61] = true,
  [62] = true,
  [63] = true,
  [64] = true,
  [65] = true,
  [66] = true,
  [67] = true,
  [68] = true,
  [69] = true,
  [70] = true,
  [71] = true,
  [129] = true,
  [130] = true,
  [131] = true,
  [135] = true,
  [142] = true,
  [149] = true,
  [153] = true,
  [157] = true,
  [161] = true,
  [165] = true,
}