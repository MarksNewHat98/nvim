-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

local function delete_backward()
  vim.schedule(function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    if col == 0 then
      return
    end
    -- find start of previous word/whitespace (mimic Insert-mode <C-W>)
    -- delete back to previous whitespace boundary
    local prefix = line:sub(1, col)
    -- remove trailing whitespace first
    local s, e = prefix:find("%s+$")
    if s then
      prefix = prefix:sub(1, s - 1)
    end

    -- remove last "word" characters
    local s2, e2 = prefix:find("%s?%w+$")
    if s2 then
      prefix = prefix:sub(1, s2 - 1)
    else
      -- if neither, delete one char
      prefix = prefix:sub(1, -2)
    end

    local new_line = prefix .. line:sub(col + 1)
    vim.api.nvim_set_current_line(new_line)
    local new_col = #prefix
    vim.api.nvim_win_set_cursor(0, { row, new_col })
  end)

  return ""
end
local function delete_forward()
  vim.schedule(function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local s, e = string.find(line, "%s?[%w%p]*%s?", col)
    if s then
      local new_line = line:sub(1, col) .. line:sub(e + 1)
      vim.api.nvim_set_current_line(new_line)
      vim.api.nvim_win_set_cursor(0, { row, col })
    end

    local s, e = string.find(line, "^%s*$")
    if s then
      vim.api.nvim_set_current_line("")
      if e == 0 then
        vim.api.nvim_del_current_line()
      end
    end
  end)

  return ""
end

keyset("i", "<S-BS>", delete_backward, opts)
keyset("i", "<S-Del>", delete_forward, opts)

keyset("n", "<S-BS", delete_backward, opts)
keyset("n", "<S-Del>", delete_forward, opts)
