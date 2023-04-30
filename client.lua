--   Script Made By Raro --


-- Code Dont Touch (Unless you know what your doing) --
local nbrDisplaying = 1

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/ct', 'This will show dving a car in roleplay.')
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/cp', 'This will show checking pulse in roleplay.')
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/cc', 'This will show respawn in roleplay.')
end)

RegisterCommand('cc', function(source, args, raw)
    local text = ("~italic~~r~Calls County Corner To Location")
    TriggerServerEvent('3dTextDisplay:shareDisplay', text)
end)

RegisterCommand('cp', function(source, args, raw)
    local text = ("~italic~~r~Checks Patients Pulse")
    TriggerServerEvent('3dTextDisplay:shareDisplay', text)
end)

RegisterCommand('ct', function(source, args, raw)
    local text = ("~italic~~r~Calls County Tow To Location")
    TriggerServerEvent('3dTextDisplay:shareDisplay', text)
end)


RegisterNetEvent('3dTextDisplay:triggerDisplay')
AddEventHandler('3dTextDisplay:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.15)
    Display(GetPlayerFromServerId(source), text, offset)
end)

function Display(mePlayer, text, offset)
    local displaying = true

Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
end)
	
Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
               DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset-1.000, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3D(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.50, 0.50)
		SetTextFont(2)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    end
end

