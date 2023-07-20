return {
  -- Lua
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode", silent = true } },
    opts = {
      plugins = {
        kitty = {
          enabled = true,
        },
      },
    },
  },
}
