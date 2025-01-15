ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("meerfps", function(source, args, rawCommand)
    TriggerClientEvent("jp-fps:applyBoost", source)
end, false)

-- Beperk het aantal voertuigen en NPC's op de server
Citizen.CreateThread(function()
    while true do
        -- Limiteer verkeersvoertuigen
        SetVehicleDensityMultiplierThisFrame(0.2)
        SetParkedVehicleDensityMultiplierThisFrame(0.1)
        
        -- Beperk voetgangers
        SetPedDensityMultiplierThisFrame(0.2)
        SetScenarioPedDensityMultiplierThisFrame(0.2, 0.2)

        Citizen.Wait(1000) -- Elke seconde uitvoeren om belasting te minimaliseren
    end
end)
