" General {{{
  set nocompatible        " Must be first line
  execute pathogen#infect()
  set guioptions=
  syntax on
  filetype plugin indent on
  set hidden
" }}}

" Look & Feel {{{
  colorscheme molokai
  
  set laststatus=2
  
  set guifont=Monospace\ 12
" }}}

" Folding {{{
  set foldmethod=marker
" }}}

" Formatting {{{
  set number
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set scrolljump=5                " Lines to scroll when cursor leaves screen
  set scrolloff=3                 " Minimum lines to keep above and below cursor
  set backspace=indent,eol,start  " Backspace for dummies
  set linespace=0                 " No extra spaces between rows
  set nu                          " Line numbers on
  set showmatch                   " Show matching brackets/parenthesis
  set incsearch                   " Find as you type search
  set hlsearch                    " Highlight search terms
  set winminheight=0              " Windows can be 0 line high
  set ignorecase                  " Case insensitive search
  set smartcase                   " Case sensitive when uc present
  set wildmenu                    " Show list instead of just completing
  set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
  set scrolljump=5                " Lines to scroll when cursor leaves screen
  set scrolloff=3                 " Minimum lines to keep above and below cursor
  set foldenable                  " Auto fold code
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }}}

" Mappings {{{
  command! Wq wq
  command! WQ wq
  command! W w
  command! Q q

  nmap ,ew :e $MYVIMRC<cr>
  nmap ,er :so $MYVIMRC<cr>
  nmap <space> :

  nmap za :b#<cr>
  nmap zz :bnext<cr>
  nmap zx :bprev<cr>
  nmap zd :bd<cr>
  nmap zf :bd!<cr>
  nmap zl :ls<cr>

  map <c-q> :NERDTreeToggle<cr>

  map <c-0> :gt<cr>
  map <c-9> :gT<cr>

  nmap <leader>l :set list!<cr>

  map <leader>c <c-_><c-_>

  nmap < <<
  nmap > >>
  vmap < <gv
  vmap > >gv

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$
  " Toggle search highlighting
  nmap <silent> <leader>/ :set invhlsearch<CR>

  " Shortcuts
  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h<cr>
  cmap cd. lcd %:p:h<cr>

  " Adjust viewports to the same size
  map <Leader>= <C-w>=

" }}}

" Plugins {{{
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  autocmd vimenter * if !argc() | NERDTree | endif
  let NERDTreeShowBookmarks=1
"  }}}

" Bash mappings {{{
  command! SendMail !~/bin/sendMail.sh %
" }}}

" Statusline {{{
  hi User1 guifg=#ffffff  guibg=#4E4EF3
  hi User2 guifg=#ffffff  guibg=#FF0000
  hi User3 guifg=#ffffff  guibg=#8C8CEE
  hi User4 guifg=#ffffff  guibg=#15155C
  hi User5 guifg=#ffffff  guibg=#4E4EF3
  " reset
  set statusline=
  " git status
  set statusline=%#ErrorMsg#\ %{fugitive#statusline()}\ %#StatusLine#
  " modify indicator
  set statusline+=%2*%-3m 
  "  filetype
  set statusline+=%1*\ %Y\ 
  "  filename
  set statusline+=%1*\ %-52F\ 
  "  read only idicator 
  set statusline+=%2*%-3r 
  "  caret type
  set statusline+=%3*\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\ 
  " file encoding
  set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\ 
  " line column
  set statusline+=%4*\ Col:%c\ 
  " line number
  set statusline+=%4*\ Line:%l\ of\ %L\ 
  " char in hex under cursor
  set statusline+=%4*\ 0x%04.4B\ 
" }}}

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

