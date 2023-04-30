RegisterServerEvent('3dTextDisplay:shareDisplay') 
AddEventHandler('3dTextDisplay:shareDisplay', function(text)
	TriggerClientEvent('3dTextDisplay:triggerDisplay', -1, text, source)
end)


