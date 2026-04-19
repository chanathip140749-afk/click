--It Taps Your Screen For Real So It Won't Walk You..
--Tbh other Auto Clicker scripts are Patched so I Maked one..

--Script

local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local isAutoClickEnabled = false -- Toggle state

-- Function to simulate a screen click
local function simulateClick()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2) -- Center of the screen

    -- Simulate a mouse button click at the center of the screen
    VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, true, game, 0)
    wait(0.1) -- Slight delay for the release
    VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, false, game, 0)
end

-- Auto-click loop
spawn(function()
    while true do
        if isAutoClickEnabled then
            simulateClick()
        end
        wait(0.1) -- Adjust It Ig
    end
end)

-- Toggle auto-click with a key press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then -- "T" toggles auto-click
        isAutoClickEnabled = not isAutoClickEnabled
        print("Auto-click enabled:", isAutoClickEnabled)
    end
end)
