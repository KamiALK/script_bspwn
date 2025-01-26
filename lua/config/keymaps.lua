-- keymaps are automatically loaded on the verylazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- add any additional keymaps hereby

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- mi creados por mi
keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })
keymap.set("i", "ii", "<esc>")
keymap.set("t", "ii", "<esc>")
--split window
-- keymap.set("n", "tr", ":split<return>term vertical resize -10<cr>")
keymap.set("n", "ty", ":split term://bash | resize 10<CR>")
keymap.set("n", "th", ":q<CR>:only<CR>")

keymap.set("n", "zs", ":split<return>", opts)

keymap.set("n", "zv", ":vsplit<return>", opts)

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- crear un tab
keymap.set("n", "te", ":tabedit<return>", opts)
-- primero seleccionar con el modo visual y luego indentar
keymap.set("v", ">", ">gv", { desc = "after tab in re-select the same" })
keymap.set("v", "<", "<gv", { desc = "after tab out re-select the same" })
keymap.set("n", "n", "nzzzv", { desc = "Goes to the next result on the seach and put the cursor in the middle" })
keymap.set("n", "N", "Nzzzv", { desc = "Goes to the prev result on the seach and put the cursor in the middle" })

-- pegar al portapapeles
keymap.set({ "n", "v" }, "<leader>y", [["+y]])

--mover las lineas arriba o abajo
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })

vim.api.nvim_set_keymap(
  "n",
  "<A-x>",
  ":RunPythonFile<CR>",
  { noremap = true, silent = true, desc = "Run .py file via terminal" }
)

vim.api.nvim_set_keymap(
  "n",
  "<A-u>",
  ":CompileAndRunJavaFile<CR>",
  { noremap = true, silent = true, desc = "Run .java file via terminal" }
)

vim.api.nvim_set_keymap(
  "n",
  "<A-m>",
  ":MavenRun<CR>",
  { noremap = true, silent = true, desc = "Run Maven build and execute JAR" }
)
