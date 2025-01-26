-- Función para crear un nuevo proyecto Spring Boot
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

-- Función para ejecutar mvn clean
local function maven_clean()
  -- Ejecutar el comando de Maven clean en una terminal
  vim.cmd("vsplit | terminal mvn clean")
end

-- Función para ejecutar mvn spring-boot:run
local function maven_run()
  -- Ejecutar el comando de Maven spring-boot:run en una terminal
  vim.cmd("vsplit | terminal mvn spring-boot:run")
end

-- Crear comandos de usuario
vim.api.nvim_create_user_command("CreateSpringBootProject", create_spring_boot_project, {})
vim.api.nvim_create_user_command("MavenClean", maven_clean, {})
vim.api.nvim_create_user_command("MavenRun", maven_run, {})
