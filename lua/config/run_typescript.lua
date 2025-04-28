local function compile_and_run_ts_file()
  local file_name = vim.api.nvim_buf_get_name(0)

  if file_name:match("%.ts$") then
    local ruta = vim.fn.getcwd()
    local base_name = file_name:match("([^/]+)%.ts$")

    local out_dir = ruta .. "/dist/"
    local ts_output_pattern = out_dir .. "**/" .. base_name .. ".js"

    -- Compilar proyecto
    local compile_cmd = "tsc -p " .. ruta .. "/tsconfig.json"
    vim.fn.system(compile_cmd)

    -- Buscar el archivo .js generado
    local matches = vim.fn.glob(ts_output_pattern, false, true)

    if #matches == 0 then
      print("Archivo compilado no encontrado.")
      return
    end

    local js_output = matches[1] -- El primer match

    -- Ejecutar
    local run_cmd = [[zsh -c 'node "]] .. js_output .. [["']]

    -- Abrir terminal dividida
    vim.cmd("vsplit | terminal")
    vim.cmd("terminal " .. run_cmd)
  else
    print("El archivo actual no es un archivo TypeScript.")
  end
end

vim.api.nvim_create_user_command("Typescript", compile_and_run_ts_file, {})

vim.api.nvim_create_user_command("Typescript", compile_and_run_ts_file, {})

vim.api.nvim_create_user_command("RunLiveServer", function()
  local file_name = vim.fn.expand("%")
  local file_path = vim.fn.expand("%:p:h") -- Obtiene la ruta del directorio actual del archivo
  if file_name:match("%.html$") then
    local cmd = "cd " .. file_path .. " && live-server ."
    vim.fn.system(cmd)
    print("Running live-server for HTML file: " .. file_name)
  else
    print("No es un archivo HTML válido.")
  end
end, {})

vim.api.nvim_create_user_command("RunTypescript", function()
  local file_name = vim.fn.expand("%")
  local file_path = vim.fn.expand("%:p:h") -- Obtiene la ruta del directorio actual del archivo
  local cmd = "cd " .. file_path .. " && tsc -p tsconfig.json"
  vim.fn.system(cmd)
  print("Running live-server for HTML file: " .. file_name)
end, {})
