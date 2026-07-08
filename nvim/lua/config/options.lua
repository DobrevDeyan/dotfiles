vim.opt.number = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true

local function is_dark_mode()
  if vim.fn.has("mac") == 1 then
    local ok, result = pcall(vim.fn.system, { "defaults", "read", "-g", "AppleInterfaceStyle" })
    return ok and result:match("Dark") ~= nil
  elseif vim.fn.has("win32") == 1 then
    local ok, result = pcall(vim.fn.system, {
      "reg", "query",
      "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
      "/v", "AppsUseLightTheme",
    })
    return not (ok and result:match("0x1") ~= nil)
  end
  return true
end

vim.o.background = is_dark_mode() and "dark" or "light"
