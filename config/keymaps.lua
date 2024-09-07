-- keymaps are automatically loaded on the verylazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- add any additional keymaps hereby

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- mi prueba
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

local keymap = vim.keymap
local function run_curr_python_file()
  -- Get the file name in the current buffer
  local file_name = vim.api.nvim_buf_get_name(0)

  if file_name:match("%.py$") then
    -- Create a new terminal window and run the command
    vim.api.nvim_command("vnew | term python3 " .. file_name)
  else
    vim.api.nvim_err_writeln("Error: Not a Python file")
  end
end
keymap.set({ "n", "i" }, "<A-x>", "", {
  desc = "Run .py file via terminal",
  callback = run_curr_python_file,
})

local function compile_and_run_java_file()
  -- Definir rutas de entrada y salida
  local input = "/src/main/java/"
  local output = "/target/classes/"

  -- Obtener el nombre del archivo actual
  local file_name = vim.api.nvim_buf_get_name(0)

  -- Verificar si el archivo es un archivo Java
  if file_name:match("%.java$") then
    -- Extraer el nombre base del archivo y el directorio del archivo
    local base_name = file_name:match("([^/]+)%.java$")
    local escaped_input = input:gsub("([%%%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
    local dir_name = file_name:match(".*" .. escaped_input .. "(.*)/[^/]+%.java$")

    -- Verificar que se hayan extraído el nombre base y el directorio
    if not base_name or not dir_name then
      print("Error: Unable to extract base name or directory from file path")
      return
    end

    -- Definir el directorio del proyecto y el directorio de clases objetivo
    local project_dir = vim.fn.getcwd()
    local target_classes_dir = project_dir .. output
    local class_dir = target_classes_dir .. "/" .. dir_name

    vim.fn.mkdir(target_classes_dir, "p")

    local compile_cmd = "javac -d " .. target_classes_dir .. " " .. project_dir .. input .. dir_name .. "/*.java"

    vim.cmd("vsplit | terminal")
    local run_cmd = "zsh -c '"
      .. compile_cmd
      .. " && java -cp "
      .. target_classes_dir
      .. " "
      .. dir_name:gsub("/", ".")
      .. "."
      .. base_name
      .. "'"
    vim.cmd("terminal " .. run_cmd)
  else
    print("El archivo actual no es un archivo Java.")
  end
end

local function maven()
  -- Obtener el directorio del proyecto y el nombre del proyecto
  local project_dir = vim.fn.getcwd()
  local project_name = vim.fn.fnamemodify(project_dir, ":t")
  print("Nombre del directorio del proyecto: " .. project_name)

  local mvn_cmd = "cd " .. vim.fn.shellescape(project_dir) .. " && mvn clean package"
  local jar_file = "target/" .. project_name .. "-1.0-SNAPSHOT.jar"
  local java_cmd = "java -jar " .. vim.fn.shellescape(jar_file)

  vim.cmd("vsplit | terminal")
  local terminal_cmd = "zsh -c '" .. mvn_cmd .. " && " .. java_cmd .. "'"
  vim.cmd("terminal " .. terminal_cmd)
end

keymap.set({ "n", "i" }, "<A-u>", "", { desc = "Run .java file via toggle term", callback = compile_and_run_java_file })

keymap.set({ "n", "i" }, "<A-m>", "", { desc = "Run Maven build and execute JAR", callback = maven })
