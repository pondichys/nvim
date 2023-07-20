-- Configurations to develop in Python
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "black", "pylyzer", "ruff-lsp" })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylizer = {
        python = {
          checkOnType = true,
        },
      },
      ruff_lsp = {
        init_options = {
          settings = {
            args = { "--max-line-length=180" },
          },
        },
      },
    },
  },
}
