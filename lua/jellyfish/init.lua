--- jellyfish.nvim — A truly zen dark theme for Neovim.
--- Ported from the VS Code Jellyfish extension by nerudevs.
---
--- Usage:
---   require("jellyfish").setup({ transparent = false })
---   vim.cmd.colorscheme("jellyfish")

local M = {}

--- Apply the Jellyfish colorscheme.
---@param opts? JellyfishConfig
function M.setup(opts)
  local config = require("jellyfish.config")
  config.setup(opts)
end

--- Load and apply all highlight groups.
--- Called automatically by `colors/jellyfish.lua` or manually via `:colorscheme jellyfish`.
function M.load()
  -- Guard: require true-color terminal
  if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
  end

  -- Reset existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "jellyfish"
  vim.o.background = "dark"

  -- Ensure config is initialised (supports :colorscheme without explicit setup)
  local config = require("jellyfish.config")
  if next(config.options) == nil then
    config.setup()
  end

  local palette    = require("jellyfish.palette").get()
  local highlights = require("jellyfish.highlights").get(palette, config.options)

  for group, attrs in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

return M
