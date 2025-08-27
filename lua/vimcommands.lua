vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set noswapfile")
vim.cmd("set autoindent")
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
-- Abbreviations for readability
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Simple bracket/quote pairs
map("i", '"', '""', { noremap = false })
map("i", "'", "''", { noremap = false })
map("i", "(", "()", { noremap = false })
map("i", "[", "[]", { noremap = false })
map("i", "{", "{}", { noremap = false })

-- Press left after inserting pair
vim.cmd([[
    inoremap " ""<left>
      inoremap ' ''<left>
        inoremap ( ()<left>
          inoremap [ []<left>
            inoremap { {}<left>
              inoremap {<CR> {<CR>}<ESC>O
                inoremap {;<CR> {<CR>};<ESC>O
                ]])

vim.keymap.set('i', '<C-l>', '<C-o>A;', {})
vim.keymap.set("i", "<C-b>", "<C-o>A {<CR>}<C-o>O", {})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
