-- Configure yaml editing
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "yaml" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "yaml-language-server", "yamlfmt", "yamllint" })
    end,
  },
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yamll = {
            keyOrdering = false,
          },
        },
      },
    },
  },
  -- YAML formatting
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nlb = require("null-ls.builtins")
      vim.list_extend(opts.sources, { nlb.formatting.yamlfmt })
    end,
  },
}
