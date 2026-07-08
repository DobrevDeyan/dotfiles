vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "forestdark"

local hi = vim.api.nvim_set_hl

local c = {
  bg0    = "#000000",
  bg1    = "#052b1d",
  bg2    = "#0b5f40",
  bg3    = "#202622",
  bg4    = "#303a34",
  bg5    = "#414d45",
  fg0    = "#d4d4d4",
  fg1    = "#b2b2b2",
  fg2    = "#8e8e8e",
  fg3    = "#595959",
  muted  = "#536359",
  red    = "#FF5733",
  g1     = "#16bf81",
  g2     = "#1adf96",
  g3     = "#55ebb4",
  g4     = "#75efc2",
  g5     = "#95f2d0",
  t1     = "#53827d",
  t2     = "#568782",
  t3     = "#75a7a2",
  t4     = "#8bb5b1",
  t5     = "#b7d1ce",
}

-- Editor base
hi(0, "Normal",          { fg = c.fg0,  bg = c.bg0 })
hi(0, "NormalFloat",     { fg = c.fg0,  bg = c.bg1 })
hi(0, "FloatBorder",     { fg = c.muted, bg = c.bg1 })
hi(0, "NormalNC",        { fg = c.fg1,  bg = c.bg0 })
hi(0, "Cursor",          { fg = c.bg0,  bg = c.g2 })
hi(0, "CursorLine",      { bg = c.bg1 })
hi(0, "CursorColumn",    { bg = c.bg1 })
hi(0, "ColorColumn",     { bg = c.bg1 })
hi(0, "LineNr",          { fg = c.fg3 })
hi(0, "CursorLineNr",    { fg = c.g2,   bold = true })
hi(0, "SignColumn",      { fg = c.fg3,  bg = c.bg0 })
hi(0, "VertSplit",       { fg = c.bg5 })
hi(0, "WinSeparator",    { fg = c.bg5 })
hi(0, "Folded",          { fg = c.muted, bg = c.bg1 })
hi(0, "FoldColumn",      { fg = c.fg3,  bg = c.bg0 })
hi(0, "EndOfBuffer",     { fg = c.bg5 })
hi(0, "NonText",         { fg = c.bg5 })
hi(0, "SpecialKey",      { fg = c.t1 })
hi(0, "Whitespace",      { fg = c.bg5 })
hi(0, "MatchParen",      { fg = c.g2,   bold = true, underline = true })
hi(0, "Conceal",         { fg = c.muted })

-- Selection / Search
hi(0, "Visual",          { bg = c.bg4 })
hi(0, "VisualNOS",       { bg = c.bg4 })
hi(0, "Search",          { fg = c.bg0,  bg = c.g2 })
hi(0, "IncSearch",       { fg = c.bg0,  bg = c.g3 })
hi(0, "CurSearch",       { fg = c.bg0,  bg = c.g2, bold = true })
hi(0, "Substitute",      { fg = c.bg0,  bg = c.t3 })

-- Status / Tab line
hi(0, "StatusLine",      { fg = c.fg0,  bg = c.bg1 })
hi(0, "StatusLineNC",    { fg = c.fg3,  bg = c.bg1 })
hi(0, "TabLine",         { fg = c.fg2,  bg = c.bg1 })
hi(0, "TabLineSel",      { fg = c.g2,   bg = c.bg0, bold = true })
hi(0, "TabLineFill",     { bg = c.bg1 })
hi(0, "WildMenu",        { fg = c.bg0,  bg = c.g2 })

-- Popup menu
hi(0, "Pmenu",           { fg = c.fg0,  bg = c.bg1 })
hi(0, "PmenuSel",        { fg = c.bg0,  bg = c.t2 })
hi(0, "PmenuSbar",       { bg = c.bg3 })
hi(0, "PmenuThumb",      { bg = c.muted })

-- Messages
hi(0, "ModeMsg",         { fg = c.g2,   bold = true })
hi(0, "MoreMsg",         { fg = c.g1 })
hi(0, "Question",        { fg = c.t4 })
hi(0, "Title",           { fg = c.g5,   bold = true })
hi(0, "WarningMsg",      { fg = c.t5 })
hi(0, "ErrorMsg",        { fg = c.red })

-- Diagnostics
hi(0, "DiagnosticError",          { fg = c.red })
hi(0, "DiagnosticWarn",           { fg = c.t5 })
hi(0, "DiagnosticInfo",           { fg = c.t4 })
hi(0, "DiagnosticHint",           { fg = c.g4 })
hi(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = c.t5 })
hi(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = c.t4 })
hi(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = c.g4 })

