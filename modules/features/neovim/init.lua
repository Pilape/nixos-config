--== TABS ==--
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
---------------

--== APPEARANCE ==--
vim.opt.number = true
vim.opt.relativenumber = true

require('lualine').setup()
vim.cmd("colorscheme gruvbox")
-----------------------

--== MISC ==--
require('blink-cmp').setup()
vim.g.mapleader = ' '
---------------

--== LSP ==--
vim.lsp.config('ccls', {
    cmd = {'ccls'},
    filetypes = {'c', 'h', 'cpp', 'hpp'},
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
------------------

--== TELESCOPE ==--
function telescope_current_buffer_fuzzy()
    vim.cmd("Telescope current_buffer_fuzzy_find")
end

function telescope_all()
    vim.cmd("Telescope")
end

vim.keymap.set('n', '<Leader>fa', '<cmd>Telescope<cr>')
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
-----------------
