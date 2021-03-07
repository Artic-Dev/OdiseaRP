Config = {}

Config.Debug = false
Config.UpdateFrequency = 300 -- How Often to Save Skills (In Seconds)
Config.NotificationType = 'default' -- Values: none | default | mythic | b1g | custom

Config.SkillsCommand = 'skills' -- Command to Check Skills Is A WIP | Values: (string or false)
Config.ResetCommand = 'resetskills' -- Command to Reset Skills | Values: (string or false)

Config.DefaultCheckTime = 25 -- How Often to Update Default Skills (In Seconds)
Config.DrivingSpeedIncrease = 80 -- At What Speed to Increase Driving Skill in MPH (If Removed Doesn't Effect Anything)

Config.Skills = {
	['Stamina'] = {
		['Current'] = 20, -- Starting Value For Skill
		['UpdateAmount'] = -0.3, -- The Amount to Increase / Decrease When Skills Update
		['Stat'] = 'MP0_STAMINA' -- GTA Stat Name | Values: (string or false)
	},
	['Lung Capacity'] = {
		['Current'] = 0,
		['UpdateAmount'] = -0.1,
		['Stat'] = 'MP0_LUNG_CAPACITY'
	},
	['Driving'] = {
		['Current'] = 0,
		['UpdateAmount'] = -0.5,
		['Stat'] = 'MP0_DRIVING_ABILITY'
	},
	['Strength'] = {
		['Current'] = 10,
		['UpdateAmount'] = -0.3,
		['Stat'] = 'MP0_STRENGTH'
	},
}