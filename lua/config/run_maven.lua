-- Define la función para crear un nuevo proyecto Spring Boot
local function create_spring_boot_project()
  -- Solicitar el groupId
  local groupId = vim.fn.input("Ingrese el groupId (por defecto: com.example): ", "com.example")

  -- Solicitar el artifactId
  local artifactId = vim.fn.input("Ingrese el artifactId: ")

  if artifactId == "" then
    print("El artifactId es obligatorio.")
    return
  end

  -- Comando de Maven para crear el proyecto
  local command = string.format(
    "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false",
    groupId,
    artifactId
  )

  -- Ejecutar el comando en una terminal
  vim.cmd("vsplit | terminal " .. command)
end

-- Define la función para crear un nuevo proyecto web
local function create_web_project()
  -- Solicitar el groupId
  local groupId = vim.fn.input("Ingrese el groupId (por defecto: com.example): ", "com.example")

  -- Solicitar el artifactId
  local artifactId = vim.fn.input("Ingrese el artifactId: ")

  if artifactId == "" then
    print("El artifactId es obligatorio.")
    return
  end

  -- Comando de Maven para crear el proyecto web
  local command = string.format(
    "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false",
    groupId,
    artifactId
  )

  -- Ejecutar el comando en una terminal
  vim.cmd("vsplit | terminal " .. command)
end

-- Crear un comando de usuario para ejecutar la función
vim.api.nvim_create_user_command("CreateWebProject", create_web_project, {})
-- Crear un comando de usuario para ejecutar la función
vim.api.nvim_create_user_command("CreateSpringBootProject", create_spring_boot_project, {})
