ESX = nil -- ESX 

CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Wait(0)
  end
end)
RegisterNetEvent('esx:playerLoaded') 
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

local startjob = true
local teleport1 = true
local teleportout1 = false
local boxm = false
local finish = false

CreateThread(function()
	
    blip = AddBlipForCoord(cfg.blip['blipposition']) 
    AddTextEntry('sdadasd', cfg.blip['blipname'])
    SetBlipSprite(blip, cfg.settings['sprite'])
    SetBlipColour(blip, cfg.settings['color'])
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('sdadasd')
    EndTextCommandSetBlipName(blip)
    
end)
  
CreateThread(function()
	while true do
    cas = 1000
        local playerPed = GetPlayerPed(-1)
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = cfg.zones['start']
        local dist = #(Coords - pos)
        if dist < 3 then
            if startjob then
                startjob = true
                if startjob == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations["start"], pos)
                    if IsControlJustPressed(0, 38) and dist < 2 then
                        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "unique_action_name",
                            duration = 4000,
                            label = cfg.translations['laptop'],
                            useWhileDead = false,
                            canCancel = false,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                        }, function(status)
                            if not status then
                                ClearPedTasks(playerPed)
                                startjob = true
                                SetDisplay(not display)
                                TriggerScreenblurFadeIn(1)
                                startjob = false
                            end
                        end)
                    
                    end
                end
            end
        end
    Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
        local playerPed = GetPlayerPed(-1)
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = cfg.zones['teleportto']
        local dist = #(Coords - pos)
        if dist < 3 then
            if teleport1 then
                teleport1 = true
                if teleport1 == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['teleportto'], pos)
                    if IsControlJustPressed(0, 38) and dist < 2 then
                        teleport1 = true
                        startjob = true
                        teleport()
                        teleport1 = false
                        teleportout1 = true
                    end
                end
            end
        end
    Wait(cas)
	end
end)
CreateThread(function()
	while true do
    cas = 1000
        local playerPed = GetPlayerPed(-1)
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = cfg.zones["teleportout"]
        local dist = #(Coords - pos)
        if dist < 3 then
            if teleportout1 then
                teleportout1 = true
                if teleportout1 == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations["teleportout"], pos)
                    if IsControlJustPressed(0, 38) and dist < 2 then
                        teleportout1 = true
                        teleport1 = true
                        teleportout()
                        teleportout1 = false
                        startjob = true
                        boxm = false    
                        RemoveBoxs()
                    end
                end
            end
        end
    Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
        local playerPed = GetPlayerPed(-1)
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = cfg.zones['search']
        local dist = #(Coords - pos)
        if dist < 3 then
            if finish then
                finish = true
                if finish == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['search'], pos)
                    if IsControlJustPressed(0, 38) and dist < 2 then
                        SetEntityHeading(playerPed, 85.4279)
                        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                        DropPackage()
                        boxonground()
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "unique_action_name",
                            duration = 10000,
                            label = cfg.translations['searching'],
                            useWhileDead = false,
                            canCancel = false,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                        }, function(status)
                            if not status then
                                chance()
                                chance2()
                                TriggerServerEvent("box:items")
                                finish = true
                                ClearPedTasks(playerPed)
                                boxm = true
                                finish = false
                            end
                        end)                    
                    end
                end
            end
        end
    Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
        for _, v in ipairs(cfg.object) do
            local playerPed = GetPlayerPed(-1)
            local Coords = GetEntityCoords(PlayerPedId())
            local pos = v.objects
            local dist = #(Coords - pos)
            if dist < 3 then
                if boxm then
                    boxm = true
                    if boxm == true then
                        cas = 5
                        ShowFloatingHelpNotification(cfg.translations['pickup'], pos)
                        if IsControlJustPressed(0, 38) and dist < 2 then
                            TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                            TriggerEvent("mythic_progbar:client:progress", {
                                name = "unique_action_name",
                                duration = 5000,
                                label = cfg.translations["pickupingbox"],
                                useWhileDead = false,
                                canCancel = false,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                            }, function(status)
                                if not status then
                                    boxm = true
                                    ClearPedTasks(playerPed)
                                    finish = true
                                    boxbum()
                                    boxm = false
                                end
                            end)
                        
                        end
                    end
                end
            end
        end
    Wait(cas)
	end
end)

function chance()
    local breakChance = math.random(1,100)
    if breakChance < cfg.chance["firstitem"] then
        TriggerServerEvent("box:chance")  
    end

end
function chance2()
    local breakChance = math.random(1,100)
    if breakChance < cfg.chance["secounditem"] then
        TriggerServerEvent("box:chance2")  
    end

end


function boxbum()
    local pos = GetEntityCoords(PlayerPedId(), true)
    RequestAnimDict('anim@heists@box_carry@')
    while (not HasAnimDictLoaded('anim@heists@box_carry@')) do
      Wait(7)
    end
    TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 5.0, -1, -1, 50, 0, false, false, false)
    RequestModel("prop_cs_cardbox_01")
    while not HasModelLoaded("prop_cs_cardbox_01") do
      Wait(0)
    end
    local object5 = CreateObject("prop_cs_cardbox_01", pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(object5, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
    carryPackage = object5
    

end

function DropPackage()
    ClearPedTasks(PlayerPedId())
    DetachEntity(carryPackage, true, true)
    DeleteObject(carryPackage)
    carryPackage = nil
    boxm = true

end

function RemoveBoxs()

    DeleteObject(object1)
    DeleteEntity(object1)

end

function object()
    for _, v in ipairs(cfg.object) do

        ESX.Game.SpawnLocalObject('prop_box_wood05a', v.objects, function(object1)
            FreezeEntityPosition(object1, true)
            boxm = true
        end)
    end

end

function boxonground()
    local playerPed = PlayerPedId()
    local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
    local objectCoords = (coords + forward * 1.0)

    ESX.Game.SpawnLocalObject("prop_cs_cardbox_01", objectCoords, function(obj)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
        Wait(10000)
        DeleteObject(obj)
        DeleteEntity(obj)
    
    end)
end

teleport = function()

    ESX.Game.Teleport(GetPlayerPed(-1), cfg.zones["teleportout"], function()
    end)


end
teleportout = function()

    ESX.Game.Teleport(GetPlayerPed(-1), cfg.zones["teleportto"], function()
    end)


end


RegisterNUICallback("start", function()
    SetDisplay(false)
    TriggerScreenblurFadeOut(1000)
    startjob = false
    object()
end)

RegisterNUICallback("exit", function()
    SetDisplay(false)
    TriggerScreenblurFadeOut(1000)
    startjob = true
end)


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end
  

ShowFloatingHelpNotification = function(msg, pos)
    AddTextEntry('text', msg)
    SetFloatingHelpTextWorldPosition(1, pos.x, pos.y, pos.z)
    SetFloatingHelpTextStyle(2, 1, 25, -1, 3, 0)
    BeginTextCommandDisplayHelp('text')
    EndTextCommandDisplayHelp(2, false, false, -1)
  end
  
  