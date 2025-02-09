-------------------Options-----------------

-- To change the local working directory to the directory of the current buffer upon entering it
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.cmd("lcd %:p:h")
--   end,
-- })
--
-- -- Open Neovim in full screen
-- vim.cmd([[
--   autocmd VimEnter * :silent exec "!wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz"
-- ]])
--

-- To change the display style of the Netrw file explorer
vim.cmd("let g:netrw_liststyle = 3")


-- How text is displayed when it exceeds the width of the window
vim.opt.wrap = true -- I like true
vim.opt.linebreak = true -- I like true


-- tabs & indentation
vim.cmd("set expandtab") -- expand tab to spaces
vim.cmd("set tabstop=4")  -- x spaces for tabs
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4") -- x spaces for indent width
-- vim.opt.autoindent = true -- copy indent from current line when starting new on

--Appearance
vim.opt.number = true
vim.opt.relativenumber = false

--Search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive


--Cursor line
--vim.opt.cursorline = true

--set highlight for multicursor
vim.api.nvim_set_hl(0, 'Multicursor', { fg = '#3EFFDC', bg = '#b2beb5', default = true})
-- fg (foreground) and bg (background)


vim.opt.virtualedit = "block" --or "insert" or "all" 
-- allow cursor to move where there is no text


--Backspace
vim.opt.backspace = "indent,eol,start" --allow backspace on indent, end of line or insert mode start position

-- Color scheme
-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
-- vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift


--Behaviour
-- vim.opt.mouse:append('a')
-- vim.opt.modifiable = true

-- Clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- vim.opt.clipboard = "unnamedplus"

-- Split window
-- vim.opt.splitright = true -- split vertical window to the right
-- vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.scrolloff = 999 -- or 17
-- it will start scrolling the window when the cursor is in the middle of the screen

-- Turn off swapfile:
vim.opt.swapfile = false

-- Split inccommand:
-- vim.opt.inccommand = "split"
--when you press :%s/'some_old_text all the way'/'to_new_text'/ + enter
--the change is previewed in the window below


--------------KeyMappings--------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- global keymaps
vim.keymap.set({"n", "v"}, "<C-s>", ":w<CR>", {silent = true, desc = "save file with Ctrl+S"})
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", {silent = true}) -- save file with Ctrl+S in insert mode
vim.keymap.set("n", "<leader>x", ":bd<CR>", {silent = true, desc = "close current buffer"})

-- move in insert mode
-- vim.keymap.set("i", "<C-h>", "<Left>", {silent = true}) -- move left in insert mode
-- vim.keymap.set("i", "<C-j>", "<Down>", {silent = true}) -- move down in insert mode
-- vim.keymap.set("i", "<C-k>", "<Up>", {silent = true}) -- move up in insert mode
-- vim.keymap.set("i", "<C-l>", "<Right>", {silent = true}) -- move right in insert mode

-- for example: vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

-- vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights"})
vim.keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights"})


-- increment/decrement numbers


-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tabs management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- vim.keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })


-- LSP diagnostics ---------------------------------------------------------------------------------------------------------
-- Initialize diagnostics visibility to false (disabled by default)
local is_diagnostics_visible = false

-- Configure diagnostics to be disabled by default
vim.diagnostic.config({
    virtual_text = is_diagnostics_visible,
    signs = is_diagnostics_visible,
    underline = is_diagnostics_visible,
})

-- Key mapping to toggle diagnostics visibility
vim.keymap.set("n", "<leader>ld", function()
    is_diagnostics_visible = not is_diagnostics_visible
    vim.diagnostic.config({
        virtual_text = is_diagnostics_visible,
        signs = is_diagnostics_visible,
        underline = is_diagnostics_visible,
    })
end, { desc = "Toggle LSP Diagnostics" })
-------------------------------------------------------------------------------------------------------

-- Map delete commands to use the black hole register
-- Now, when you use the d or x commands to delete text, it won't be stored in any register, and you won't be able to paste it later using "0p or similar commands.
-- vim.keymap.set('n', 'd', '"_d')        -- Normal mode delete
-- vim.keymap.set('n', 'dd', '"_dd')      -- Normal mode delete line
-- vim.keymap.set('v', 'd', '"_d')        -- Visual mode delete
-- vim.keymap.set('n', 'D', '"_D')        -- Normal mode delete to end of line
-- vim.keymap.set('n', 'x', '"_x')        -- Normal mode delete character
-- vim.keymap.set('n', 'X', '"_X')        -- Normal mode delete character before cursor
-- vim.keymap.set('n', 'c', '"_c')        -- Normal mode change
-- vim.keymap.set('n', 'cc', '"_cc')      -- Normal mode change line
-- vim.keymap.set('v', 'c', '"_c')        -- Visual mode change
-- vim.keymap.set('n', 's', '"_s')        -- Normal mode substitute character
-- vim.keymap.set('n', 'S', '"_S')        -- Normal mode substitute line
-- vim.keymap.set('v', 's', '"_s')        -- Visual mode substitute

