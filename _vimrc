" ~/.vimrc (configuration file for vim only)
" filetypes
filetype plugin on
filetype indent on

syntax on

set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set expandtab
set number
set colorcolumn=80
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256

set hlsearch
set incsearch

let g:Powerline_symbols = 'fancy'

"colorscheme jellybeans
"let g:jellybeans_use_lowcolor_black = 0

let g:solarized_termcolors=256
set background=dark
"colorscheme solarized



if has("gui_running")
    let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
    let s:minfontsize = 6
    let s:maxfontsize = 16
    function! AdjustFontSize(amount)
      if has("gui_gtk2") && has("gui_running")
        let fontname = substitute(&guifont, s:pattern, '\1', '')
        let cursize = substitute(&guifont, s:pattern, '\2', '')
        let newsize = cursize + a:amount
        if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
          let newfont = fontname . newsize
          let &guifont = newfont
        endif
      else
        echoerr "You need to run the GTK2 version of Vim to use this function."
      endif
    endfunction

    function! LargerFont()
      call AdjustFontSize(1)
    endfunction
    command! LargerFont call LargerFont()

    function! SmallerFont()
      call AdjustFontSize(-1)
    endfunction
    command! SmallerFont call SmallerFont()

    noremap <Leader>+ :call LargerFont()<CR>
    noremap <Leader>- :call SmallerFont()<CR>
    noremap <Leader>0 :set guifont=Droid\ Sans\ Mono\ 9<CR>

    set guioptions-=T
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
       set guifont=Monaco\ for\ Powerline
    endif
endif

call pathogen#infect()
"call pathogen#helptags()
"call pathogen#incubate()
call pathogen#helptags()

set guifont=Menlo\ for\ Powerline
let g:solarized_termcolors=256                                                  
"set background=dark                                                             
colorscheme solarized 

let g:Powerline_symbols = 'fancy'
let g:NERDTreeDirArrows=0


vmap <silent> <leader>c "+y
nmap <silent> <leader>v "+p

set list listchars=tab:▸\ 

"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

"set rnu
"    au InsertEnter * :set nu
"    au InsertLeave * :set rnu
"    au FocusLost * :set nu
"    au FocusGained * :set rnu
" ~/.vimrc ends here
"Added by android-vim:
set tags=/home/tom/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

let g:dbext_default_profile_vertical_life = 'type=MYSQL:user=vertical_life:passwd=1234:dbname=vertical_life'
