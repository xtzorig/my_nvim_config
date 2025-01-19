return {
	"benlubas/molten-nvim",
	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	lazy = false,
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_output_win_max_height = 12 --12
        vim.g.molten_output_win_max_width = 999999 --vim.opt.columns:get() -- my edition
		vim.g.molten_virt_text_output = false --by default is true (text: output)
		-- vim.g.molten_virt_text_max_lines = 1
        vim.g.molten_wrap_output = true -- my edition
        vim.g.molten_output_win_wrap = false -- me edit

    vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
    { silent = true, desc = "Molten Init Kernel" })
    vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>",
    { silent = true, desc = "Molten Evaluate Line" })
    vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv<ESC>",
    { silent = true, desc = "Molten Evaluate Visual" })
    vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>",
    { silent = true, desc = "Molten Hide Output" })
    vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>",
    { silent = true, desc = "Molten Enter Output" })
    vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { silent = true, desc = "Delete active cell" })
	end,
}


