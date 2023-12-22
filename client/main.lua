local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local src
local Player
local CurrentCops = 0
local obj
-- In Vehicle Gangsters --
local vehicle
local driver
local passenger
local passenger2
local passenger3
-- On Foot Gangsters --
local gangster
local gangster2
local gangster3
local PlayerJob = {}

RegisterNetEvent('police:SetCopCount', function(amount)
  CurrentCops = amount
end)

--- Weed Warehouse Entry
RegisterNetEvent('warehouse:EnterLocation2', function()
  if CurrentCops >= Config.Cops then
    QBCore.Functions.TriggerCallback("mg:server:CooldownCallback", function(isCooldown)
      if not isCooldown then
        if QBCore.Functions.HasItem(Config.HackItem) then
          -- TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })
          QBCore.Functions.Progressbar('cnct_elect', 'Rewiring the Door Lock...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {
            animDict = "amb@prop_human_movie_studio_light@base",
            anim = "base",
            flags = 16,
          }, {}, {}, function()
            StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
          end)
          Wait(5000)
          -- TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })
          exports['ps-ui']:Scrambler(function(success)
            if success then
              Wait(100)
              -- TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })
              Wait(500)
              QBCore.Functions.Progressbar('po_usb', 'Making Final Adjustments...', 4000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
              }, {
                animDict = "amb@prop_human_movie_studio_light@base",
                anim = "base",
                flags = 16,
              }, {}, {}, function()
                StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
              end)
              Wait(4000)
              -- TriggerEvent('animations:client:EmoteCommandStart', { "c" })
              QBCore.Functions.Notify(
                'You Successfully Rewired the Door!', 'primary',
                3000)
              TriggerEvent('warehouse:EnterDoor')
              Wait(3000)
              QBCore.Functions.Notify(
                'The alarm is only disabled for 100 seconds. Then nearby locals will ring the Police!',
                'error',
                4000)

              Wait(100000)
              exports["ps-dispatch"]:CustomAlert({
                coords = vector3(620.16, 2798.11, 42.43),
                message = "Warehouse Robbery",
                dispatchCode = "118881",
                description = "Warehouse Robbery",
                radius = 0,
                sprite = 357,
                color = 2,
                scale = 0.7,
                length = 3,
              })
            else
              TriggerEvent('animations:client:EmoteCommandStart', { "c" })
              QBCore.Functions.Notify('Police Was Alerted!', 'error', 2000)
              exports["ps-dispatch"]:CustomAlert({
                coords = vector3(620.16, 2798.11, 42.43),
                message = "Attempted Warehouse Robbery",
                dispatchCode = "118881",
                description = "Attempted Warehouse Robbery",
                radius = 0,
                sprite = 357,
                color = 2,
                scale = 0.7,
                length = 3,
              })
            end
          end, Config.HackType, Config.HackTime, 0)
        else
          QBCore.Functions.Notify('You dont have the right tools', 'error', 3000)
        end
      else
        QBCore.Functions.Notify("System seems to be on a cooldown", 'error')
      end
    end)
  else
    QBCore.Functions.Notify("Not Enough Police On!", 'error')
  end
end)

-- Weed Warehouse Pickup event --
RegisterNetEvent('warehouse:client:target:pickupWeed', function()
  QBCore.Functions.GetPlayerData(function(PlayerData)
    PlayerJob = PlayerData.job
    if PlayerData.job.name ~= "police" then
      TriggerEvent('animations:client:EmoteCommandStart', { "inspect" })
      QBCore.Functions.Progressbar('cnct_elect', 'Getting all sticky-icky!', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 16,
      }, {}, {}, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
      end)
      Wait(5000)
      TriggerServerEvent('mg:server:getItem')
    else
      QBCore.Functions.Notify('A container that smells strongly of cannabis...', 'primary', 8000)
    end
  end)
end)

