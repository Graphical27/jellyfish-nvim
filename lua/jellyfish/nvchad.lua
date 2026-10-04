--- NvChad base46 integration for jellyfish.nvim.
---
--- This module exports the palette in the format expected by NvChad's base46
--- theme system. Place this file at:
---   ~/.config/nvim/lua/themes/jellyfish.lua
--- or use it as a reference when customising NvChad highlights.

local M = {}

M.base_30 = {
  white         = "#e6e6e6",
  darker_black  = "#0e0e10",
  black         = "#151517",   -- nvim bg
  black2        = "#1c1c1e",
  one_bg        = "#222224",
  one_bg2       = "#2c2c2e",
  one_bg3       = "#343436",
  grey          = "#3e3e40",
  grey_fg       = "#4a4a4c",
  grey_fg2      = "#565658",
  light_grey    = "#636365",
  red           = "#e1270e",
  baby_pink     = "#F9A8BF",
  pink          = "#F88DAD",
  line          = "#2c2c2e",   -- for lines like vertsplit
  green         = "#68EDC6",
  vibrant_green = "#7AF0D0",
  nord_blue     = "#3BA5E0",
  blue          = "#00A6FB",
  yellow        = "#ACAFFF",   -- mapped to lavender in jellyfish
  sun           = "#BFC2FF",
  purple        = "#da68fb",
  dark_purple   = "#b84edd",
  teal          = "#5cc9f5",
  orange        = "#e2c08d",
  cyan          = "#5cc9f5",
  statusline_bg = "#1c1c1e",
  lightbg       = "#2c2c2e",
  pmenu_bg      = "#5cc9f5",
  folder_bg     = "#5cc9f5",
}

M.base_16 = {
  base00 = "#151517", -- Default Background
  base01 = "#1c1c1e", -- Lighter Background (status bars, line numbers)
  base02 = "#2c2c2e", -- Selection Background
  base03 = "#5c6370", -- Comments, Invisibles
  base04 = "#757575", -- Dark Foreground (status bars)
  base05 = "#cccccc", -- Default Foreground
  base06 = "#e6e6e6", -- Light Foreground
  base07 = "#ffffff", -- Light Background
  base08 = "#F88DAD", -- Variables, Tags
  base09 = "#ACAFFF", -- Integers, Constants
  base0A = "#00A6FB", -- Classes, Types
  base0B = "#68EDC6", -- Strings
  base0C = "#5cc9f5", -- Support, RegExp
  base0D = "#5cc9f5", -- Functions, Methods
  base0E = "#da68fb", -- Keywords, Storage
  base0F = "#F88DAD", -- Deprecated, Embedded
}

M.type = "dark"

return M
