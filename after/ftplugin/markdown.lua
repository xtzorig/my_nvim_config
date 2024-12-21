require("otter").activate({"python"}, true, true, nil)
vim.keymap.set("n", "K", ":lua require'otter'.ask_hover()<CR>", {silent = true}) -- Hover for function definition on otter cells
vim.keymap.set("n", "gd", ":lua require'otter'.ask_definition()<CR>", {silent = true, desc = "Go to definition"}) 
vim.keymap.set("n", "<leader>D", ":lua require'otter'.ask_type_definition()<CR>", {silent = true, desc = "Go to type definition"})
vim.keymap.set("n", "<leader>rn", ":lua require'otter'.ask_rename()<CR>", {silent = true, desc = "Rename"})
vim.keymap.set("n", "<leader>gr", ":lua require'otter'.ask_references()<CR>", {silent = true, desc = "Go to references in a quickfix list"})
vim.keymap.set("n", "<leader>sb", ":lua require'otter'.ask_document_symbols()<CR>", {silent = true, desc = "Ask for doc symbols"})
vim.keymap.set("n", "<leader>gf", ":lua require'otter'.ask_format()<CR>", {silent = true, desc = "Format file"})
