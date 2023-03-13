-- Disable Animation
hs.window.animationDuration = 0

-- Setup Key Shortcuts
local hyper = {"shift", "cmd", "alt", "ctrl"}

-- TODO: Test this on dual displays
-- Send Window to Next Display
--hs.hotkey.bind(hyper, "p", function()
--  if hs.window.focusedWindow() then
--    hs.window:moveToScreen(hs.screen:next())
--  else
--    hs.alert.show("No Active Window")
--  end
--end)

-- Full Screen
hs.hotkey.bind(hyper, "o", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Top Half
hs.hotkey.bind(hyper, "k", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = 0
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Bottom Half
hs.hotkey.bind(hyper, "l", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Left Half
hs.hotkey.bind(hyper, "j", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Right Half
hs.hotkey.bind(hyper, ";", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Top Left
hs.hotkey.bind(hyper, "u", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Top Right
hs.hotkey.bind(hyper, "i", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Bottom Right
hs.hotkey.bind(hyper, "m", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Bottom Left
hs.hotkey.bind(hyper, "n", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Hint Keys
hs.hints.hintChars = {"A", "S", "D", "F", "Q", "W", "E", "R"}

-- Disable Showing Titles
hs.hints.showTitleThresh = 0

-- Hint Shortcut
hs.hotkey.bind(hyper, 'w', function()
  hs.hints.windowHints()
end)

-- Switch Window Focus
hs.hotkey.bind(hyper, '[', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowWest()
  else
    hs.alert.show("No Active Window")
  end
end)

hs.hotkey.bind(hyper, ']', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowEast()
  else
    hs.alert.show("No Active Window")
  end
end)

hs.hotkey.bind(hyper, '-', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowNorth()
  else
    hs.alert.show("No Active Window")
  end
end)

hs.hotkey.bind(hyper, '=', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowSouth()
  else
    hs.alert.show("No Active Window")
  end
end)
