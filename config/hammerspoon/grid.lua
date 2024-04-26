hs.grid.setGrid'2x1'
hs.grid.setMargins("0,0")
hs.window.animationDuration = 0

function getWin()
  local win = hs.window.focusedWindow()
  if not win then win = hs.window.frontmostWindow() end
  return win
end

function zoomDisplay()

    local zoomWindow = hs.window.get("Zoom Meeting")
    local activeWindow = hs.window.focusedWindow()
    local screen = activeWindow:screen()

    -- TODO: Get window ratio

    zoomWindow:moveToScreen(screen)
    zoomWindow:move(screen:fromUnitRect(0,0,1,0.36))
    zoomWindow:raise()

    activeWindow:move(screen:fromUnitRect(0,0.36,1,0.64))

    hs.alert("zoom")

  end


-- get current window and alert
hs.hotkey.bind(mash, "=", function() hs.alert.show(getWin()); end)

--- arrows: move window
hs.hotkey.bind(mash, "left", function() hs.grid.pushWindowLeft() end)
hs.hotkey.bind(mash, "right", function() hs.grid.pushWindowRight() end)
hs.hotkey.bind(mash, "up", function() hs.grid.pushWindowUp() end)
hs.hotkey.bind(mash, "down", function() hs.grid.pushWindowDown() end)

--- ikjl: resize window
hs.hotkey.bind(mash, "i", function() hs.grid.resizeWindowShorter() end)
hs.hotkey.bind(mash, "k", function() hs.grid.resizeWindowTaller() end)
hs.hotkey.bind(mash, "j", function() hs.grid.resizeWindowThinner() end)
hs.hotkey.bind(mash, "l", function() hs.grid.resizeWindowWider() end)

--- ikjl: resize window
hs.hotkey.bind(mash, "z", function() zoomDisplay(); end)

--- 234: resize grid
hs.hotkey.bind(mash, "1", function() hs.grid.setGrid('1x1'); hs.alert.show('Grid set to 1x1'); end)
hs.hotkey.bind(mash, "2", function() hs.grid.setGrid('2x2'); hs.alert.show('Grid set to 2x2'); end)
hs.hotkey.bind(mash, "3", function() hs.grid.setGrid('3x3'); hs.alert.show('Grid set to 3x3'); end)
hs.hotkey.bind(mash, "4", function() hs.grid.setGrid('4x4'); hs.alert.show('Grid set to 4x4'); end)
hs.hotkey.bind(mash, "5", function() hs.grid.setGrid('5x5'); hs.alert.show('Grid set to 5x5'); end)

--- /: move window to next screen
hs.hotkey.bind(mash, "/", function() local win = getWin(); win:moveToScreen(win:screen():next()) end)

--- ,: snap window to grid
hs.hotkey.bind(mash, ",", function() hs.grid.snap(getWin()) end)

--- space: maximize window
hs.hotkey.bind(mash, "space", function() hs.grid.maximizeWindow() end)

--- .: minimize window
hs.hotkey.bind(mash, ".", function() hs.grid.set(getWin(), '0,0 1x1'); end)
