local function loadModel(model)
    model = type(model) == 'string' and joaat(model) or model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

local function createBlip(data)
    if not data.blip then
        return
    end
    local b = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(b, data.blip.sprite or 402)
    SetBlipDisplay(b, 4)
    SetBlipScale(b, data.blip.scale or 0.8)
    SetBlipColour(b, data.blip.color or 46)
    SetBlipAsShortRange(b, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(data.blip.text or 'Toko Mekanik')
    EndTextCommandSetBlipName(b)
end

local function openShopMenu()
    local options = {}
    for _, v in ipairs(Config.ShopItems) do
        options[#options + 1] = {
            title = v.label,
            description = ('Harga: $%s'):format(v.price),
            icon = 'wrench',
            onSelect = function()
                TriggerServerEvent('mechanic_shop:buyItem', v.item)
            end
        }
    end

    lib.registerContext({
        id = 'mechanic_shop_menu',
        title = 'Toko Mekanik',
        options = options
    })
    lib.showContext('mechanic_shop_menu')
end

RegisterNetEvent('mechanic_shop:openMenu', openShopMenu)

CreateThread(function()
    local hasTarget = exports.ox_target ~= nil

    for i, pedData in ipairs(Config.Peds) do
        loadModel(pedData.model)
        local c = pedData.coords
        local ped = CreatePed(4, joaat(pedData.model), c.x, c.y, c.z - 1.0, c.w, false, true)

        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)

        if pedData.scenario then
            TaskStartScenarioInPlace(ped, pedData.scenario, 0, true)
        end

        createBlip(pedData)

        if hasTarget and pedData.useTarget then
            -- interaksi via ox_target
            exports.ox_target:addLocalEntity(ped, {{
                icon = 'fa-solid fa-wrench',
                label = 'Buka Toko Mekanik',
                onSelect = function()
                    openShopMenu()
                end,
                distance = 2.0
            }})
        else
            -- fallback: prompt E per ped
            CreateThread(function()
                local shown = false
                local promptText = '[E] Buka Toko Mekanik'
                while DoesEntityExist(ped) do
                    local sleep = 1000
                    local ply = PlayerPedId()
                    local pos = GetEntityCoords(ply)
                    local dist = #(pos - vec3(c.x, c.y, c.z))

                    if dist < 2.0 then
                        sleep = 0
                        if not shown then
                            lib.showTextUI(promptText)
                            shown = true
                        end
                        if IsControlJustReleased(0, 38) then -- E
                            openShopMenu()
                        end
                    elseif shown then
                        lib.hideTextUI()
                        shown = false
                    end
                    Wait(sleep)
                end
                if shown then
                    lib.hideTextUI()
                end
            end)
        end
    end
end)

RegisterNetEvent('mechanic_shop:notify', function(msg)
    if lib and lib.notify then
        lib.notify({
            title = 'Toko Mekanik',
            description = msg,
            type = 'inform'
        })
    else
        ESX.ShowNotification(msg)
    end
end)
