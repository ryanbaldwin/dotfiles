if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a custom <Leader> key
let mapleader = ","

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Fuzzy File Finding For Fun and Functionality
Plug 'https://github.com/kien/ctrlp.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/keith/swift.vim'

" Git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter' " GitGutter

" Ruby stuff
Plug 'https://github.com/tpope/vim-rails'   " Rails
Plug 'https://github.com/vim-ruby/vim-ruby' " Ruby
Plug 'https://github.com/tpope/vim-bundler' " Bundle
Plug 'https://github.com/skalnik/vim-vroom' " tests
Plug 'https://github.com/tpope/vim-endwise' " automagically ends structures
Plug 'https://github.com/ervandew/supertab' " insert completions
Plug 'https://github.com/ngmy/vim-rubocop'  " Rubocop!

" Rspec
Plug 'https://github.com/thoughtbot/vim-rspec'
let g:rspec_command = '!bundle exec rspec --color {spec}'
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

syntax on
set number

" Splits
set splitbelow
set splitright
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Syntastic Settings
let g:syntastic_swift_checkers = ['swiftlint', 'swiftpm']

" Error symbols
let g:syntastic_error_symbol = "✗"
let syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "∙∙"
let syntastic_style_warning_symbol = "∙∙"

" status line colors and stuff
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatusLine guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi StatusLine guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi StatusLine guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatusLine guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
