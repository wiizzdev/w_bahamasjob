ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'bahamas', 'alerte bahamas', true, true)
TriggerEvent('esx_society:registerSociety', 'bahamas', 'bahamas', 'society_bahamas', 'society_bahamas', 'society_bahamas', {type = 'public'})

RegisterServerEvent('bahamas:ouvert')
AddEventHandler('bahamas:ouvert', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Bahamas", "Annonce", "Le Bahamas est désormais ~g~Ouvert ~s~!", "CHAR_MP_MORS_MUTUAL", 5)
    end
end)

RegisterServerEvent('bahamas:ferme')
AddEventHandler('bahamas:ferme', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Bahamas", "Annonce", "Le Bahamas est désormais ~r~Fermé ~s~!", "CHAR_MP_MORS_MUTUAL", 5)
	end
end) 

RegisterServerEvent('bahamas:perso')
AddEventHandler('bahamas:perso', function(notif)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Bahamas", "Annonce", notif, "CHAR_MP_MORS_MUTUAL", 5)
    end
end)

ESX.RegisterServerCallback('bahamas:playerinventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = xPlayer.inventory
    local all_items = {}
    for k,v in pairs(items) do
        if v.count > 0 then
            table.insert(all_items, {label = v.label, item = v.name, nb = v.count})
        end
    end
    cb(all_items)
end)

ESX.RegisterServerCallback('bahamas:getStockItems', function(source, cb)
    local all_items = {}
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bahamas', function(inventory)
        for k,v in pairs(inventory.items) do
            if v.count > 0 then
                table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
            end
        end
    end)
    cb(all_items)
end)

RegisterServerEvent('bahamas:putStockItems')
AddEventHandler('bahamas:putStockItems', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item_in_inventory = xPlayer.getInventoryItem(itemName).count
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bahamas', function(inventory)
        if item_in_inventory >= count and count > 0 then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
            TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous avez déposé "..Config.Color.." "..count.." "..itemName.." ~s~dans le coffre de la société")
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, "~r~Vous n'en avez pas assez sur vous")
        end
    end)
end)

RegisterServerEvent('bahamas:takeStockItems')
AddEventHandler('bahamas:takeStockItems', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bahamas', function(inventory)
        xPlayer.addInventoryItem(itemName, count)
        inventory.removeItem(itemName, count)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous avez retiré "..Config.Color..""..count.." "..itemName.." ~s~du coffre de la société")
    end)
end)

RegisterServerEvent('bahamas:preparer')
AddEventHandler('bahamas:preparer', function(name)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(name, 1)
end)