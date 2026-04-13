-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

keyset("i", "<S-BS>", "<C-W>", opts) -- if terminal reports <S-BS>
keyset("i", "<S-Del>", function()
  vim.schedule(function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    row = row - 1
    local line = vim.api.nvim_get_current_line()
    local s, e = string.find(line, "%s*%w+", col + 1)
    if s then
      local new_line = line:sub(1, col) .. line:sub(e + 1)
      vim.api.nvim_set_current_line(new_line)
      vim.api.nvim_win_set_cursor(0, { row + 1, col })
    end
  end)

  return ""
end, opts)

keyset("n", "<S-BS>", "db", opts) -- delete back a word in normal
keyset("n", "<S-Del>", "dw", opts) -- delete forward a word in normal
