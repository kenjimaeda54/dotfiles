call plug#begin("~/.vim/plugged")
Plug 'pantharshit00/vim-prisma'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
Plug 'sheerun/vim-polyglot'
Plug 'rescript-lang/vim-rescript'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'wakatime/vim-wakatime'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/csv.vim'
Plug 'lambdalisue/fern.vim'
Plug 'SirVer/ultisnips'
Plug 'bfrg/vim-cpp-modern'
Plug 'bfrg/vim-cpp-modern'
Plug 'vim-autoformat/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
call plug#end()

" ale
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_hover_cursor = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters_explicit = 1
autocmd BufNewFile,BufRead */recipes/*.rb set ft=chef syntax=ruby

" abrir o terminal
function! OpenTerminal()
      split term://zsh
      resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" para coc  para preicsa isntalar o tssserver CocInstall  coc-tsserver
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

let g:coc_disable_startup_warning = 1

function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" information
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
      else
            call CocAction('doHover')
      endif
endfunction


nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
      if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
            silent call CocActionAsync('doHover')
      endif
endfunction


function! s:show_hover_doc()
      call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
      autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
else
      inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <c-space> coc#refresh()


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
noremap <silent> <space>c  :<C-u>CocList commands<cr>

" auto format
au BufWrite * :Autoformat



"nerd
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrl z
nnoremap <silent> <C-z> :NERDTreeToggle<CR>


" cpp mordern
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1


" sudo pacman -Sy ccls
let g:ycm_language_server =
                  \ [{
                  \   'name': 'ccls',
                  \   'cmdline': [ 'ccls' ],
                  \   'filetypes': [ 'c', 'cpp', 'cuda', 'objc', 'objcpp' ],
                  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
                  \ }]


"para utilsnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" Habilita syntax highlight
syntax on

if (has("termguicolors"))
      set termguicolors
endif
syntax enable
colorscheme dracula


" Tema Airline
let g:airline_theme='dracula'
let g:indentLine_setColors = 0

" " Define o tema
set t_Co=256
set cursorline
let g:indentLine_setColors = 1
let g:indentLine_color_term = 237
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1

" Configuração do plugin polyglot para JSX (vim-jsx-pretty) ------------------

let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 0

" Configurações do plugin Airline --------------------------------------------

" Permitir fontes Powerline
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

let g:airline_symbols.notexists = ' ✗'

" Configuração do plugin de smooth scroll ------------------------------------

" Permite que o cursor acompanhe a rolagem da tela
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" information e tooltip



" Scroll para floating windows

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

let g:fzf_preview_window = []
let $FZF_DEFAULT_OPTS="--preview-window 'right:60%' --layout reverse --margin=0,0 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


" Posicionamento da janela do FZF (v2)
let g:fzf_layout =
                  \ { 'window':
                  \ { 'width': 0.98, 'height': 0.7, 'yoffset': 0.94, 'border': 'rounded' }
                  \ }

" Cores do FZF devem casar com as cores do tema
let g:fzf_colors =
                  \ { 'fg':      ['fg', 'Normal'],
                  \ 'bg':      ['bg', 'Normal'],
                  \ 'hl':      ['fg', 'Comment'],
                  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                  \ 'hl+':     ['fg', 'Statement'],
                  \ 'info':    ['fg', 'PreProc'],
                  \ 'border':  ['fg', 'Ignore'],
                  \ 'prompt':  ['fg', 'Conditional'],
                  \ 'pointer': ['fg', 'Exception'],
                  \ 'marker':  ['fg', 'Keyword'],
                  \ 'spinner': ['fg', 'Label'],
                  \ 'header':  ['fg', 'Comment'] }

" Configuração do ReScript ---------------------------------------------------

" Key bindings
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>r :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>t :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>b :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>

" Autocomplete
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set colorcolumn=80
set cursorline
set number
set list
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_
autocmd BufEnter * :syntax sync fromstart
set autoindent
set incsearch
set wildmenu
set encoding=utf-8
set mouse=a
set splitbelow
set splitright
set hidden
set inccommand=split
set nowrap
set clipboard+=unnamedplus
set smartcase
set undodir=~/.config/nvim/undos
set undofile
set list!

let mapleader=","
let maplocalleader=";"
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>yf :let @+ = expand("%")<cr>
nnoremap <c-p> :Files<cr>
nnoremap <s-m-p> :GFiles<cr>
nnoremap <c-o> :Buffers<cr>
nnoremap go :ls<cr>:b
nnoremap gv :ls<cr>:vsplit \| b
nnoremap gh :ls<cr>:split \| b

" Alternar entre buffers com `gp` ao invés de Ctrl + 6
nnoremap gp :e#<cr>
noremap zin <c-w>_ <c-w>\|
nnoremap zni <c-w>=
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<cr>a
map <C-s> :write<CR>
map <C-q> :quit!<CR>
map q :quit<CR>
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv
nnoremap <c-s-m-p> <Nop>
nnoremap <c-s-m-e> <Nop>
nnoremap <m-0> <Nop>
nnoremap <m-1> <Nop>
nnoremap <m-2> <Nop>
nnoremap <m-3> <Nop>
iabbrev lenght length
iabbrev widht width
iabbrev heigth height
