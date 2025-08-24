local Vehicles
local Customs = {}

RegisterNetEvent('esx_lscustom:startModing', function(props, netId)
	local src = tostring(source)
	if Customs[src] then
		Customs[src][tostring(props.plate)] = {props = props, netId = netId}
	else
		Customs[src] = {}
		Customs[src][tostring(props.plate)] = {props = props, netId = netId}
	end
end)

RegisterNetEvent('esx_lscustom:stopModing', function(plate)
	local src = tostring(source)
	if Customs[src] then
		Customs[src][tostring(plate)] = nil
	end
end)

AddEventHandler('esx:playerDropped', function(src)
    src = tostring(src)
	local playersCount = #GetPlayers()
    if Customs[src] then
        for k, v in pairs(Customs[src]) do
            local entity = NetworkGetEntityFromNetworkId(v.netId)
            if DoesEntityExist(entity) then
                if playersCount > 0 then
                    TriggerClientEvent('esx_lscustom:restoreMods', -1, v.netId, v.props)
                else
                    DeleteEntity(entity)
                end
            end
        end
        Customs[src] = nil
    end
end)

RegisterNetEvent('esx_lscustom:buyMod', function(price)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	price = tonumber(price)

  if not xPlayer then return print('^3[WARNING]^0 The player could\'nt be found.') end

	if price < xPlayer.getMoney() then
		TriggerClientEvent('esx_lscustom:installMod', source)
		TriggerClientEvent('esx:showNotification', source, TranslateCap('purchased'))
		xPlayer.removeMoney(price, "LSC Purchase")
	else
		TriggerClientEvent('esx_lscustom:cancelInstallMod', source)
		TriggerClientEvent('esx:showNotification', source, TranslateCap('not_enough_money'))
	end
end)

RegisterNetEvent('esx_lscustom:refreshOwnedVehicle', function(vehicleProps, netId)
	local src = tostring(source)
	local xPlayer = ESX.GetPlayerFromId(source)

  if not vehicleProps then return print('^3[WARNING]^0 The vehicle Props could\'nt be found.') end
  if not vehicleProps.plate then return print('^3[WARNING]^0 The vehicle plate could\'nt be found.') end
  if not vehicleProps.model then return print('^3[WARNING]^0 The vehicle model could\'nt be found.') end

  if not xPlayer then return print('^3[WARNING]^0 The player could\'nt be found.') end

	MySQL.single('SELECT vehicle FROM owned_vehicles WHERE plate = ?', {vehicleProps.plate},
	function(result)
		if result then
			local vehicle = json.decode(result.vehicle)
			if vehicleProps.model == vehicle.model then
				MySQL.update('UPDATE owned_vehicles SET vehicle = ? WHERE plate = ?', {json.encode(vehicleProps), vehicleProps.plate})
				if Customs[src] then
					if Customs[src][tostring(vehicleProps.plate)]  then
						Customs[src][tostring(vehicleProps.plate)].props = vehicleProps
					else
						Customs[src][tostring(vehicleProps.plate)] = {props = vehicleProps, netId = netId}
					end
				else
					Customs[src] = {}
					Customs[src][tostring(vehicleProps.plate)] = {props = vehicleProps, netId = netId}
				end
        local veh = NetworkGetEntityFromNetworkId(netId)
				local Veh_State = Entity(veh).state.VehicleProperties
				if Veh_State then
					Entity(veh).state:set("VehicleProperties", vehicleProps, true)
        end
			else
				print(('[^3WARNING^7] Player ^5%s^7 Attempted To upgrade with mismatching vehicle model'):format(xPlayer.source))
			end
		end
	end)
end)

RegisterNetEvent('custom_repair:attemptRepair')
AddEventHandler('custom_repair:attemptRepair', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.getMoney() >= Config.RepairPrice then
        xPlayer.removeMoney(Config.RepairPrice)
        TriggerClientEvent('custom_repair:doRepair', source)
    else
        TriggerClientEvent('custom_repair:insufficientFunds', source)
    end
end)

RegisterNetEvent('item_repair:consumeKit', function(kitType)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not kitType then return end

    local itemName
    if kitType == 'toolkit' then
        itemName = 'toolkit'
    elseif kitType == 'repairkit' then
        itemName = 'repairkit'
    elseif kitType == 'bodykit' then
        itemName = 'bodykit'
    elseif kitType == 'tirekit' then
        itemName = 'tirekit'
    end
    if not itemName then return end

    local count = xPlayer.getInventoryItem(itemName).count or 0
    if count <= 0 then
        print(('[custom_repair] Player %s tried to consume %s without having it'):format(src, itemName))
        return
    end

    xPlayer.removeInventoryItem(itemName, 1)
end)


-- RegisterNetEvent('item_repair:removeItem', function(kit)
--     local xPlayer = ESX.GetPlayerFromId(source)
-- 		if not xPlayer or not kitType then return end

--     local itemName
--     if kitType == 'toolkit' then
--         itemName = 'toolkit'
--     elseif kitType == 'repairkit' then
--         itemName = 'repairkit'
--     elseif kitType == 'bodykit' then
--         itemName = 'bodykit'
--     elseif kitType == 'tirekit' then
--         itemName = 'tirekit'
--     end
--     if not itemName then return end

--     local count = xPlayer.getInventoryItem(itemName).count or 0
--     if count <= 0 then
--         print(('[custom_repair] Player %s tried to consume %s without having it'):format(src, itemName))
--         return
--     end

--     xPlayer.removeInventoryItem(itemName, 1)
-- end)

ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if not Vehicles then
		Vehicles = MySQL.query.await('SELECT model, price FROM vehicles')
	end
	cb(Vehicles)
end)
