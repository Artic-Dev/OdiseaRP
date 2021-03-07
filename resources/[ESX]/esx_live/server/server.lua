function msgInConsole(msg)
    if msg ~= nil then
        print('|| =========================================== ||')
        print(' ')
        print(msg)
        print(' ')
        print('|| =========================================== ||')
    end
end


function IntroducirIdentificadores(license, discord, ipUser, steamId) 


    MySQL.Async.fetchAll('UPDATE `users` SET `license` = @license, `discord` = @discord, `ipUser` = @ipUser WHERE `identifier` = @steamId',
    {
        ['@license'] = license,
        ['@discord'] = discord,
        ['@ipUser'] = ipUser,
        ['@steamId'] = steamId
    }, 
    function()
        msgInConsole('El usuario a sido actualizado')
    end) 

    
end

function ObtenerId(source)
    local identificador = GetPlayerIdentifiers(source)
    local steamId, license, ip, discord

    for k, v in pairs(identificador) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamId = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        end
    end

    IntroducirIdentificadores(license, discord, ip, steamId)
end

Citizen.CreateThread(function()
    MySQL.ready(function()
        msgInConsole('MySQL Esta lista para crear las consultas')
    end)
end)

AddEventHandler('es:playerLoaded', function(source)
    ObtenerId(source)
end)
