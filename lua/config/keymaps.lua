local map = vim.keymap.set

map({ "i", "n" }, "<C-BS>", "<C-W>")

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")

map("n", "<leader>fn", "<cmd>enew<cr>")

