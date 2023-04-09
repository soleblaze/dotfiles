-- Disable Animation
hs.window.animationDuration = 0

-- Setup Key Shortcuts
local hyper = { "shift", "cmd", "alt", "ctrl" }

function MoveWindowToThirds(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "left" then
    Xoffset = 0
  elseif position == "center" then
    Xoffset = (screenFrame.w / 3)
  elseif position == "right" then
    Xoffset = (screenFrame.w * 2 / 3)
  end

  win:setFrame({
    x = screenFrame.x + Xoffset,
    y = screenFrame.y,
    w = screenFrame.w / 3,
    h = screenFrame.h
  })
end

function MoveWindowToLeftOrRight(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "left" then
    Xoffset = 0
  elseif position == "right" then
    Xoffset = (screenFrame.w / 2)
  end

  win:setFrame({
    x = screenFrame.x + Xoffset,
    y = screenFrame.y,
    w = screenFrame.w / 2,
    h = screenFrame.h
  })
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
    Yoffset = 0
  elseif position == "bottom" then
    win:setFrame({
      Yoffset = (screenFrame.h / 2)
    })
  end
  win:setFrame({
    x = screenFrame.x,
    y = screenFrame.y + Yoffset,
    w = screenFrame.w / 2,
    h = screenFrame.h / 2
  })
end

function MoveLeftThird(position)
  local win = hs.window.focusedWindow()

  if win == nil then
    hs.alert.show("No active window detected")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  if position == "top" then
    Yoffset = 0
  elseif position == "bottom" then
    Yoffset = (screenFrame.h / 2)
  end

  win:setFrame({
    x = screenFrame.x,
    y = screenFrame.y + Yoffset,
    w = screenFrame.w / 3,
    h = screenFrame.h / 2
  })
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
  MoveWindowToThirds("left")
end)

hs.hotkey.bind(hyper, "k", function()
  MoveWindowToThirds("center")
end)

hs.hotkey.bind(hyper, "l", function()
  MoveWindowToThirds("right")
end)

hs.hotkey.bind(hyper, "i", function()
  MoveWindowToLeftOrRight("left")
end)

hs.hotkey.bind(hyper, "p", function()
  MoveWindowToLeftOrRight("right")
end)

hs.hotkey.bind(hyper, ",", function()
  moveLeftHalf("top")
end)

hs.hotkey.bind(hyper, ",", function()
  moveLeftHalf("bottom")
end)

hs.hotkey.bind(hyper, "u", function()
  MoveLeftThird("top")
end)

hs.hotkey.bind(hyper, "m", function()
  MoveLeftThird("bottom")
end)

hs.hotkey.bind(hyper, "0", function()
  setTwoWindowsFrames()
end)

-- Switch Window Focus
local wf = hs.window.filter
local visibleWindows = wf.new():setDefaultFilter({
  visible = true,
  currentSpace = true,
  allowRoles = '*',
  fullscreen = false
})

function getFullyVisibleWindows(windows)
  local fullyVisibleWindows = {}
  for _, win in ipairs(windows) do
    if win:isStandard() then
      table.insert(fullyVisibleWindows, win)
    end
  end
  return fullyVisibleWindows
end

hs.hotkey.bind(hyper, "[", function()
  local currentWindow = hs.window.focusedWindow()
  local westWindows = visibleWindows:windowsToWest(currentWindow, { sortHorizontalFirst = true })
  local fullyVisibleWestWindows = getFullyVisibleWindows(westWindows)
  local previousWindow = fullyVisibleWestWindows[1]

  if not currentWindow then
    hs.alert.show("No active window detected", 2)
    return
  end

  if previousWindow then
    previousWindow:focus()
  else
    hs.alert.show("No window to the West", 2)
  end
end)

hs.hotkey.bind(hyper, "]", function()
  local currentWindow = hs.window.focusedWindow()
  local eastWindows = visibleWindows:windowsToEast(currentWindow, { sortHorizontalFirst = true })
  local fullyVisibleEastWindows = getFullyVisibleWindows(eastWindows)
  local nextWindow = fullyVisibleEastWindows[1]

  if not currentWindow then
    hs.alert.show("No active window detected", 2)
    return
  end

  if nextWindow then
    nextWindow:focus()
  else
    hs.alert.show("No window to the East", 2)
  end
end)

hs.hotkey.bind(hyper, "-", function()
  local currentWindow = hs.window.focusedWindow()
  local northWindows = visibleWindows:windowsToNorth(currentWindow, { sortVerticalFirst = true })
  local fullyVisibleNorthWindows = getFullyVisibleWindows(northWindows)
  local nextWindow = fullyVisibleNorthWindows[1]

  if not currentWindow then
    hs.alert.show("No active window detected", 2)
    return
  end

  if nextWindow then
    nextWindow:focus()
  else
    hs.alert.show("No window to the North", 2)
  end
end)

hs.hotkey.bind(hyper, "=", function()
  local currentWindow = hs.window.focusedWindow()
  local southWindows = visibleWindows:windowsToSouth(currentWindow, { sortVerticalFirst = true })
  local fullyVisibleSouthWindows = getFullyVisibleWindows(southWindows)
  local nextWindow = fullyVisibleSouthWindows[1]

  if not currentWindow then
    hs.alert.show("No active window detected", 2)
    return
  end

  if nextWindow then
    nextWindow:focus()
  else
    hs.alert.show("No window to the South", 2)
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
