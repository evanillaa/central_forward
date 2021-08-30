Config = Config or {}

Config.UiOpend = false

Config.ButtonData = {}

Config.EmergencyData = {}

Config.SirenData = {
    [GetHashKey('PoliceMotor')] = {
      ['Name'] = 'Police Motor',
      ['SoundId'] = nil,
      ['SirenSound'] = "RESIDENT_VEHICLES_SIREN_WAIL_03",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
        ['Blauw'] = {1},
        ['Oranje'] = {2}, 
        ['Groen'] = {},
        ['Stop'] = {3},
        ['Volg'] = {4},
      },
    },
    [GetHashKey('PoliceTouran')] = {
      ['Name'] = 'Police Touran',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
        ['Blauw'] = {1,7},
        ['Oranje'] = {2,8},
        ['Groen'] = {5},
        ['Stop'] = {3},
        ['Volg'] = {4},
      },
    },
    [GetHashKey('PoliceRS6')] = {
      ['Name'] = 'Police Audi',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
          ['Blauw'] = {1},
          ['Oranje'] = {2},
          ['Groen'] = {},
          ['Stop'] = {3},
          ['Volg'] = {4},
        },
    },
    [GetHashKey('PoliceVito')] = {
      ['Name'] = 'Police Vito',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
          ['Blauw'] = {1},
          ['Oranje'] = {2},
          ['Groen'] = {},
          ['Stop'] = {3},
          ['Volg'] = {4},
        },
    },
    [GetHashKey('PoliceKlasse')] = {
      ['Name'] = 'Police Klasse',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
        ['Blauw'] = {1,4},
        ['Oranje'] = {2,8},
          ['Groen'] = {5},
          ['Stop'] = {3},
          ['Volg'] = {4},
        },
    },
    [GetHashKey('PoliceAudiUnmarked')] = {
      ['Name'] = 'Police Audi Unmarked',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = true,
      ['LightSettings'] = {
          ['Blauw'] = {1,2},
          ['Oranje'] = {},
          ['Groen'] = {},
          ['Stop'] = {3},
          ['Volg'] = {4},
          ['Pit'] = {6,10},
        },
    },
    [GetHashKey('PoliceBmw')] = {
      ['Name'] = 'Police BMW M5',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = true,
      ['LightSettings'] = {
          ['Blauw'] = {1,2},
          ['Oranje'] = {},
          ['Groen'] = {},
          ['Stop'] = {3},
          ['Volg'] = {4},
          ['Pit'] = {6,10},
        },
    },
    [GetHashKey('PoliceVelar')] = {
      ['Name'] = 'Police Velar',
      ['SoundId'] = nil,
      ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
      ['IsUnmarked'] = true,
      ['LightSettings'] = {
          ['Blauw'] = {1,2},
          ['Oranje'] = {},
          ['Groen'] = {},
          ['Stop'] = {3},
          ['Volg'] = {4},
          ['Pit'] = {6,10},
        },
    },
    -- [GetHashKey('PoliceRange')] = {
    --   ['Name'] = 'Police Range',
    --   ['SoundId'] = nil,
    --   ['SirenSound'] = "VEHICLES_HORNS_SIREN_1",
    --   ['IsUnmarked'] = false,
    --   ['LightSettings'] = {
    --     ['Blauw'] = {1,7},
    --     ['Oranje'] = {2,8},
    --     ['Groen'] = {5},
    --     ['Stop'] = {3},
    --     ['Volg'] = {4},
    --     },
    -- },
    [GetHashKey('AmbulanceSprinter')] = {
      ['Name'] = 'Ambulance Sprinter',
      ['SoundId'] = nil,
      ['SirenSound'] = "RESIDENT_VEHICLES_SIREN_WAIL_01",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
          ['Blauw'] = {1,2,3,4,5},
          ['Oranje'] = {6},
          ['Groen'] = {7},
          ['Stop'] = {},
          ['Volg'] = {},
          ['Pit'] = {},
        },
    },
    [GetHashKey('AmbulanceTouran')] = {
      ['Name'] = 'Ambulance Touran',
      ['SoundId'] = nil,
      ['SirenSound'] = "RESIDENT_VEHICLES_SIREN_WAIL_01",
      ['IsUnmarked'] = false,
      ['LightSettings'] = {
          ['Blauw'] = {1,6,7},
          ['Oranje'] = {2,5},
          ['Groen'] = {3},
          ['Stop'] = {},
          ['Volg'] = {},
          ['Pit'] = {},
        },
    },
}