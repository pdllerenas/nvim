return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function() 
    local config = require("nvim-treesitter.configs")


    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right <CR>', {})
    config.setup({
    ensure_installed = {"lua", "cpp"},
    highlight = { enable = true },
    indent = { enable = true }
    })
  end
}

