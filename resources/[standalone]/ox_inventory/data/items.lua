return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},



	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},


	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	["steel"] = {
		label = "Steel",
		weight = 1,
		stack = true,
		close = true,
	},

	["electronics"] = {
		label = "Electronics",
		weight = 1,
		stack = true,
		close = true,
	},

	["plastic"] = {
		label = "Plastic",
		weight = 1,
		stack = true,
		close = true,
	},

	["rubber"] = {
		label = "Rubber",
		weight = 1,
		stack = true,
		close = true,
	},

	-- Mechanic Items
	['toolkit'] = {
			label = 'Toolkit',
			weight = 500, 
			stack = true, 
			close = true,
			description = 'Perbaikan lengkap (mesin, body, ban).',
			client = { 
				event = 'item_repair:useToolKit',
			}
	},

	['repairkit'] = {
			label = 'Repair Kit',
			weight = 300, 
			stack = true, 
			close = true,
			description = 'Perbaiki mesin & performa.',
			client = { 
				event = 'item_repair:useRepairKit' 
			}
	},

	['bodykit'] = {
			label = 'Body Kit',
			weight = 300, 
			stack = true, 
			close = true,
			description = 'Perbaiki kerusakan body/chassis.',
			client = { 
				event = 'item_repair:useBodyKit' 
			}
	},

	['tirekit'] = {
			label = 'Tire Kit',
			weight = 200, 
			stack = true, 
			close = true,
			description = 'Perbaiki ban pecah/aus.',
			client = { 
				event = 'item_repair:useTireKit' 
			}
	},

	-- Shop Items (Foods)
	['rice'] = {
		label = 'Rice',
		weight = 1000,
		client = {
			status = { hunger = 1000000 }, -- 100%
			anim = 'eating',
			prop = 'rice',
			usetime = 5000, -- 5 seconds
			cancel = true,
			notification = 'You ate some rice'
		}
	},
	['pizza_ham'] = {
		label = 'Pizza Ham',
		weight = 1000,
		client = {
			status = { hunger = 1000000 }, -- 100%
			anim = 'eating',
			prop = 'rice',
			usetime = 5000, -- 5 seconds
			cancel = true,
			notification = 'You ate a pizza ham'
		}
	},
	['burger_chicken'] = {
		label = 'Burger Chicken',
		weight = 500,
		client = {
			status = { hunger = 1000000 }, -- 100%
			anim = 'eating',
			prop = 'burger',
			usetime = 5000, -- 5 seconds
			cancel = true,
			notification = 'You ate a delicious burger'
		},
	},
	['fries'] = {
		label = 'Potato Fries',
		weight = 200,
		client = {
			status = { hunger = 200000 }, -- 20%
			anim = 'eating',
			prop = 'burger',
			usetime = 3000, -- 3 seconds
			cancel = true,
			notification = 'You ate some potato fries'
		},
	},

	-- Shop items (Drinks)
	['juice'] = {
		label = 'Juice',
		weight = 500,
		client = {
			status = { thirst = 1000000 }, -- 100%
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 5000, -- 5 seconds
			cancel = true,
			notification = 'You drank a juice'
		}
	},
	['soda'] = {
		label = 'Soda',
		weight = 500,
		client = {
			status = { thirst = 1000000 }, -- 100%
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 5000, -- 5 seconds
			cancel = true,
			notification = 'You drank a soda'
		}
	},
	['sprunk'] = {
		label = 'Sprunk',
		weight = 500,
		client = {
			status = { thirst = 1000000 }, -- 100%
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) }, 
			usetime = 5000, -- 5 seconds
			cancel = true,
			notification = 'You drank a sprunk'
		}
	},
	['water'] = {
		label = 'Water',
		weight = 200,
		client = {
			status = { thirst = 200000 }, -- 20%
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 3000, -- 3 seconds
			cancel = true,
			notification = 'You drank a water'
		}
	},
}