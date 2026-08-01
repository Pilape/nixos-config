vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
--vim.opt.tabsize = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.lsp.enable({
    cmd = {'ccls'},
    filetypes = {'c', 'h', 'cpp', 'hpp'},
    root_markers = {'.git'},
})

vim.lsp.enable('nixd')

vim.cmd("colorscheme gruvbox")
