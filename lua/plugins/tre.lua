return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
        "python",
        "java",
        "dart",
        "ninja",
        "rst",
        "html",
      },

      -- Matchup plugin configuration (si lo necesitas)
      -- matchup = {
      --   enable = true,
      -- },

      -- Query linter configuration
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

      -- Playground configuration
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = true, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },

      -- Textobjects configuration
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Para mirar hacia adelante y hacer las selecciones más precisas
          keymaps = {
            ["af"] = "@function.outer", -- Selecciona toda la función
            ["if"] = "@function.inner", -- Selecciona solo el contenido de la función
            ["ac"] = "@class.outer", -- Selecciona toda la clase
            ["ic"] = "@class.inner", -- Selecciona solo el contenido de la clase
            ["ap"] = "@parameter.outer", -- Selecciona un parámetro completo
            ["ip"] = "@parameter.inner", -- Selecciona solo el contenido del parámetro
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- Si se debe ir a la posición anterior del cursor
          goto_next_start = {
            ["]m"] = "@function.outer", -- Siguiente función
            ["]c"] = "@class.outer", -- Siguiente clase
            ["]p"] = "@parameter.outer", -- Siguiente parámetro
          },
          goto_previous_start = {
            ["[m"] = "@function.outer", -- Función anterior
            ["[c"] = "@class.outer", -- Clase anterior
            ["[p"] = "@parameter.outer", -- Parámetro anterior
          },
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX configuration
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
