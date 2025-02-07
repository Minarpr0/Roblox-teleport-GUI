-- Create the GUI elements
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame for GUI layout
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- TextBox for entering the player's name
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 250, 0, 50)
textBox.Position = UDim2.new(0, 25, 0, 25)
textBox.PlaceholderText = "Enter player name"
textBox.ClearTextOnFocus = true
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.Parent = frame

-- Teleport Button
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 250, 0, 50)
teleportButton.Position = UDim2.new(0, 25, 0, 100)
teleportButton.Text = "Teleport"
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
teleportButton.Parent = frame

-- Function to teleport to the player
local function teleportToPlayer()
    local playerName = textBox.Text
    if playerName == "" then
        return -- Do nothing if the name is empty
    end

    local targetPlayer = game.Players:FindFirstChild(playerName)

    if targetPlayer then
        -- Check if the player is valid and teleport
        local targetCharacter = targetPlayer.Character
        if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
            local targetPosition = targetCharacter.HumanoidRootPart.Position
            player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
        else
            print("Target player's character is not available!")
        end
    else
        print("Player not found!")
    end
end

-- Connect the teleport function to the button click
teleportButton.MouseButton1Click:Connect(teleportToPlayer)