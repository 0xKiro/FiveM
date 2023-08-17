ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    for _, info in pairs(Config.gouv.blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, info.scale)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

local identite = {
    {
        name = 'givecard',
        label = "Demander une carte d'identité",
        onSelect = function()
            ESX.TriggerServerCallback('identiteusetarget', function(hasCard)
                if not hasCard then
                    TriggerServerEvent("ajouterCarteIdentite")
                else
                    ESX.ShowNotification("~r~Vous avez déjà une carte d'identité.")
                end
            end)
        end,
    },
}


local ped = {
	"cs_molly"
}


exports.ox_target:addModel(ped, identite)