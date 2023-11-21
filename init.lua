vim.g.mapleader = ","

-- load all plugins
require("plugins")
-- setup lsp
require("lsp")
-- plugin configuration
require("pluginconfig")
-- prettier 
require("prettierconfig")

-- some
vim.keymap.set("n", "<M-b>", ":Ex<CR>")

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<C-f>', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
  		previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<M-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


vim.keymap.set('n', '<Leader>hm', ':<C-u>s/<[^>]*>/\r&\r/g<CR>:<C-u>g/^$/d<CR>gg=G')


vim.keymap.set('n', '<C-d>', "<C-d>zz", { desc = 'Page down and centers' })
vim.keymap.set('n', '<C-u>', "<C-u>zz", { desc = 'Page down and centers' })

-- tab
vim.keymap.set('n', '<leader>tn', "<cmd>tabnew<CR>", { desc = 'New tab' })

-- NERDTree
vim.keymap.set('n', '-', "<cmd>NERDTreeToggle<CR>", { desc = 'Opens nerd tree' })

-- Paste remap 
vim.keymap.set('x', 'p', '"_dP', { desc = 'Better pasting option'})

-- COLORSCHEME
vim.cmd("colorscheme catppuccin")
-- Adding the same comment color in each theme
-- vim.cmd([[
-- 	augroup CustomCommentCollor
-- 		autocmd!
-- 		autocmd VimEnter * hi Comment guifg=#2ea542
-- 	augroup END
-- ]])

-- Disable annoying match brackets and all the jaz
vim.cmd([[
	augroup CustomHI
		autocmd!
		autocmd VimEnter * NoMatchParen 
	augroup END
]])

vim.o.background = "dark"

vim.keymap.set("i", "jj", "<Esc>")

local autocmd = vim.api.nvim_create_autocmd   -- Create autocommad

autocmd('Filetype', {
  pattern = { 'tsx', 'ts', 'css' },
  command = 'setlocal tabstop=2 shiftwidth=2 softtabstop=2'
})


autocmd('Filetype', {
  pattern = { 'go' },
  command = 'setlocal tabstop=4 shiftwidth=4 softtabstop=4'
})

--vim.opt.guicursor = "i:block"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.swapfile = false

vim.opt.clipboard='unnamed'
vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
--vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
