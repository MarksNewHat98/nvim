-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local api = vim.api
local schedule = vim.schedule
local cmd = vim.cmd
local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

local function split_with_indices(str, delimiter)
  local result = {}
  local start = 1
  local delim_start, delim_end = string.find(str, delimiter, start)

  while delim_start do
    table.insert(result, {
      ["string"] = string.sub(str, start, delim_start - 1),
      ["start"] = start,
      ["stop"] = delim_start - 1,
    })
    start = delim_end + 1
    delim_start, delim_end = string.find(str, delimiter, start)
  end

  table.insert(result, {
    ["string"] = string.sub(str, start),
    ["start"] = start,
    ["stop"] = #str,
  })

  return result
end

local function delete_backward()
  schedule(function()
    local row, col = unpack(api.nvim_win_get_cursor(0))
    local line = api.nvim_get_current_line()
    if col == 0 then
      return
    end
    local prefix = line:sub(1, col)
    local s, e = prefix:find("%s+$")
    if s then
      prefix = prefix:sub(1, s - 1)
    end

    local s2, e2 = prefix:find("%s?%w+$")
    if s2 then
      prefix = prefix:sub(1, s2 - 1)
    else
      prefix = prefix:sub(1, -2)
    end

    local new_line = prefix .. line:sub(col + 1)
    api.nvim_set_current_line(new_line)
    local new_col = #prefix
    api.nvim_win_set_cursor(0, { row, new_col })
  end)

  return ""
end

local function delete_forward()
  schedule(function()
    local row, col = unpack(api.nvim_win_get_cursor(0))
    local line = api.nvim_get_current_line()
    local s, e = string.find(line, "%s?[%w%p]*%s?", col)
    if s then
      local new_line = line:sub(1, col) .. line:sub(e + 1)
      api.nvim_set_current_line(new_line)
      api.nvim_win_set_cursor(0, { row, col })
    end

    local s, e = string.find(line, "^%s*$")
    if s then
      api.nvim_set_current_line("")
      if e == 0 then
        api.nvim_del_current_line()
      end
    end
  end)

  return ""
end

local function select_space_seperated_text()
  schedule(function()
    local row, col = unpack(api.nvim_win_get_cursor(0))
    local bufnr = api.nvim_get_current_buf()
    local line = api.nvim_get_current_line()
    local strs = split_with_indices(line, " ")
    for _, v in pairs(strs) do
      local space_check = string.match(v.string, "^(%s*)$")
      if space_check == "" then
        goto continue
      end
      if space_check ~= "" and space_check ~= nil then
        goto continue
      end

      if v.start > col + 1 or v.stop < col then
        goto continue
      end

      print(v.string)

      --vim.hl.range(bufnr, "Visual", "Visual", v.start - 1, v.stop)
      api.nvim_win_set_cursor(0, { row, v.start - 1 })
      api.nvim_buf_set_mark(0, "v", row, v.stop - 1, {})
      cmd("normal <Esc>vVv`v")
      cmd("delmarks v")
      --api.nvim_win_set_cursor(0, { row, v.stop })
      ::continue::
    end
  end)

  return ""
end

keyset({ "i", "n" }, "<S-BS", delete_backward, opts)
keyset({ "i", "n" }, "<S-Del>", delete_forward, opts)
keyset({ "i", "n" }, "<C-D>", select_space_seperated_text, opts)

api.nvim_create_autocmd("BufEnter", {
  pattern = "github.com_*.txt",
  command = "set filetype=markdown",
})
