ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Automatische functie based op fps type shi (niet getest roemang)
Citizen.CreateThread(function()
    while true do
        local currentFPS = GetFrameRate()
        if currentFPS < 30 then
            SetTimecycleModifier("CLEAR")
            SetTimecycleModifierStrength(0.0)
            OverrideLodscaleThisFrame(0.3)
        elseif currentFPS < 60 then
            SetTimecycleModifier("CLEAR")
            SetTimecycleModifierStrength(0.5)
            OverrideLodscaleThisFrame(0.6)
        else
            SetTimecycleModifier("CLEAR")
            SetTimecycleModifierStrength(1.0)
        end
        Citizen.Wait(300000) -- Check elke 30 seconden
    end
end)


function ApplyFPSBoost()
    -- Zet onnodige visuele effecten uit
    SetTimecycleModifier("CLEAR")
    SetTimecycleModifierStrength(0.0)


    -- Verminder onnodige particle effects
    RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 500.0)

    -- Schakel straatverlichting schaduw uit
    SetLightsCutoffDistanceTweak(100.0)

    -- Verlaag LOD-schaal (Level of Detail)
    SetHdArea(GetEntityCoords(PlayerPedId()), 50.0)
    OverrideLodscaleThisFrame(0.5)

    -- Minimaliseer updates voor decoraties
    ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 500.0, false)

    -- Schakel onnodige HUD-componenten uit
    Citizen.CreateThread(function()
        for i = 1, 22 do
            HideHudComponentThisFrame(i)
        end
    end)
end

RegisterNetEvent("jp-fps:applyBoost")
AddEventHandler("jp-fps:applyBoost", function()
    ApplyFPSBoost()
end)


-- Menu voor spelers om zelf laag, medium, hoog te zetten (working on it just a chill guy) replacement voor oude functie 



-- Auto functie's voor locatie's en clear dingen shit so naar me guys
--  animatie updates
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        ClearAreaOfObjects(GetEntityCoords(ped), 500.0, false)
        Citizen.Wait(10000) -- Elke 10 seconden izjn cleanup (weet niet wat de fps ermee doet tbh anders gewoon uithalen)
    end
end)

-- Automatisch als bij np enzo 
Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local zone = GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)

        if zone == "DOWNTOWN" or zone == "CITY" then
            SetTrafficDensityMultiplier(0.1)
            SetPedDensityMultiplier(0.1)
            OverrideLodscaleThisFrame(0.5)
        else
            SetTrafficDensityMultiplier(0.5)
            SetPedDensityMultiplier(0.5)
            OverrideLodscaleThisFrame(1.0)
        end
        Citizen.Wait(150000) -- Controleer elke 15 seconde (weet niet wat met fps doet anders uithalen xx)
    end
end)