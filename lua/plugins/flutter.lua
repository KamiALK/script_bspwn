return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = "/home/kamilo/flutter/flutter/bin/flutter", -- Ruta personalizada de Flutter
      widget_guides = {
        enabled = true, -- Muestra líneas guía en los widgets
      },
      closing_tags = {
        highlight = "Comment", -- Resalta las etiquetas de cierre de widgets
      },
      dev_tools = {
        autostart = true, -- Inicia automáticamente DevTools
        auto_open_browser = false, -- No abre automáticamente el navegador
      },
      lsp = {
        color = {
          enabled = true, -- Habilita los colores para los errores y advertencias
          background = true, -- Resalta el fondo de los errores
        },
        on_attach = function(client, bufnr)
          -- Atajos de teclado personalizados para LSP
          local buf_map = function(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end
          buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
          buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        end,
      },
    })
  end,
}
