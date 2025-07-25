return {
  {
     'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function ()
       local builtin = require('telescope.builtin')
       
        require("telescope").setup { extensions = { 
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
            }
          }
        }
        require('telescope').load_extension('fzf')


       vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
       vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
       vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
       vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim', 
    config = function()
      require("telescope").setup {
          extensions = {
              ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                    -- even more opts
                  }
              }
          }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
      end
    }
}
   
