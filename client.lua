RegisterCommand('intmenu', function(source, args, rawCommand)             --                                                                
    RegisterNetEvent("newmenu")                                           --                                  
     WarMenu.OpenMenu('Animations')                                       -- Создание скриптовой команды для использования. Пример: открываешь консоль и пишешь "intmenu" - результат: открывается меню                                     
     WarMenu.Display()                                                    --                         
end)                                                                      --       
                                                                             
 -- Основная проблема вот с этим говном             
function animacion() -- нужно ли в скобках sceneid я не уверен                                                                         --                              
local ped = PlayerPedId()   -- ped = это Pedestrian у Рокстарцев так называется что то одушевленное типа человека, животного                                                                           --                            
local x, y, z = table.unpack(GetEntityCoords(ped))  -- table.unpack(GetEntityCoords(ped)) - берет текущее положение Entity, в нашем случае игрока      --                                                     
local h = GetEntityHeading(ped) -- heading это направление (куда смотреть будет) - GetEntityHeading - текущее направление игрока                                        
TaskStartScenarioAtPosition(ped, GetHashKey(sceneID), x, y, z, h, -1, false, false, 0, 0, false) 
SceneID = nil     --   собственно нативная команда, которая начинает сценарий (предопределенная анимация) с конкретной позиции                                                                                                
end                                                                                                   --      

-- В идеале я хотел получить следующее: открывается менюшечка с анимациями и ты мог выбрать нужную анимку. 

---------------- это образец 
 --   if WarMenu.Button("     LEAN BACK RAILING   ") then     -- создает кнопку с названием анимациями  
 --   animacion()        --  отсылка к функции 
--   sceneID = 'WORLD_HUMAN_LEAN_BACK_RAILING' -- вот с этим самая главная беда. в команде  TaskStartScenarioAtPosition(), параметр GetHashKey() - отвечает за получение хэша (у рокстарев все в хэшше). 


