return {
  -- Codeium plugin
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
    config = function()
      require("codeium").setup({})
    end,
  },
  -- Add Codeium to cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "jcdickinson/codeium.nvim" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
    end,
    -- This function removes all Codeium server binaries except the most recent one. Credit to https://github.com/chrisgrieser
    build = function()
      local bin_path = vim.fn.stdpath("data") .. "/codeium"
      local oldBinaries = vim.fs.find(function()
        return true
      end, { type = "file", limit = math.huge, path = bin_path })
      table.remove(oldBinaries) -- remove last item (= most up to date binary) from list
      for _, binaryPath in pairs(oldBinaries) do
        os.remove(binaryPath)
        os.remove(vim.fs.dirname(binaryPath))
      end
    end,
  },
}
