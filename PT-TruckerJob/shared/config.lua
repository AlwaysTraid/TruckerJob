Config = {}

Config.Debug = true -- Debug Mode

Config.JobLaptop = {
    LaptopCoords = vector3(153.91, -3211.73, 5.91),
    AnimationCoords = vector3(153.28, -3211.73, 5.91),
}
Config.TreasureHunterBlipSettings = {
    name = "Treasure Hunter",
    sprite = 310,
    scale = 0.70,
    color = 2,

}

Config.TournamentTimer = 30 -- Minutes
Config.TreasureHuntingChestItem = "treasurehunterchest"
Config.TournamentChestItem = "tournamentchest"
Config.TournamentBlipSettings = {
    name = "Tournament Treasure Hunting Zone",
    radius = 250.0,
    sprite = 587,
    scale = 0.75,
    color = 0,

}
Config.TournamentLength = 30 -- Minutes

Config.TreasureHuntingChestLootTable = {
    amountOfItems = math.random(2, 3),
    rareChance = 8,
    rareProperties = {
        [1] = {
            name = 'WEAPON_APPISTOL',
            amount = 1,
        },
        [2] = {
            name = 'captainskull',
            amount = 1,
        },
    },
    normalProperties = {
        [1] = {
            name = 'yellow-diamond',
            amount = 1,
        },
        [2] = {
            name = 'antique_sapphire',
            amount = 1,
        },
        [3] = {
            name = 'antique_ruby',
            amount = 1,
        },
        [4] = {
            name = 'antique_diamond',
            amount = 1,
        },
        [5] = {
            name = 'antique_emerald',
            amount = 1,
        },   
    }
}

Config.TournamentChestLootTable = {
    amountOfItems = math.random(4, 5),
    rareChance = 6,
    rareProperties = {
        [1] = {
            name = 'weapon_smg',
            amount = 1,
        },
        [2] = {
            name = 'captainskull',
            amount = math.random(1, 2),
        },
    },
    normalProperties = {
        [1] = {
            name = 'yellow-diamond',
            amount = math.random(2, 3),
        },
        [2] = {
            name = 'antique_sapphire',
            amount = math.random(2, 3),
        },
        [3] = {
            name = 'antique_ruby',
            amount = math.random(2, 3),
        },
        [4] = {
            name = 'antique_diamond',
            amount = math.random(2, 3),
        },
        [5] = {
            name = 'antique_emerald',
            amount = math.random(2, 3),
        },
    }
    
}

Config.TreasureLocations = {
    [1] = {
        blip = vector3(-2838.28, -551.37, -75.25),
        spots = {
            vector4(-2827.17, -498.84, -66.75, 259.66),
            vector4(-2834.28, -531.37, -75.25, 352.53),
            vector4(-2830.98, -562.47, -75.2, 5.51),
        },
        model = "xm_prop_x17_chest_closed"
    }
}



