local M = {}

--- Build all highlight group definitions from the palette and config.
---@param p JellyfishPalette
---@param cfg JellyfishConfig
---@return table<string, table> highlights  Map of group name → highlight attrs
function M.get(p, cfg)
  local bg = cfg.transparent and p.none or p.bg
  local italic = "italic"
  local comment_style = cfg.italic_comments and italic or p.none
  local keyword_style = cfg.italic_keywords and italic or p.none
  local diag_underline = cfg.undercurl and "undercurl" or "underline"

  -- stylua: ignore
  local hl = {
    ---------------------------------------------------------------------------
    -- Editor UI
    ---------------------------------------------------------------------------
    Normal                       = { fg = p.fg, bg = bg },
    NormalFloat                  = { fg = p.fg, bg = bg },
    NormalNC                     = { fg = p.fg, bg = bg },
    FloatBorder                  = { fg = p.subtle, bg = bg },
    FloatTitle                   = { fg = p.white, bg = bg, bold = true },
    ColorColumn                  = { bg = p.subtle },
    Cursor                       = { fg = p.bg, bg = p.white },
    CursorColumn                 = { bg = p.line_highlight },
    CursorLine                   = { bg = p.line_highlight },
    CursorLineNr                 = { fg = p.white, bold = true },
    LineNr                       = { fg = p.gutter },
    SignColumn                   = { fg = p.gutter, bg = bg },
    VertSplit                    = { fg = p.subtle },
    WinSeparator                 = { fg = p.subtle },
    Folded                       = { fg = p.comment, bg = p.diff_text },
    FoldColumn                   = { fg = p.gutter, bg = bg },
    MatchParen                   = { fg = p.white, bg = p.subtle, bold = true },
    NonText                      = { fg = p.subtle },
    SpecialKey                   = { fg = p.subtle },
    Whitespace                   = { fg = p.subtle },
    EndOfBuffer                  = { fg = bg },

    -- Popup menu
    Pmenu                        = { fg = p.fg, bg = bg },
    PmenuSel                     = { fg = p.white, bg = p.line_highlight },
    PmenuSbar                    = { bg = p.subtle },
    PmenuThumb                   = { bg = p.gutter },

    -- Search
    Search                       = { fg = p.white, bg = "#515c6a" },
    IncSearch                    = { fg = p.bg, bg = p.cyan },
    CurSearch                    = { fg = p.bg, bg = p.cyan },
    Substitute                   = { fg = p.bg, bg = p.pink },

    -- Visual
    Visual                       = { bg = p.selection },
    VisualNOS                    = { bg = p.selection },

    -- Status / Tab / Win bar
    StatusLine                   = { fg = p.fg, bg = bg },
    StatusLineNC                 = { fg = p.gutter, bg = bg },
    TabLine                      = { fg = p.gutter, bg = bg },
    TabLineFill                  = { bg = bg },
    TabLineSel                   = { fg = p.white, bg = bg },
    WinBar                       = { fg = p.fg, bg = bg },
    WinBarNC                     = { fg = p.gutter, bg = bg },

    -- Messages
    MsgArea                      = { fg = p.fg },
    ModeMsg                      = { fg = p.fg, bold = true },
    MoreMsg                      = { fg = p.cyan },
    WarningMsg                   = { fg = p.warning },
    ErrorMsg                     = { fg = p.error },
    Question                     = { fg = p.cyan },

    -- Diff
    DiffAdd                      = { bg = p.diff_add },
    DiffChange                   = { bg = "#0c7d9d33" },
    DiffDelete                   = { bg = p.diff_delete },
    DiffText                     = { bg = p.diff_text },

    -- Spell
    SpellBad                     = { sp = p.error, undercurl = true },
    SpellCap                     = { sp = p.warning, undercurl = true },
    SpellLocal                   = { sp = p.info, undercurl = true },
    SpellRare                    = { sp = p.hint, undercurl = true },

    -- Misc
    Directory                    = { fg = p.cyan },
    Title                        = { fg = p.pink, bold = true },
    Conceal                      = { fg = p.comment },
    qfFileName                   = { fg = p.cyan },
    qfLineNr                     = { fg = p.gutter },

    ---------------------------------------------------------------------------
    -- Standard syntax groups (:h group-name)
    ---------------------------------------------------------------------------
    Comment                      = { fg = p.comment, italic = comment_style == italic },

    Constant                     = { fg = p.lavender },
    String                       = { fg = p.green },
    Character                    = { fg = p.green },
    Number                       = { fg = p.lavender },
    Boolean                      = { fg = p.lavender },
    Float                        = { fg = p.lavender },

    Identifier                   = { fg = p.pink },
    Function                     = { fg = p.cyan },

    Statement                    = { fg = p.purple },
    Conditional                  = { fg = p.purple, italic = keyword_style == italic },
    Repeat                       = { fg = p.purple, italic = keyword_style == italic },
    Label                        = { fg = p.pink },
    Operator                     = { fg = p.fg },
    Keyword                      = { fg = p.purple, italic = keyword_style == italic },
    Exception                    = { fg = p.purple },

    PreProc                      = { fg = p.purple },
    Include                      = { fg = p.purple },
    Define                       = { fg = p.purple },
    Macro                        = { fg = p.purple },
    PreCondit                    = { fg = p.purple },

    Type                         = { fg = p.blue },
    StorageClass                 = { fg = p.purple },
    Structure                    = { fg = p.blue },
    Typedef                      = { fg = p.blue },

    Special                      = { fg = p.cyan },
    SpecialChar                  = { fg = p.cyan },
    Tag                          = { fg = p.pink },
    Delimiter                    = { fg = p.fg },
    SpecialComment               = { fg = p.comment },
    Debug                        = { fg = p.purple },

    Underlined                   = { underline = true },
    Bold                         = { bold = true },
    Italic                       = { italic = true },

    Error                        = { fg = p.error },
    Todo                         = { fg = p.bg, bg = p.lavender, bold = true },

    ---------------------------------------------------------------------------
    -- Diagnostics
    ---------------------------------------------------------------------------
    DiagnosticError              = { fg = p.error },
    DiagnosticWarn               = { fg = p.warning },
    DiagnosticInfo               = { fg = p.info },
    DiagnosticHint               = { fg = p.hint },
    DiagnosticOk                 = { fg = p.git_add },

    DiagnosticUnderlineError     = { sp = p.error,   [diag_underline] = true },
    DiagnosticUnderlineWarn      = { sp = p.warning, [diag_underline] = true },
    DiagnosticUnderlineInfo      = { sp = p.info,    [diag_underline] = true },
    DiagnosticUnderlineHint      = { sp = p.hint,    [diag_underline] = true },

    DiagnosticVirtualTextError   = { fg = p.error,   bg = "#e1270e15" },
    DiagnosticVirtualTextWarn    = { fg = p.warning,  bg = "#ff453a15" },
    DiagnosticVirtualTextInfo    = { fg = p.info,    bg = "#75beff15" },
    DiagnosticVirtualTextHint    = { fg = p.hint,    bg = "#5cc9f515" },

    DiagnosticSignError          = { fg = p.error },
    DiagnosticSignWarn           = { fg = p.warning },
    DiagnosticSignInfo           = { fg = p.info },
    DiagnosticSignHint           = { fg = p.hint },

    ---------------------------------------------------------------------------
    -- LSP
    ---------------------------------------------------------------------------
    LspReferenceText             = { bg = p.line_highlight },
    LspReferenceRead             = { bg = p.line_highlight },
    LspReferenceWrite            = { bg = p.line_highlight },
    LspSignatureActiveParameter  = { fg = p.cyan, bold = true },
    LspCodeLens                  = { fg = p.comment },
    LspInfoBorder                = { fg = p.subtle },

    ---------------------------------------------------------------------------
    -- Treesitter (@-prefixed capture groups)
    ---------------------------------------------------------------------------
    ["@variable"]                = { fg = p.pink },
    ["@variable.builtin"]        = { fg = p.blue },
    ["@variable.parameter"]      = { fg = p.pink, italic = true },
    ["@variable.member"]         = { fg = p.pink },

    ["@constant"]                = { fg = p.lavender },
    ["@constant.builtin"]        = { fg = p.lavender },
    ["@constant.macro"]          = { fg = p.lavender },

    ["@module"]                  = { fg = p.blue },
    ["@label"]                   = { fg = p.pink },

    ["@string"]                  = { fg = p.green },
    ["@string.documentation"]    = { fg = p.green },
    ["@string.regexp"]           = { fg = p.cyan },
    ["@string.escape"]           = { fg = p.cyan },
    ["@string.special"]          = { fg = p.cyan },

    ["@character"]               = { fg = p.green },
    ["@character.special"]       = { fg = p.cyan },

    ["@boolean"]                 = { fg = p.lavender },
    ["@number"]                  = { fg = p.lavender },
    ["@number.float"]            = { fg = p.lavender },

    ["@type"]                    = { fg = p.blue },
    ["@type.builtin"]            = { fg = p.blue },
    ["@type.definition"]         = { fg = p.blue },
    ["@type.qualifier"]          = { fg = p.purple },

    ["@attribute"]               = { fg = p.lavender },
    ["@property"]                = { fg = p.pink },

    ["@function"]                = { fg = p.cyan },
    ["@function.builtin"]        = { fg = p.cyan },
    ["@function.call"]           = { fg = p.cyan },
    ["@function.macro"]          = { fg = p.cyan },
    ["@function.method"]         = { fg = p.cyan },
    ["@function.method.call"]    = { fg = p.cyan },

    ["@constructor"]             = { fg = p.blue },
    ["@operator"]                = { fg = p.fg },

    ["@keyword"]                 = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.coroutine"]       = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.function"]        = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.operator"]        = { fg = p.purple },
    ["@keyword.import"]          = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.storage"]         = { fg = p.purple },
    ["@keyword.repeat"]          = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.return"]          = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.debug"]           = { fg = p.purple },
    ["@keyword.exception"]       = { fg = p.purple },
    ["@keyword.conditional"]     = { fg = p.purple, italic = keyword_style == italic },
    ["@keyword.directive"]       = { fg = p.purple },

    ["@punctuation.bracket"]     = { fg = p.fg },
    ["@punctuation.delimiter"]   = { fg = p.fg },
    ["@punctuation.special"]     = { fg = p.purple },

    ["@comment"]                 = { fg = p.comment, italic = comment_style == italic },
    ["@comment.documentation"]   = { fg = p.comment, italic = comment_style == italic },
    ["@comment.error"]           = { fg = p.error },
    ["@comment.warning"]         = { fg = p.warning },
    ["@comment.todo"]            = { fg = p.bg, bg = p.lavender, bold = true },
    ["@comment.note"]            = { fg = p.info },

    ["@markup.strong"]           = { bold = true },
    ["@markup.italic"]           = { italic = true },
    ["@markup.strikethrough"]    = { strikethrough = true },
    ["@markup.underline"]        = { underline = true },
    ["@markup.heading"]          = { fg = p.pink, bold = true },
    ["@markup.raw"]              = { fg = p.green },
    ["@markup.link"]             = { fg = p.purple, underline = true },
    ["@markup.link.url"]         = { fg = p.cyan, underline = true },
    ["@markup.link.label"]       = { fg = p.cyan },
    ["@markup.list"]             = { fg = p.pink },
    ["@markup.quote"]            = { fg = p.comment, italic = true },

    ["@diff.plus"]               = { fg = p.git_add },
    ["@diff.minus"]              = { fg = p.git_delete },
    ["@diff.delta"]              = { fg = p.git_change },

    ["@tag"]                     = { fg = p.pink },
    ["@tag.attribute"]           = { fg = p.lavender, italic = true },
    ["@tag.delimiter"]           = { fg = p.fg },

    ---------------------------------------------------------------------------
    -- Semantic tokens (LSP)
    ---------------------------------------------------------------------------
    ["@lsp.type.class"]          = { fg = p.blue },
    ["@lsp.type.decorator"]      = { fg = p.cyan },
    ["@lsp.type.enum"]           = { fg = p.blue },
    ["@lsp.type.enumMember"]     = { fg = p.cyan },
    ["@lsp.type.function"]       = { fg = p.cyan },
    ["@lsp.type.interface"]      = { fg = p.blue },
    ["@lsp.type.macro"]          = { fg = p.purple },
    ["@lsp.type.method"]         = { fg = p.cyan },
    ["@lsp.type.namespace"]      = { fg = p.blue },
    ["@lsp.type.parameter"]      = { fg = p.pink, italic = true },
    ["@lsp.type.property"]       = { fg = p.pink },
    ["@lsp.type.struct"]         = { fg = p.blue },
    ["@lsp.type.type"]           = { fg = p.blue },
    ["@lsp.type.typeParameter"]  = { fg = p.blue },
    ["@lsp.type.variable"]       = { fg = p.pink },
    ["@lsp.mod.defaultLibrary"]  = { fg = p.blue },
    ["@lsp.mod.readonly"]        = { fg = p.lavender },

    ---------------------------------------------------------------------------
    -- Plugins: Telescope
    ---------------------------------------------------------------------------
    TelescopeNormal              = { fg = p.fg, bg = bg },
    TelescopeBorder              = { fg = p.subtle, bg = bg },
    TelescopePromptNormal        = { fg = p.fg, bg = bg },
    TelescopePromptBorder        = { fg = p.subtle, bg = bg },
    TelescopePromptTitle         = { fg = p.white, bg = bg, bold = true },
    TelescopeResultsNormal       = { fg = p.fg, bg = bg },
    TelescopeResultsBorder       = { fg = p.subtle, bg = bg },
    TelescopeResultsTitle        = { fg = p.white, bg = bg, bold = true },
    TelescopePreviewNormal       = { fg = p.fg, bg = bg },
    TelescopePreviewBorder       = { fg = p.subtle, bg = bg },
    TelescopePreviewTitle        = { fg = p.white, bg = bg, bold = true },
    TelescopeSelection           = { fg = p.white, bg = p.line_highlight },
    TelescopeSelectionCaret      = { fg = p.cyan },
    TelescopeMatching            = { fg = p.cyan, bold = true },

    ---------------------------------------------------------------------------
    -- Plugins: nvim-tree / neo-tree
    ---------------------------------------------------------------------------
    NvimTreeNormal               = { fg = p.fg, bg = bg },
    NvimTreeFolderName           = { fg = p.fg },
    NvimTreeOpenedFolderName     = { fg = p.white, bold = true },
    NvimTreeRootFolder           = { fg = p.white, bold = true },
    NvimTreeFolderIcon           = { fg = p.cyan },
    NvimTreeFileIcon             = { fg = p.fg },
    NvimTreeSpecialFile          = { fg = p.lavender },
    NvimTreeIndentMarker         = { fg = p.subtle },
    NvimTreeGitDirty             = { fg = p.git_change },
    NvimTreeGitNew               = { fg = p.git_add },
    NvimTreeGitDeleted           = { fg = p.git_delete },
    NvimTreeGitStaged            = { fg = p.git_add },
    NvimTreeWinSeparator         = { fg = p.subtle, bg = bg },

    NeoTreeNormal                = { fg = p.fg, bg = bg },
    NeoTreeNormalNC              = { fg = p.fg, bg = bg },
    NeoTreeGitAdded              = { fg = p.git_add },
    NeoTreeGitConflict           = { fg = p.warning },
    NeoTreeGitDeleted            = { fg = p.git_delete },
    NeoTreeGitModified           = { fg = p.git_change },
    NeoTreeGitUntracked          = { fg = p.git_untracked },
    NeoTreeIndentMarker          = { fg = p.subtle },

    ---------------------------------------------------------------------------
    -- Plugins: Gitsigns
    ---------------------------------------------------------------------------
    GitSignsAdd                  = { fg = p.git_add },
    GitSignsChange               = { fg = p.diff_change },
    GitSignsDelete               = { fg = p.git_delete },
    GitSignsAddNr                = { fg = p.git_add },
    GitSignsChangeNr             = { fg = p.diff_change },
    GitSignsDeleteNr             = { fg = p.git_delete },
    GitSignsAddLn                = { bg = p.diff_add },
    GitSignsChangeLn             = { bg = "#0c7d9d33" },
    GitSignsDeleteLn             = { bg = p.diff_delete },

    ---------------------------------------------------------------------------
    -- Plugins: Indent-blankline
    ---------------------------------------------------------------------------
    IndentBlanklineChar          = { fg = p.subtle, nocombine = true },
    IndentBlanklineContextChar   = { fg = p.gutter, nocombine = true },
    IblIndent                    = { fg = p.subtle, nocombine = true },
    IblScope                     = { fg = p.gutter, nocombine = true },

    ---------------------------------------------------------------------------
    -- Plugins: nvim-cmp
    ---------------------------------------------------------------------------
    CmpItemAbbr                  = { fg = p.fg },
    CmpItemAbbrDeprecated        = { fg = p.comment, strikethrough = true },
    CmpItemAbbrMatch             = { fg = p.cyan, bold = true },
    CmpItemAbbrMatchFuzzy        = { fg = p.cyan, bold = true },
    CmpItemKind                  = { fg = p.lavender },
    CmpItemMenu                  = { fg = p.comment },
    CmpItemKindClass             = { fg = p.blue },
    CmpItemKindColor             = { fg = p.green },
    CmpItemKindConstant          = { fg = p.lavender },
    CmpItemKindConstructor       = { fg = p.blue },
    CmpItemKindEnum              = { fg = p.blue },
    CmpItemKindEnumMember        = { fg = p.cyan },
    CmpItemKindEvent             = { fg = p.purple },
    CmpItemKindField             = { fg = p.pink },
    CmpItemKindFile              = { fg = p.fg },
    CmpItemKindFolder            = { fg = p.cyan },
    CmpItemKindFunction          = { fg = p.cyan },
    CmpItemKindInterface         = { fg = p.blue },
    CmpItemKindKeyword           = { fg = p.purple },
    CmpItemKindMethod            = { fg = p.cyan },
    CmpItemKindModule            = { fg = p.blue },
    CmpItemKindOperator          = { fg = p.fg },
    CmpItemKindProperty          = { fg = p.pink },
    CmpItemKindReference         = { fg = p.lavender },
    CmpItemKindSnippet           = { fg = p.green },
    CmpItemKindStruct            = { fg = p.blue },
    CmpItemKindText              = { fg = p.fg },
    CmpItemKindTypeParameter     = { fg = p.blue },
    CmpItemKindUnit              = { fg = p.lavender },
    CmpItemKindValue             = { fg = p.lavender },
    CmpItemKindVariable          = { fg = p.pink },

    ---------------------------------------------------------------------------
    -- Plugins: Which-key
    ---------------------------------------------------------------------------
    WhichKey                     = { fg = p.cyan },
    WhichKeyGroup                = { fg = p.purple },
    WhichKeyDesc                 = { fg = p.fg },
    WhichKeySeparator            = { fg = p.comment },
    WhichKeyFloat                = { bg = bg },
    WhichKeyBorder               = { fg = p.subtle, bg = bg },
    WhichKeyValue                = { fg = p.comment },

    ---------------------------------------------------------------------------
    -- Plugins: Dashboard / Alpha
    ---------------------------------------------------------------------------
    DashboardHeader              = { fg = p.cyan },
    DashboardFooter              = { fg = p.comment },
    DashboardCenter              = { fg = p.fg },
    DashboardShortCut            = { fg = p.purple },
    AlphaHeader                  = { fg = p.cyan },
    AlphaButtons                 = { fg = p.fg },
    AlphaShortcut                = { fg = p.purple },
    AlphaFooter                  = { fg = p.comment },

    ---------------------------------------------------------------------------
    -- Plugins: Lazy.nvim
    ---------------------------------------------------------------------------
    LazyNormal                   = { fg = p.fg, bg = bg },
    LazyButton                   = { fg = p.fg, bg = p.subtle },
    LazyButtonActive             = { fg = p.white, bg = p.gutter, bold = true },
    LazyH1                       = { fg = p.bg, bg = p.cyan, bold = true },

    ---------------------------------------------------------------------------
    -- Plugins: Mason
    ---------------------------------------------------------------------------
    MasonNormal                  = { fg = p.fg, bg = bg },
    MasonHeader                  = { fg = p.bg, bg = p.cyan, bold = true },
    MasonHighlight               = { fg = p.cyan },
    MasonHighlightBlock          = { fg = p.bg, bg = p.cyan },
    MasonHighlightBlockBold      = { fg = p.bg, bg = p.cyan, bold = true },
    MasonMutedBlock              = { fg = p.fg, bg = p.subtle },

    ---------------------------------------------------------------------------
    -- Plugins: Notify
    ---------------------------------------------------------------------------
    NotifyERRORBorder            = { fg = p.error },
    NotifyERRORIcon              = { fg = p.error },
    NotifyERRORTitle             = { fg = p.error },
    NotifyWARNBorder             = { fg = p.warning },
    NotifyWARNIcon               = { fg = p.warning },
    NotifyWARNTitle              = { fg = p.warning },
    NotifyINFOBorder             = { fg = p.info },
    NotifyINFOIcon               = { fg = p.info },
    NotifyINFOTitle              = { fg = p.info },
    NotifyDEBUGBorder            = { fg = p.comment },
    NotifyDEBUGIcon              = { fg = p.comment },
    NotifyDEBUGTitle             = { fg = p.comment },
    NotifyTRACEBorder            = { fg = p.purple },
    NotifyTRACEIcon              = { fg = p.purple },
    NotifyTRACETitle             = { fg = p.purple },

    ---------------------------------------------------------------------------
    -- Plugins: Bufferline
    ---------------------------------------------------------------------------
    BufferLineFill                = { bg = bg },
    BufferLineBackground         = { fg = p.gutter, bg = bg },
    BufferLineBuffer             = { fg = p.gutter, bg = bg },
    BufferLineBufferSelected     = { fg = p.white, bg = bg, bold = true },
    BufferLineBufferVisible      = { fg = p.comment, bg = bg },
    BufferLineCloseButton        = { fg = p.gutter, bg = bg },
    BufferLineCloseButtonSelected = { fg = p.white, bg = bg },
    BufferLineCloseButtonVisible = { fg = p.comment, bg = bg },
    BufferLineIndicatorSelected  = { fg = p.cyan, bg = bg },
    BufferLineSeparator          = { fg = bg, bg = bg },
    BufferLineSeparatorSelected  = { fg = bg, bg = bg },
    BufferLineSeparatorVisible   = { fg = bg, bg = bg },
    BufferLineModified           = { fg = p.git_change },
    BufferLineModifiedSelected   = { fg = p.git_change },
    BufferLineModifiedVisible    = { fg = p.git_change },

    ---------------------------------------------------------------------------
    -- Plugins: Noice
    ---------------------------------------------------------------------------
    NoiceCmdline                 = { fg = p.fg },
    NoiceCmdlineIcon             = { fg = p.cyan },
    NoiceCmdlineIconSearch       = { fg = p.lavender },
    NoiceCmdlinePopup            = { fg = p.fg, bg = bg },
    NoiceCmdlinePopupBorder      = { fg = p.subtle },
    NoiceConfirm                 = { fg = p.fg, bg = bg },
    NoiceConfirmBorder           = { fg = p.subtle },

    ---------------------------------------------------------------------------
    -- Plugins: Mini
    ---------------------------------------------------------------------------
    MiniStatuslineDevinfo        = { fg = p.fg, bg = p.subtle },
    MiniStatuslineFileinfo       = { fg = p.fg, bg = p.subtle },
    MiniStatuslineFilename       = { fg = p.fg, bg = bg },
    MiniStatuslineInactive       = { fg = p.comment, bg = bg },
    MiniStatuslineModeCommand    = { fg = p.bg, bg = p.lavender, bold = true },
    MiniStatuslineModeInsert     = { fg = p.bg, bg = p.green, bold = true },
    MiniStatuslineModeNormal     = { fg = p.bg, bg = p.cyan, bold = true },
    MiniStatuslineModeOther      = { fg = p.bg, bg = p.purple, bold = true },
    MiniStatuslineModeReplace    = { fg = p.bg, bg = p.pink, bold = true },
    MiniStatuslineModeVisual     = { fg = p.bg, bg = p.blue, bold = true },

    ---------------------------------------------------------------------------
    -- NvChad-specific overrides (Tbline / St)
    ---------------------------------------------------------------------------
    TbLineBufOn                  = { fg = p.white, bg = bg, bold = true },
    TbLineBufOff                 = { fg = p.gutter, bg = bg },
    TbLineBufOnClose             = { fg = p.white, bg = bg },
    TbLineBufOffClose            = { fg = p.gutter, bg = bg },
    TbLineBufOnModified          = { fg = p.git_change, bg = bg },
    TbLineBufOffModified         = { fg = p.gutter, bg = bg },
    TbLineTabOn                  = { fg = p.white, bg = bg, bold = true },
    TbLineTabOff                 = { fg = p.gutter, bg = bg },
    TbLineTabCloseBtn            = { fg = p.white, bg = bg },
    TblineTabNewBtn              = { fg = p.cyan, bg = bg },
    TbLineThemeToggleBtn         = { fg = p.cyan, bg = bg },
    TbLineCloseAllBufsBtn        = { fg = p.pink, bg = bg },
    TbLineFill                   = { bg = bg },

    St_NormalMode                = { fg = p.bg, bg = p.cyan, bold = true },
    St_InsertMode                = { fg = p.bg, bg = p.green, bold = true },
    St_VisualMode                = { fg = p.bg, bg = p.blue, bold = true },
    St_ReplaceMode               = { fg = p.bg, bg = p.pink, bold = true },
    St_TerminalMode              = { fg = p.bg, bg = p.purple, bold = true },
    St_CommandMode               = { fg = p.bg, bg = p.lavender, bold = true },
    St_ConfirmMode               = { fg = p.bg, bg = p.lavender, bold = true },
    St_SelectMode                = { fg = p.bg, bg = p.blue, bold = true },

    St_NormalModeSep             = { fg = p.cyan, bg = bg },
    St_InsertModeSep             = { fg = p.green, bg = bg },
    St_VisualModeSep             = { fg = p.blue, bg = bg },
    St_ReplaceModeSep            = { fg = p.pink, bg = bg },
    St_TerminalModeSep           = { fg = p.purple, bg = bg },
    St_CommandModeSep            = { fg = p.lavender, bg = bg },

    St_file                      = { fg = p.white, bg = p.subtle },
    St_file_sep                  = { fg = p.subtle, bg = bg },
    St_gitIcons                  = { fg = p.comment, bg = p.subtle },
    St_lspError                  = { fg = p.error, bg = p.subtle },
    St_lspWarning                = { fg = p.warning, bg = p.subtle },
    St_lspHints                  = { fg = p.hint, bg = p.subtle },
    St_lspInfo                   = { fg = p.info, bg = p.subtle },
    St_LspStatus                 = { fg = p.cyan, bg = p.subtle },
    St_LspProgress               = { fg = p.green, bg = bg },
    St_cwd                       = { fg = p.bg, bg = p.pink },
    St_cwd_sep                   = { fg = p.pink, bg = bg },
    St_pos_sep                   = { fg = p.cyan, bg = bg },
    St_pos_text                  = { fg = p.bg, bg = p.cyan },
  }

  return hl
end

return M
