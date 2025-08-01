local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpackLimit = 40
local autoResetEnabled = false

-- GUI в gethui для работы в Delta
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = gethui and gethui() or game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 180, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 30)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "Auto-Reset: OFF"
ToggleButton.Parent = Frame

ToggleButton.MouseButton1Click:Connect(function()
    autoResetEnabled = not autoResetEnabled
    ToggleButton.Text = "Auto-Reset: " .. (autoResetEnabled and "ON" or "OFF")
end)

-- Цикл ресета
while true do
    task.wait(0.5)
    if autoResetEnabled and player:FindFirstChild("Data") and player.Data:FindFirstChild("Coins") then
        if player.Data.Coins.Value >= backpackLimit then
            if player.Character then
                player.Character:BreakJoints()
            end
        end
    end
end
