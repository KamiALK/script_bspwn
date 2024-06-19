return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },
  -- {
  --   "mfussenegger/nvim-dap-python",
  -- -- stylua: ignore
  -- keys = {
  --   { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
  --   { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
  -- },
  --   config = function()
  --     local path = require("mason-registry").get_package("debugpy"):get_install_path()
  --     require("dap-python").setup(path .. "/venv/bin/python")
  --   end,
  -- },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
}
