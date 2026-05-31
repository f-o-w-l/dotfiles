units = {
  right50  = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50   = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  top50    = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50    = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upleft   = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
  upright  = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
  botleft  = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
  botright = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },
  maximum  = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

mash = { 'shift', 'cmd' }
hs.hotkey.bind(mash, 'w', function() hs.window.focusedWindow():move(units.top50, nil, true) end)
hs.hotkey.bind(mash, 'a', function() hs.window.focusedWindow():move(units.left50, nil, true) end)
hs.hotkey.bind(mash, 's', function() hs.window.focusedWindow():move(units.bot50, nil, true) end)
hs.hotkey.bind(mash, 'd', function() hs.window.focusedWindow():move(units.right50, nil, true) end)
hs.hotkey.bind(mash, '1', function() hs.window.focusedWindow():move(units.upleft, nil, true) end)
hs.hotkey.bind(mash, '2', function() hs.window.focusedWindow():move(units.upright, nil, true) end)
hs.hotkey.bind(mash, '3', function() hs.window.focusedWindow():move(units.botleft, nil, true) end)
hs.hotkey.bind(mash, "4", function() hs.window.focusedWindow():move(units.botright, nil, true) end)
hs.hotkey.bind(mash, 'e', function() hs.window.focusedWindow():move(units.maximum, nil, true) end)
