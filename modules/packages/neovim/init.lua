--== TABS ==--
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
---------------

--== APPEARANCE ==--
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd.colorscheme("dim")
-----------------------

--== MISC ==--
require('autoclose').setup()
require('gitsigns').setup()
require('blink-cmp').setup({
    completion = { documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
    }},

    signature = { 
        enabled = true,
        --window = { show_documentation = false },
    }
})

local moveline = require('moveline')
vim.keymap.set('n', '<M-k>', moveline.up)
vim.keymap.set('n', '<M-j>', moveline.down)
vim.keymap.set('v', '<M-k>', moveline.block_up)
vim.keymap.set('v', '<M-j>', moveline.block_down)

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.g.mapleader = ' '

vim.keymap.set({'n', 'i'}, '<C-s>', '<cmd>w<cr>')
---------------

--== LSP ==--
vim.lsp.config('ccls', {
    cmd = {'ccls'},
    filetypes = {'c', 'cpp'},
    root_markers = {'.git'},
})
vim.lsp.enable('ccls')

vim.lsp.config('nixd', {
    cmd = {'nixd'},
    filetypes = {'nix'},
    root_markers = {'.git', 'flake.nix', 'flake.lock'}
})
vim.lsp.enable('nixd')

vim.lsp.config('luals', {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    root_markers = {'.luarc.json', '.luarc.jsonc', '.git'},
})
vim.lsp.enable('luals')

vim.lsp.config('asm-lsp', {
    cmd = {'asm-lsp'},
    filetypes = { 'asm' },
    root_markers = { '.git', '.asm-lsp.toml' },
})
vim.lsp.enable('asm-lsp')
------------------

--== TELESCOPE ==--
vim.keymap.set('n', '<Leader>fa', '<cmd>Telescope<cr>')
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
-----------------
