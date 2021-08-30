Config = Config or {}

Config.IsSelling = false

Config.TrapHouse = {
    ['Code'] = 1111,
    ['Owner'] = '',
    ['Coords'] = {
        ['Enter'] = {
            ['X'] = 'Just go for a nice search..',
            ['Y'] = 'Just go for a nice search..',
            ['Z'] = 'Just go for a nice search..',
            ['H'] = 'Just go for a nice search..',
            ['Z-OffSet'] = 35,
        },
        ['Interact'] = {
            ['X'] = 'Just go for a nice search..',
            ['Y'] = 'Just go for a nice search..',
            ['Z'] = 'Just go for a nice search..',
        },
    },
}

Config.SellItems = {
 ['diamond-blue'] = {
   ['Type'] = 'money',
   ['Amount'] = math.random(4500, 7000),
 },
 ['diamond-red'] = {
   ['Type'] = 'money',
   ['Amount'] = math.random(4500, 7500),
 },
 ['markedbills'] = {
   ['Type'] = 'info',
   ['Amount'] = 0,
 },
}