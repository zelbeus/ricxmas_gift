RegisterNetEvent("ricxmas_gift:triggergift")
AddEventHandler("ricxmas_gift:triggergift", function()
    TriggerServerEvent("ricxmas_gift:addgift")
end)

  
  --Basic Notification
RegisterNetEvent('Notification:left_xmas')
AddEventHandler('Notification:left_xmas', function(t1, t2, dict, txtr, timer)
    if not HasStreamedTextureDictLoaded(dict) then
        RequestStreamedTextureDict(dict, true) 
        while not HasStreamedTextureDictLoaded(dict) do
            Wait(5)
        end
    end
    if txtr ~= nil then
        exports.ricxmas_gift.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    else
        local txtr = "tick"
        exports.ricxmas_gift.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    end
end)

