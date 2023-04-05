let mapleader = ","

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8

syntax on
set nocompatible
set hlsearch
set number relativenumber
set laststatus=2
set vb
set ruler
set spelllang=en_us
set autoindent
set colorcolumn=80
set mouse=a
set clipboard=unnamed
set noscrollbind
set wildmenu
set autochdir
set runtimepath+=~/.vim-plugins/LanguageClient-neovim
set rtp+=/usr/local/opt/fzf

hi Search cterm=NONE ctermfg=black ctermbg=red
" No noremap Arrow Keys, deal with it
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" tab shortcuts 
nnoremap <leader>tn <cmd>tabnew<cr>


" Paste repmap
xnoremap p "_dP

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>tt <cmd>:ToggleTerm<cr>
nnoremap <leader>fc <cmd>:Prettier<cr>


" LazyGit settings
" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

" netrw

nnoremap - :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_winsize=20
autocmd FileType netrw setl bufhidden=delete

"-- netrw END

"Go spacing
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4

"TSX 
autocmd Filetype tsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype ts setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2

"some coc setting
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" plug
call plug#begin()
"> NerdTREE
Plug 'preservim/nerdtree'
" Nicer icons
Plug 'ryanoasis/vim-devicons'

"
"> Must Have
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'tpope/vim-commentary'    " https://github.com/tpope/vim-commentary
Plug 'airblade/vim-gitgutter'  " https://github.com/airblade/vim-gitgutter
Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim

"> Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " https://github.com/neoclide/coc.nvim
Plug 'SirVer/ultisnips'                             " https://github.com/sirver/UltiSnips
Plug 'ray-x/go.nvim' " https://github.com/ray-x/go.nvim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" TeleScope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Recommended by Telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"auto closing brackets
" Plug 'rstacruz/vim-closer'

" Lazy Git 
" https://github.com/kdheepak/lazygit.nvim
Plug 'kdheepak/lazygit.nvim'

"> Theme
Plug 'NLKNguyen/papercolor-theme' " https://github.com/NLKNguyen/papercolor-theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'nyoom-engineering/nyoom.nvim'
Plug 'ayu-theme/ayu-vim'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" React & TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" pretteir 
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" TEST FOR LSP
Plug 'hrsh7th/nvim-cmp' 
Plug 'glepnir/lspsaga.nvim' 
Plug 'folke/trouble.nvim' 

"Rust
Plug 'rust-lang/rust.vim'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}


call plug#end()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"-- plug END

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

lua << EOF
require("toggleterm").setup()
require("lsp")
EOF

" rust format
let g:rustfmt_autosave = 1

let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

" better Go highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" better go settings
let g:go_auto_type_info = 1

" vim-gitgutter

set updatetime=500

"-- vim-gitgutter END
let ayucolor="dark"
" papercolor-theme

set termguicolors
"set background=dark
"colorscheme PaperColor
"colorscheme dracula
"colorscheme onedark
"colorscheme nyoom
colorscheme ayu


"-- papercolor-theme END
"

"telecope set find all files
