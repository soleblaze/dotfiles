-- Disable Animation
hs.window.animationDuration = 0

-- Setup Key Shortcuts
local hyper = { "shift", "cmd", "alt", "ctrl" }

function moveWindowToThirds(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "left" then
    win:setFrame({
      x = screenFrame.x,
      y = screenFrame.y,
      w = screenFrame.w / 3,
      h = screenFrame.h
    })
  elseif position == "center" then
    win:setFrame({
      x = screenFrame.x + (screenFrame.w / 3),
      y = screenFrame.y,
      w = screenFrame.w / 3,
      h = screenFrame.h
    })
  elseif position == "right" then
    win:setFrame({
      x = screenFrame.x + (screenFrame.w * 2 / 3),
      y = screenFrame.y,
      w = screenFrame.w / 3,
      h = screenFrame.h
    })
  end
end

function moveWindowToLeftOrRight(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "left" then
    win:setFrame({
      x = screenFrame.x,
      y = screenFrame.y,
      w = screenFrame.w / 2,
      h = screenFrame.h
    })
  elseif position == "right" then
    win:setFrame({
      x = screenFrame.x + (screenFrame.w / 2),
      y = screenFrame.y,
      w = screenFrame.w / 2,
      h = screenFrame.h
    })
  end
end

function moveLeftHalf(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "top" then
    win:setFrame({
      x = screenFrame.x,
      y = screenFrame.y,
      w = screenFrame.w / 2,
      h = screenFrame.h / 2
    })
  elseif position == "bottom" then
    win:setFrame({
      x = screenFrame.x,
      y = screenFrame.y + (screenFrame.h / 2),
      w = screenFrame.w / 2,
      h = screenFrame.h / 2
    })
  end
end

function moveLeftThird(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "top" then
    win:setFrame({
      x = screenFrame.x,
      y = screenFrame.y,
      w = screenFrame.w / 3,
      h = screenFrame.h / 2
    })
  elseif position == "bottom" then
    win:setFrame({
      x = screenFrame.x,
      y = screenFrame.y + (screenFrame.h / 2),
      w = screenFrame.w / 3,
      h = screenFrame.h / 2
    })
  end
end

function toggleFullScreen()
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local max = screen:frame()

  win:setFrame(max)
end

function setTwoWindowsFrames()
  local allWindows = hs.window.orderedWindows()

  if #allWindows < 2 then
    hs.alert.show("Not enough windows to apply the function")
    return
  end

  local frontmostWindow = allWindows[1]
  local secondFrontmostWindow = allWindows[2]

  frontmostWindow:setFrame(hs.geometry.rect(1281, 25, 1790, 1271))
  secondFrontmostWindow:setFrame(hs.geometry.rect(0, 25, 1281, 1271))
end

hs.hotkey.bind(hyper, "o", function()
  toggleFullScreen()
end)

hs.hotkey.bind(hyper, "j", function()
  moveWindowToThirds("left")
end)

hs.hotkey.bind(hyper, "k", function()
  moveWindowToThirds("center")
end)

hs.hotkey.bind(hyper, "l", function()
  moveWindowToThirds("right")
end)

hs.hotkey.bind(hyper, "i", function()
  moveWindowToLeftOrRight("left")
end)

hs.hotkey.bind(hyper, "p", function()
  moveWindowToLeftOrRight("right")
end)

hs.hotkey.bind(hyper, ",", function()
  moveLeftHalf("top")
end)

hs.hotkey.bind(hyper, ",", function()
  moveLeftHalf("bottom")
end)

hs.hotkey.bind(hyper, "u", function()
  moveLeftThird("top")
end)

hs.hotkey.bind(hyper, "m", function()
  moveLeftThird("bottom")
end)

hs.hotkey.bind(hyper, "0", function()
  setTwoWindowsFrames()
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


-- Hint Shortcut
hs.hints.hintChars = { 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l' }
hs.hints.showTitleThresh = 0
hs.hotkey.bind(hyper, 'w', function()
  hs.hints.windowHints()
end)

--[[
function showFocusedWindowFrame()
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local winFrame = win:frame()
  hs.alert.show("X: " ..
    math.floor(winFrame.x) ..
    ", Y: " .. math.floor(winFrame.y) .. ", Width: " .. math.floor(winFrame.w) .. ", Height: " .. math.floor(winFrame.h), 10)
end

hs.hotkey.bind({ "ctrl", "shift" }, "P", function()
  showFocusedWindowFrame()
end) ]]
