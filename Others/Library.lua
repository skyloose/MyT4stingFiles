local G2L = {}
--eeeeeee
function G2L:Initialize()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui", playerGui)
    local mainUI = Instance.new("Frame", screenGui)
    mainUI.BorderSizePixel = 0
    mainUI.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
    mainUI.Size = UDim2.new(0, 514, 0, 382)
    mainUI.Position = UDim2.new(0.368, 0, 0.23472, 0)
    mainUI.Name = "MainUI"
    mainUI.Active = true

    Instance.new("UIAspectRatioConstraint", mainUI)
    Instance.new("UICorner", mainUI)

    local titleLabel = Instance.new("TextLabel", mainUI)
    titleLabel.BorderSizePixel = 0
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 14
    titleLabel.Text = "Helio"
    titleLabel.Font = Enum.Font.SourceSansBold -- Fallback to built-in font
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(0, 292, 0, 35)
    titleLabel.Position = UDim2.new(0.02618, 0, 0, 0)

    local closeButton = Instance.new("TextButton", mainUI)
    closeButton.TextWrapped = true
    closeButton.BorderSizePixel = 0
    closeButton.TextSize = 14
    closeButton.TextColor3 = Color3.fromRGB(213, 213, 213)
    closeButton.TextScaled = true
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.Nunito -- Fallback built-in
    closeButton.Size = UDim2.new(0, 32, 0, 28)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = "x"
    closeButton.Position = UDim2.new(0.90052, 0, 0.01832, 0)

    local scrollingFrame = Instance.new("ScrollingFrame", mainUI)
    scrollingFrame.Active = true
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    scrollingFrame.Name = "MainScrollingFrame"
    scrollingFrame.Size = UDim2.new(0, 366, 0, 328)
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(207, 207, 207)
    scrollingFrame.Position = UDim2.new(0.02618, 0, 0.1178, 0)
    scrollingFrame.ScrollBarThickness = 3
    scrollingFrame.BackgroundTransparency = 1

    local uiListLayout = Instance.new("UIListLayout", scrollingFrame)
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local toggleUI = Instance.new("TextButton", screenGui)
    toggleUI.Text = "Toggle UI"
    toggleUI.BorderSizePixel = 0
    toggleUI.TextSize = 14
    toggleUI.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggleUI.Size = UDim2.new(0, 80, 0, 35)
    toggleUI.Position = UDim2.new(0.05, 0, 0.05, 0)
    Instance.new("UICorner", toggleUI)

    -- UI Dragging Logic
    local dragging, dragStart, startPos
    mainUI.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainUI.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    
    mainUI.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            mainUI.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    toggleUI.MouseButton1Click:Connect(function()
        mainUI.Visible = not mainUI.Visible
    end)

    self.MainUI = mainUI
    self.ScrollingFrame = scrollingFrame
    return self
end

return G2L
