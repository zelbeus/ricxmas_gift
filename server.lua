data = {}
local QBRItems
local framework = "redemrp" --"redemrp" or "qbr"

if framework == "redemrp" then
	TriggerEvent("redemrp_inventory:getData",function(call)
	    data = call
	end)
elseif framework == "qbr" then 
	QBRItems = exports['qbr-core']:GetItems()
end


RegisterServerEvent("ricxmas_gift:addgift")
AddEventHandler("ricxmas_gift:addgift", function()
	local _source = source
    local label
    local text = ""
if framework == "redemrp" then
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
elseif framework == "qbr" then 
     local random = math.random(1,#Config.Gifts)
     if  Config.Gifts[random][1] ~= "money" then
          local itemData = QBRItems[Config.Gifts[random][1]]
 	  local User = exports['qbr-core']:GetPlayer(_source)
	  User.Functions.AddItem(Config.Gifts[random][1], Config.Gifts[random][2])
          local label = itemData.label
          text = Config.Recieved.."\n"..label.." ("..Config.Gifts[random][2]..")"
     else
          local User = exports['qbr-core']:GetPlayer(_source)
          User.Functions.AddMoney("cash", Config.Gifts[random][2]), "desc")
          text = Config.Recieved.."\n+$"..Config.Gifts[random][2]
     end
          TriggerClientEvent("Notification:left_xmas", _source, Config.Title, text, "scoretimer_textures", "scoretimer_generic_tick", 2000)
end
end)


local hour = (60*1000)*60
    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(hour)
        TriggerClientEvent("ricxmas_gift:triggergift", -1)
    end
end)
