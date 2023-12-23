-- Disable Animation
hs.window.animationDuration = 0

-- Setup Key Shortcuts
local hyper = { "shift", "cmd", "alt", "ctrl" }

-- Helper function to handle nil window case
local function handleNilWindow(win)
	if win == nil then
		hs.alert.show("No active window detected")
		return true
	end
	return false
end

-- Move window to left or right half of the screen
function MoveWindowToHalf(position)
	local win = hs.window.focusedWindow()

	if handleNilWindow(win) then
		return
	end

	local screen = win:screen()
	local screenFrame = screen:frame()
	local Xoffset = 0

	if position == "right" then
		Xoffset = (screenFrame.w / 2)
	end

	win:setFrame({
		x = screenFrame.x + Xoffset,
		y = screenFrame.y,
		w = screenFrame.w / 2,
		h = screenFrame.h,
	})
end

-- Toggle full screen for the focused window
function toggleFullScreen()
	local win = hs.window.focusedWindow()

	if handleNilWindow(win) then
		return
	end

	local screen = win:screen()
	local max = screen:frame()

	win:setFrame(max)
end

-- Set frames for two frontmost windows
function setTwoWindowsFrames()
	local allWindows = hs.window.orderedWindows()

	if #allWindows < 2 then
		hs.alert.show("Not enough windows to apply the function")
		return
	end

	local frontmostWindow = allWindows[1]
	local secondFrontmostWindow = allWindows[2]

	local screenFrame = hs.screen.mainScreen():frame()

	local leftFrame = hs.geometry.rect(0, 0, 1280, screenFrame.h)
	local rightFrame = hs.geometry.rect(1280, 0, screenFrame.w - 1280, screenFrame.h)

	frontmostWindow:setFrame(leftFrame)
	secondFrontmostWindow:setFrame(rightFrame)
end

-- Switch Window Focus
local wf = hs.window.filter
local visibleWindows = wf.new():setDefaultFilter({
	visible = true,
	currentSpace = true,
	allowRoles = "*",
	fullscreen = false,
})

-- Helper function to filter fully visible windows
function getFullyVisibleWindows(windows)
	local fullyVisibleWindows = {}
	for _, win in ipairs(windows) do
		if win:isStandard() then
			table.insert(fullyVisibleWindows, win)
		end
	end
	return fullyVisibleWindows
end

-- Functions to focus windows in different directions
local function focusWindowInDirection(direction)
	local currentWindow = hs.window.focusedWindow()
	local directionWindows =
		visibleWindows["windowsTo" .. direction](visibleWindows, currentWindow, { sortHorizontalFirst = true })
	local fullyVisibleDirectionWindows = getFullyVisibleWindows(directionWindows)
	local targetWindow = fullyVisibleDirectionWindows[1]

	if handleNilWindow(currentWindow) then
		return
	end

	if targetWindow then
		targetWindow:focus()
	else
		hs.alert.show("No window to the " .. direction, 2)
	end
end

-- Hint Shortcut
hs.hints.hintChars = { "a", "s", "d", "f", "g", "h", "j", "k", "l" }
hs.hints.showTitleThresh = 0

-- Bind Keys

hs.hotkey.bind(hyper, "0", setTwoWindowsFrames)
hs.hotkey.bind(hyper, "=", function()
	focusWindowInDirection("South")
end)
hs.hotkey.bind(hyper, "[", function()
	focusWindowInDirection("West")
end)
hs.hotkey.bind(hyper, "]", function()
	focusWindowInDirection("East")
end)
hs.hotkey.bind(hyper, "u", function()
	MoveWindowToHalf("left")
end)
hs.hotkey.bind(hyper, "i", function()
	MoveWindowToHalf("right")
end)
hs.hotkey.bind(hyper, "o", toggleFullScreen)
hs.hotkey.bind(hyper, "w", function()
	hs.hints.windowHints()
end)