" VIM-Plug {{{
call plug#begin('~/.config/nvim/plugged')

" aesthetic
Plug 'vim-airline/vim-airline'
Plug 'jacoborus/tender.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ntk148v/vim-horizon'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'NLKNguyen/papercolor-theme'

" editor enhancements
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'bfredl/nvim-miniyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-rooter'
Plug 'sandeepcr529/Buffet.vim'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/ListToggle'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'sheerun/vim-polyglot'

" clojure things
Plug 'guns/vim-clojure-static'
Plug 'kovisoft/paredit'
Plug 'Olical/conjure', {'tag': 'v3.4.0'}
Plug 'dmac/vim-cljfmt'
Plug 'humorless/vim-kibit'

" other languages/filetypes
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'

" misc
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/mru.vim'
Plug 'mbbill/undotree'

call plug#end()
" }}}
" Basic options {{{
let g:python_host_prog='/usr/bin/python'
set nocompatible
set noshowmode
set termguicolors
set modelines=0
set ts=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set formatoptions=l
set cursorline
set lbr
set number
set gdefault
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set ofu=syntaxcomplete#Complete
set guioptions-=t
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=R
set guioptions-=B
set guioptions-=M
set nobackup
set noswapfile
set virtualedit=block
set splitbelow
set splitright
set lsp=1
set relativenumber
set timeoutlen=1000 ttimeoutlen=0
" Better Completion
set complete=.,w,b,u,t
" set completeopt=noinsert,menuone,noselect
set completeopt=longest,menuone,preview
if getcwd() == $HOME
    if !empty($PROJECTS_DIR)
        cd $PROJECTS_DIR
    endif
endif
set noautoread

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Refresh current buffer if file changed
autocmd BufEnter,FocusGained * checktime

"Disabling concealing json syntax bu default
let g:vim_json_syntax_conceal = 0

" }}}
" Trailing whitespace  {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" Disable preview scratch window 
" <CR>: close popup and save indent.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}
" Key Mapping {{{
noremap <leader>j :%!python -m json.tool<CR>
nnoremap Y y$
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap j gj
nnoremap k gk
" nnoremap <C-a> ^
" nnoremap <C-e> $
nnoremap <up> g<up>
nnoremap <down> g<down>
"
"Show hidden chars
nmap <C-h> :set list!<CR>

" Map Ctrl-t to open a new editor tab, Ctrl-j and Ctrl-k for tab navigation
nmap <C-t> :tabnew<CR>
nmap <C-left> :tabprevious<CR>
nmap <C-right> :tabnext<CR>

noremap <C-up> {zz
noremap <C-down> }zz
map <leader>vv :e $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>
" Resizing
map <silent> <A-left> 5<C-w><
map <silent> <A-down> 5<C-W>-
map <silent> <A-up> 5<C-W>+
map <silent> <A-right> 5<C-w>> 
" Clean trailing whitespace
nnoremap <leader>cw mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" Made D behave
nnoremap D d$
nmap gV `[v`]
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*<c-o>:call winrestview(stay_star_view)<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
" Location and Quickfix toggle
let g:lt_location_list_toggle_map = '<leader>cx'
let g:lt_quickfix_list_toggle_map = '<leader>cz'
" }}}
" Colors and fonts {{{
syntax on
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_overrides = {
            \    'MatchParen': {'guifg': 'ccff04',
            \                   'guibg': 'None',
            \                   'gui': 'BOLD', 
            \                   'cterm': 'BOLD', 
            \                   'ctermfg': '226',
            \                   'ctermbg': 'None',
            \                   'attr': 'bold'},
            \   'Search': {     'gui': 'UNDERLINE', 
            \                   'cterm': 'UNDERLINE', 
            \                   'guifg': '95BDAE',
            \                   'guibg': '603D36',
            \                   'attr': 'underline'},
            \  'CursorLine': {'guibg': '303030',
            \                  'ctermbg': '236'}
            \}
set background=dark
colorscheme PaperColor
hi MatchParen guifg=#ccff04 guibg=None gui=BOLD cterm=BOLD ctermfg=226 ctermbg=None
" set gfn=InconsolataGo\ Nerd\ Font:h19

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}
" NerdTree {{{
let NERDTreeIgnore = ['\.pyc$', '\.orig$']	
let NERDTreeQuitOnOpen=3

" returns true if is NERDTree open/active
function! NTisNTOpen()        
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! NTImprovedToggle()
    if NTisNTOpen()
        NERDTreeClose
    else
        if @% == ""
            NERDTreeToggle                      
        else                                    
            NERDTreeFind                        
        endif   
    endif
endfunction
nmap <leader><leader>o :call NTImprovedToggle()<CR>

" }}}
" ALE {{{
" let g:ale_open_list=1
let g:ale_sign_highlight_linenrs=1
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_text_changed='normal'
let g:ale_python_flake8_args = '--ignore=E --select=E128'
let g:ale_go_langserver_executable = 'gopls'
let g:ale_elixir_elixir_ls_release = '/Users/nirr/.elixir-ls/release'
let g:ale_linters = {
\   'clojure': ['clj-kondo'],
\   'elixir': ['credo'],
\}
" let g:ale_linters_explicit = 1

" }}}
" deoplete/ncm2 {{{
let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1 
let g:deoplete#disable_auto_complete=0
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:deoplete#auto_completion_start_length=3
autocmd CompleteDone * pclose
autocmd FileType python setlocal omnifunc=jedi#completions
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set shortmess+=c

