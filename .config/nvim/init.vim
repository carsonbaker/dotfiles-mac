call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'scrooloose/nerdtree'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'justinmk/vim-sneak'

call plug#end()

" Move precisely with EasyMotion
nmap F <Plug>(easymotion-prefix)s

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Use the system clipboard
set clipboard=unnamed

" Use , as the leader key
let mapleader=","

" Use ,, to switch between buffers
nnoremap <leader><leader> :b#<CR>

" Press <tab>, get two spaces
set expandtab shiftwidth=2 tabstop=2

" Show `▸▸` for tabs:         , `·` for tailing whitespace:
set list listchars=tab:▸▸,trail:·

" Enable mouse mode
set mouse=a

" Colors
set termguicolors
" colorscheme Tomorrow-Night
set background=dark
colorscheme gruvbox
" colorscheme acme

" Show line numbers
set number

" Map leader e to Explore
map <leader>e :Explore<CR>

" Easily reload .config/nvim/init.vim
map <leader>s :source ~/.config/nvim/init.vim<CR>

" Easily edit .config/nvim/init.vim
map <leader>v :e ~/.config/nvim/init.vim<CR>

" Close a buffer
map <leader>w :bd<CR>

" Indenting logic
filetype indent on
set nowrap
" set smartindent
" set autoindent

" Wrap long lines
set wrap

" Automatically pick up changes to file if buffer has not been modified
set autoread

" Don't highlight present line
 set nocursorline

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Highlight found words
set hlsearch

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Use the silver searcher to find in files
let g:ackprg = 'ag --nogroup --nocolor --column'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Make netrw not suck
let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
let g:netrw_list_hide='\.DS_Store,'

" Set up fzf for fuzzy finding
set rtp+=/brew/opt/fzf
let g:fzf_layout = { 'window': '10split enew' }
"FZF decide what file find to use
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun
" nnoremap <C-p> :call FzfOmniFiles()<CR>
map <leader>t :call FzfOmniFiles()<CR>
nmap <C-p> :r !pbpaste<CR>


" Toggle Limelight and Goyo (distraction free editing)
let g:goyo_width = 100
map <leader>l :Limelight!! 0.5<CR>
map <leader>g :Goyo<CR>

" Lightline configuration
set noshowmode
let g:lightline = {
  \ 'component_function': {
  \   'fileformat': 'LightlineFileformat',
  \   'fileencoding': 'LightlineFileencoding',
  \ },
  \ }

function! LightlineFileformat()
	return ''
endfunction

function! LightlineFileencoding()
	return ''
endfunction

" Close Vim if only buffer open is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree
map <C-n> :NERDTreeToggle<CR>
