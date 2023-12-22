box1 = false
box2 = false
box3 = false
box4 = false
box5 = false
box6 = false

-- Outside Warehouse --
exports['qb-target']:AddBoxZone("warehouseOutside2", vector3(620.42, 2798.02, 42.01), 0.7, 0.5, {
  name = "warehouseOutside2",
  heading = 281.05,
  minZ = 41.01,
  maxZ = 43.01,
  debugpoly = false,
}, {
  options = {
    {
      type = "client",
      event = "warehouse:EnterLocation2",
      icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
      label = "Rewire Electrical System",
    },
  },
  distance = 2.5,
})

--Weed Warehouse --
exports['qb-target']:AddBoxZone("warehouseInside", vector3(1066.3, -3183.42, -39.16), 1.4, 1.4, {
  name = "warehouseInside",
  heading = 270.77,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
    {
      type = "client",
      event = "mg-gangwarehouses:ExitDoor",
      icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
      label = "Exit",
    },
  },
  distance = 2.5,
})

-- Weed Props --
function ExportWeed1()
  -- vector3(1063.03, -3181.83, -39.16)
  exports['qb-target']:AddBoxZone("weedbox1", vector3(1063.03, -3181.83, -40.0), 2.0, 2.0, {
    name = "weedbox1",
    heading = 0, --270.95
    minZ = -40.0,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:client:target:pickupWeed",
        icon = Target.IconsActive["weedPallet"],
        label = Target.Label["weedPallet"],
        targeticon = Target.Icon["weedPallet"],
        action = function()
          TriggerEvent("warehouse:client:target:pickupWeed")
          RemoveWeed1()
        end,
      },
    },
    distance = 2.5,
  })
end

function ExportWeed2() -- vector3(1063.91, -3188.16, -39.13)
  exports['qb-target']:AddBoxZone("weedbox2", vector3(1062.88, -3189.2, -40.0), 2.0, 2.0, {
    name = "weedbox2",
    heading = 0,
    minZ = -40.0,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:client:target:pickupWeed",
        icon = Target.IconsActive["weedPallet"],
        label = Target.Label["weedPallet"],
        targeticon = Target.Icon["weedPallet"],
        action = function()
          TriggerEvent("warehouse:client:target:pickupWeed")
          RemoveWeed2()
        end,
      },
    },
    distance = 2.5,
  })
end

function ExportWeed3()
  exports['qb-target']:AddBoxZone("weedbox3", vector3(1058.49, -3195.39, -40.0), 2.0, 2.0, {
    name = "weedbox3",
    heading = 0,
    minZ = -40.0,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:client:target:pickupWeed",
        icon = Target.IconsActive["weedPallet"],
        label = Target.Label["weedPallet"],
        targeticon = Target.Icon["weedPallet"],
        action = function()
          TriggerEvent("warehouse:client:target:pickupWeed")
          RemoveWeed3()
        end,
      },
    },
    distance = 2.5,
  })
end

function ExportWeed4()
  exports['qb-target']:AddBoxZone("weedbox4", vector3(1040.01, -3197.26, -39.15), 2.0, 2.0, {
    name = "weedbox4",
    heading = 0,
    minZ = -39.15,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:client:target:pickupWeed",
        icon = Target.IconsActive["weedPallet"],
        label = Target.Label["weedPallet"],
        targeticon = Target.Icon["weedPallet"],
        action = function()
          TriggerEvent("warehouse:client:target:pickupWeed")
          RemoveWeed4()
        end,
      },
    },
    distance = 2.5,
  })
end

function ExportWeed5()
  exports['qb-target']:AddBoxZone("weedbox5", vector3(1041.33, -3193.03, -39.15), 2.0, 2.0, {
    name = "weedbox5",
    heading = 0,
    minZ = -39.15,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:client:target:pickupWeed",
        icon = Target.IconsActive["weedPallet"],
        label = Target.Label["weedPallet"],
        targeticon = Target.Icon["weedPallet"],
        action = function()
          TriggerEvent("warehouse:client:target:pickupWeed")
          RemoveWeed5()
        end,
      },
    },
    distance = 2.5,
  })
end

function ExportWeed6()
  exports['qb-target']:AddBoxZone("weedbox6", vector3(1044.93, -3192.92, -39.15), 2.0, 2.0, {
    name = "weedbox6",
    heading = 0,
    minZ = -39.15,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:client:target:pickupWeed",
        icon = Target.IconsActive["weedPallet"],
        label = Target.Label["weedPallet"],
        targeticon = Target.Icon["weedPallet"],
        action = function()
          TriggerEvent("warehouse:client:target:pickupWeed")
          RemoveWeed6()
        end
      },
    },
    distance = 2.5,
  })
end

-- Laptop --
function CheckLaptop()
  exports['qb-target']:AddBoxZone("laptop", vector3(1045.25, -3194.85, -38.36), 1.0, 0.5, {
    name = "laptop",
    heading = 270,
    minZ = -39.15,
    maxZ = -35.5,
    debugpoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "warehouse:AccessLaptop",
        icon = Target.IconsActive["laptop"],
        label = "Check the laptop",
        targeticon = Target.Icon["laptop"],
        action = function()
          TriggerEvent("warehouse:AccessLaptop")
          RemoveLaptop()
        end,
        job ~= 'police',

      },
    },
    distance = 2.5,
  })
end

-- dispatch --
exports['qb-target']:AddBoxZone("warehousepolice", vector3(620.57, 2800.5, 41.94), 1.4, 2, {
  name = "warehousepolice",
  heading = 354,
  debugPoly = false,
  minZ = 41.94,
  maxZ = 46.94,
}, {
  options = {
    {
      type = "client",
      event = "mg-gangwarehouses:EnterDoorPolice",
      icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
      label = 'Break Open Door',
      job = 'police',
    }
  },
  distance = 2.5,
})


-- remove warehouse target after search
function RemoveLocation1()
  exports['qb-target']:RemoveZone("box1")
end

function RemoveLocation2()
  exports['qb-target']:RemoveZone("box2")
end

function RemoveLocation3()
  exports['qb-target']:RemoveZone("box3")
end

function RemoveLocation4()
  exports['qb-target']:RemoveZone("box4")
end

function RemoveLocation5()
  exports['qb-target']:RemoveZone("box5")
end

function RemoveLocation6()
  exports['qb-target']:RemoveZone("box6")
end

-- remove Weed warehouse target after search
function RemoveWeed1()
  exports['qb-target']:RemoveZone("weedbox1")
end

function RemoveWeed2()
  exports['qb-target']:RemoveZone("weedbox2")
end

function RemoveWeed3()
  exports['qb-target']:RemoveZone("weedbox3")
end

function RemoveWeed4()
  exports['qb-target']:RemoveZone("weedbox4")
end

function RemoveWeed5()
  exports['qb-target']:RemoveZone("weedbox5")
end

function RemoveWeed6()
  exports['qb-target']:RemoveZone("weedbox6")
end

-- remove laptop target --
function RemoveLaptop()
  exports['qb-target']:RemoveZone("laptop")
end
