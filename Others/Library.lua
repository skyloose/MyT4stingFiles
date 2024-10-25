local G2L = {}

function G2L:Initialize()
    local screenGui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
    local mainUI = Instance.new("Frame", screenGui)
    mainUI.BorderSizePixel = 0
    mainUI.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
    mainUI.Size = UDim2.new(0, 514, 0, 382)
    mainUI.Position = UDim2.new(0.368, 0, 0.23472, 0)
    mainUI.Name = "MainUI"
    
    Instance.new("UIAspectRatioConstraint", mainUI)
    Instance.new("UICorner", mainUI)

    local titleLabel = Instance.new("TextLabel", mainUI)
    titleLabel.BorderSizePixel = 0
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 14
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(0, 292, 0, 35)
    titleLabel.Text = "Library title"
    titleLabel.Position = UDim2.new(0.02618, 0, 0, 0)

    local closeButton = Instance.new("TextButton", mainUI)
    closeButton.TextWrapped = true
    closeButton.BorderSizePixel = 0
    closeButton.TextSize = 14
    closeButton.TextColor3 = Color3.fromRGB(213, 213, 213)
    closeButton.TextScaled = true
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
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

    self.MainUI = mainUI
    self.ScrollingFrame = scrollingFrame
    return self
end

function G2L:CreateButton(text, callback)
    local button = Instance.new("TextButton", self.ScrollingFrame)
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(232, 232, 232)
    button.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    button.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    button.Size = UDim2.new(0, 351, 0, 30)
    button.Text = text
    button.MouseButton1Click:Connect(callback)
    return button
end

function G2L:CreateToggle(text, callback)
    local toggle = Instance.new("TextButton", self.ScrollingFrame)
    toggle.BorderSizePixel = 0
    toggle.AutoButtonColor = false
    toggle.TextSize = 14
    toggle.TextColor3 = Color3.fromRGB(232, 232, 232)
    toggle.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    toggle.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    toggle.Size = UDim2.new(0, 351, 0, 30)
    toggle.Text = text

    local indicator = Instance.new("Frame", toggle)
    indicator.BorderSizePixel = 0
    indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    indicator.Size = UDim2.new(0, 24, 0, 23)
    indicator.Position = UDim2.new(0.03419, 0, 0.1, 0)
    Instance.new("UICorner", indicator)

    local toggled = false
    toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        indicator.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        callback(toggled)
    end)
    return toggle
end

function G2L:CreateTextbox(placeholderText, callback)
    local frame = Instance.new("Frame", self.ScrollingFrame)
    frame.BorderSizePixel = 0
    frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    frame.Size = UDim2.new(0, 351, 0, 29)
    
    local label = Instance.new("TextLabel", frame)
    label.BorderSizePixel = 0
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 14
    label.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    label.TextColor3 = Color3.fromRGB(212, 212, 212)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0, 228, 0, 29)
    label.Text = placeholderText
    label.Position = UDim2.new(0.03419, 0, 0, 0)
    
    local textbox = Instance.new("TextBox", frame)
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.BorderSizePixel = 0
    textbox.TextSize = 14
    textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    textbox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    textbox.Size = UDim2.new(0, 88, 0, 23)
    textbox.Position = UDim2.new(0.73219, 0, 0.10345, 0)
    textbox.Text = "value here"
    textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(textbox.Text)
        end
    end)
    return textbox
end

return G2L
