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

--- Automatically install the NvChad base46 theme.
--- Copies the `nvchad.lua` theme file into the user's `lua/themes/` directory
--- so that it appears in the `<space> + t + h` theme picker.
function M.patch_nvchad()
  local src = vim.api.nvim_get_runtime_file("lua/jellyfish/nvchad.lua", false)[1]
  if not src then return end

  local themes_dir = vim.fn.stdpath("config") .. "/lua/themes"
  local dest = themes_dir .. "/jellyfish.lua"

  if vim.fn.isdirectory(themes_dir) == 0 then
    vim.fn.mkdir(themes_dir, "p")
  end

  local src_file = io.open(src, "r")
  if not src_file then return end
  local content = src_file:read("*a")
  src_file:close()

  local dest_file_read = io.open(dest, "r")
  if dest_file_read then
    local dest_content = dest_file_read:read("*a")
    dest_file_read:close()
    if dest_content == content then return end -- Already installed and up-to-date
  end

  local dest_file_write = io.open(dest, "w")
  if not dest_file_write then return end
  dest_file_write:write(content)
  dest_file_write:close()
  
  -- Notify the user on first install
  vim.notify("Jellyfish theme installed to NvChad! Press <space> + t + h to switch to it.", vim.log.levels.INFO)
end

return M
