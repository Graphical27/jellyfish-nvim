---@class JellyfishPalette
---@field bg string
---@field fg string
---@field blue string
---@field cyan string
---@field lavender string
---@field pink string
---@field purple string
---@field green string
---@field comment string
---@field gutter string
---@field selection string
---@field line_highlight string
---@field subtle string
---@field white string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field diff_add string
---@field diff_change string
---@field diff_delete string
---@field diff_text string
---@field git_add string
---@field git_change string
---@field git_delete string
---@field git_ignore string
---@field git_untracked string
---@field none string

local M = {}

--- Returns the canonical Jellyfish color palette.
--- Every hex value originates from the VS Code Jellyfish theme to ensure
--- a pixel-perfect port.
---@return JellyfishPalette
function M.get()
  return {
    -- Core background / foreground
    bg             = "#151517",
    fg             = "#cccccc",

    -- Syntax accent colors (ordered by hue)
    blue           = "#00A6FB", -- types, classes, namespaces
    cyan           = "#5cc9f5", -- functions, methods, operators
    lavender       = "#ACAFFF", -- constants, numbers, attributes
    pink           = "#F88DAD", -- variables, tags, identifiers
    purple         = "#da68fb", -- keywords, control flow, storage
    green          = "#68EDC6", -- strings, string punctuation

    -- UI chrome
    comment        = "#5c6370",
    gutter         = "#757575",
    selection      = "#3793e040",
    line_highlight = "#FFFFFF0A",
    subtle         = "#343434",
    white          = "#ffffff",
    none           = "NONE",

    -- Diagnostics
    error          = "#e1270e",
    warning        = "#ff453a",
    info           = "#75beff",
    hint           = "#5cc9f5",

    -- Diff
    diff_add       = "#9bb95533",
    diff_change    = "#0c7d9d",
    diff_delete    = "#ff000033",
    diff_text      = "#264f784d",

    -- Git decorations
    git_add        = "#81b88b",
    git_change     = "#e2c08d",
    git_delete     = "#c74e39",
    git_ignore     = "#8c8c8c",
    git_untracked  = "#73c991",
  }
end

return M
