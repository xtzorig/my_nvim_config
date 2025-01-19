-- return {
--   "nvim-lualine/lualine.nvim",
--   config = function()
--     require("lualine").setup({
--       options = {
--         theme = "dracula"
--       }
--     })
--   end
-- }


return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local molten_status = require('molten.status')

    require("lualine").setup({
      options = {
        theme = "dracula"
      },
      sections = {
        lualine_a = {
            -- here add
        },
        lualine_b = {
            -- here add something

        },
        lualine_c = {
          { 
            -- here add
          }
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype'
        },
        lualine_y = {
          'progress',
          'location'
        },
        lualine_z = {
          'os.date("%Y-%m-%d %H:%M:%S")' -- Current date and time
        }
      }
    })
  end
}

