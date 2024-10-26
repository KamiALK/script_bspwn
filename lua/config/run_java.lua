-- Define la función para compilar y ejecutar archivos Java
local function compile_and_run_java_file()
  -- Definir rutas de entrada y salida
  local input = "/src/main/java"
  local output = "/target/classes"

  -- Obtener el nombre del archivo actual
  local file_name = vim.api.nvim_buf_get_name(0)

  -- Verificar si el archivo es un archivo Java
  if file_name:match("%.java$") then
    -- Extraer el nombre base del archivo y el directorio del archivo
    local base_name = file_name:match("([^/]+)%.java$")
    local escaped_input = input:gsub("([%%%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
    local dir_name = file_name:match(".*" .. escaped_input .. "(.*)/[^/]+%.java$")

    -- Definir el directorio del proyecto y el directorio de clases objetivo
    local project_dir = vim.fn.getcwd()
    local target_classes_dir = project_dir .. output

    -- Crear el directorio si no existe
    vim.fn.mkdir(target_classes_dir, "p")

    -- Comando de compilación utilizando el patrón **/*.java
    local compile_cmd = "javac -d " .. target_classes_dir .. " " .. project_dir .. input .. dir_name .. "/**/*.java"

    -- Convertir la ruta del directorio a formato de paquete (com/kmialk/proyecto -> com.kmialk.proyecto)
    local package_name = dir_name:gsub("^/", ""):gsub("/", ".")

    -- Comando para ejecutar la clase
    local run_cmd = "zsh -c '"
      .. compile_cmd
      .. " && java -cp "
      .. target_classes_dir
      .. " "
      .. package_name
      .. "."
      .. base_name
      .. "'"

    -- Ejecutar en una terminal dividida
    vim.cmd("vsplit | terminal")
    vim.cmd("terminal " .. run_cmd)
  else
    print("El archivo actual no es un archivo Java.")
  end
end

-- Crear un comando de usuario para ejecutar la función de compilación y ejecución de Java
vim.api.nvim_create_user_command("CompileAndRunJavaFile", compile_and_run_java_file, {})
