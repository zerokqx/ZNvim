-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local mF = require("functions.miniFiles")
vim.keymap.set("i", "<CL>", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
-- vim.keymap.set("n", "<Leader>cn", ":lua require('neogen').generate()<CR>", { desc = "Neogen" })
vim.keymap.set("n", "<Leader>rt", ":terminal bun run %<CR>", { desc = "Launch Typescript" })
vim.keymap.set("n", "<Leader>e", mF.miniFilesRelative, { desc = "Launch Typescript" })
vim.keymap.set("n", "<Leader>E", mF.miniFilesRoot, { desc = "Launch Typescript" })
