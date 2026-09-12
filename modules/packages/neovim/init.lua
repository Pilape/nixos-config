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

vim.g.mapleader = ' '

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Escape terminal mode with ESC
vim.keymap.set({'n', 'i'}, '<C-s>', '<cmd>w<cr>') -- CTRL+s to save

---------------

--== WINDOWS/SPLITS ==--

-- Movement --
vim.keymap.set({'n', 't'}, '<C-h>', '<C-w>h')
vim.keymap.set({'n', 't'}, '<C-j>', '<C-w>j')
vim.keymap.set({'n', 't'}, '<C-k>', '<C-w>k')
vim.keymap.set({'n', 't'}, '<C-l>', '<C-w>l')

-- Creating and deleting splits
vim.keymap.set({'n', 't'}, '<M-s>', '<C-w>s')
vim.keymap.set({'n', 't'}, '<M-v>', '<C-w>v')
vim.keymap.set({'n', 't'}, '<M-q>', '<C-w>q')

---------------

--== MOVELINE ==--
local moveline = require('moveline')
vim.keymap.set('n', '<M-k>', moveline.up)
vim.keymap.set('n', '<M-j>', moveline.down)
vim.keymap.set('v', '<M-k>', moveline.block_up)
vim.keymap.set('v', '<M-j>', moveline.block_down)
---------------

--== LSP ==--
vim.lsp.config('clangd', {
    cmd = {'clangd'},
    filetypes = {'c', 'cpp'},
    root_markers = {'.git', '.clangd', 'compile_commands.json', 'compile_flags.txt'},
})
vim.lsp.enable('clangd')

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
