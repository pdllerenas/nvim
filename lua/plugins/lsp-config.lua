return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.texlab.setup({
        setting = {
          texlab = {
            build = {
              executable = "latexmk",
              args = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"},
              onSave=true,
              forwardSeachAfter=true,

            },
            forwardSearch = {
              executable = "zathura",
              args = {"--synctex-forward", "%l:1:%f", "%p"},
            },
            auxDirectoy = ".",
          }
        }
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
