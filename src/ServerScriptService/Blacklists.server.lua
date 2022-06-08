local Players = game:GetService("Players")

local api = require(9850275624)

Players.PlayerAdded:Connect(function(Player)
    local Blacklist = api.getBlacklist(Player.UserId)
    
    if Blacklist.success then
        Player:Kick('\nYOU ARE BLACKLISTED\n\nReason: '..Blacklist.data.reason..'\nModerator: '..Blacklist.data.moderator..'\n\n Blacklists are unappealable.')
    end
end)