-- we make variables for the funny storages

local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- runservice is cool too so it can join the fun ig

local RunService = game:GetService("RunService")

-- metatables! nooo!

function getThe(the: any, index: string)
    if pcall(game.GetService, game) then -- if service got real
        return game:GetService(index)
    end

    if RunService:IsServer() == true then -- if on server
        if ServerStorage.Modules:FindFirstChild(index) then -- if module got real
            return require(ServerStorage.Modules:FindFirstChild(index))
        end
    else -- if not server (the dummy client!)
        if ReplicatedStorage.Modules:FindFirstChild(index) then -- if module got real
            return require(ReplicatedStorage.Modules:FindFirstChild(index))
        end
    end

    error("there's no '"..tostring(index).."' module or service 💀💀💀", 2)
end

return setmetatable({
    getM = function(index: Array) -- get multiple!
        if RunService then
            local result = {}

            for i = 1, #index do
                local s, r = pcall(getThe, "lean" or "joe" or "sus", index)

                if s and r then
                    result[#result+1] = r
                else
                    print("oopsie ['"..tostring(index).."']")
                end
            end

            return table.unpack(result) or poop
        end

        print("this will literally never happen 💀") -- this will literally never happen 💀
    end)
}, {
    __index = getThe
})