--[[
    Created by mvvrgan
]]

local Players = game:GetService("Players")

local api = require(9850275624)

Players.PlayerAdded:Connect(function(Player)
    local Blacklist = api.getBlacklist(Player.UserId)
    
    if Blacklist.success then
        Player:Kick('\nYOU ARE BLACKLISTED\n\nReason: '..Blacklist.data.reason..'\nModerator: '..Blacklist.data.moderator..'\n\n Blacklists are unappealable.')
    end
end)

while wait(1) do
    local Blacklists = api.getBlacklists()
    
    if Blacklists.success then
        for _, Blacklist in ipairs(Blacklists.data) do
            for _,Player in ipairs(Players:GetChildren()) do
                if Player.UserId == Blacklist.robloxid then
                    Player:Kick('\nYOU ARE BLACKLISTED\n\nReason: '..Blacklist.reason..'\nModerator: '..Blacklist.moderator..'\n\n Blacklists are unappealable.')
                end
            end
        end
    end
end