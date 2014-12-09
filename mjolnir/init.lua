-- Load Extensions
local application = require "mjolnir.application"
local window = require "mjolnir.window"
local hotkey = require "mjolnir.hotkey"
local keycodes = require "mjolnir.keycodes"
local fnutils = require "mjolnir.fnutils"
local screen = require "mjolnir.screen"

-- User packages
local grid = require "mjolnir.bg.grid"

local mods = {"ctrl", "alt", "cmd"}

local divider1 = 0.22;
local divider2 = 0.50;

hotkey.bind(mods, "j", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local s = win:screen():frame()
  f.x = 0
  f.y = 0
  f.w = (s.w * divider1)
  f.h = s.h
  win:setframe(f)
end)

hotkey.bind(mods, "k", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local s = win:screen():frame()
  f.x = s.w * divider1
  f.y = 0
  f.w = (divider2 - divider1) * s.w
  f.h = s.h
  win:setframe(f)
end)

hotkey.bind(mods, "l", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local s = win:screen():frame()
  f.x = s.w * divider2
  f.y = 0
  f.w = (1 - divider2) * s.w
  f.h = s.h
  win:setframe(f)
end)

hotkey.bind(mods, "m", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local s = win:screen():frame()
  f.x = 0
  f.y = 0
  f.w = s.w
  f.h = s.h
  win:setframe(f)
end)
