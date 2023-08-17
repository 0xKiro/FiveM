ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("ajouterCarteIdentite")
AddEventHandler("ajouterCarteIdentite", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasCard = xPlayer.getInventoryItem("carteidentite").count >= 1

    if not hasCard then
        xPlayer.addInventoryItem("carteidentite", 1)
    end
end)

ESX.RegisterServerCallback('identiteusetarget', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasCard = xPlayer.getInventoryItem("carteidentite").count >= 1

    cb(hasCard)
end)


