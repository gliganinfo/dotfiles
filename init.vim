
" 
" NVIM config (~/.config/nvim/init.vim)
" By Ronaldo David Gomes Gligan
" 

" VIM-Plug plugins
call plug#begin()


	" SYNTAX

  Plug 'neoclide/coc.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'eslint/eslint'
  Plug 'dag/vim-fish'
  Plug 'cespare/vim-toml'
  Plug 'leafoftree/vim-vue-plugin'
  Plug 'tpope/vim-rails'


  " INTERFACE

  " Vim-one theme
  Plug 'https://github.com/rakr/vim-one.git'
  " “Zen-mode”, cool when writing in markdown or latex
  Plug 'junegunn/goyo.vim'
  " A statusline that's easy to use, that's why I don't use it anymore ;-)
  "Plug 'itchyny/lightline.vim'
  " This one is more complex, yeah
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Of course, nerdtree is needed
  Plug 'scrooloose/nerdtree'
  " Icons for everything
  Plug 'ryanoasis/vim-devicons'

  " Color schemes
  Plug 'junegunn/seoul256.vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'alessandroyorba/alduin'
  Plug 'morhetz/gruvbox'
  Plug 'ajh17/spacegray.vim'
  " I use base16-default-dark
  Plug 'chriskempson/base16-vim'
  Plug 'sjl/badwolf'



	" TOOLS
    " Notes:
    "   - Try repeat.vim & visualrepeat

  " FZF
  Plug 'ctrlpvim/ctrlp.vim'
  " Show color when some kind of color (like #fff) is written in the buffer
  Plug 'lilydjwg/colorizer'
  " Comment and uncomment stuff easily
  Plug 'scrooloose/nerdcommenter'
  " Displays intendation levels
  Plug 'yggdroot/indentline'
  " For those ones who use TMUX with VIM, it's just an integration
  Plug 'christoomey/vim-tmux-navigator'
  " To make code more readable
  Plug 'junegunn/vim-easy-align'
  " Easy motions
  Plug 'easymotion/vim-easymotion'
  " Emmet, write html & css faster
  Plug 'mattn/emmet-vim'
  " Run python, ruby & more while you write in vim
  Plug 'metakirby5/codi.vim'
  " Auto close brackets, parenthesis and more
  Plug 'townk/vim-autoclose'
  " Surroundings
  Plug 'tpope/vim-surround'
  " The name says everything
  Plug 'terryma/vim-multiple-cursors'
  " Parenthesis in different colors
  Plug 'frazrepo/vim-rainbow'
  " This criptically-named plugin lets you write UNIX commands inside VIM
  Plug 'tpope/vim-eunuch'
  " Code autocompletion for js
  "Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
  Plug 'itchyny/calendar.vim'

call plug#end()

if has("termguicolors")
  set termguicolors
endif

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

" Better performance with CTRLP
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/node_modules/*,*/Downloads/*,*/Pictures/*,*/Music/*
let g:ctrlp_clear_cache_on_exit = 0

"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let base16colorspace=25

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"

let g:seoul256_background = 236

let g:rainbow_active = 1

:hi clear SignColumn

let g:vim_vue_plugin_load_full_syntax = 1

let g:one_allow_italics = 1
set background=dark
"colorscheme one

colorscheme base16-default-dark

let mapleader = " "

set shortmess=I

highlight CodiVirtualText guifg=cyan
let g:codi#virtual_text_prefix = "❯ "
map <leader>r :Codi <CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

syntax on
set mouse=a         " Enable mouse selection
vmap <C-C> "+y
" (In visual mode) Control+C copy what's selected
set nowrap
set number relativenumber
set nocompatible
set encoding=utf-8
set noshowmode
set wildmode=longest,list,full
set splitbelow splitright 
filetype plugin on
"set omnifunc=syntaxcomplete#Complete
set smarttab
set expandtab
set cursorline
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
set fillchars+=vert:\ 

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <C-t><up>    :tabr<cr>
map <C-t><down>  :tabl<cr>
map <C-t><left>  :tabp<cr>
map <C-t><right> :tabn<cr>

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    "silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
map <leader>1 :Goyo \| set linebreak \| set wrap<CR>


let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <leader><tab> :NERDTreeToggle<CR>
map <leader>º :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline config
let g:airline_theme='monochrome'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" Lightline config
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }


set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint --'

let s:hidden_all = 0
function! ToggleBar()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <silent> <leader><backspace> :call ToggleBar()<CR>

inoremap ññ <ESC>

map <leader>ñ :History<CR>
map <leader>l :Lines<CR>

" Ctrl+S to save, like in everywhere
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR> w<CR>endif<CR>
set cmdheight=1

set tabstop=2
set shiftwidth=2
set expandtab

" Add tab
set ai
set smartindent
inoremap {<CR> {<CR>}<ESC>O

" Tab in visual select mode
vmap <Tab> >gv
vmap <S-Tab> <gv

set colorcolumn=80
highlight ColorColumn ctermbg=black 


" COC CONFIGS


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


map <Leader><Space> <Plug>(easymotion-w)
" EASYMOTION and COC fix
let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
  if EasyMotion#is_active()
    let g:easymotion#is_active = 1
    CocDisable
  else
    if g:easymotion#is_active == 1
      let g:easymotion#is_active = 0
      CocEnable
    endif
  endif
endfunction
autocmd TextChanged,CursorMoved * call EasyMotionCoc()

