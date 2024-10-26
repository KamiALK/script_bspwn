local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- variables de macro 3
local filtro_uno = 's/\v(.+)/"\1\\n",/'
local filtro_dos = "s/,$//"
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.test.core" },

    -- { import = "plugins.extras.lang.flutter" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "solarized-osaka", "craftzdog" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
-- aqui modificacioneskamilo

require("config.run_python") -- vamos a correr archivos de python
require("config.run_maven") -- vamos a correr archivos de python
require("config.run_java") -- vamos a correr archivos de python
require("dapui").setup()

-- Configuración de nvim-cmp (Autocompletado para Python)
require("cmp").setup({
  sources = {
    { name = "codeium" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
  },
})
require("neo-tree").setup({
  event_handlers = {

    {
      event = "file_opened",
      handler = function(file_path)
        -- auto close
        -- vimc.cmd("Neotree close")
        -- OR
        require("neo-tree.command").execute({ action = "close" })
      end,
    },
  },

  filesystem = {

    filtered_items = {
      visible = true, -- Mostrar elementos filtrados
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = true, -- Solo funciona en Windows para archivos/directorios ocultos
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        --"node_modules",
      },
      hide_by_pattern = {
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = {
        ".gitignored",
        ".env",
      },
      never_show = {
        --".DS_Store",
        --"thumbs.db",
      },
      never_show_by_pattern = {
        --".null-ls_*",
      },
    },
  },
})