-- interior design/deploy --
local function buildInterior()
  for _, pickuploc in pairs(Config.PickupLocations) do
    local model = GetHashKey(Config.PropObjects[math.random(1, #Config.PropObjects)])
    RequestModel(model)
    while not HasModelLoaded(model) do
      Wait(0)
    end
    obj = CreateObject(model, pickuploc.x, pickuploc.y, pickuploc.z, false, true, true)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
  end
end

-- Door Event

RegisterNetEvent('warehouse:EnterDoor', function()
  TriggerServerEvent('mg:server:removeHackingDevice', playerId)
  DoScreenFadeOut(500)
  Wait(500)
  buildInterior()
  SetEntityCoords(PlayerPedId(), Config.InsideLocation.x, Config.InsideLocation.y, Config.InsideLocation.z)
  ExportWeed1()
  ExportWeed2()
  ExportWeed3()
  ExportWeed4()
  ExportWeed5()
  ExportWeed6()
  CheckLaptop()
  DoScreenFadeIn(500)
  Wait(10000)
  QBCore.Functions.Notify(
    'A lookout has tipped off the warehouse owners. I\'d be careful leaving!', 'error',
    6000)
end)

RegisterNetEvent('mg-gangwarehouses:EnterDoorPolice', function()
  DoScreenFadeOut(500)
  Wait(500)
  SetEntityCoords(PlayerPedId(), Config.InsideLocation.x, Config.InsideLocation.y, Config.InsideLocation.z)
  DoScreenFadeIn(500)
end)

RegisterNetEvent('mg-gangwarehouses:ExitDoor', function()
  PlayerData = QBCore.Functions.GetPlayerData()
  if PlayerData.job.name ~= "police" then
    DoScreenFadeOut(500)
    Wait(1000)
    SetEntityCoords(PlayerPedId(), Config.OutsideExitPosition.x, Config.OutsideExitPosition.y,
      Config.OutsideExitPosition.z)
    TriggerServerEvent('mg:server:cool')
    DoScreenFadeIn(500)
    WarehouseGangstersOnFoot()
    Wait(6000)
    WarehouseGangsters()
    Wait(30000)
    StopWarehouseGuards()
    Wait(30000)
    vehicle = SetVehicleAsNoLongerNeeded()
  else
    DoScreenFadeOut(500)
    SetEntityCoords(PlayerPedId(), Config.OutsideExitPosition.x, Config.OutsideExitPosition.y,
      Config.OutsideExitPosition.z)
    DoScreenFadeIn(500)
  end
end)

-- laptop --
RegisterNetEvent('warehouse:AccessLaptop', function()
  PlayerData = QBCore.Functions.GetPlayerData()
  if PlayerData.job.name ~= "police" then
    QBCore.Functions.TriggerCallback("mg:server:CooldownCallback", function(isCooldown)
      if not isCooldown then
        if QBCore.Functions.HasItem(Config.HackItemLaptop) then
          -- TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })
          QBCore.Functions.Progressbar('cnct_elect', 'Inserting the USB...which way is it?!', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {
            animDict = "amb@prop_human_bum_bin@idle_b",
            anim = "idle_d",
            flags = 16,
          }, {}, {}, function()
            StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
          end)
          Wait(5000)
          -- TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })


          Wait(100)
          -- TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })
          Wait(500)
          QBCore.Functions.Progressbar('po_usb', 'Accessing communication files...', 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {
            animDict = "amb@prop_human_bum_bin@idle_b",
            anim = "idle_d",
            flags = 16,
          }, {}, {}, function()
            StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
          end)
          Wait(10000)
          QBCore.Functions.Notify(
            'Extraction complete...', 'primary',
            3000)

          TriggerServerEvent('mg:server:laptopItem')
        else
          QBCore.Functions.Notify('You dont have the right tools', 'error', 3000)
        end
      else
        QBCore.Functions.Notify("System seems to be on a cooldown", 'error')
      end
    end)
  else
    QBCore.Functions.Notify("A laptop damaged by either the intruder or the electrical rewiring...", 'error')
  end
