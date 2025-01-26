-- Función para crear un nuevo proyecto Spring Boot con Maven
local function create_spring_boot_project()
  -- Solicitar el groupId
  local groupId = vim.fn.input("Ingrese el groupId (por defecto: com.example): ", "com.example")

  -- Solicitar el artifactId
  local artifactId = vim.fn.input("Ingrese el artifactId: ")

  if artifactId == "" then
    print("El artifactId es obligatorio.")
    return
  end

  -- Solicitar las dependencias
  local dependencies =
    vim.fn.input("Ingrese las dependencias separadas por coma (por ejemplo, web,data-jpa,thymeleaf): ")

  if dependencies == "" then
    print("Las dependencias son obligatorias.")
    return
  end

  -- Normalizar las dependencias (eliminar espacios extra)
  dependencies = dependencies:gsub("%s+", "")

  -- Comando de Maven para generar el proyecto usando Spring Initializr
  local download_command = string.format(
    "curl -s https://start.spring.io/starter.zip -d dependencies=%s -d type=maven-project -d groupId=%s -d artifactId=%s -d name=%s -o %s.zip",
    dependencies,
    groupId,
    artifactId,
    artifactId,
    artifactId
  )

  -- Comando para descomprimir el archivo ZIP
  local unzip_command = string.format("unzip -o %s.zip -d %s", artifactId, artifactId)

  -- Comando para eliminar el archivo ZIP
  local remove_zip_command = string.format("rm %s.zip", artifactId)

  -- Ejecutar los comandos en una terminal
  vim.cmd("vsplit | terminal " .. download_command .. " && " .. unzip_command .. " && " .. remove_zip_command)
end

-- Función para ejecutar mvn clean
local function maven_clean()
  -- Ejecutar el comando de Maven clean en una terminal
  vim.cmd("vsplit | terminal mvn clean")
end

-- Crear el comando MavenSpring
vim.api.nvim_create_user_command("MavenSpring", create_spring_boot_project, {})
vim.api.nvim_create_user_command("MavenClean", maven_clean, {})
