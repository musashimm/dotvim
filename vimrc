" General {{{
  set nocompatible        " Must be first line
  execute pathogen#infect()
  set guioptions=
  syntax on
  filetype plugin indent on
  set hidden

  set pastetoggle=<F2>
  set nobackup
  set noswapfile
  runtime macros/matchit.vim
" }}}

" Look & Feel {{{
  colorscheme xoria256
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

au BufNewFile,BufRead *.es6 set filetype=javascript

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
  nnoremap ,ed :e config/deploy.rb<cr>

  " Closes all buffers
  nnoremap ,c :1,999bd<cr>

  " Commands starting with leader
  " nnoremap <leader>r :RunSpec<cr>
  nnoremap <leader>l :set list!<cr>
  nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

  nnoremap <C-s> <esc>:w<CR>
  inoremap <C-s> <esc>:w<CR>

  " Adjust viewports to the same size
  nnoremap <leader>= <C-w>=

  " Toggle search highlighting
  nnoremap <silent> ,/ :set invhlsearch<CR>

  " moving beetween tabs
  nnoremap <c-0> :gt<cr>
  nnoremap <c-9> :gT<cr>

  " Command mode
  cnoremap <c-p> <up>
  cnoremap <c-j> <down>

  " Change Working Directory to that of the current file
  cnoremap cwd lcd %:p:h<cr>
  cnoremap cd. lcd %:p:h<cr>

  " Buffers switching
  nnoremap  <silent>   <tab>  :bnext<CR>
  nnoremap  <silent> <s-tab>  :bprevious<CR>
  nnoremap  <silent> <c-tab>  :bd<CR>

  " Arrow keys are unacceptable
  nmap <Left> <Nop>
  nmap <Right> <Nop>
  nmap <Up> <Nop>
  nmap <Down> <Nop>

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

  map <c-e> <c-u>

  nnoremap <F5> :enew<CR>i
  nnoremap <F8> <esc>:bd!<CR>

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

  " Tcomment
  nmap <leader>c <c-_><c-_>
  vmap <leader>c <c-_><c-_>

  " Fugitive
  nnoremap ,g :Gstatus<cr>

  " NERDTree
  nnoremap <silent> ,q :NERDTreeToggle<cr>

  " CommandT
  " nnoremap <c-a> :CommandT<cr>
    nnoremap <silent> ,z :CommandT<CR>
    nnoremap <silent> ,b :CommandTBuffer<CR>
    nnoremap <silent> ,m :CommandTFlush<CR>
"  }}}

" Bash mappings {{{
  command! -nargs=1 Rak !rak --nocolour <args>
  command! Rspec !rspec --no-colour
  command! -nargs=* Mina !mina <args>
  nnoremap ,r :Rspec<cr>

  command! Yardoc !yardoc
  nnoremap ,y :Yardoc<cr>
  nnoremap <F3> :SaveAndSend<cr>
  nnoremap <F4> :ReformatXML<cr>
" }}}

" Statusline {{{
  set laststatus=2

  hi MyDirectory guifg=#ffffff guibg=#666666
  hi MyCurrentFile guifg=#ffffff guibg=#4E4EF3
  hi MyGitStatus guifg=#000000 guibg=#fdfffd
  hi MyWarning guifg=#ffffff guibg=#FF0000
  hi MyParameters guifg=#ffffff guibg=#666666
  hi MyFileType guifg=#ffffff guibg=#444444

  " reset
  set statusline=%#MyDirectory#
  " current working direcotry
  set statusline+=\ %-20.20{CurrentDirectory()}\ 
  " git status
  set statusline+=%#MyGitStatus#
  set statusline+=\ %{fugitive#statusline()}\ 
  " modify indicator
  set statusline+=%#MyWarning#
  set statusline+=%-3m 
  "  filetype
  set statusline+=%#MyFileType#
  set statusline+=\ %Y\ 
  "  filename
  " set statusline+=%#MyCurrentFile#
  set statusline+=\ %-50.50F\ 
  "  read only idicator 
  set statusline+=%#MyParameters#
  set statusline+=%-3r 
  "  caret type
  set statusline+=\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\ 
  " file encoding
  set statusline+=\ %{&fenc!=''?&fenc:&enc}\ 
  " line column
  set statusline+=\ Col:%c\ 
  " line number
  set statusline+=\ Line:%l\ of\ %L\ 
  " char in hex under cursor
  set statusline+=\ 0x%04.4B\ 
" }}}

" Vimrc {{{
  " Source the vimrc file after saving it
  if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd BufWritePost * :normal :CommandTFlush
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

  command! ReformatXML call s:ReformatXML()

  function! s:ReformatXML()
    set ft=xml
    normal gg
    %s/>\s*</>\r</g
    normal gg=G
  endfunction

" }}}

  nnoremap <silent> ,f :ReformatAndClean<cr>
" The end {{{
  " At last go to workspace if exists
    let mydir = $HOME . "/workspace"
    if isdirectory(mydir)
      exe 'cd' mydir
    endif
" }}}


