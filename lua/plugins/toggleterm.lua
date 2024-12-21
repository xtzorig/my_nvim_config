return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<leader>tt]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- "horizontal" | "vertical" | "float"
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    local function get_current_file_directory()
      return vim.fn.fnamemodify(vim.fn.expand("%"), ":h")
    end

    -- Keymapping to toggle the terminal
    vim.keymap.set("n", "<leader>tt", function()
      require("toggleterm").toggle(20, { dir = get_current_file_directory() })
    end, { desc = "[T]oggle [T]erminal" })
    vim.keymap.set("t", "<leader>tt", function()
      require("toggleterm").toggle(20, { dir = get_current_file_directory() })
    end, { desc = "[T]oggle [T]erminal" })


    -- Key mapping to switch from insert mode to normal mode using 'escape' in terminal
    vim.cmd("tnoremap <Esc> <C-\\><C-n>")

  end,
}
