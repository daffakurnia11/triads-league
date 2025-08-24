local ESX = exports['es_extended']:getSharedObject()
local ox_inv = exports.ox_inventory

RegisterNetEvent('mechanic_shop:buyItem', function(itemName)
  local src = source
  local xPlayer = ESX.GetPlayerFromId(src)
  if not xPlayer then return end

  -- cari item valid + harga dari Config
  local wanted, price
  for _, v in ipairs(Config.ShopItems) do
    if v.item == itemName then
      wanted = v.item
      price = tonumber(v.price)
      break
    end
  end

  if not wanted or not price then
    TriggerClientEvent('mechanic_shop:notify', src, 'Item tidak valid.')
    return
  end

  -- cek uang cash
  if (xPlayer.getMoney() or 0) < price then
    TriggerClientEvent('mechanic_shop:notify', src, 'Uangmu tidak cukup.')
    return
  end

  -- cek kapasitas tas
  if not ox_inv:CanCarryItem(src, wanted, 1) then
    TriggerClientEvent('mechanic_shop:notify', src, 'Tasmu penuh.')
    return
  end

  xPlayer.removeMoney(price)
  ox_inv:AddItem(src, wanted, 1)
  TriggerClientEvent('mechanic_shop:notify', src, ('Berhasil membeli %s.'):format(wanted))
end)
