local keymap = vim.keymap

-- leader key
vim.g.mapleader = " "

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", "_x")

keymap.set("n", "<leader>+", "<C-a>") -- incr number under cursor
keymap.set("n", "<leader>-", "<C-x>") -- decr number under cursor

keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizotnally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

keymap.set("n", "K", ":<C-u>m-2<CR>==")
keymap.set("n", "J", ":<C-u>m+<CR>==")
keymap.set("v", "K", ":m-2<CR>gv=gv")
keymap.set("v", "J", ":m'>+<CR>gv=gv")

-- plugin keymaps

-- split maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fW", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- gitsigns
keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>")
keymap.set("n", "<leader>gc", "<cmd>Gitsigns preview_hunk<cr>")

-- folding
keymap.set("n", "fo", ":foldopen<CR>") -- foldopen
keymap.set("n", "fc", ":foldclose<CR>") -- foldclose

keymap.set('n', 'fO', require('ufo').openAllFolds) -- open all folds
keymap.set('n', 'fC', require('ufo').closeAllFolds) -- close all folds

-- debugging
keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
keymap.set("n", "<leader>dus", function()
    local widgets = require("dap.ui.widgets")
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
end)

-- go debugging
keymap.set("n", "<leader>dgt", require("dap-go").debug_test)
keymap.set("n", "<leader>dgl", require("dap-go").debug_last_test)
