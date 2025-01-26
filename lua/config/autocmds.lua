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
  colorscheme solarized-osaka-night
]])
