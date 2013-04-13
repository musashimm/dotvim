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
  set guifont=Monospace\ 12
  set previewheight=30
  set wildignore=*roska*,*.swp,*~,*cache*
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
  nnoremap <space> :
  " Quick escape to normal mode
  inoremap jk <esc>

  command! Wq wq
  command! WQ wq
  command! W w
  command! Q q
  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Commands starting with comma
  nnoremap ,ew :e $MYVIMRC<cr>
  nnoremap ,g :Gstatus<cr>

  " Commands starting with leader
  nnoremap <leader>r :RunSpec<cr>
  nnoremap <leader>l :set list!<cr>
  nnoremap <leader>c <c-_><c-_>
  nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
  " Adjust viewports to the same size
  nnoremap <Leader>= <C-w>=
  " Toggle search highlighting
  nnoremap <silent> <leader>/ :set invhlsearch<CR>
  
  nnoremap <c-q> :NERDTreeToggle<cr>
  nnoremap <c-0> :gt<cr>
  nnoremap <c-9> :gT<cr>
  nnoremap <c-a> :CommandT<cr>
  " Command mode
  cnoremap <c-k> <c-p>
  cnoremap <c-h> <left>
  cnoremap <c-j> <c-n>
  cnoremap <c-l> <right>
  " Shortcuts
  " Change Working Directory to that of the current file
  cnoremap cwd lcd %:p:h<cr>
  cnoremap cd. lcd %:p:h<cr>

  " Indent
  nnoremap < <<
  nnoremap > >>
  vnoremap < <gv
  vnoremap > >gv

  " Buffers switching
  nnoremap  <silent>   <tab>  :bnext<CR>
  nnoremap  <silent> <s-tab>  :bprevious<CR>
  nnoremap  <silent> <c-tab>  :bd<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ARROW KEYS ARE UNACCEPTABLE
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  noremap <Left> <Nop>
  noremap <Right> <Nop>
  noremap <Up> <Nop>
  noremap <Down> <Nop>

  " center motion
  nnoremap } }zz
  nnoremap { {zz
  
  " make empty lines
  nnoremap go o<up><esc>
  nnoremap gO O<down><esc>

  " Move around splits with <c-hjkl>
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-h> <c-w>h
  nnoremap <c-l> <c-w>l

  command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " RENAME CURRENT FILE
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! RenameFile()
      let old_name = expand('%')
      let new_name = input('New file name: ', expand('%'), 'file')
      if new_name != '' && new_name != old_name
          exec ':saveas ' . new_name
          exec ':silent !rm ' . old_name
          redraw!
      endif
  endfunction
  map <leader>n :call RenameFile()<cr>
" }}}

" Plugins {{{
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd vimenter * if !argc() | NERDTree | endif
  let NERDTreeShowBookmarks=1
  let g:EasyMotion_leader_key = '<leader>'
"  }}}

" Bash mappings {{{
  command! SendMail !~/bin/sendMail.sh %
" }}}

" Statusline {{{
  set laststatus=2
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
  set statusline+=%1*\ %-90.90F\ 
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

" Vimrc {{{ 
  " Source the vimrc file after saving it
  if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
  endif
" }}}

" Functions {{{
  function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
  endfunction
  inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} 

" At last go to workspace
cd ~/workspace

