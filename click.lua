local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local isAutoClickEnabled = True
local function simulateClick()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2) 
    VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, true, game, 0)
    wait(0.1) 
    VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, false, game, 0)
end
spawn(function()
    while true do
        if isAutoClickEnabled then
            simulateClick()
        end
        wait(0.01)
    end
end)
