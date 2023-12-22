-- Config --
print("^2mg-drugrobbery ^7v^4" ..
	GetResourceMetadata(GetCurrentResourceName(), 'version', nil):gsub("%.", "^7.^4") ..
	"^7 - ^2Drug Robbery by ^1MrGames^7")

Config = {}
Target = {}

UseTarget = true
Config.HackItem =
'electronickit'                                              -- item used to hack things you are free to change it to whatever you want
Config.HackItemLaptop =
'electronickit'                                              -- item used to hack things you are free to change it to whatever you want
Config.HackType =
'greek'                                                      -- can be alphabet, numeric, alphanumeric, greek, braille, runes
Config.HackTypeLaptop =
'numeric'                                                    -- can be alphabet, numeric, alphanumeric, greek, braille, runes
Config.HackTime = 25                                         --how long to do minigame
Config.HackingTime = 15                                      --how long for hacking progressbars
-- Weed Warehouse 1 Config
Config.InsideLocation = vector3(1066.29, -3183.54, -39.16)   -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
Config.OutsideLocation = vector3(620.16, 2798.11, 42.43)     -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
Config.OutsideExitPosition = vector3(620.52, 2800.09, 41.95) -- Where ped spawns outside on exit
Config.MaxItemsReceivedWeed = 2                              -- Max amount of seperate items you can get per Weedbox i.e. a bag of skunk (amount determined by MinItemReceivedQtyWeed & MaxItemReceivedQtyWeed) AND a brick of weed (again determined by min and max received qty)
Config.MinItemReceivedQtyWeed = 1                            -- Min amount of a certain item you can get at a time
Config.MaxItemReceivedQtyWeed = 5                            -- Max amount of a certain item you can get at a time
Config.MaxItemsReceivedLaptop = 1                            -- Max amount of different items you can get per laptop hack (see MaxItemsReceivedWeed for explanation)
Config.MinItemReceivedQtyLaptop = 1                          -- Min amount of a certain item you can get at a time
Config.MaxItemReceivedQtylaptop = 1                          -- Min amount of a certain item you can get at a time
-- General Config
Config.CoolDown = 1                                          -- How many minutes it takes until it can be looted again
Config.Cops = 0                                              -- Amount of cops needed to do the robbery

-- Guards --
Config.Patrol = true        -- If you want a patrol car to spawn when they exit the warehouse (It will chase them down until killed)
Config.PatrolOnFoot = true
Config.GangstersVehicle = 2 -- Amount of guards in the car that will shoot at you (Limit: 3)
Config.GangstersOnFoot = 3

-- Weapon --
Config.PassengerAccuracy = 25 -- Accuracy of the Passengers - 100 = Perfect Accuracy its not recommended to go above 50 because the Passengers will shoot you down instantly
Config.PassengerWeapon =
'WEAPON_PISTOL'               -- Weapon of the Passengers - https://wiki.rage.mp/index.php?title=Weapons
Config.PassengerAmmo = 50     -- Ammo for the Passengers
Config.WeaponPattern = 'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
Config.OnFootAccuracy = 25    -- Accuracy of the Passengers - 100 = Perfect Accuracy its not recommended to go above 50 because the Passengers will shoot you down instantly
Config.OnFootWeapon =
'WEAPON_PISTOL'               -- Weapon of the Passengers - https://wiki.rage.mp/index.php?title=Weapons
Config.OnFootAmmo = 50        -- Ammo for the Passengers

-- Pickup Locations --
-- Cannabis Warehouse --
Config.PickupLocations = { -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
	[1] = vector3(1063.03, -3181.83, -40.0),
	[2] = vector3(1062.88, -3189.2, -40.0),
	[3] = vector3(1058.49, -3195.39, -40.0),
	[4] = vector3(1040.01, -3197.26, -39.15),
	[5] = vector3(1041.33, -3193.03, -39.15),
	[6] = vector3(1044.93, -3192.92, -39.15),
}
-- Laptop Location --
Config.laptopLocation = vector3(1045.25, -3194.85, -38.36)

-- Props --
Config.PropObjects = { -- Can be changed (the code will then randomly change props - we just use the weed pallets here for context)
	[1] = "prop_weed_pallet",
	[2] = "prop_weed_pallet",
	[3] = "prop_weed_pallet",
	[4] = "prop_weed_pallet",
	[5] = "prop_weed_pallet",
	[6] = "prop_weed_pallet",
	[7] = "prop_weed_pallet",
}

-- Item Tables --
Config.ItemTableWeed = { -- Items that can be found in the pallets/containers
	[1] = "jar_ak47",
	[2] = "jar_amnesia",
	[3] = "jar_ogkush",
	[4] = "jar_purps",
	[5] = "jar_skunk",
	[6] = "jar_whitewidow",
	[7] = "jar_ak47",
	[8] = "jar_amnesia",
	[9] = "jar_ogkush",
	[10] = "jar_purps",
	[11] = "jar_skunk",
	[12] = "jar_whitewidow",
}

Config.ItemTableLaptop = { -- Items that can be found from hacking the laptop
	[1] = "boat_data",     -- 1 in 20 chance of working data for mg-boatdeliveries
	[2] = "corrupt_usb",
}

-- Target Customisation --
Target.IconsActive = {
	weedPallet = "fa-solid fa-hand-back-fist",
	laptop = "fa-brands fa-usb",
}
Target.Icon = {
	weedPallet = "fa-solid fa-cannabis",
	laptop = "fa-solid fa-laptop",
}
Target.Label = {
	weedPallet = "Search drugs stash",
}
