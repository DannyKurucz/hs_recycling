ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)


RegisterNetEvent('box:chance')
AddEventHandler('box:chance', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem(cfg.chanceitem["item"], cfg.chanceitemcount["item"])
    
end)
RegisterNetEvent('box:chance2')
AddEventHandler('box:chance2', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem(cfg.chanceitem["item"], cfg.chanceitemcount["item2"])
    
end)

RegisterNetEvent('box:items')
AddEventHandler('box:items', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.canCarryItem(RandomItem(), RandomNumber()) then
        xPlayer.addInventoryItem(RandomItem(), RandomNumber())    
    end

end)

Items = {
    cfg.item["item0"],
    cfg.item["item1"],
    cfg.item["item2"],
    cfg.item["item3"],
    cfg.item["item4"],
    cfg.item["item5"],
}

function RandomItem()
    return Items[math.random(#Items)]
end
  
function RandomNumber()
    return math.random(cfg.random["count"])
end
