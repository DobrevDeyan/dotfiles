return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme(vim.o.background == "light" and "catppuccin-latte" or "catppuccin-mocha")
    end,
  },
}
