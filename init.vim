" Auto-Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	"autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" Vim-Editor Plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" Dracula color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Git plugin
Plug 'tpope/vim-fugitive'

" NerdTree
Plug 'preservim/nerdtree'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Use <TAB> for autocomplete
Plug 'ervandew/supertab'

" Autocomplete Brackets and Qoutes
Plug 'jiangmiao/auto-pairs'

" Auto close HTML Tags
Plug 'alvan/vim-closetag'

" Language Pack
Plug 'sheerun/vim-polyglot'

" Colorizes Colors
Plug 'chrisbra/Colorizer'

" Autogenerates py docstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" Statusbar at bottom
Plug 'vim-airline/vim-airline'

" Icons
Plug 'ryanoasis/vim-devicons'

" Rainbow parantheses
Plug 'junegunn/rainbow_parentheses.vim'

" Syntax checker
Plug 'vim-syntastic/syntastic'

call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1

" Showing lines
set number

" Enable rainbow_parentheses
au VimEnter * RainbowParentheses

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Run python scripts using <STRG + R>
autocmd FileType python map <buffer> <C-R> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-R> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Markdown preview settings
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" Enable highlighting of colors
au VimEnter * ColorHighlight
