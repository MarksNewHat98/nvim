local map = vim.keymap.set

map({ "i", "n" }, "<C-BS>", "<C-W>")
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")

map("n", "<leader>fn", "<cmd>enew<cr>")

map("x", "<", "<gv")
map("x", ">", ">gv")

map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

