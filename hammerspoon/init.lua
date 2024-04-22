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

	-- Set left and right window size multipler based on the monitor aspect ratio
	if screenFrame.w / screenFrame.h > 2 then
		multiplier = 0.42
	else
		multiplier = 0.5
	end

	if position == "right" then
		Xoffset = (screenFrame.w * multiplier)
		multiplier = 1 - multiplier
	end

	win:setFrame({
		x = screenFrame.x + Xoffset,
		y = screenFrame.y,
		w = screenFrame.w * multiplier,
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

function displayWindowSize()
	local win = hs.window.focusedWindow()
	if win then
		local size = win:size()
		hs.alert.show("Window size: " .. size["h"] .. "x" .. size["w"])
	else
		hs.alert.show("No active window found.")
	end
end

-- Bind Keys

hs.hotkey.bind(hyper, "=", displayWindowSize)
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
