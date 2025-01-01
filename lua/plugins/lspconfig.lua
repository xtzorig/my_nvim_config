return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ruff", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            args = {},
          }
        }
      })
      lspconfig.pyright.setup({
        settings = {
          pyright = {
            disableOrganizeImports = true, -- using Ruff
          },
          python = {
            analysis = {
              ignore = { '*' }, -- using Ruff
            },
          },
        },
      })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover for function definition" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "implementation" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "List workspace folders" })
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "<space>le", vim.diagnostic.open_float, { desc = "Show diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic"})
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Show diagnostics in location list" })
    end,
  },
}
