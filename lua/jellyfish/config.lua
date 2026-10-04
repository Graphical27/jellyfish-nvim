local M = {}

---@class JellyfishConfig
---@field transparent boolean     Enable transparent background
---@field italic_comments boolean Enable italic comments
---@field italic_keywords boolean Enable italic keywords
---@field undercurl boolean       Use undercurl for diagnostics

--- Default configuration.
---@type JellyfishConfig
M.defaults = {
  transparent     = false,
  italic_comments = true,
  italic_keywords = true,
  undercurl       = true,
}

--- Active merged configuration (set during setup).
---@type JellyfishConfig
M.options = {}

--- Merge user options with defaults.
---@param opts? JellyfishConfig
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
