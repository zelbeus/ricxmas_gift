data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent("ricxmas_gift:addgift")
AddEventHandler("ricxmas_gift:addgift", function()
	local _source = source
    local label
    local text = ""
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        if user ~= nil then
            local random = math.random(1,#Config.Gifts)
            if  Config.Gifts[random][1] ~= "money" then
                local ItemData = data.getItem(_source, Config.Gifts[random][1])
                local ItemInfo = data.getItemData( Config.Gifts[random][1])
                ItemData.AddItem(Config.Gifts[random][2])
                local label = ItemInfo.label
                text = Config.Recieved.."\n"..label.." ("..Config.Gifts[random][2]..")"
            else
                user.addMoney(Config.Gifts[random][2])
                text = Config.Recieved.."\n+$"..Config.Gifts[random][2]
            end
            TriggerClientEvent("Notification:left_xmas", _source, Config.Title, text, "scoretimer_textures", "scoretimer_generic_tick", 2000)
        end
    end)
end)


local hour = (60*1000)*60
    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(hour)
        TriggerClientEvent("ricxmas_gift:triggergift", -1)
    end
end)