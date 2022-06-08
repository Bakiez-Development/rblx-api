local options = require(script.Parent.options)

local Httpservice = game:GetService("HttpService")

return function (robloxid: number)
    local response
    local data
    pcall( function ()
        response = Httpservice:GetAsync(options.url..'/blacklists?robloxid='..robloxid)
        data = Httpservice:JSONDecode(response)
    end)

    if not data then return {["success"] = false, ["error"] = 'There was a problem connecting to the server'} end
    if data.error then return {["success"] = false, ["error"] = data.error} end

    return {["success"] = true, ["data"] = data}
end