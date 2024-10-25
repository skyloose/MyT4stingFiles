local G2L = {}

-- Function to initialize the GUI and return its components
function G2L:Initialize()
    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))

    -- Main UI Frame
    local mainUI = Instance.new("Frame", screenGui)
    mainUI.BorderSizePixel = 0
    mainUI.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
    mainUI.Size = UDim2.new(0, 514, 0, 382)
    mainUI.Position = UDim2.new(0.368, 0, 0.23472, 0)
    mainUI.Name = "MainUI"
    
    -- UIAspectRatioConstraint and UICorner for Main UI
    local uiAspectRatio = Instance.new("UIAspectRatioConstraint", mainUI)
    local uiCorner = Instance.new("UICorner", mainUI)

    -- Title Label
    local titleLabel = Instance.new("TextLabel", mainUI)
    titleLabel.BorderSizePixel = 0
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 14
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red text color
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(0, 292, 0, 35)
    titleLabel.Text = "Library title"
    titleLabel.Position = UDim2.new(0.02618, 0, 0, 0)

    -- Close Button
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

    -- Main Scrolling Frame
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

    -- List Layout for Scrolling Frame
    local uiListLayout = Instance.new("UIListLayout", scrollingFrame)
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Return created GUI elements
    return {
        screenGui = screenGui,
        mainUI = mainUI,
        titleLabel = titleLabel,
        closeButton = closeButton,
        scrollingFrame = scrollingFrame
    }
end

return G2L
