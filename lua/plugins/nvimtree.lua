return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      --update_cwd = true, -- Automaically update the current working directory

      update_focused_file = {
                enable = true, --Enable updating focused file
                update_cwd = true, --Update cwd when opening a file
      },
      view = {
        width = 35,
        relativenumber = false,
        -- number = false,
      },
    }

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
  end,
}
