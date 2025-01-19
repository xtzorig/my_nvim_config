-- return {
--   "nvim-tree/nvim-tree.lua",
--   version = "*",
--   lazy = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     require("nvim-tree").setup {
--       update_cwd = true, -- Automaically update the current working directory
--
--       update_focused_file = {
--                 enable = true, --Enable updating focused file
--                 -- update_cwd = true, --Update cwd when opening a file
--       },
--       view = {
--         width = 35,
--         relativenumber = false,
--         -- number = false,
--       },
--       -- change folder arrow icons
--       renderer = {
--         indent_markers = {
--           enable = true,
--         },
--         icons = {
--           glyphs = {
--             folder = {
--               arrow_closed = "", -- arrow when folder is closed
--               arrow_open = "", -- arrow when folder is open
--             },
--           },
--         },
--       },
--       -- disable window_picker for
--       -- explorer to work well with
--       -- window splits
--       actions = {
--         open_file = {
--           window_picker = {
--             enable = false,
--           },
--         },
--       },
--       filters = {
--         custom = { ".DS_Store" },
--       },
--       git = {
--         ignore = false,
--       },
--     }
--
--     vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
--     vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
--   end,
-- }


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      -- update_cwd = true, -- Automatically update the current working directory

      update_focused_file = {
        enable = true, -- Enable updating focused file
        update_cwd = true, -- Update cwd when opening a file
      },
      view = {
        width = 35,
        relativenumber = false,
        -- number = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- to sort tree by numbers
      sort = {
        sorter = function(nodes)
          table.sort(nodes, function(a, b)
            local function extract_number(str)
              if str then
                local num = str:match("%d+")
                return tonumber(num) or 0
              else
                return 0
              end
            end

            local num1 = extract_number(a.name)
            local num2 = extract_number(b.name)

            if num1 == num2 then
              -- If the numbers are equal, sort by name
              return a.name < b.name
            else
              return num1 < num2
            end
          end)
        end,
      },

      -- disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    }

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
  end,
}
