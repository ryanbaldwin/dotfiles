if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set tags=tags;/

" Specify a custom <Leader> key
let mapleader = ","

" shortcut to edit vimrc file
map <leader>vimrc :tabe ~/.vimrc<cr>

" shortcut to save
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>

" auto-write and reload vimrc on save/close
autocmd bufwritepost .vimrc source $MYVIMRC

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<leader>>"
let g:UltiSnipsJumpBackwardTrigger="<leader><"

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
let g:NERDTreeNodeDelimiter = "\u00a0"
map <Leader>f :NERDTreeToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|ios\/build\|ios\/Pods\|DS_Store'

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
noremap <leader>. :CtrlPTag<cr>
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
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
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse

Plug 'https://github.com/airblade/vim-gitgutter' " GitGutter

" GraphQL
Plug 'jparise/vim-graphql'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" RN/JSX/TSX bidness
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
">  Plug 'mxw/vim-jsx'
">  let g:jsx_ext_required=0
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Raimondi/delimitMate'
inoremap {<CR> {<CR>}<C-o>O
inoremap [<CR> [<CR>]<C-o>O
Plug 'heavenshell/vim-jsdoc'
let g:jsdoc_enable_es6=1
Plug 'morgsmccauley/vim-react-native-snippets'
Plug 'https://github.com/alvan/vim-closetag'

" Tests
Plug 'tpope/vim-dispatch' " asynchronous builds and tests and such

Plug 'janko-m/vim-test'
let test#strategy = "dispatch"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>gt :TestVisit<CR>
nmap <silent> <leader>ta :Dispatch yarn test<CR>
nmap <silent> <leader>ta! :Dispatch! yarn test<CR>

nmap <silent> <leader>/ <Plug>(jsdoc)

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-t>'
let g:user_emmet_settings = {
			\'javascript': {
			\'extends': 'jsx',
			\}
			\}

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#exec_cmd_async =1
" run before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#single_quote = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'all'


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx,ts'

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

" searching
Plug 'vim-scripts/grep.vim'

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
autocmd Filetype typescript  setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype liquid setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

