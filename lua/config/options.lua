-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Configure code folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
-- Highlight search results
vim.opt.hlsearch = true
-- Display entered command in the statusline of the window
vim.opt.showcmdloc = "statusline"
-- Add winbar with path to the file opened in the buffer
vim.opt.winbar = "%=%m %f"
