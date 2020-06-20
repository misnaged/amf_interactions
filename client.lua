local kushetki = {
    { x = -819.2239, y = -1312.3547, z = 43.2034 }, --blackwater
    { x = 2715.9, y = -1285.04, z = -100 },  --saint
}


local active = false
local BWKushPrompt
--local StopPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupBWKushPrompt() -- устанавливаем кнопку для вызова меню интеракции
    Citizen.CreateThread(function()
        local str = 'Kooshetka'
        BWKushPrompt = PromptRegisterBegin()
        PromptSetControlAction(BWKushPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(BWKushPrompt, str)
        PromptSetEnabled(BWKushPrompt, false)
        PromptSetVisible(BWKushPrompt, false)
        PromptSetHoldMode(BWKushPrompt, true)
        PromptRegisterEnd(BWKushPrompt)
    end)
end

--function SetupStopPrompt()
--    Citizen.CreateThread(function()
--        local str = 'stop da rock'
--        StopPrompt = PromptRegisterBegin()
--        PromptSetControlAction(StopPrompt, 0xCDC4E4E9)
--        str = CreateVarString(10, 'LITERAL_STRING', str)
--        PromptSetText(StopPrompt, str)
--        PromptSetEnabled(StopPrompt, false)
---- PromptSetEnabled(StopPrompt,
----          PromptSetVisible(StopPrompt, false)
--        PromptSetHoldMode(StopPrompt, true)
--        PromptRegisterEnd(StopPrompt)
--
--    end)
--end

AddEventHandler('amf_interactions:hasEnteredMarker', function(zone) -- добавляем проверку: находится ли игрок внутри маркера
    currentZone     = zone
end)

AddEventHandler('amf_interactions:hasExitedMarker', function(zone) -- добавляем проверку: вышел ли игрок из маркера
    if active == true then
        PromptSetEnabled(BWKushPrompt, false)
        PromptSetVisible(BWKushPrompt, false)
    -- PromptSetEnabled(StopPrompt, false)
     -- PromptSetVisible(StopPrompt, false)
        active = false
    end
    WarMenu.CloseMenu()
    currentZone = nil
end)

Citizen.CreateThread(function()  -- Собственно, сама функция проверки
    SetupBWKushPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

         for k,v in ipairs(kushetki) do
            if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 1.5) then
                isInMarker  = true
                currentZone = 'kushetki'
                lastZone    = 'kushetki'
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            TriggerEvent('amf_interactions:hasEnteredMarker', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('amf_interactions:hasExitedMarker', lastZone)
        end

    end
end)

-- Citizen.CreateThread(function()  
--     SetupStopPrompt()
--         while true do
--         Citizen.Wait(0)
--         ClearPedTasks(PlayerPedId())
-- Citizen.Wait(2000)
-- ClearPedTasksImmediately(PlayerPedId())
-- end
-- end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if currentZone then
         if active == false then
             PromptSetEnabled(BWKushPrompt, true)
             PromptSetVisible(BWKushPrompt, true)
            -- PromptSetEnabled(StopPrompt, true)
            -- PromptSetVisible(StopPrompt, true)
             active = true
         end
         if PromptHasHoldModeCompleted(BWKushPrompt) then
             WarMenu.OpenMenu('KushMusic')
             WarMenu.Display()
             PromptSetEnabled(BWKushPrompt, false)
             PromptSetVisible(BWKushPrompt, false)
         --  PromptSetEnabled(StopPrompt, false)
         --  PromptSetVisible(StopPrompt, false)
                active = false

                currentZone = nil
            end
        else
            Citizen.Wait(500)
        end
    end
end)




Citizen.CreateThread(function()
    WarMenu.CreateMenu('KushMusic', 'Actions')
    WarMenu.CreateSubMenu('PlayBanjo', 'KushMusic', 'Play banjo')
    WarMenu.CreateSubMenu('PlayMandoline', 'KushMusic', 'Play mandoline')
    WarMenu.CreateSubMenu('PlayGuitar', 'KushMusic', 'Play Guitar')
 while true do
        if WarMenu.IsMenuOpened('KushMusic') then

            if WarMenu.MenuButton('Play banjo', 'PlayBanjo') then end
            if WarMenu.MenuButton('Play mandoline', 'PlayMandoline') then end
            if WarMenu.MenuButton('Play Guitar', 'PlayGuitar') then end
            WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('PlayBanjo') then

            if WarMenu.Button("     Happy    ") then
            TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('PROP_HUMAN_SEAT_CHAIR_BANJO_UPBEAT'), -819.2239, -1312.3547, 43.2034, 171.39, -1, false, false, 0, 0, false)

             elseif WarMenu.Button("   Deep   ") then
            TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('PROP_HUMAN_SEAT_CHAIR_BANJO_DOWNBEAT'), -819.2239, -1312.3547, 43.2034, 171.39, -1, false, false, 0, 0, false)
            end
                    WarMenu.Display()

-----------------------------------------------------

            elseif WarMenu.IsMenuOpened('PlayMandoline') then

            if WarMenu.Button("     Happy    ") then
            TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('PROP_HUMAN_SEAT_BENCH_MANDOLIN_UPBEAT'), -819.2239, -1312.3547, 43.2034, 171.39, -1, false, false, 0, 0, false)

             elseif WarMenu.Button("   Deep   ") then
            TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('PROP_HUMAN_SEAT_BENCH_MANDOLIN_DOWNBEAT'), -819.2239, -1312.3547, 43.2034, 171.39, -1, false, false, 0, 0, false)
            end
                    WarMenu.Display()
-----------------------------------------------------
   
            elseif WarMenu.IsMenuOpened('PlayGuitar') then

            if WarMenu.Button("     Happy    ") then
            TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('WORLD_HUMAN_SIT_GUITAR_UPBEAT'), -819.2239, -1312.3547, 43.2034, 171.39, -1, false, false, 0, 0, false)

             elseif WarMenu.Button("   Deep   ") then
            TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('WORLD_HUMAN_SIT_GUITAR_DOWNBEAT'), -819.2239, -1312.3547, 43.2034, 171.39, -1, false, false, 0, 0, false)
            end
                    WarMenu.Display()
-----------------------------------------------------
        end

        Citizen.Wait(0)
    end
end)
