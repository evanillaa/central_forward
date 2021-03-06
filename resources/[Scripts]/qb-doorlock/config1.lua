Config = {}

Config.Doors = {
--[[
	[1] = {
	  ['DoorName'] = 'Police Voordeur',
	  ['TextCoords'] = vector3(434.81, -981.93, 30.89),
	  ['Autorized'] = {
	   [1] = 'police',
	   [2] = 'judge',
	  },
	  ['Locking'] = false,
	  ['Locked'] = false,
	  ["Pickable"] = true,
	  ["Distance"] = 2.5,
	  ['Doors'] = {
	  	[1] = {
	  	 ['ObjName'] = 'gabz_mrpd_reception_entrancedoor',
	  	 ['ObjYaw'] = -90.0,
	  	 ['ObjCoords'] = vector3(434.7, -980.6, 30.8)
	  	},
	  	[2] = {
	  	 ['ObjName'] = 'gabz_mrpd_reception_entrancedoor',
	  	 ['ObjYaw'] =  90.0,
	  	 ['ObjCoords'] = vector3(434.7, -983.2, 30.8)
	  	},
	   }
   },
   [2] = {
	['DoorName'] = 'Police Garage Zij Deur',
	['TextCoords'] = vector3(441.94, -999.29, 30.72),
	['Autorized'] = {
	 [1] = 'police',
	 [2] = 'judge',
	},
	['Locking'] = false,
	['Locked'] = true,
	["Pickable"] = true,
	["Distance"] = 2.5,
	['Doors'] = {
		[1] = {
		 ['ObjName'] = 'gabz_mrpd_reception_entrancedoor',
		 ['ObjYaw'] = 180.0,
		 ['ObjCoords'] = vector3(442.92, -999.28, 30.72)
		},
		[2] = {
		 ['ObjName'] = 'gabz_mrpd_reception_entrancedoor',
		 ['ObjYaw'] =  0.0,
		 ['ObjCoords'] = vector3(440.91, -999.29, 30.72)
		},
	 }
   },
   [3] = {
	['DoorName'] = 'Police Garage Zij Deur',
	['TextCoords'] = vector3(457.04, -971.75, 30.70),
	['Autorized'] = {
	 [1] = 'police',
	 [2] = 'judge',
	},
	['Locking'] = false,
	['Locked'] = true,
	["Pickable"] = true,
	["Distance"] = 2.5,
	['Doors'] = {
		[1] = {
		 ['ObjName'] = 'gabz_mrpd_reception_entrancedoor',
		 ['ObjYaw'] = 180.0,
		 ['ObjCoords'] = vector3(457.84, -971.84, 30.70)
		},
		[2] = {
		 ['ObjName'] = 'gabz_mrpd_reception_entrancedoor',
		 ['ObjYaw'] =  0.0,
		 ['ObjCoords'] = vector3(456.08, -971.69, 30.70)
		},
	 }
	 },
	 [4] = {
		['DoorName'] = 'Garage Deur Beneden',
		['TextCoords'] = vector3(463.69, -996.76, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 3.0,
		['ObjYaw'] = 90.0,
		['ObjName'] = 'gabz_mrpd_room13_parkingdoor',
		['ObjCoords'] = vector3(463.69, -996.76, 26.27)
	 },
	 [5] = {
		['DoorName'] = 'Garage Deur Beneden 2',
		['TextCoords'] = vector3(463.68, -975.37, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 3.0,
		['ObjYaw'] = 270.0,
		['ObjName'] = 'gabz_mrpd_room13_parkingdoor',
		['ObjCoords'] = vector3(463.68, -975.37, 26.27)
	 },
	 [6] = {
		['DoorName'] = 'Receptie Zijdeuren',
		['TextCoords'] = vector3(441.16, -978.11, 30.68),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 3.0,
		['ObjYaw'] = 0.0,
		['ObjName'] = 'gabz_mrpd_door_04',
		['ObjCoords'] = vector3(441.16, -978.11, 30.68)
	 },
	 [7] = {
		['DoorName'] = 'Receptie Zijdeuren 2',
		['TextCoords'] = vector3(441.30, -985.71, 30.68),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 3.0,
		['ObjYaw'] = 180.0,
		['ObjName'] = 'gabz_mrpd_door_05',
		['ObjCoords'] = vector3(441.30, -985.71, 30.68)
	 },
	 [8] = {
		['DoorName'] = 'Cell Deur 1',
		['TextCoords'] = vector3(477.05, -1008.22, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 270.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(477.05, -1008.22, 26.27)
	 },
	 [9] = {
		['DoorName'] = 'Cell Deur 2',
		['TextCoords'] = vector3(481.66, -1004.56, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 180.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(481.66, -1004.56, 26.27)
	 },
	 [10] = {
		['DoorName'] = 'Cell Deur 3',
		['TextCoords'] = vector3(484.82, -1008.17, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 180.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(484.82, -1008.17, 26.27)
	 },
	 [11] = {
		['DoorName'] = 'Cell Deur 4',
		['TextCoords'] = vector3(486.28, -1011.74, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 0.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(486.28, -1011.74, 26.27)
	 },
	 [12] = {
		['DoorName'] = 'Cell Deur 5',
		['TextCoords'] = vector3(483.25, -1011.70, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 0.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(483.25, -1011.70, 26.27)
	 },
	 [13] = {
		['DoorName'] = 'Cell Deur 6',
		['TextCoords'] = vector3(480.21, -1011.66, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 0.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(480.21, -1011.66, 26.27)
	 },
	 [14] = {
		['DoorName'] = 'Cell Deur 7',
		['TextCoords'] = vector3(477.15, -1011.75, 26.27),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 1.0,
		['ObjYaw'] = 0.0,
		['ObjName'] = 'gabz_mrpd_cells_door',
		['ObjCoords'] = vector3(477.15, -1011.75, 26.27)
	 },

	 [15] = {
		['DoorName'] = 'Police Achter Deuren',
		['TextCoords'] = vector3(468.64, -1014.86, 26.38),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 2.5,
		['Doors'] = {
			[1] = {
			 ['ObjName'] = 'gabz_mrpd_door_03',
			 ['ObjYaw'] = 180.0,
			 ['ObjCoords'] = vector3(469.52, -1014.88, 26.38)
			},
			[2] = {
			 ['ObjName'] = 'gabz_mrpd_door_03',
			 ['ObjYaw'] =  0.0,
			 ['ObjCoords'] = vector3(467.71, -1014.87, 26.38)
			},
		 }
		 },

]]--



	 [1] = {
		['DoorName'] = 'Ambulance OK 1',
		['TextCoords'] = vector3(312.94, -572.42, 43.28),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		 [2] = 'ambulance',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 2.5,
		['Doors'] = {
			[1] = {
			 ['ObjName'] = 'gabz_pillbox_doubledoor_r',
			 ['ObjYaw'] = -20.0,
			 ['ObjCoords'] = vector3(314.14, -572.61, 43.28)
			},
			[2] = {
			 ['ObjName'] = 'gabz_pillbox_doubledoor_l',
			 ['ObjYaw'] = -20.0,
			 ['ObjCoords'] = vector3(311.91, -571.78, 43.28)
			},
		 }
	 },
	 [2] = {
		['DoorName'] = 'Ambulance OK 2',
		['TextCoords'] = vector3(318.96, -574.26, 43.28),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		 [2] = 'ambulance',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 2.5,
		['Doors'] = {
			[1] = {
			 ['ObjName'] = 'gabz_pillbox_doubledoor_r',
			 ['ObjYaw'] = -20.0,
			 ['ObjCoords'] = vector3(319.89, -574.69, 43.28)
			},
			[2] = {
			 ['ObjName'] = 'gabz_pillbox_doubledoor_l',
			 ['ObjYaw'] = -20.0,
			 ['ObjCoords'] = vector3(317.66, -573.87, 43.28)
			},
		 }
	 },
	 [3] = {
		['DoorName'] = 'Gevangenis Gate 1',
		['TextCoords'] = vector3(1844.9, 2608.5, 48.0),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 11.0,
		['ObjName'] = 'prop_gate_prison_01',
		['ObjCoords'] = vector3(1844.9, 2604.8, 44.6)
	 },
	 [4] = {
		['DoorName'] = 'Gevangenis Gate 2',
		['TextCoords'] = vector3(1818.5, 2608.4, 48.0),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 11.0,
		['ObjName'] = 'prop_gate_prison_01',
		['ObjCoords'] = vector3(1818.5, 2604.8, 44.6)
	 },
	 [5] = {
		['DoorName'] = 'Gevangenis Gate Binnen 1',
		['TextCoords'] = vector3(1831.13, 2594.52, 45.89),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 2.5,
		['ObjName'] = 'bobo_prison_cellgate',
		['ObjCoords'] = vector3(1831.13, 2594.52, 45.89)
	 },
	 [6] = {
		['DoorName'] = 'Gevangenis Gate Binnen 2',
		['TextCoords'] = vector3(1838.80, 2588.48, 45.89),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = false,
		["Distance"] = 2.5,
		['ObjName'] = 'bobo_prison_cellgate',
		['ObjCoords'] = vector3(1838.80, 2588.48, 45.89)
	 },
	 [7] = {
		['DoorName'] = 'Bank Gate 1',
		['TextCoords'] = vector3(148.96, -1047.12, 29.7),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_gb_vaubar',
		['ObjCoords'] = vector3(148.96, -1047.12, 29.7)
	 },
	 [8] = {
		['DoorName'] = 'Bank Gate 2',
		['TextCoords'] = vector3(314.61, -285.82, 54.49),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_gb_vaubar',
		['ObjCoords'] = vector3(314.61, -285.82, 54.49)
	 },
	 [9] = {
		['DoorName'] = 'Bank Gate 3',
		['TextCoords'] = vector3(-351.7, -56.28, 49.38),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_gb_vaubar',
		['ObjCoords'] = vector3(-351.7, -56.28, 49.38)
	 },
	 [10] = {
		['DoorName'] = 'Bank Gate 4',
		['TextCoords'] = vector3(-2956.18, -335.76, 38.11),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_gb_vaubar',
		['ObjCoords'] = vector3(-2956.18, -335.76, 38.11)
	 },
	 [11] = {
		['DoorName'] = 'Bank Gate 5',
		['TextCoords'] = vector3(-2956.18, 483.96, 16.02),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_gb_vaubar',
		['ObjCoords'] = vector3(-2956.18, 483.96, 16.02)
	 },
	 [12] = {
		['DoorName'] = 'Bank Gate 6',
		['TextCoords'] = vector3(-1208.52, -335.60, 37.75),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_gb_vaubar',
		['ObjCoords'] = vector3(-1208.52, -335.60, 37.75)
	 },
     [13] = {
 	  ['DoorName'] = 'Juwelier Deuren',
 	  ['TextCoords'] = vector3(-631.9554, -236.3333, 38.20653),
 	  ['Autorized'] = {
		[1] = 'police',
		[2] = 'judge',
 	  },
 	  ['Locking'] = false,
 	  ['Locked'] = true,
 	  ["Pickable"] = false,
 	  ["Distance"] = 2.5,
 	  ['Doors'] = {
 	  	[1] = {
 	  	 ['ObjName'] = 'p_jewel_door_l',
 	  	 ['ObjYaw'] = -54.0,
 	  	 ['ObjCoords'] = vector3(-631.9554, -236.3333, 38.20653)
 	  	},
 	  	[2] = {
 	  	 ['ObjName'] = 'p_jewel_door_r1',
 	  	 ['ObjYaw'] = -54.0,
 	  	 ['ObjCoords'] = vector3(-630.4265, -238.4376, 38.20653)
 	  	},
 	   }
    },
	[14] = {
		['DoorName'] = 'Human Labs',
		['TextCoords'] = vector3(3525.326, 3702.961, 20.9918),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 1.5,
		['ObjName'] = 'v_ilev_bl_doorpool',
		['ObjCoords'] = vector3(3525.326, 3702.961, 20.9918)
	 },
	 [15] = {
		['DoorName'] = 'Human Labs',
		['TextCoords'] = vector3(3621.109, 3751.822, 28.69323),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 3.5,
		['ObjName'] = 'v_ilev_bl_shutter2',
		['ObjCoords'] = vector3(3621.109, 3751.822, 28.69323)
	 },
	 [16] = {
		['DoorName'] = 'Human Labs',
		['TextCoords'] = vector3(3628.873, 3746.595, 28.68423),
		['Autorized'] = {
		 [1] = 'police',
		 [2] = 'judge',
		},
		['Locking'] = false,
		['Locked'] = true,
		["Pickable"] = true,
		["Distance"] = 3.5,
		['ObjName'] = 'v_ilev_bl_shutter2',
		['ObjCoords'] = vector3(3628.873, 3746.595, 28.68423)
	 },
}