local map = vim.keymap.set
local function exec_cmd(cmd, ret)
    return function()
        vim.cmd(cmd)
        return ret
    end
end

local all_modes = { "i", "x", "n", "s", "c" }

local function table_clone_insert(t, ...)
    local nt = {}
    for i, v in pairs(t) do
        nt[i] = v
    end
    for i, v in pairs({...}) do
        table.insert(nt,  v)
    end
    return nt
end

map(table_clone_insert(all_modes, "t"), "<C-BS>", "<C-W>")
map(all_modes, "<C-s>", exec_cmd("write"))

map("n", "<leader>fn", "<cmd>enew<cr>")

map("x", "<", "<gv")
map("x", ">", ">gv")

map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>ba", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map(all_modes, "<esc>", exec_cmd("noh", "<esc>"), { expr = true, desc = "Escape and Clear hlsearch" })

map(table_clone_insert(all_modes, "t"), "<C-r>", exec_cmd("redo"))
map(all_modes, "<C-z>", exec_cmd("undo"))
