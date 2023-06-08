local opt = vim.opt

opt.fileencoding = 'utf-8'
opt.laststatus = 3

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true
opt.scrolloff = 5
opt.sidescrolloff = 7

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.history = 500
opt.swapfile = false
opt.updatetime = 300
opt.cursorline = true
opt.colorcolumn = '80'

opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.termguicolors = true
vim.cmd("colorscheme onedark")
