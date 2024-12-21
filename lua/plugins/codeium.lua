return {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
        --Set up key mapping for :Codeium Chat
        vim.keymap.set('n', '<C-a>', ':Codeium Chat<CR>', {noremap = true, silent = true, desc = "Codeium Chat"})
    end
}

