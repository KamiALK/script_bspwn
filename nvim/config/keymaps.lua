-- keymaps are automatically loaded on the verylazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- add any additional keymaps hereby

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--split window
keymap.set("n", "zs", ":split<return>", opts)
keymap.set("n", "zv", ":vsplit<return>", opts)

--rezise window
keymap.set("n", "s<left>", "<c-w><")
keymap.set("n", "s<right>", "<c-w>>")
keymap.set("n", "s<up>", "<c-w>+")
keymap.set("n", "s<down>", "<c-w>-")

keymap.set("n", "te", ":tabedit<return>", opts)
keymap.set("n", "ty", ":tabnext<return>", opts)
keymap.set("n", "tr", ":tabprev<Return>", opts)

keymap.set("v", ">", ">gv", { desc = "after tab in re-select the same" })
keymap.set("v", "<", "<gv", { desc = "after tab out re-select the same" })
keymap.set("n", "n", "nzzzv", { desc = "Goes to the next result on the seach and put the cursor in the middle" })
keymap.set("n", "N", "Nzzzv", { desc = "Goes to the prev result on the seach and put the cursor in the middle" })

-- keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- keymap.set("n", "<leader>Y", [["+Y]])
