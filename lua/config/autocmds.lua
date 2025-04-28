-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Turn off paste mode when leaving insert
--

vim.api.nvim_create_user_command("VenvPath", function()
	vim.cmd(":VenvSelect")
	vim.defer_fn(function()
		local venv_path = vim.g.VenvSelect_PythonPath
		vim.notify("Venv Path: " .. (venv_path or "Not Found"))
	end, 1000) -- Asegúrate de que haya tiempo para que el plugin se inicialice
end, {})

vim.api.nvim_create_autocmd("User", {
	pattern = "VenvSelectorPost",
	callback = function()
		-- Intenta capturar el entorno desde rutas posibles
		local selected_venv = vim.g.VenvSelect_PythonPath
		local fallback_venv = require("venv-selector")._state and require("venv-selector")._state.current_venv

		if selected_venv then
			vim.notify("Selected venv (g): " .. selected_venv)
		elseif fallback_venv then
			vim.notify("Selected venv (state): " .. fallback_venv)
		else
			vim.notify("No venv detected!", vim.log.levels.ERROR)
		end
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
vim.opt.clipboard = "unnamedplus"
-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Configuración del team
vim.cmd([[
  " Cambiar el esquema de colores al iniciar Neovim
  colorscheme solarized-osaka
]])

-- Autocomando para manejar buffers de tipo 'prompt'
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "prompt" then
			-- Impedir que se guarde un buffer de tipo 'prompt'
			vim.cmd("echo 'No se puede guardar un búfer de tipo prompt'")
			return false
		end
	end,
})
-- Crea automáticamente el paquete y la clase para archivos .java
-- vim.api.nvim_create_autocmd("BufNewFile", {
--   pattern = "*.java",
--   callback = function()
--     -- Obtiene la ruta del archivo y el nombre de la clase
--     local filename = vim.fn.expand("%:t:r") -- Nombre del archivo sin extensión
--     local filepath = vim.fn.expand("%:p:h") -- Ruta completa del directorio del archivo
--
--     -- Comprobar si el archivo está dentro de src/main/java
--     if filepath:match("/src/main/java/") then
--       -- Extraer el paquete a partir de la ruta dentro de src/main/java
--       local package_path = filepath:match("/src/main/java/(.*)$"):gsub("/", ".")
--       local package_name = "package " .. package_path .. ";"
--
--       -- Crear la línea de la clase, usando el nombre del archivo
--       local class_name = "public class " .. filename .. " { }"
--
--       -- Insertar el paquete y la clase al principio del archivo
--       vim.api.nvim_buf_set_lines(0, 0, 0, false, { package_name, "", class_name })
--     end
--   end,
-- })
