Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_staffmode")

local staffmode = {}

RegisterCommand("staffmode", function(source, args)
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id, "player.phone"}) then 
		if not staffmode[source] then 
			TriggerClientEvent("vRP:staffon", source, true)
			-- Inlocuiesti tu notifcarile astea cu ce ai tu :)
			TriggerClientEvent('notifications', source, "#affdac", "xNarcis08 - Notify", "STAFF-MODE ACTIVAT ")
			staffmode[source] = source
		else
			TriggerClientEvent("vRP:staffon", source, false)
			-- Same shit
			TriggerClientEvent('notifications', source, "#affdac", "xNarcis08 - Notify", "STAFF-MODE DEZACTIVAT ")
			staffmode[source] = nil
		end
	end
end)