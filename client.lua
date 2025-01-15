ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
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