-- Syntax (classic groups)
-- Hierarchy: keyword=#1adf96  type=#568782  fn-def=#d4d4d4  string=#55ebb4  ops=dark-gray
hi(0, "Comment",         { fg = c.muted, italic = true })
hi(0, "Constant",        { fg = c.t5 })
hi(0, "String",          { fg = c.g3 })
hi(0, "Character",       { fg = c.g3 })
hi(0, "Number",          { fg = c.t5 })
hi(0, "Boolean",         { fg = c.red,  bold = true })
hi(0, "Float",           { fg = c.t5 })
hi(0, "Identifier",      { fg = c.fg0 })
hi(0, "Function",        { fg = c.fg0 })        -- near-white, clearly not green
hi(0, "Statement",       { fg = c.g2,   bold = true })
hi(0, "Conditional",     { fg = c.g2,   bold = true })
hi(0, "Repeat",          { fg = c.g2,   bold = true })
hi(0, "Label",           { fg = c.g2 })
hi(0, "Operator",        { fg = c.fg2 })
hi(0, "Keyword",         { fg = c.g2,   bold = true })
hi(0, "Exception",       { fg = c.red,  bold = true })
hi(0, "PreProc",         { fg = c.t2 })
hi(0, "Include",         { fg = c.t2 })
hi(0, "Define",          { fg = c.t2 })
hi(0, "Macro",           { fg = c.t3 })
hi(0, "PreCondit",       { fg = c.t2 })
hi(0, "Type",            { fg = c.t2 })          -- teal, distinct hue from green keywords
hi(0, "StorageClass",    { fg = c.g2,   bold = true })
hi(0, "Structure",       { fg = c.t2 })
hi(0, "Typedef",         { fg = c.t2 })
hi(0, "Special",         { fg = c.g4 })
hi(0, "SpecialChar",     { fg = c.g3 })
hi(0, "Tag",             { fg = c.fg0 })
hi(0, "Delimiter",       { fg = c.fg2 })
hi(0, "SpecialComment",  { fg = c.t4,   italic = true })
hi(0, "Debug",           { fg = c.g5 })
hi(0, "Underlined",      { underline = true })
hi(0, "Error",           { fg = c.red })
hi(0, "Todo",            { fg = c.bg0,  bg = c.g2, bold = true })

-- Treesitter
hi(0, "@comment",               { link = "Comment" })
hi(0, "@string",                { link = "String" })
hi(0, "@string.escape",         { fg = c.g5 })
hi(0, "@string.special",        { fg = c.g5 })
hi(0, "@number",                { link = "Number" })
hi(0, "@boolean",               { fg = c.red,  bold = true })
hi(0, "@float",                 { link = "Float" })
hi(0, "@function",              { fg = c.fg0 })           -- definition: near-white
hi(0, "@function.builtin",      { fg = c.g4 })            -- builtin: lighter mint
hi(0, "@function.call",         { fg = c.g4 })            -- call: lighter mint, not bold
hi(0, "@function.macro",        { fg = c.t3 })
hi(0, "@method",                { fg = c.fg0 })           -- definition: near-white
hi(0, "@method.call",           { fg = c.g4 })            -- call: lighter mint
hi(0, "@constructor",           { fg = c.t2 })
hi(0, "@parameter",             { fg = c.t5 })            -- light blue-teal: distinct from vars
hi(0, "@keyword",               { link = "Keyword" })
hi(0, "@keyword.function",      { fg = c.g2,   bold = true })
hi(0, "@keyword.operator",      { fg = c.fg2 })
hi(0, "@keyword.return",        { fg = c.g2,   bold = true })
hi(0, "@conditional",           { link = "Conditional" })
hi(0, "@repeat",                { link = "Repeat" })
hi(0, "@label",                 { link = "Label" })
hi(0, "@operator",              { fg = c.fg2 })
hi(0, "@exception",             { fg = c.red,  bold = true })
hi(0, "@type",                  { fg = c.t2 })            -- teal: clearly ≠ keyword green
hi(0, "@type.builtin",          { fg = c.t2,   bold = true })
hi(0, "@type.definition",       { fg = c.t2 })
hi(0, "@type.qualifier",        { fg = c.g2,   bold = true }) -- const/readonly qualifiers = keyword
hi(0, "@namespace",             { fg = c.t1 })
hi(0, "@include",               { link = "Include" })
hi(0, "@variable",              { fg = c.fg0 })
hi(0, "@variable.builtin",      { fg = c.g2,   italic = true }) -- this/self = keyword-ish
hi(0, "@constant",              { fg = c.t5 })
hi(0, "@constant.builtin",      { fg = c.red,  bold = true })
hi(0, "@field",                 { fg = c.fg0 })           -- keys: near-white, neutral
hi(0, "@property",              { fg = c.fg0 })           -- properties: near-white, neutral
hi(0, "@punctuation.bracket",   { fg = c.fg2 })
hi(0, "@punctuation.delimiter", { fg = c.fg2 })
hi(0, "@punctuation.special",   { fg = c.muted })
hi(0, "@tag",                   { fg = c.g2 })
hi(0, "@tag.attribute",         { fg = c.t4 })
hi(0, "@tag.delimiter",         { fg = c.fg3 })
hi(0, "@text",                  { fg = c.fg0 })
hi(0, "@text.title",            { link = "Title" })
hi(0, "@text.emphasis",         { italic = true })
hi(0, "@text.strong",           { bold = true })
hi(0, "@text.uri",              { fg = c.t4,   underline = true })
hi(0, "@text.todo",             { link = "Todo" })
hi(0, "@text.reference",        { fg = c.t4 })

-- LSP
hi(0, "LspReferenceText",              { bg = c.bg3 })
hi(0, "LspReferenceRead",              { bg = c.bg3 })
hi(0, "LspReferenceWrite",             { bg = c.bg3, underline = true })
hi(0, "LspSignatureActiveParameter",   { fg = c.g2,  bold = true })

-- Git diff
hi(0, "DiffAdd",    { fg = c.g2,  bg = c.bg0 })
hi(0, "DiffChange", { fg = c.t3,  bg = c.bg0 })
hi(0, "DiffDelete", { fg = c.fg3, bg = c.bg0 })
hi(0, "DiffText",   { fg = c.t5,  bg = c.bg1 })
hi(0, "Added",      { fg = c.g2 })
hi(0, "Changed",    { fg = c.t3 })
hi(0, "Removed",    { fg = c.fg3 })
