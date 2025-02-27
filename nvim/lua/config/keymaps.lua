-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<Leader>k", "<Cmd>nohlsearch<CR>")
map("n", "<Leader>n", "<Cmd>Neotree toggle<CR>")

vim.cmd([[command! W w]])
