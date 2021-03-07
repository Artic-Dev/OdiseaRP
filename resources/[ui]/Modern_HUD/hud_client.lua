ESX = nil
myStrengthModifier = 1
isPlayerDead = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent("Kl_Hud:onTick")
AddEventHandler("Kl_Hud:onTick", function(status)

    TriggerEvent('esx_status:getStatus', 'hunger', function(status)
        food = status.val / 10000
    end)
    TriggerEvent('esx_status:getStatus', 'thirst', function(status)
        thirst = status.val / 10000
    end)
    TriggerEvent('esx_status:getStatus', 'stress', function(status)
        stress = status.val / 10000
    end)

end)




Citizen.CreateThread(function()
    while true do 
        local s = 500
        local ped = GetPlayerPed(-1)
        local MyPedVeh = GetVehiclePedIsIn(ped,false)
        local EstaEnElAgua = IsEntityInWater(ped)
        local EstaEnElAguaNadando = IsPedSwimming(ped)
        local Player = ESX.GetPlayerData()
        -- Rdarar
        if IsPedSittingInAnyVehicle(ped) and not IsPlayerDead(ped) then

            DisplayRadar(true)
        

        elseif not IsPedSittingInAnyVehicle(ped) then

            DisplayRadar(false)

        end

        SendNUIMessage({
            pauseMenu = IsPauseMenuActive();
            armour = GetPedArmour(PlayerPedId());
            health = GetEntityHealth(PlayerPedId())-100;
            food = food;
            thirst = thirst;
            stress = stress;
            estoyencoche = IsPedSittingInAnyVehicle(ped);
            id = GetPlayerServerId(PlayerId());
            EstaEnElAgua = IsEntityInWater(ped);
            EstaEnElAguaNadando = IsPedSwimming(ped);
            oxigenoagua = GetPlayerUnderwaterTimeRemaining(PlayerId())*10;
            oxigeno = 100-GetPlayerSprintStaminaRemaining(PlayerId());
            Accounts = Player.accounts;
            Player = Player;
            coordenadas = GetEntityCoords(ped, false);

            
        })

        RegisterCommand('hud',function()
            SendNUIMessage({
                hud = true
            })
        end)

        Citizen.Wait(s)
        
	end
	
end)