" }}}
" Folding {{{

set foldlevelstart=0

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}
" Clojure  {{{
setlocal lispwords+=ns,if-not,match,when-not,go-loop,POST,GET,ANY
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,POST,GET,ANY'
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^if-not', '^go-loop', '^POST', '^GET', '^ANY']
let g:clojure_fold_extra = [
            \ 'defgauge',
            \ 'defmeter',
            \ 'defhistogram',
            \ 'defcounter',
            \ 'deftimer',
            \
            \ 'defdb',
            \ 'defentity',
            \ 'defaspect',
            \ 'add-aspect',
            \ 'defmigration',
            \
            \ 'defsynth',
            \ 'definst',
            \ 'defproject',
            \
            \ 'defroutes',
            \
            \ 'defrec',
            \
            \ 'defparser',
            \
            \ 'defform',
            \ 'defform-',
            \
            \ 'defpage',
            \ 'defsketch'
            \
            \ ]

let g:clojure_highlight_extra_defs = [
            \ 'defparser',
            \ 'deftest',
            \ 'match',
            \
            \ 'defproject',
            \
            \ 'defroutes'
            \ ]

let g:clojure_conceal_extras = 1
set wildignore+=classes
set wildignore+=lib
augroup ft_clojure
    au!

    au BufNewFile,BufRead riemann.config set filetype=clojure
    au FileType clojure silent! call TurnOnClojureFolding()
    "au FileType clojure compiler clojure
    au FileType clojure setlocal report=100000

    " Indent top-level form.
    au FileType clojure nmap <buffer> <localleader>= mz99[(v%='z
    " ])
augroup END
au FileType clojure let loaded_delimitMate = 0
autocmd FileType clojure nnoremap <buffer> <silent> <leader>rx :Eval (do (require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/set-refresh-dirs "src/clj" "src/cljc") (clojure.tools.namespace.repl/refresh))<cr>

" }}}
" GoLang      {{{

autocmd FileType go nnoremap <buffer> <silent> ]<C-d> :GoDef<cr>
autocmd FileType go nnoremap <buffer> <silent> K :GoDoc<cr>
let g:go_version_warning=0

" }}}
" Paredit {{{
let g:paredit_leader='\'
let g:paredit_smartjump=1
let g:paredit_electric_return=1
let g:paredit_matchlines=300
let g:paredit_shortmaps=0
let g:sexp_enable_insert_mode_mappings=0
au FileType lfe call PareditInitBuffer()
" }}}
" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" CtrlP {{{
" let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|orig)$'
            \ }

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
cnoreabbrev Ag Ag!

noremap <silent> qq :Bufferlist<CR>
" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
" }}}
" Bufferline {{{
let g:bufferline_echo = 0
" }}}
" Rainbow Partnheses {{{
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
"}}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" MiniYank  {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
let g:miniyank_filename = $HOME."/.miniyank.mpack"
" }}}
" WebDevIcons {{{
" loading the plugin 
let g:webdevicons_enable = 1

" adding the flags to NERDTree 
let g:webdevicons_enable_nerdtree = 1

" adding the custom source to unite 
let g:webdevicons_enable_unite = 1

" adding to vim-airline's tabline 
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline 
let g:webdevicons_enable_airline_statusline = 1

" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs 
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags 
let g:webdevicons_conceal_nerdtree_brackets = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically 
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
"}}}
" Sneak    {{{
let g:sneak#s_next = 1
let g:sneak#label = 1
"}}}
" Startify    {{{
let g:startify_change_to_dir = 0
"}}}
" Haskell {{{
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
" let g:necoghc_enable_detailed_browse = 1
" let g:necoghc_use_stack = 1
" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}
" Lightline/Airline {{{
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:lightline = {
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'MyGitBranch',
  \     'filetype': 'MyFiletype',
  \     'fileformat': 'MyFileformat',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyGitBranch()
   let a:branch = FugitiveHead()
   if a:branch == 'master' || a:branch == ''
       return a:branch
   else
       return a:branch . ' '
   endif
endfunction

"}}}
" LanguageClient {{{
" let g:LanguageClient_serverCommands = { 'haskell': ['hie'] }
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
" map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
" map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
" map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
" map <Leader>lb :call LanguageClient#textDocument_references()<CR>
" map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
" map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
"}}}
" Conjure {{{
let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
let g:conjure_quick_doc_normal_mode = v:false
" let g:conjure_quick_doc_insert_mode = v:false
map <leader>cc <leader>cL
" }}}
" Rooter {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = [
\  'project.clj',
\  'deps.edn',
\  '.git/',
\  '.svn/',
\  '.hg/',
\  '.bzr/',
\  '.gitignore',
\  'Rakefile',
\  'pom.xml'
\]
" }}}
" COC {{{
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
inoremap <silent><expr> <c-p> coc#refresh()
"}}}
" Vim-Clap {{{
noremap <silent> <space><space> :Clap files<CR>
noremap <silent> <leader>t :Clap files ~/projects<CR>
autocmd Filetype clap_input call s:clap_mappings()

function! s:clap_mappings()
    nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
    nnoremap <silent> <buffer> x     :<c-u>call clap#action#invoke()<CR>
    nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
    inoremap <silent> <buffer> <Esc> <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
endfunction
" let g:clap_insert_mode_only=1

"}}}

