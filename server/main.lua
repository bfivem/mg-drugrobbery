local QBCore = exports['qb-core']:GetCoreObject()
local CoolDown = false

-- WEBHOOKS --
-- I am unsure if the webhooks work, as I have yet to test them. --
local Webhooks = {
    ['default'] = '',
    ['warehouserobbery'] = '', -- Put your webhook for logs here
}
-- Useful: https://www.spycolor.com/
local Colors = {
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('mg:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Warehouse Logs',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'Warehouse Logs', embeds = embedData }),
        { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST',
            json.encode({ username = 'Warehouse Logs', content = '@everyone' }),
            { ['Content-Type'] = 'application/json' })
    end
end)

-- EVENTS --
-- Cooldown
RegisterServerEvent('mg:server:cool', function()
    CoolDown = true
    local timer = Config.CoolDown * (60 * 1000)
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            CoolDown = false
        end
    end
end)

-- Cooldown Callback
QBCore.Functions.CreateCallback("mg:server:CooldownCallback", function(source, cb)
    if CoolDown then
        cb(true)
    else
        cb(false)
    end
end)

-- Get Item (Weed Warehouse)
RegisterNetEvent('mg:server:getItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _ = 1, math.random(1, Config.MaxItemsReceivedWeed), 1 do
        local randItem2 = Config.ItemTableWeed[math.random(1, #Config.ItemTableWeed)]
        local amount = math.random(Config.MinItemReceivedQtyWeed, Config.MaxItemReceivedQtyWeed)
        Player.Functions.AddItem(randItem2, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem2], 'add')
        Wait(500)
        TriggerEvent('mg:server:CreateLog', 'warehouserobbery', 'Warehouse Robbery', 'red',
            Player.PlayerData.charinfo.firstname ..
            ' ' ..
            Player.PlayerData.charinfo.lastname ..
            ' successfully Robbed Warehouse and got ' .. amount .. ' ' .. randItem2,
            false)
    end
end)

-- Get Item (Laptop) --
RegisterNetEvent('mg:server:laptopItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for _ = 1, math.random(1, Config.MaxItemsReceivedLaptop), 1 do
        local randomNumber = math.random(20)
        local randItem = (randomNumber == 1) and Config.ItemTableLaptop[1] or Config.ItemTableLaptop[2]

        local amount = Config.MaxItemsReceivedQtyLaptop
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Wait(500)

        TriggerEvent('mg:server:CreateLog', 'warehouserobbery', 'Warehouse Robbery', 'red',
            Player.PlayerData.charinfo.firstname ..
            ' ' ..
            Player.PlayerData.charinfo.lastname ..
            ' successfully Robbed Warehouse and got ' .. amount .. ' ' .. randItem,
            false)
    end
end)

-- Remove hacking device --
RegisterNetEvent('mg:server:removeHackingDevice', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('electronickit', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['electronickit'], 'remove')
end)
