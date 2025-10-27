--
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
set("n", "<Leader>rt", ":terminal bun run %<CR>", { desc = "Launch Typescript" })
-- set("n", "<Leader>e", mF.miniFilesRelative, { desc = mF.name })

set("n", "<leader>ci", function()
  require("functions.fileManager.importInIndex").importInIndex()
end, { desc = "Generate exports in index.ts(x)" })
