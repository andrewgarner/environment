return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
  },
  init = function()
    vim.cmd.colorscheme "tokyonight"
    vim.cmd.hi "Comment gui=none"
  end,
}