end)

-- Weed Warehouse Gangsters (normal)
RegisterCommand('spawngangsters', function()
  WarehouseGangsters()
end)

function WarehouseGangsters()
  if Config.Patrol == true then
    RequestModel('Dubsta2')
    while not HasModelLoaded('Dubsta2') do
      Wait(1)
    end

    RequestModel(`g_m_y_famdnf_01`)
    while not HasModelLoaded(`g_m_y_famdnf_01`) do
      Wait(1)
    end

    RequestModel(`g_m_y_famdnf_01`)
    while not HasModelLoaded(`g_m_y_famdnf_01`) do
      Wait(1)
    end

    vehicle = CreateVehicle('Dubsta2', vector4(598.86, 2659.26, 41.1, 356.51), true, false)

    driver = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, -1, true, false)

    if Config.GangstersVehicle == 1 then
      passenger = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, 0, true, false)
      SetPedRelationshipGroupHash(passenger, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(passenger, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
      TaskDriveBy(passenger, PlayerPedId())
      SetPedAccuracy(passenger, Config.PassengerAccuracy)
      SetPedCombatRange(passenger, 0)
    else
    end
    if Config.GangstersVehicle == 2 then
      passenger = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, 0, true, false)
      passenger2 = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, 1, true, false)
      SetPedRelationshipGroupHash(passenger, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(passenger, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
      TaskDriveBy(passenger, PlayerPedId())
      SetPedAccuracy(passenger, Config.PassengerAccuracy)
      SetPedCombatRange(passenger, 0)

      SetPedRelationshipGroupHash(passenger2, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(passenger2, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
      TaskDriveBy(passenger2, PlayerPedId())
      SetPedAccuracy(passenger2, Config.PassengerAccuracy)
      SetPedCombatRange(passenger2, 0)
    end
    if Config.GangstersVehicle == 3 then
      passenger = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, 0, true, false)
      passenger2 = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, 1, true, false)
      passenger3 = CreatePedInsideVehicle(vehicle, 6, `g_m_y_famdnf_01`, 2, true, false)
      SetPedRelationshipGroupHash(passenger, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(passenger, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
      TaskDriveBy(passenger, PlayerPedId())
      SetPedAccuracy(passenger, Config.PassengerAccuracy)
      SetPedCombatRange(passenger, 0)

      SetPedRelationshipGroupHash(passenger2, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(passenger2, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
      TaskDriveBy(passenger2, PlayerPedId())
      SetPedAccuracy(passenger2, Config.PassengerAccuracy)
      SetPedCombatRange(passenger2, 0)

      SetPedRelationshipGroupHash(passenger3, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(passenger3, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
      TaskDriveBy(passenger3, PlayerPedId())
      SetPedAccuracy(passenger3, Config.PassengerAccuracy)
      SetPedCombatRange(passenger3, 0)
      -- SetCanAttackFriendly(passenger,false,true)
      -- SetPedDropsWeaponsWhenDead(passenger,false)
    else
    end

    Player = GetEntityCoords(PlayerPedId())

    TaskVehicleFollow(driver, vehicle, PlayerPedId(), -1, 6, 1)
    TaskVehicleChase(driver, Player)
    SetPedCombatRange(driver, 2)
    SetPedFleeAttributes(driver, 0, 0)
    SetPedCombatAttributes(driver, 46, true)
    SetPedCombatAttributes(driver, 1, true)
    SetPedCombatAttributes(driver, 2, true)
    SetPedRelationshipGroupHash(driver, GetHashKey("HATES_PLAYER"))
    SetEntityInvincible(driver, false)
    SetPedSeeingRange(driver, 0.0)
    SetPedHearingRange(driver, 0.0)
    SetPedAlertness(driver, 3)
    SetPedKeepTask(driver, true)
    SetVehicleEngineOn(vehicle, true, 1, 1)
    -- SET_VEHICLE_MOD
    SetVehicleMod(
      vehicle --[[ Vehicle ]],
      VMT_TURBO --[[ integer ]],
      18 --[[ integer ]],
      false --[[ boolean ]]
    )
    SetVehicleMod(
      vehicle --[[ Vehicle ]],
      VMT_ENGINE --[[ integer ]],
      11 --[[ integer ]],
      false --[[ boolean ]]
    )
    SetVehicleMod(
      vehicle --[[ Vehicle ]],
      VMT_SPOILER --[[ integer ]],
      0 --[[ integer ]],
      false --[[ boolean ]]
    )
    ModifyVehicleTopSpeed(
      vehicle --[[ Vehicle ]],
      200 --[[ number ]]
    )
  else
  end
end

-- Additional 'on-foot' Gangsters
RegisterCommand('spawngangstersonfoot', function()
  WarehouseGangstersOnFoot()
end)

function WarehouseGangstersOnFoot()
  if Config.PatrolOnFoot == true then
    -- RequestModel('SultanRS')
    -- while not HasModelLoaded('SultanRS') do
    --   Wait(1)
    -- end

    RequestModel(`g_m_y_famdnf_01`)
    while not HasModelLoaded(`g_m_y_famdnf_01`) do
      Wait(1)
    end

    if Config.GangstersOnFoot == 1 then
      gangster = CreatePed(26, "g_m_y_famdnf_01", 588.25, 2783.62, 43.48, 308.86, false, false)
      SetPedRelationshipGroupHash(gangster, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(gangster, GetHashKey(Config.OnFootWeapon), Config.OnFootAmmo, false, true)
      SetPedAccuracy(gangster, Config.OnFootAccuracy)
      SetPedCombatRange(gangster, 0)
    else
    end
    if CoConfig.GangstersOnFoot == 2 then
      gangster = CreatePed(26, "g_m_y_famdnf_01", 588.25, 2783.62, 43.48, 308.86, false, false)
      gangster2 = CreatePed(26, "g_m_y_famdnf_01", 588.25, 2783.62, 43.48, 308.86, false, false)
      SetPedRelationshipGroupHash(gangster, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(gangster, GetHashKey(Config.OnFootWeapon), Config.OnFootAmmo, false, true)
      SetPedAccuracy(gangster, Config.OnFootAccuracy)
      SetPedCombatRange(gangster, 0)

      SetPedRelationshipGroupHash(gangster2, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(gangster2, GetHashKey(Config.OnFootWeapon), Config.OnFootAmmo, false, true)
      SetPedAccuracy(gangster2, Config.OnFootAccuracy)
      SetPedCombatRange(gangster2, 0)
    end
    if CoConfig.GangstersOnFoot == 3 then
      gangster = CreatePed(26, "g_m_y_famdnf_01", 588.25, 2783.62, 43.48, 308.86, false, false)
      gangster2 = CreatePed(26, "g_m_y_famdnf_01", 588.25, 2783.62, 43.48, 308.86, false, false)
      gangster3 = CreatePed(26, "g_m_y_famdnf_01", 588.25, 2783.62, 43.48, 308.86, false, false)
      SetPedRelationshipGroupHash(gangster, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(gangster, GetHashKey(Config.OnFootWeapon), Config.OnFootAmmo, false, true)
      SetPedAccuracy(gangster, Config.OnFootAccuracy)
      SetPedCombatRange(gangster, 0)

      SetPedRelationshipGroupHash(gangster2, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(gangster2, GetHashKey(Config.OnFootWeapon), Config.OnFootAmmo, false, true)
      SetPedAccuracy(gangster2, Config.OnFootAccuracy)
      SetPedCombatRange(gangster2, 0)

      SetPedRelationshipGroupHash(gangster3, GetHashKey("HATES_PLAYER"))
      GiveWeaponToPed(gangster3, GetHashKey(Config.OnFootWeapon), Config.OnFootAmmo, false, true)
      SetPedAccuracy(gangster3, Config.OnFootAccuracy)
      SetPedCombatRange(gangster3, 0)
    else
    end

    Player = GetEntityCoords(PlayerPedId())

    TaskVehicleFollow(driver, vehicle, PlayerPedId(), -1, 6, 1)
    TaskVehicleChase(driver, Player)
    SetPedCombatRange(driver, 2)
    SetPedFleeAttributes(driver, 0, 0)
    SetPedCombatAttributes(driver, 46, true)
    SetPedCombatAttributes(driver, 1, true)
    SetPedCombatAttributes(driver, 2, true)
    SetPedRelationshipGroupHash(driver, GetHashKey("HATES_PLAYER"))
    SetEntityInvincible(driver, false)
    SetPedSeeingRange(driver, 0.0)
    SetPedHearingRange(driver, 0.0)
    SetPedAlertness(driver, 3)
    SetPedKeepTask(driver, true)
    SetVehicleEngineOn(vehicle, true, 1, 1)
  else
  end
end

-- Flee Guards --
RegisterCommand('despawnguards', function()
  StopWarehouseGuards()
end)

function StopWarehouseGuards()
  Wait(20000)
  -- In Vehicle --
  ClearPedTasks(
    driver
  )
  ClearPedTasks(
    passenger
  )
  ClearPedTasks(
    passenger2
  )
  ClearPedTasks(
    passenger3
  )
  -- On Foot --
  ClearPedTasks(
    gangster
  )
  ClearPedTasks(
    gangster2
  )
  ClearPedTasks(
    gangster3
  )
  QBCore.Functions.Notify('Incoming police presence scared off the gangsters...', 'primary', 8000)
  -- In Vehicle --
  SetPedRelationshipGroupHash(passenger, GetHashKey("GANG_1"))
  SetPedRelationshipGroupHash(passenger2, GetHashKey("GANG_1"))
  SetPedRelationshipGroupHash(passenger3, GetHashKey("GANG_1"))
  -- On Foot --
  SetPedRelationshipGroupHash(gangster, GetHashKey("GANG_1"))
  SetPedRelationshipGroupHash(gangster2, GetHashKey("GANG_1"))
  SetPedRelationshipGroupHash(gangster3, GetHashKey("GANG_1"))

  -- Flee the Gangster Peds (Vehicle) --
  TaskReactAndFleePed(
    driver --[[ Ped ]],
    PlayerPedId() --[[ Ped ]]
  )

  RemoveWeaponFromPed(
    passenger --[[ Ped ]],
    GetHashKey('WEAPON_PISTOL')
  )
  RemoveWeaponFromPed(
    passenger2 --[[ Ped ]],
    GetHashKey('WEAPON_PISTOL')
  )
  RemoveWeaponFromPed(
    passenger3 --[[ Ped ]],
    GetHashKey('WEAPON_PISTOL')
  )
  -- Flee the Gangster Peds (On Foot) --
  TaskReactAndFleePed(
    gangster --[[ Ped ]],
    PlayerPedId() --[[ Ped ]]
  )
  TaskReactAndFleePed(
    gangster2 --[[ Ped ]],
    PlayerPedId() --[[ Ped ]]
  )
  TaskReactAndFleePed(
    gangster3 --[[ Ped ]],
    PlayerPedId() --[[ Ped ]]
  )
  RemoveWeaponFromPed(
    gangster --[[ Ped ]],
    GetHashKey('WEAPON_PISTOL')
  )
  RemoveWeaponFromPed(
    gangster2 --[[ Ped ]],
    GetHashKey('WEAPON_PISTOL')
  )
  RemoveWeaponFromPed(
    gangster3 --[[ Ped ]],
    GetHashKey('WEAPON_PISTOL')
  )
end
