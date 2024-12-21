return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Fuzzy find files in cwd"})
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, {desc = "Fuzzy Find Word"})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Fuzzy Find Buffers"})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope Help Tags"})
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = "Fuzzy Find Oldfiles"})
      vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {desc = "Fuzzy Find Current Buffer"})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
