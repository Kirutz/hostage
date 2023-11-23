
----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>--



local QBCore = exports['qb-core']:GetCoreObject()

local GlobalCD = false

RegisterServerEvent('am_hostage:ServerCooldown')
AddEventHandler('am_hostage:ServerCooldown', function()
    local CDTime = math.ceil(Config.GlobalCooldown * 60)
    if not GlobalCD then 
        GlobalCD = true
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5000)
                CDTime = CDTime - 5
                if CDTime <= 0 then 
                    GlobalCD = false
                    local CDTime = math.ceil(Config.GlobalCooldown * 60)
                    break
                end
            end
        end)
    end
end)

RegisterServerEvent('am_hostage:srv:RobHostage')
AddEventHandler('am_hostage:srv:RobHostage', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        if Config.EnableHostageLoot then 
            local Reward = Config.RobHostageReward
            local RewardVal = math.random(Reward.min, Reward.max)
            Player.Functions.AddMoney('cash', RewardVal, 'Hostage-reward')
            TriggerClientEvent('QBCore:Notify', src, 'You got $'..RewardVal, 'success')
        end
    end
end)

QBCore.Functions.CreateCallback('am_hostage:GetGlobalCooldown', function(source, cb)
	if Config.EnableGlobalCooldown then 
        cb(GlobalCD)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('am_hostage:getCops', function(source, cb)
	local amount = 0
    if Config.EnableRequiredCops then 
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            local Player = QBCore.Functions.GetPlayer(v)
            if Player ~= nil then 
                if (Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "police1" or Player.PlayerData.job.name == "police2" or Player.PlayerData.job.name == "police3" or Player.PlayerData.job.name == "police4" or Player.PlayerData.job.name == "police5" or Player.PlayerData.job.name == "police6" or Player.PlayerData.job.name == "police7" or Player.PlayerData.job.name == "police8" and Player.PlayerData.job.onduty) then
                    amount = amount + 1
                end
            end
        end
        cb(amount)
    else 
        cb(amount)
    end
end)

RegisterServerEvent('am_hostage:srv:releaseHostage')
AddEventHandler('am_hostage:srv:releaseHostage', function(data)
    local src = source
    TriggerClientEvent('am_hostage:releaseHostage', -1, data)
    TriggerClientEvent('am_hostage:SetReleaseSource', src)
end)

RegisterServerEvent('am_hostage:attach')
AddEventHandler('am_hostage:attach', function(source, target)
    TriggerClientEvent('am_hostage:attach', -1, source, target)
end)

RegisterServerEvent('am_hostage:deattach')
AddEventHandler('am_hostage:deattach', function(source, target)
    TriggerClientEvent('am_hostage:deattach', -1, source, target)
end)

RegisterServerEvent('am_hostage:srv:HandcuffAnimations')
AddEventHandler('am_hostage:srv:HandcuffAnimations', function(playerped1, target)
    TriggerClientEvent('am_hostage:HandcuffAnimations', -1, playerped1, target)
end)


------------------------------------------------------------
---------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------                 
------------------------------            Sistema HTML NOTIFICATIONS AMERICAN SCRIPT (CODIFICADO)
------------------------------
------------------------------------------------------------------------------------------
---------------------------------------------------------------------------
------------------------------------------------------------



RegisterServerEvent('am_hostage:server:hostageitem')
AddEventHandler('am_hostage:server:hostageitem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem("smg_ammo", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["smg_ammo"], "add")

end)


RegisterServerEvent('am_hostage:server:hostageitem2')
AddEventHandler('am_hostage:server:hostageitem2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem("pistol_ammo", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol_ammo"], "add")

end)


RegisterServerEvent('am_hostage:server:hostageitem3')
AddEventHandler('am_hostage:server:hostageitem3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem("weapon_pistol_mk2", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_pistol_mk2"], "add")

end)


RegisterServerEvent('am_hostage:server:hostageitem4')
AddEventHandler('am_hostage:server:hostageitem4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem("rifle_ammo", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rifle_ammo"], "add")

end)


RegisterServerEvent('am_hostage:server:hostageitem5')
AddEventHandler('am_hostage:server:hostageitem5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem("weapon_microsmg", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_microsmg"], "add")

end)


RegisterServerEvent('am_hostage:server:hostageitem6')
AddEventHandler('am_hostage:server:hostageitem6', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem("packagedcoca", 10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["packagedcoca"], "add")

end)