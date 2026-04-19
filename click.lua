local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local isAutoClickEnabled = true 

local function simulateClick()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2) 
    VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, true, game, 0)
    task.wait(0.1)
    VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, false, game, 0)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.T then
        isAutoClickEnabled = not isAutoClickEnabled
        print("AutoClick Status:", isAutoClickEnabled)
    end
end)
task.spawn(function()
    while true do
        if isAutoClickEnabled then
            simulateClick()
        end
        task.wait(0.05) 
    end
end)
