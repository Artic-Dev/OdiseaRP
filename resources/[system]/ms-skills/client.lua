local skills = ''
if Config.SkillsCommand then
	RegisterCommand(Config.SkillsCommand, function(source, args, rawCommand)
		FetchSkills()
		for k,v in pairs(Config.Skills) do
			skills = skills .. ('~y~' .. k .. ': ~s~' .. v['Current'] .. '%\n')
		end
		SetNotificationTextEntry('STRING')
		AddTextComponentString(skills)
		DrawNotification(false, false)
	end)
end

if Config.ResetCommand then
	RegisterCommand(Config.ResetCommand, function(source, args, rawCommand)
		for k,v in pairs(Config.Skills) do
			UpdateSkill(k, -v['Current'])
			ShowNotification('~r~You have reset all your skills.')
		end
	end)
end

Citizen.CreateThread(function()
	FetchSkills()
	while true do
		for k,v in pairs(Config.Skills) do
			UpdateSkill(k, v['UpdateAmount'])
		end
		Citizen.Wait(Config.UpdateFrequency * 1000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedRunning(ped) and Config.Skills['Stamina'] then
			UpdateSkill('Stamina', 0.2)
		elseif IsPedSwimmingUnderWater(ped) and Config.Skills['Lung Capacity'] then
			UpdateSkill('Lung Capacity', 0.5)
		elseif IsPedInMeleeCombat(ped) and Config.Skills['Strength'] then
			UpdateSkill('Strength', 0.5)
		elseif DoesEntityExist(GetVehiclePedIsUsing(ped)) and Config.Skills['Driving'] then
			if (GetEntitySpeed(GetVehiclePedIsUsing(ped)) * 2.23694) > Config.DrivingSpeedIncrease then
				UpdateSkill('Driving', 0.2)
			end
		end
		Citizen.Wait(Config.DefaultCheckTime * 1000)
	end
end)

function GetSkill(skill)
	return Config.Skills[skill]
end

function FetchSkills()
	if GetResourceKvpString('skills') then
		local data = json.decode(GetResourceKvpString('skills'))
		for k,v in pairs(data) do
			if Config.Skills[k] then
				Config.Skills[k]['Current'] = v['Current']
			else
				DebugPrint('Removing: ' .. k)
			end
			break
		end
		RefreshSkills()
	end
end

function RefreshSkills()
	for k,v in pairs(Config.Skills) do
		if v['Stat'] then
			StatSetInt(v['Stat'], math.floor(v['Current'] + 0.5), true)
		end
	end
end

function UpdateSkill(skill, amount)
	DebugPrint('Updating ' .. skill .. ' by ' .. amount)
	if Config.Skills[skill] then
		local skillAmt = Config.Skills[skill]['Current']

		if (skillAmt + tonumber(amount)) < 0 then
			Config.Skills[skill]['Current'] = 0.0
		elseif (skillAmt + tonumber(amount)) > 100 then
			Config.Skills[skill]['Current'] = 100.0
		else
			Config.Skills[skill]['Current'] = math.floor((skillAmt + tonumber(amount)) + 0.5)
		end
		RefreshSkills()
		if tonumber(amount) > 0 then
			ShowNotification('~y~+' .. amount .. '% ~s~' .. skill)
		end
		SetResourceKvp('skills', json.encode(Config.Skills))
	else
		DebugPrint(skill .. ' is not a valid skill.')
	end
end

function DebugPrint(message)
	if Config.Debug then
		print('[' .. GetCurrentResourceName() .. '] ' .. message)
	end
end

function ShowNotification(message)
	if Config.NotificationType == 'none' then
		DebugPrint(message)
	elseif Config.NotificationType == 'mythic' then
		exports['mythic_notify']:DoHudText('inform', message)
	elseif Config.NotificationType == 'b1g' then
		exports['b1g_notify']:Notify('light', message)
	elseif Config.NotificationType == 'default' then
		SetNotificationTextEntry('STRING')
		AddTextComponentString(message)
		DrawNotification(false, false)
	elseif Config.NotificationType == 'custom' then
		-- Add Your Custom Notification Code Here
	else
		DebugPrint('You have selected an invalid notification type.')
	end
end

exports('GetSkill', GetSkill)
exports('UpdateSkill', UpdateSkill)
exports('FetchSkills', FetchSkills)