tvRP = Proxy.getInterface("vRP")


local staffon = false 
local clothing = nil 

RegisterNetEvent("vRP:staffon")
AddEventHandler("vRP:staffon", function(staffmode)
    staffon = staffmode
    if staffon then 
        if clothing == nil then 
            clothing = tvRP.getCustomization()
        end
        SetEntityInvincible(PlayerPedId(), true)
        local ped = "u_m_m_jesus_01" -- staff ped poti lasa si modelul default: mp_m_freemode_01
        RequestModel(ped)
        while not HasModelLoaded(ped) do
          Citizen.Wait(0)
        end

        SetPlayerModel(PlayerId(), ped)
        SetModelAsNoLongerNeeded(ped)
        SetPedComponentVariation(ped, 0, 0, 0, 0) --- https://docs.fivem.net/natives/?_0x262B14F48D29DE80 daca vrei sa ai skin-ul normal dar cu anumite componente schimbate ( gen sa ii dea un anumit hanorac cand e in staff-mode, o anumita sapca, etc)
    else
        SetEntityInvincible(PlayerPedId(), false)
        tvRP.setCustomization({clothing})
        clothing = nil 
    end
end)


function textStatus(x,y,scale,text,r,g,b,a, outline)
    SetTextFont(15)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end




Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      if staffon then
            textStatus(0.42, 0.375 + 0.01,0.25, "~r~[ ~w~STAFF DUTY ~r~]" or 0, 255,255,255,150)
            -- sau
            textStatus(0.17, 0.925 + 0.01,0.30, "~r~[ ~w~STAFF ~w~ON~r~ - ~w~DUTY~r~ ] " or 0, 255,255,255,150)
        -- le puteti pastra pe ambele/doar una/niciuna
      end
    end
end)

Citizen.CreateThread(function()
	while true do
        local xnarcis08 = 2500
		if staffon then
            xnarcis08 = 1
			SetEntityInvincible(PlayerPedId(), true)
			SetPedCanRagdoll(PlayerPedId(), false)
		else
            xnarcis08 = 1
			SetEntityInvincible(PlayerPedId(), false)
			SetPedCanRagdoll(PlayerPedId(), true)
		end
        Wait(xnarcis08)
	end
end)