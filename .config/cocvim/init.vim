call plug#begin("~/.local/share/nvim/plugged")

" code completion and other IDE like fetchers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector' " debugger
Plug 'Dinduks/vim-java-get-set' " java gettter setters code generation
Plug 'liuchengxu/vista.vim' " navigate symbols

"snippets
Plug 'honza/vim-snippets'

"file navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep' " search utility

"sessions
Plug 'xolox/vim-session'
Plug 'Tarmean/fzf-session.vim'

"tpope stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

"terminal stuff
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'
Plug 'szw/vim-maximizer'
Plug 'voldikss/vim-floaterm'

" frontend
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'gregsexton/MatchTag' " Match html tags

" syntax
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
Plug 'uiiaoo/java-syntax.vim'
Plug 'sheerun/vim-polyglot'

"prompt lines
Plug 'itchyny/lightline.vim'
Plug 'edkolev/promptline.vim'

"color shemes
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'gosukiwi/vim-atom-dark'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'rainglow/vim'
Plug 'w0ng/vim-hybrid'

" other estetics enchancments
Plug 'mkitt/tabline.vim'
Plug 'ryanoasis/vim-devicons'

"other 
Plug 'gioele/vim-autoswap' " deal with anoying swap files
Plug 'airblade/vim-rooter' " automaticly change direcory to current file directory
Plug 'xolox/vim-misc' " usefull vim scripts for other plugins
Plug 'jiangmiao/auto-pairs'
Plug 'othree/xml.vim' " xml helper
Plug  'glepnir/dashboard-nvim' " welcome page

call plug#end()

let mapleader =" "



set syntax=on
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set relativenumber
set ruler
set nowrap
set noswapfile
set nohlsearch
set smarttab
set smartindent
set cursorline
set autoindent
set autoread
let g:coc_disable_startup_warning = 1
set t_Co=256                    " Set if term supports 256 colors.
set guitablabel=%N\ %f
set mouse=a
set path+=/work
set scrolloff=999
set shortmess=a
set incsearch
set lazyredraw
set termguicolors
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" color scheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme onedark

" easier copying to cliboard
vnoremap <C-c> "+y
vnoremap <C-v> "+p
noremap <leader>p "0p 
vnoremap <leader>p "0p 

" select all
" noremap <C-a> ggVG
"create empty lines
nnoremap <C-Space> o<Esc>k
" works only in graphical vim
nnoremap <S-Space> O<Esc>j

inoremap <C-v> <C-R>+

" manipulate words and parenthesis
nnoremap cw ciw
nnoremap cW ciW
nnoremap vw viw
nnoremap vW viW
nnoremap yw yiw
nnoremap yW yiW
nnoremap dw diw
nnoremap dW diW
nnoremap v" vi"
nnoremap d" di"
nnoremap c" ci"
nnoremap y" yi"
nnoremap v' vi'
nnoremap d' di'
nnoremap c' ci'
nnoremap y' yi'

" move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap > >gv
vnoremap < <gv
vnoremap <leader>l <gv
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j

"disable big S
nnoremap S $

" vimrc:  edit and source shortcuts 
nnoremap <leader>en  :e $MYVIMRC<cr>
nnoremap <leader>sn  :source $MYVIMRC<cr> :e! <cr>

" edid linux configs
nnoremap <leader>ei3 :e /home/frezer02/.config/i3/config<cr>

" file explorer
nnoremap <C-n> :NERDTreeMirror<CR>
nnoremap <C-c> :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <BS>f :Files<CR>
" nnoremap <leader>bl :BLines<CR>
nnoremap <leader><leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>g :Rg<CR>

"  some custom remaps with leader key
nnoremap <leader>i :echo @% <CR>
nnoremap <leader>r :e! <CR>
nnoremap <leader>z :MaximizerToggle<Esc>
nnoremap <leader>t :tabnew<Esc>
nnoremap <BS>q :q<CR>
nnoremap <BS>w :w<CR>
nnoremap <leader>s :SessionLoad<Esc>
nnoremap <leader>cd :CocDiagnostics<Esc>
nnoremap <leader>ca :CocAction<Esc>
nnoremap <leader><space> a<space><Esc>h

" Formating and refsheshing files
" nnoremap <F5> :e!<CR>
nnoremap vv mm vip= `m
nnoremap <C-f> mm gg=G `m
autocmd FileType typescript nnoremap <buffer> <C-f> mm :%!$NVM_BIN/tsfmt --stdin <CR> `m
autocmd FileType html nnoremap <buffer> <C-f> mm :%!$NVM_BIN/js-beautify --type html <CR> `m
autocmd FileType json nnoremap <buffer> <C-f> mm :%!$NVM_BIN/js-beautify --type js <CR> `m

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split resize
nnoremap <C-Down> :resize +5 <CR>
nnoremap <C-Up> :resize -5 <CR>
nnoremap <C-Left> :vertical resize +5 <CR>
nnoremap <C-Right> :vertical resize -5 <CR>


" exit terminal mode
tnoremap <Esc> <C-\><C-n>

" line navigation
nnoremap 0 0^
nnoremap <leader>0 0

" restore cursor position after yank
augroup yank_restore_cursor
    autocmd!
    autocmd VimEnter,CursorMoved *
        \ let s:cursor = getpos('.')
    autocmd TextYankPost *
        \ if v:event.operator ==? 'y' |
            \ call setpos('.', s:cursor) |
        \ endif

" clear register command
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor


" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>


" source plugin configurations
 source ~/.config/nvim/plugins-config/airline.vim
 source ~/.config/nvim/plugins-config/lightline.vim
 source ~/.config/nvim/plugins-config/coc.vim
 source ~/.config/nvim/plugins-config/emmet.vim
 source ~/.config/nvim/plugins-config/fzf.vim
 source ~/.config/nvim/plugins-config/tabline.vim
 source ~/.config/nvim/plugins-config/vim-java-get-set.vim
 source ~/.config/nvim/plugins-config/vim-session
 source ~/.config/nvim/plugins-config/vimspector.vim
 source ~/.config/nvim/plugins-config/vim-python.vim
 source ~/.config/nvim/plugins-config/startify.vim
 source ~/.config/nvim/plugins-config/vista.vim
 source ~/.config/nvim/plugins-config/dashboard.vim



" gui options 
" set guifont=DejaVu\ Sans\ Mono:h10
set guifont=JetBrainsMono\ Nerd\ Font:h13