-- то есть команда в идеале выглядела бы так: -  TaskStartScenarioAtPosition(ped, GetHashKey('WORLD_HUMAN_LEAN_BACK_RAILING'), x, y, z, h, -1, false, false, 0, 0, false)      
-- по какой то причине именно 'WORLD_HUMAN_LEAN_BACK_RAILING' работает, а вот остальные ни в какую не хотят работать =(

-- 

Citizen.CreateThread(function()

    WarMenu.CreateMenu('Animations', 'Actions')
    WarMenu.CreateSubMenu('Leanback', 'Animations', 'Lean back')
    WarMenu.CreateSubMenu('Leanleft', 'Animations', 'Lean left')
    WarMenu.CreateSubMenu('Leanright', 'Animations', 'Lean right')
    WarMenu.CreateSubMenu('Lean', 'Animations', 'Lean')
   -- WarMenu.CreateSubMenu('Sitground', 'Animations', 'Sitting on a ground')
   -- WarMenu.CreateSubMenu('Sitchair', 'Animations', 'Sitting on a chair/bench/stool')

 while true do
        if WarMenu.IsMenuOpened('Animations') then

        if WarMenu.MenuButton('Lean back', 'Leanback') then end
        if WarMenu.MenuButton('Lean left', 'Leanleft') then end
        if WarMenu.MenuButton('Lean right', 'Leanright') then end
        if WarMenu.MenuButton('Lean', 'Lean') then end
      --  if WarMenu.MenuButton('Sitting on a ground', 'Sitground') then end
      --  if WarMenu.MenuButton('Sitting on a chair/bench/stool', 'Sitchair') then end

            WarMenu.Display()
           
        elseif WarMenu.IsMenuOpened('Leanback') then
               
                if WarMenu.Button("     LEAN BACK RAILING   ") then    
               --   sceneID = 'WORLD_HUMAN_LEAN_BACK_RAILING'
                 -- animacion(sceneID)
                 print('nil') 
                 Citizen.Wait(0)                            
                 elseif WarMenu.Button("   LEAN BACK WALL BACK WALL   ") then
            --     SceneID = 'WORLD_HUMAN_LEAN_BACK_WALL'
             --     animacion(sceneID)
             print('nil')
             Citizen.Wait(0)   
                 elseif WarMenu.Button("   LEAN BACK WALL NO PROPS   ") then
             --     SceneID = 'WORLD_HUMAN_LEAN_BACK_WALL_NO_PROPS'
              --    animacion(sceneID)
              print('nil')
              Citizen.Wait(0)   
                elseif WarMenu.Button("   LEAN BACK RAILING WHITTLE   ") then
                 SceneID = 'WORLD_HUMAN_LEAN_BACK_WHITTLE'
                 animacion(SceneID)
                 Citizen.Wait(0)   
                elseif WarMenu.Button("   LEAN BACK DRINKING   ") then
                  SceneID = 'WORLD_HUMAN_LEAN_BACK_RAILING_DRINKING'
                  animacion(SceneID)
                  Citizen.Wait(0)   
            end
                    WarMenu.Display()

-----------------------------------------------------

            elseif WarMenu.IsMenuOpened('Leanleft') then

                if WarMenu.Button("     LEAN POST LEFT   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_POST_LEFT'
                 elseif WarMenu.Button("   LEAN POST LEFT HAND PLANTED   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_POST_LEFT_HAND_PLANTED'
                 elseif WarMenu.Button("  LEAN RAILING LEFT    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_LEFT'
                 elseif WarMenu.Button("  LEAN WALL LEFT    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_WALL_LEFT'

            end
                    WarMenu.Display()
-----------------------------------------------------
   
            elseif WarMenu.IsMenuOpened('Leanright') then

                if WarMenu.Button("     LEAN POST RIGHT   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_POST_RIGHT'
                 elseif WarMenu.Button("  LEAN POST RIGHT HAND PLANTED    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_POST_RIGHT_HAND_PLANTED'
                 elseif WarMenu.Button("  LEAN WALL RIGHT    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_WALL_RIGHT'
            end
                    WarMenu.Display()
-----------------------------------------------------
 
        elseif WarMenu.IsMenuOpened('Lean') then

                if WarMenu.Button("   LEAN READ PAPER      ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_READ_PAPER'
                 elseif WarMenu.Button("   LEAN READ PAPER TRAIN PLANS   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_READ_PAPER_TRAIN_PLANS'
                 elseif WarMenu.Button("  GUARD LEAN WALL    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_GUARD_LEAN_WALL'
                 elseif WarMenu.Button("  LEAN CHECK PISTOL    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_CHECK_PISTOL'
                 elseif WarMenu.Button("   LEAN TABLE SHARPEN KNIFE ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_TABLE_SHARPEN_KNIFE'
                elseif WarMenu.Button("  LEAN BARREL    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_BARREL'
                 elseif WarMenu.Button("  LEAN BAR READ NEWSPAPER    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_BAR_READ_NEWSPAPER'
                elseif WarMenu.Button("    LEAN WALL DRINKING  ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_WALL_DRINKING'
                elseif WarMenu.Button("   LEAN RAILING   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING'                
                elseif WarMenu.Button("    LEAN RAILING DRINKING  ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_DRINKING'
                 elseif WarMenu.Button("   LEAN RAILING SMOKING   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_SMOKING'
                elseif WarMenu.Button("   LEAN RAILING INTERACTION   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_INTERACTION'
                elseif WarMenu.Button("  LEAN RAILING DYNAMIC    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_DYNAMIC'
            end
                    WarMenu.Display()

-----------------------------------------------------
 
        elseif WarMenu.IsMenuOpened('Lean') then

                if WarMenu.Button("   LEAN READ PAPER      ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_READ_PAPER'
                 elseif WarMenu.Button("   LEAN READ PAPER TRAIN PLANS   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_READ_PAPER_TRAIN_PLANS'
                 elseif WarMenu.Button("  GUARD LEAN WALL    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_GUARD_LEAN_WALL'
                 elseif WarMenu.Button("  LEAN CHECK PISTOL    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_CHECK_PISTOL'
                 elseif WarMenu.Button("   LEAN TABLE SHARPEN KNIFE ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_TABLE_SHARPEN_KNIFE'
                elseif WarMenu.Button("  LEAN BARREL    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_BARREL'
                elseif WarMenu.Button("    LEAN WALL DRINKING  ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_WALL_DRINKING'
                elseif WarMenu.Button("   LEAN RAILING   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING'                
                elseif WarMenu.Button("    LEAN RAILING DRINKING  ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_DRINKING'
                 elseif WarMenu.Button("   LEAN RAILING SMOKING   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_SMOKING'
                elseif WarMenu.Button("   LEAN RAILING INTERACTION   ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_INTERACTION'
                elseif WarMenu.Button("  LEAN RAILING DYNAMIC    ") then
                  animacion()
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_DYNAMIC'
            end
                    WarMenu.Display()

-----------------------------------------------------
        end

        Citizen.Wait(0)
    end
end)
