-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.relativenumber = false

if vim.g.started_by_firenvim == true then
  vim.o.laststatus = 0
end
