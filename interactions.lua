RegisterCommand('hardreset', function(source, args, rawCommand)           
    RegisterNetEvent("hardreset1")                                         
    ClearPedTasksImmediately(PlayerPedId())                                               
end)                                       

RegisterCommand('resetanim', function(source, args, rawCommand)           
    RegisterNetEvent("resetanimka")                                         
    ClearPedTasks(PlayerPedId())                                               
end)     

      

RegisterCommand('intmenu', function(source, args, rawCommand)           
    RegisterNetEvent("newmenu")                                         
     WarMenu.OpenMenu('Animations')                                                                      
     WarMenu.Display()                                                  
end)                                                                                                                                            
           
function animacion(SceneID)                                                                                         
local ped = PlayerPedId()                                                                                                        
local x, y, z = table.unpack(GetEntityCoords(ped))             
local h = GetEntityHeading(ped)                                        
TaskStartScenarioAtPosition(ped, GetHashKey(SceneID), x, y, z, h, -1, false, false, 0, 0, false) 
SceneID = nil                                                                                                
end                                                                                                      



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
                      sceneID = 'WORLD_HUMAN_LEAN_BACK_RAILING'
                      animacion(sceneID)
                      WarMenu.CloseMenu('Leanback')
            Citizen.Wait(5)                            
                 elseif WarMenu.Button("   LEAN BACK WALL BACK WALL   ") then
                        SceneID = 'WORLD_HUMAN_LEAN_BACK_WALL'
                        animacion(sceneID)
                        WarMenu.CloseMenu('Leanback')
            Citizen.Wait(5)   
                 elseif WarMenu.Button("   LEAN BACK WALL NO PROPS   ") then
                        SceneID = 'WORLD_HUMAN_LEAN_BACK_WALL_NO_PROPS'
                        animacion(sceneID)
                        WarMenu.CloseMenu('Leanback')
            Citizen.Wait(5)   
                elseif WarMenu.Button("   LEAN BACK RAILING WHITTLE   ") then
                         SceneID = 'WORLD_HUMAN_LEAN_BACK_WHITTLE'
                         animacion(SceneID)
                         WarMenu.CloseMenu('Leanback')
            Citizen.Wait(5)   
                elseif WarMenu.Button("   LEAN BACK DRINKING   ") then
                          SceneID = 'WORLD_HUMAN_LEAN_BACK_RAILING_DRINKING'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanback')
            Citizen.Wait(5)   
            end
                    WarMenu.Display()

-----------------------------------------------------

            elseif WarMenu.IsMenuOpened('Leanleft') then

                if WarMenu.Button("     LEAN POST LEFT   ") then
                          SceneID = 'WORLD_HUMAN_LEAN_POST_LEFT'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanleft')
             Citizen.Wait(5)    

                 elseif WarMenu.Button("   LEAN POST LEFT HAND PLANTED   ") then
                SceneID = 'WORLD_HUMAN_LEAN_POST_LEFT_HAND_PLANTED'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanleft')
             Citizen.Wait(5) 

                 elseif WarMenu.Button("  LEAN RAILING LEFT    ") then
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_LEFT'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanleft')
             Citizen.Wait(5)  

                 elseif WarMenu.Button("  LEAN WALL LEFT    ") then
                SceneID = 'WORLD_HUMAN_LEAN_WALL_LEFT'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanleft')
             Citizen.Wait(5)  
            end
                    WarMenu.Display()
-----------------------------------------------------
   
            elseif WarMenu.IsMenuOpened('Leanright') then

                if WarMenu.Button("     LEAN POST RIGHT   ") then
                SceneID = 'WORLD_HUMAN_LEAN_POST_RIGHT'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanright')
             Citizen.Wait(5)                  
                 elseif WarMenu.Button("  LEAN POST RIGHT HAND PLANTED    ") then
                SceneID = 'WORLD_HUMAN_LEAN_POST_RIGHT_HAND_PLANTED'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanright')
             Citizen.Wait(5)  
                 elseif WarMenu.Button("  LEAN WALL RIGHT    ") then
                SceneID = 'WORLD_HUMAN_LEAN_WALL_RIGHT'
                          animacion(SceneID)
                          WarMenu.CloseMenu('Leanright')
             Citizen.Wait(5)  
            end
                    WarMenu.Display()
-----------------------------------------------------
 
        elseif WarMenu.IsMenuOpened('Lean') then

                if WarMenu.Button("   LEAN READ PAPER      ") then
                SceneID = 'WORLD_HUMAN_LEAN_READ_PAPER'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                 elseif WarMenu.Button("   LEAN READ PAPER TRAIN PLANS   ") then
                SceneID = 'WORLD_HUMAN_LEAN_READ_PAPER_TRAIN_PLANS'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                 elseif WarMenu.Button("  GUARD LEAN WALL    ") then
                SceneID = 'WORLD_HUMAN_GUARD_LEAN_WALL'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                 elseif WarMenu.Button("  LEAN CHECK PISTOL    ") then
                SceneID = 'WORLD_HUMAN_LEAN_CHECK_PISTOL'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                 elseif WarMenu.Button("   LEAN TABLE SHARPEN KNIFE ") then
                SceneID = 'WORLD_HUMAN_LEAN_TABLE_SHARPEN_KNIFE'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                elseif WarMenu.Button("  LEAN BARREL    ") then
                SceneID = 'WORLD_HUMAN_LEAN_BARREL'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                 elseif WarMenu.Button("  LEAN BAR READ NEWSPAPER    ") then
                SceneID = 'WORLD_HUMAN_LEAN_BAR_READ_NEWSPAPER'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                elseif WarMenu.Button("    LEAN WALL DRINKING  ") then
                SceneID = 'WORLD_HUMAN_LEAN_WALL_DRINKING'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                elseif WarMenu.Button("   LEAN RAILING   ") then
                SceneID = 'WORLD_HUMAN_LEAN_RAILING'                

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                elseif WarMenu.Button("    LEAN RAILING DRINKING  ") then
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_DRINKING'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                 elseif WarMenu.Button("   LEAN RAILING SMOKING   ") then
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_SMOKING'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                elseif WarMenu.Button("   LEAN RAILING INTERACTION   ") then
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_INTERACTION'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
                elseif WarMenu.Button("  LEAN RAILING DYNAMIC    ") then
                SceneID = 'WORLD_HUMAN_LEAN_RAILING_DYNAMIC'

          animacion(SceneID)
          WarMenu.CloseMenu('Lean')
          Citizen.Wait(5)
            end
                    WarMenu.Display()
-----------------------------------------------------


-----------------------------------------------------
        end

        Citizen.Wait(0)
    end
end)
