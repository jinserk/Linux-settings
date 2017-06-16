" vimrc based on Douglas Black
"
" 1. check you have git and vim latest version
" 2. copy this file to $HOME/.vimrc
" 3. install Minimalist Vim Plugin Manager
"    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 4. run vim and type :PlugInstall in normal mode
"
" Preset {{{
set nocompatible        " be iMproved, required
" }}}
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Smart-Tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'sjl/badwolf'
Plug 'rust-lang/rust.vim'
Plug 'will133/vim-dirdiff'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'scrooloose/nerdtree'
"Plug 'derekwyatt/vim-scala'
"Plug 'janko-m/vim-test'
"Plug 'keith/swift.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'leafgarland/typescript-vim'
"Plug 'moll/vim-node'
"Plug 'scrooloose/syntastic'
"Plug 'simnalamburt/vim-mundo'
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-fugitive'
"Plug 'vimwiki/vimwiki'
call plug#end()
" }}}
" Colors {{{
set t_Co=256
set term=screen-256color
syntax enable           " enable syntax processing
silent! colorscheme badwolf
"silent! set termguicolors
" }}}
" Misc {{{
set backspace=indent,eol,start
"let g:vimwiki_list = [{'path': '~/.wiki/'}]
set tags+=~/.vim/tags
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
"set expandtab           " use spaces for tabs
set noexpandtab           " use spaces for tabs
set autoindent
set cindent
set smartindent
set copyindent
filetype indent on
filetype plugin on
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set nowrap
silent! set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <Bslash> :nohl<CR><Bslash>
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>et :exec ":vsp /Users/dblack/notes/vim/" . strftime('%m-%d-%y') . ".md"<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make! 
nnoremap <leader>r :TestFile<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}
" Syntastic {{{
"let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_c_include_dirs = ['/opt/unimrcp/include']
let g:syntastic_c_check_header = 1
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
	"autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 et ai pi si ci nolist
    autocmd Filetype xml setlocal ts=2 sts=2 sw=2 et
    autocmd BufEnter *.c,*.cc,*.cpp,*.h,*.hh,*.hpp setlocal ts=4 sts=0 sw=4 noet nosi ai pi ci cindent
    autocmd Filetype netrw setlocal nolist
augroup END
" }}}
" Testing {{{
let test#strategy = 'neovim'
let test#python#runner = 'nose'
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" airline {{{
set laststatus=2
"let g:airline_theme = 'zenburn'
let g:airline_theme = 'badwolf'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" }}}
" Custom Functions {{{
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | q! | endif
let NERDTreeIgnore = ['\~$','\.d$[[dir]]','\.o$[[file]]','\.pyc$[[file]]']
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" Diff {{{
if &diff
    set cursorline
    map ] ]c
    map [ [c
endif
" }}}
" vim-diff-enhanced {{{
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
" }}}
" vim:foldmethod=marker:foldlevel=0
