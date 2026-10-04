<p align="center">
  <h2 align="center">🪼 Jellyfish for Neovim</h2>
</p>

<p align="center">
  A truly zen dark theme for Neovim &mdash; ported from the
  <a href="https://marketplace.visualstudio.com/items?itemName=nerudevs.jellyfish-dark">VS Code Jellyfish</a> extension.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.9%2B-57A143?style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim 0.9+">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="MIT License">
  <img src="https://img.shields.io/badge/NvChad-Ready-cyan?style=for-the-badge" alt="NvChad Ready">
</p>

---

## Features

- **Pixel-perfect port** of every color from the original VS Code theme
- **Full Treesitter support** — all `@capture` groups covered
- **LSP semantic token** highlights
- **Plugin support** — Telescope, nvim-tree, neo-tree, gitsigns, nvim-cmp, which-key, bufferline, noice, notify, lazy.nvim, mason, mini.nvim, dashboard, alpha
- **NvChad native integration** — base46 theme file included
- **Configurable** — transparent backgrounds, italic toggles, undercurl control
- **Clean architecture** — palette, config, and highlights are fully separated

## Palette

| Swatch | Name | Hex | Usage |
|--------|------|-----|-------|
| 🔵 | Blue | `#00A6FB` | Types, classes, namespaces |
| 🩵 | Cyan | `#5cc9f5` | Functions, methods, operators |
| 🟣 | Lavender | `#ACAFFF` | Constants, numbers, attributes |
| 🩷 | Pink | `#F88DAD` | Variables, tags, identifiers |
| 💜 | Purple | `#da68fb` | Keywords, control flow, storage |
| 💚 | Green | `#68EDC6` | Strings |
| ⬛ | Background | `#151517` | Editor background |
| ⬜ | Foreground | `#cccccc` | Default text |

---

## Installation

### Method 1: NvChad (Recommended)

NvChad v2.5+ uses a custom theming system. We have included an automatic patcher that installs the theme for you!

**Step 1 — Install the plugin**

Add the plugin to your NvChad custom plugins. Edit `~/.config/nvim/lua/plugins/init.lua`:

```lua
return {
  {
    "Graphical27/jellyfish-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("jellyfish").patch_nvchad()
    end,
  },
}
```

**Step 2 — Switch to the theme**

Restart Neovim. The plugin will automatically copy the theme file so NvChad can find it. 
Press `<space> + t + h` and select **jellyfish** from the menu!

*(Optional)* To make it your default theme on startup, add this to your `~/.config/nvim/lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "jellyfish",
}
```

---

### Method 2: Standalone (lazy.nvim)

```lua
{
  "Graphical27/jellyfish-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("jellyfish").setup({
      transparent     = false, -- set true for transparent background
      italic_comments = true,  -- italicize comments
      italic_keywords = true,  -- italicize keywords (if, for, return, etc.)
      undercurl       = true,  -- use undercurl for diagnostics
    })
    vim.cmd.colorscheme("jellyfish")
  end,
}
```

### Method 3: Standalone (packer.nvim)

```lua
use({
  "Graphical27/jellyfish-nvim",
  config = function()
    require("jellyfish").setup()
    vim.cmd.colorscheme("jellyfish")
  end,
})
```

### Method 4: Manual

```bash
git clone https://github.com/Graphical27/jellyfish-nvim \
  ~/.local/share/nvim/site/pack/themes/start/jellyfish-nvim
```

Then add to your `init.lua`:

```lua
require("jellyfish").setup()
vim.cmd.colorscheme("jellyfish")
```

---

## Configuration

All options are optional. Call `setup()` before loading the colorscheme:

```lua
require("jellyfish").setup({
  transparent     = false, -- enable transparent background
  italic_comments = true,  -- render comments in italic
  italic_keywords = true,  -- render keywords in italic
  undercurl       = true,  -- use undercurl instead of underline for diagnostics
})
```

---

## Supported Plugins

| Plugin | Status |
|--------|--------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | ✅ Full |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | ✅ Full |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ✅ Full |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | ✅ Full |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | ✅ Full |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | ✅ Full |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | ✅ Full |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | ✅ Full |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | ✅ Full |
| [noice.nvim](https://github.com/folke/noice.nvim) | ✅ Full |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | ✅ Full |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | ✅ Full |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | ✅ Full |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | ✅ Full |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | ✅ Full |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) / [alpha-nvim](https://github.com/goolord/alpha-nvim) | ✅ Full |
| NvChad base46 / Tbline / Statusline | ✅ Full |

---

## Project Structure

```
jellyfish.nvim/
├── colors/
│   └── jellyfish.lua          # :colorscheme entry point
├── lua/
│   └── jellyfish/
│       ├── init.lua            # Public API (setup / load)
│       ├── config.lua          # User configuration & defaults
│       ├── palette.lua         # Canonical color palette
│       ├── highlights.lua      # All highlight group definitions
│       └── nvchad.lua          # NvChad base46 theme integration
├── LICENSE
└── README.md
```

---

## Credits

- Original [Jellyfish VS Code theme](https://marketplace.visualstudio.com/items?itemName=nerudevs.jellyfish-dark) by [nerudevs](https://github.com/isneru)
- Inspired by the Neovim theming ecosystem

## License

[MIT](./LICENSE)
