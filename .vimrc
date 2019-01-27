if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a custom <Leader> key
let mapleader = ","

" shortcut to edit vimrc file
map <leader>vimrc :tabe ~/.vimrc<cr>

" auto-write and reload vimrc on save/close
autocmd bufwritepost .vimrc source $MYVIMRC

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
let g:NERDTreeNodeDelimiter = "\u00a0"
map <Leader>t :NERDTreeToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'

" General programming plugins
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1 		" Add spaces after comment delimiters by default
" let g:NERDCompactSexyComs = 0 		" Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' 	" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_swift = 1 		" Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 0 	" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 	" Enable trimming of trailing whitespace when uncommenting

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

Plug 'majutsushi/tagbar'
nmap <Leader>b :TagbarToggle<CR>
let g:tagbar_type_swift = {
  \ 'ctagstype': 'swift',
  \ 'kinds' : [
    \ 'n:Enums',
    \ 't:Typealiases',
    \ 'p:Protocols',
    \ 's:Structs',
    \ 'c:Classes',
    \ 'f:Functions',
    \ 'v:Variables',
    \ 'e:Extensions'
  \ ],
  \ 'sort' : 0
\ }

Plug 'junegunn/vim-easy-align'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" asynchronous linting
Plug 'w0rp/ale'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
Plug 'skywind3000/asyncrun.vim'

" Swift
Plug 'https://github.com/bumaociyuan/vim-swift'

" Git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter' " GitGutter

" GraphQL
Plug 'jparise/vim-graphql'

" Ruby stuff
Plug 'https://github.com/tpope/vim-rails'   " Rails
Plug 'https://github.com/tpope/vim-rake'    " Rake
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

" RN/JSX bidness
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'https://github.com/alvan/vim-closetag'
Plug 'mattn/emmet-vim'

let g:user_emmet_leader_key='<C-t>'
let g:user_emmet_settings = {
			\'javascript.jsx': {
			\'extends': 'jsx',
			\},
			\}
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Initialize plugin system
call plug#end()

" miscellaneous bootstrap settings
syntax on
set number rnu cursorline

" Splits
set splitbelow
set splitright
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>

" Tabs
nnoremap <Leader>] :tabn<CR>
nnoremap <Leader>[ :tabp<CR>

" Language tab settings
"set list
autocmd Filetype python setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype swift setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype graphql setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype liquid setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
