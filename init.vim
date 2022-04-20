call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'github/copilot.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'w0rp/ale'
Plug 'bfrg/vim-cpp-modern'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()



au BufWrite * :Autoformat


" remove space brancos
autocmd BufWritePre * :%s/\s\+$//e
set wrap
set linebreak
set showbreak=>\ \ \
autocmd BufWritePre *.pl %s/\s\+$//e
autocmd FileType c,cpp,java,php,js,ts autocmd BufWritePre <buffer> %s/\s\+$//e


" airlene
let g:airline_theme = 'violet'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty='⚡'

" ale
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1


" map
set mouse=a
set nu!
set title
set cursorline
set autoindent
set incsearch
set wildmenu
set encoding=utf-8
set t_Co=256
map <C-s> :write<CR>
map <C-q> :quit!<CR>
map q :quit<CR>

syntax on syntax highlight
set showmatch
set nowrap
set ts=2
set sw=2
set et





if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme dracula

"nerd
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrl b
nnoremap <silent> <C-b> :NERDTreeToggle<CR>



set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>



" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
noremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


"ctrl+t to open it in a new tab.
"ctrl+s to open below (split view).
"ctrl+v to open to the side (vertical split).

" ctrl + p ==> pesquisar arquivos
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


