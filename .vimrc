set nocompatible " use vim defaults
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Git-hub repos:
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'jnurmine/Zenburn'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'dag/vim2hs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'godlygeek/tabular'

" Use filetype specific detection, indentation and plugins
filetype plugin indent on


" filetype-specific settings can be found in
" ~/.vim/after/ftplugin/<filetype>.vim

set path=.,/usr/local/include,/usr/include,,

set title " Filename as title for terminal window
set ruler " adds row and colimn number at statusbar
set number " adds line numbering
"set relativenumber " add relative line numbering
set cursorline " highlights the current line
set showbreak=+++\  " string to use at the beginning for wrapped lines
set linebreak " Conserves words for wrapped lines
set background=dark " Use theme made for dark terminals
let g:zenburn_high_Contrast = 1 " use higher contrast
let g:zenburn_old_Visual = 1
colorscheme zenburn " set to zenburn low-contrast color schema
if(has('x11'))
  set clipboard=unnamedplus  
else
  set clipboard=unnamed " share with system clipboard on os x
endif
set foldmethod=syntax
set splitbelow " Put new windows below active
set splitright " Put new windows right of active

set encoding=utf-8
set undofile " save undo tree when quitting
set undodir=~/.vimundo/ " Save undo file in specific folder

" Fast terminal for fast drawing.
set ttyfast

" Mouse support
if has("mouse")
	set mouse=a
endif

" Syntax highlighting
syntax enable

" Tabbing: Check :help tabstop for configuration options
set tabstop=2     " Number of spaces per tab
set shiftwidth=2  " Number of spaces to use for each steop of auto indent.
set softtabstop=2 " Insert nr of spaces instead of tabs, 0 == off
set expandtab     " Use the appropriate number of spaces to insert a tab. 
                  " Forces to only use spaces and not mixes

set ignorecase " ignore case for search and a number of other things
set smartcase " do not ignore case if seach pattern contains upper case.

" Indenting. Overridden by "indent on"
"set autoindent

" Autowrite when :make. OBS! also effects :next and some other commands
set autowrite

" Allow hidden files (non-shown files with unsaved changes)
set hidden

set hlsearch  " Highlight search results
set incsearch " Search as typed

set showmatch " briefly show matchin parenthesis or equal.

" Set lineoffset for scrolling
set scrolloff=3


let mapleader = ","

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Use bash syntax instead of bourne shell syntas on .sh-files.
let g:is_bash = 1

" Enable softwrap
set wrap

"" clang_complete
"let g:clang_use_library = 1
""let g:clang_library_path = "/Users/julian/.vim/bundle/clang_complete/lib"
"let g:clang_snippets = 1
"let g:clang_trailing_placeholder = 1
""let g:clang_complete_macros = 1
"let g:clang_user_options = '-std=c++11 -stdlib=libc++'
"let g:clang_close_preview = 1

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" and for input mode for hardcore viming
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" default action of <c-\> (mapped to <c-ö>) does some strange shit, disable
inoremap <c-\> <nop>

" Step in displayed lines when wrap is on
nnoremap j gj
nnoremap k gk

" Change cursor icon depending on insert mode or not
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Default to vertical diff splits
set diffopt+=vertical

" Add all tabpages to sessions
set sessionoptions+=tabpages

" Gundo:
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1 " Position tree to the right

" To be able to use [[, ][, ]] and [] with functions that put bracers on the
" same line
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

autocmd BufNewFile,BufRead *.frag,*.vert,*.glsl set filetype=glsl330

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Shortcut for alternative file switching
nmap <C-A-^> A

" custom text objects:
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap af :normal Vaf<CR>
