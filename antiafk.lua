-- Create the GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AntiAFKGui"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "Anti-AFK"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Parent = frame

local btnEnable = Instance.new("TextButton")
btnEnable.Text = "Enable Anti-AFK"
btnEnable.Font = Enum.Font.Gotham
btnEnable.TextSize = 16
btnEnable.Size = UDim2.new(0.8, 0, 0, 40)
btnEnable.Position = UDim2.new(0.1, 0, 0.3, 0)
btnEnable.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
btnEnable.TextColor3 = Color3.new(1, 1, 1)
btnEnable.Parent = frame

local btnDisable = Instance.new("TextButton")
btnDisable.Text = "Disable Anti-AFK"
btnDisable.Font = Enum.Font.Gotham
btnDisable.TextSize = 16
btnDisable.Size = UDim2.new(0.8, 0, 0, 40)
btnDisable.Position = UDim2.new(0.1, 0, 0.6, 0)
btnDisable.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
btnDisable.TextColor3 = Color3.new(1, 1, 1)
btnDisable.Parent = frame

-- Create the toggle button (circle)
local toggleButton = Instance.new("TextButton")
toggleButton.Text = ""
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0.5, -25, 0.1, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Shape = Enum.ButtonStyle.Round
toggleButton.Parent = gui

-- Variables
local antiAFKActive = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local guiVisible = true

-- Function to keep the character moving (anti-AFK)
local function keepMoving()
    while antiAFKActive do
        -- Trigger an activity without changing character's position
        humanoid:Move(Vector3.new(0, 0, 0))  -- Pretend to move but no actual movement occurs
        wait(60)  -- Wait 60 seconds before "moving" again
    end
end

-- Enable Anti-AFK
btnEnable.MouseButton1Click:Connect(function()
    antiAFKActive = true
    keepMoving()
    btnEnable.Text = "Anti-AFK Enabled"
    btnEnable.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    btnDisable.Text = "Disable Anti-AFK"
    btnDisable.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

-- Disable Anti-AFK
btnDisable.MouseButton1Click:Connect(function()
    antiAFKActive = false
    btnEnable.Text = "Enable Anti-AFK"
    btnEnable.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    btnDisable.Text = "Anti-AFK Disabled"
    btnDisable.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
end)

-- Toggle button to show/hide the GUI
toggleButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    gui.Enabled = guiVisible
    if guiVisible then
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green when visible
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red when hidden
    end
end)
