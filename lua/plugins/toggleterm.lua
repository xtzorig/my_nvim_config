return {
    --- Improved terminal toggle
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = nil, 
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = false, -- For manually handle inseart mode mappings. seems false alows to jump in insert and normal mode
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true, -- close the terminal window when the process exits
            shell = "/usr/bin/bash",  -- Set Bash as the default shell here
        })

        -- Function to toggle terminal in the current working directory
        function _G.toggle_current_term()
            local cwd = vim.fn.expand("%:p:h") 
            local term = _G.toggle_current_term_terminal
            if not term or not term:is_open() then
                term = require("toggleterm.terminal").Terminal:new({
                    dir = cwd, -- set directory cwd
                    hidden = true, -- keep terminal hidden until opened
                })
                _G.toggle_current_term_terminal = term
            end
            term:toggle()
        end

        -- Function to run the current Python file in the toggle terminal
        function _G.run_current_python_file()
            local file = vim.fn.expand("%:p")
            -- Save the current file
            vim.cmd("write")
            local term = _G.toggle_current_term_terminal
            if not term or not term:is_open() then
                _G.toggle_current_term()
                term = _G.toggle_current_term_terminal
            end
            -- Send the command to run the Python file
            term:send("python3 " .. file .. "\n")
        end

        -- Function for keymapping toggleterm
        function _G.set_terminal_keymaps()
            local opts = {noremap = true}
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts) -- to switch from insert mode to normal mode
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts) -- tmux handle to jump between terminal and editor
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-t>', [[<C-\><C-n>:lua _G.toggle_current_term()<CR>]], opts) -- to close in insert mode
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()') -- to activate (call) _G.set_terminal_keymaps function
        vim.api.nvim_set_keymap('n', '<C-t>', ':lua _G.toggle_current_term()<CR>', { noremap = true, silent = true }) -- to activate (call) _G.toggle_current_term function

        -- Keybinding to run the current Python file in the toggle terminal
        vim.api.nvim_set_keymap('n', '<leader>rr', ':lua _G.run_current_python_file()<CR>', { noremap = true, silent = true, desc = "to run current python file" })
    end,
}

