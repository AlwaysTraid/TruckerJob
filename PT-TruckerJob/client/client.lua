local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local Targets = {}
local Objects = {}
local Blips = {}


local function SetDefaultTargets()

    Targets["TruckerJobLaptop"] = exports.ox_target:addBoxZone({
        coords = vector3(Config.JobLaptop.LaptopCoords.x, Config.JobLaptop.LaptopCoords.y, Config.JobLaptop.LaptopCoords.z),
        size = vector3(1,1, 2),
        rotation = 0,
        debug = Config.Debug,
        options = {
            {
                name= "TruckerJobLaptop",
                type = "client",
                event = "PT-TruckerJob:client:OpenJobLaptop",
                icon = "fa-solid fa-laptop",
                label = "Open Job Menu",
                distance = 1.5
            }
        }
    })

end

local function ResetTargets()
    --for _, v in pairs(Peds) do DeletePed(v) end
    for k in pairs(Targets) do exports.ox_target:removeZone(k) end
    for k in pairs(Objects) do
        DeleteObject(Objects[k])
    end
	for i = 1, #Blips do RemoveBlip(Blips[i]) end
end
-----------------------
-- EVENTS/FUNCTIONS --
-----------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SetDefaultTargets()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    ResetTargets()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    SetDefaultTargets()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    ResetTargets()
    PlayerData = {}
end)

RegisterNetEvent("PT-TruckerJob:client:OpenJobLaptop", function()
    local menu = {}

    if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", 3) then
        TaskGoStraightToCoord(PlayerPedId(), Config.JobLaptop.AnimationCoords, 1.0, -1, 0.0, 0.0)
        while #(GetEntityCoords(PlayerPedId()) - Config.JobLaptop.AnimationCoords) >= 0.2 do Wait(100) end
        ClearPedTasksImmediately(PlayerPedId())
        TaskTurnPedToFaceCoord(PlayerPedId(), Config.JobLaptop.LaptopCoords, 1500)
        Wait(800)
        loadAnimDict("anim@heists@prison_heistig1_p1_guard_checks_bus")
        TaskPlayAnim(PlayerPedId(), "anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", 2.0, 2.0, -1, 51, 0, false, false, false)

    end

    menu[#menu+1] = {
        title = "Check Your Job Stats",
        icon = "fa-solid fa-clipboard-user",
        iconColor = "blue",
        description = "Check what your current stats are for the job!",
        event = "PT-TruckerJob:client:OpenPlayerStatsMenuLaptop",
        arrow = true,
    }
    menu[#menu+1] = {
        title = "Start Job Route",
        icon = "fa-solid fa-trailer",
        iconColor = "green",
        description = "Setup a route and start your next job!",
        event = "PT-TruckerJob:client:OpenJobRoutesLaptop",
        arrow = true,
    }
    lib.registerContext({
        id = "TruckerJobLaptop",
        title = "Trucker Job Laptop Settings",
        onExit = function()
            ClearPedTasks(PlayerPedId())
        end,
        options = menu
    })
    lib.showContext("TruckerJobLaptop")
end)

RegisterNetEvent("PT-TruckerJob:client:OpenPlayerStatsMenuLaptop", function()
    local menu = {}

    PlayerName = PlayerData.charinfo.firstname:sub(1,1):upper()..PlayerData.charinfo.firstname:sub(2).. " ".. PlayerData.charinfo.lastname:sub(1,1):upper()..PlayerData.charinfo.lastname:sub(2)

    menu[#menu+1] = {
        title = "Name",
        description = PlayerName,
    }
    menu[#menu+1] = {
        title = "Reptuation Level",
        description = PlayerData.metadata["truckerrep"]/100,
        progress = PlayerData.metadata["truckerrep"]%100,
    }
    menu[#menu+1] = {
        title = "Truck Statistics",
        icon = "fa-solid fa-bus-simple",
        iconColor = "pink",
        description = "Check your Truck Statistics",
        event = "PT-TruckerJob:client:OpenTruckStatisticsLaptop",
        arrow = true,
    }
    lib.registerContext({
        id = "PlayerStatsMenuLaptop",
        title = "Trucker Statistics Page",
        onExit = function()
            ClearPedTasks(PlayerPedId())
        end,
        menu = 'TruckerJobLaptop',
        options = menu
    })
    lib.showContext("PlayerStatsMenuLaptop")
end)

RegisterNetEvent("PT-TruckerJob:client:OpenTruckStatisticsLaptop", function()
    local menu = {}

    menu[#menu+1] = {
        title = "Chosen Truck",
        description = "Unknown",
        event = "PT-TruckerJob:client:ChangeTruckLaptop",
        arrow = true,
    }
    menu[#menu+1] = {
        title = "Distance Traveled",
        description = "0",
    }
    menu[#menu+1] = {
        title = "Upgrades",
        description = "Change Truck Upgrades",
        event = "PT-TruckerJob:client:ChangeTruckUpgradesLaptop",
        arrow = true,
        disable = true,
    }
    lib.registerContext({
        id = "TruckStatisticsLaptop",
        title = "Truck Statistics Page",
        onExit = function()
            ClearPedTasks(PlayerPedId())
        end,
        menu = 'PlayerStatsMenuLaptop',
        options = menu
    })
    lib.showContext("TruckStatisticsLaptop")
end)