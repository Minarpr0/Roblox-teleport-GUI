local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 250, 0, 50)
textBox.Position = UDim2.new(0, 25, 0, 25)
textBox.PlaceholderText = "Enter player name"
textBox.ClearTextOnFocus = true
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.Parent = frame

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 250, 0, 50)
teleportButton.Position = UDim2.new(0, 25, 0, 100)
teleportButton.Text = "Teleport"
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
teleportButton.Parent = frame

local function teleportToPlayer()
    local playerName = textBox.Text
    if playerName == "" then return end

    local targetPlayer = game.Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character:SetPrimaryPartCFrame(CFrame.new(targetPlayer.Character.HumanoidRootPart.Position))
    end
end

teleportButton.MouseButton1Click:Connect(teleportToPlayer)

local function onPlayerChatted(message)
    if message == "/disable" then
        screenGui.Enabled = false
    elseif message == "/enable" then
        screenGui.Enabled = true
    end
end

player.Chatted:Connect(onPlayerChatted)