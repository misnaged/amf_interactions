 Citizen.CreateThread(function()
	SpawnBarmenSD()
end, false)

function SpawnBarmenSD()
	BarmenSD = GetHashKey("U_M_M_NbxBartender_01")

	RequestModel(BarmenSD)
	while not HasModelLoaded(BarmenSD) do
		RequestModel(BarmenSD)
		Wait(1)
	end
	local barmenspawn = CreatePed(BarmenSD, 2639.8992, -1223.3961, 53.3804, 101.24, true, false, false, false)
	 Citizen.InvokeNative(0x283978A15512B2FE, barmenspawn, true)
	  SetEntityVisible(BarmenSD, true)
	  SetEntityAlpha(BarmenSD, 255, false)
	  SetModelAsNoLongerNeeded("U_M_M_NbxBartender_01")
	  Citizen.Wait(10)
end
