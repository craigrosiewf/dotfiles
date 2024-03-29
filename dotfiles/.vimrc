" VUNDLE

" Only use coc for LSP. Must come before plugins are loaded.
let g:ale_disable_lsp = 1

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" add fzf to the runtime path
set rtp+=/usr/local/opt/fzf
" add prefs/vim to runtime path to enable Ultisnips to find snippets
set rtp+=~/github/prefs/vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'fatih/molokai'
Plugin 'SirVer/ultisnips'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'janko-m/vim-test'
Plugin 'psf/black'
Plugin 'raimon49/requirements.txt.vim'
Plugin 'cespare/vim-toml'
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'psliwka/vim-smoothie'
Plugin 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plugin 'mattn/emmet-vim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'pechorin/any-jump.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'wellle/context.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'rhysd/clever-f.vim'
Plugin 'ruanyl/vim-gh-line'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'voldikss/fzf-floaterm'
Plugin 'voldikss/vim-floaterm'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'vim-python/python-syntax'

"All of your Plugins must be added before the following line
call vundle#end()            " required
" Enable file type based indentation
filetype plugin indent on    " required

" Enable file type detection
filetype on

" Enable syntax highlighting
syntax on

" Enable modified molokai colourscheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" VIM-TEST
let test#python#pytest#executable = 'python -m pytest -v --flake8 --cov=.'
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" COMMANDS

" Define Silent command to effectively run shell commands in the background
:command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

" SETS

" Enable line numbers
set number

" Add coloured columns to indicate optimal line-width
set colorcolumn=80,100

" Increase history size
set history=1000

" Disable line wrapper
set nowrap

" Set tab to 4 spaces
set tabstop=4

" Set shiftwidth to 4 spaces to match tabstop
set shiftwidth=4

" Enable expandtab
set expandtab

" Enable autoindent
set autoindent

" Enable smartindent
set smartindent

" Enable highlighting of found search terms
set hlsearch

" Enable incremental search highlighting
set incsearch

" Highlight matching parenthesis
set showmatch

" Enable backspace in insert mode
set backspace=indent,eol,start

" DEVCONTAINER disable backups
" Enable backups
" set backup
" set writebackup

" Set backup directory
" set backupdir=~/.vim/backups

" Skip creating backups of files in sensitive directories
" set backupskip=/tmp/*,/private/tmp/*

" Set swapfile directory
" set directory=~/.vim/swaps

" Better searching
set ignorecase
set smartcase

" Enable larger preview window (e.g. for fugitive's Gstatus)
set previewheight=30

" Enable hidden buffers
set hidden

" Use vertical splits when running :Gdiff
set diffopt+=vertical

" Set ctags location
set tags=./tags,tags,./.git/tags;

" More intuitive splits
set splitright
set splitbelow

" keep x lines off the edges of the screen when scrolling vertically
set scrolloff=2
" keep x columns off the edges of the screen when scrolling horizontally
set sidescrolloff=2

" always show statusline
set laststatus=2

if v:version >= 730
    " keep a persistent backup file
    " (see http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines)
    set undofile
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif

" Enable extended Python syntax highlighting (vim-python/python-syntax)
let g:python_highlight_all = 1

" Fix bash here{doc,string} syntax highlighting
" https://stackoverflow.com/a/42640338
let g:is_bash=1

" Disable tmux navigator when zooming the vim pane
let g:tmux_navigator_disable_when_zoomed = 1

let g:black_virtualenv = "~/.vim/black"

" Always show hidden files in NERDTree
let NERDTreeShowHidden=1

" Disable display of Bookmarks label and help text in NERDTree
let NERDTreeMinimalUI=1

" Highlight current cursor line in NERDTree
let NERDTreeHighlightCursorline=1

" Hide certain files in NERDTree
let NERDTreeIgnore = [
    \'\.pyc$',
    \'\.vim$',
    \'\.git$',
    \'\.vscode$',
    \'__pycache__$',
    \'\.cache$',
    \'\.gitlab$',
    \'\.sonarlint',
    \'\.ipynb_checkpoints$',
    \'\.egg-info',
    \'\.ds_store',
    \'\.eggs',
    \'\.pytest_cache',
    \'\.mypy_cache',
    \'\.coverage$',
    \'\.DS_Store',
    \]

" Use ag for ack.vim
let g:ackprg = 'ag --vimgrep --hidden'
" https://github.com/mileszs/ack.vim/pull/142
let g:ack_mappings = {
      \ "v": "<C-W><CR>:exe 'wincmd ' (&splitright ? 'L' : 'H')<CR><C-W>p<C-W>J<C-W>p =",
      \ "gv": "<C-W><CR>:exe 'wincmd ' (&splitright ? 'L' : 'H')<CR><C-W>p<C-W>J" }

" ALE customisation
let g:ale_sign_error='✘'
let g:ale_sign_warning='▲'
let g:ale_echo_msg_format = '%severity% %linter%: [%code%] %s'
let g:ale_echo_msg_error_str = '✘'
let g:ale_echo_msg_warning_str = '▲'
highlight ALEErrorSign ctermbg=None ctermfg=Red
highlight ALEWarningSign ctermbg=None ctermfg=Yellow

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/github/prefs/vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["Ultisnips", "custom_snippets"]
let g:UltiSnipsExpandTrigger="<c-e>"
let g:ultisnips_python_style="google"

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_jump_to_error = 0

" Vim Markdown Preview (https://github.com/JamshedVesuna/vim-markdown-preview)
let vim_markdown_preview_hotkey='<leader>m'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

" Vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/wiki'}]
let g:vimwiki_ext = '.md' " set extension to .md
let g:vimwiki_global_ext = 0 " make sure vimwiki doesn't own all .md files

au BufRead,BufNewFile *.wiki set filetype=vimwiki
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<CR>

" vim-pydocstring
let g:pydocstring_formatter = 'google'
" By default, vim-pydocstring sets up a <C-l> mapping which breaks
" vim and tmux navigation
let g:pydocstring_enable_mapping = 0

" vim-emmet
let g:user_emmet_leader_key='<C-y>'

" any-jump.vim
" done to prevent <leader>a clash with ack.vim
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_preview_lines_count = 10
let g:any_jump_max_search_results = 20

" vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" ENDSETS

" MAPPINGS

" Set leader key to space
let mapleader=" "

" Copy to system clipboard
xnoremap <leader>y "*y<CR>

" Allow vim config reload without restart
map <leader>sv :source ~/.vimrc<CR>

" Key combination for toggling NERDTree
map <C-n> :NERDTreeFocus<CR>

" Shortcut for regenerating ctags
map <leader>ct :Silent ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./.git/tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") > /dev/null 2>&1<CR>

" Cancel a search with space
nnoremap <leader><space> :nohlsearch<CR>

" Don't jump to first result when searching with ack.vim
nnoremap <leader>a :Ack! -Q<Space>

" Search for word under cursor with ack.vim
nmap <leader>f :Ack! <C-W> <CR>

" Shortcut for searching files with fzf
nmap <leader>p :Files<CR>

" Shortcut for ctags (in the current buffer) with fzf
nmap <leader>r :BTags<CR>

" vim-fugitive
" Shortcut for :Gstatus
nmap <leader>fs :Gstatus<CR>
" Shortcut for :Gdiff
nmap <leader>fd :Gdiff<CR>
" Shortcut for git push
nmap <leader>fp :Gpush<space>
" Shortcut for git push with --force-with-lease
nmap <leader>fpfl :Gpush --force-with-lease<space>
" Shortcut for git commit --verbose
nmap <leader>fc :Gcommit --verbose<CR>
" Shortcut for git commit --amend --verbose
nmap <leader>fca :Gcommit --amend --verbose<CR>
" Shortcuts for dealing with diffs
nmap <leader>fdg :diffget<CR>
nmap <leader>fdp :diffput<CR>

" Shortcut for refreshing current buffer
nmap <leader>e :e!<CR>

" Shortcut for running Black Python code formatter
nmap <leader>b :w <CR>:Black<CR>

" Shortcut to yank whole file to clipboard
nmap <leader>yf :%y+<CR>

" Vertical visual movement when lines are wrapped
nmap j gj
nmap k gk

" use <tab> to move between matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Adjust split size
map <leader>] :vertical resize +10<CR>
map <leader>[ :vertical resize -10<CR>

" Wordcount in visual mode
xnoremap <leader>wc <esc>:'<,'>:w !wc<CR>

" Sort in visual mode
xnoremap <leader>so <esc>:'<,'>!sort<CR>

" Get unstuck from blocked popup window
map <leader>quit :call popup_close(win_getid())<CR>

" Shortcut for vim-pydocstring
nmap <leader>pd :Pydocstring<CR>

" Custom mapping for jumping forward in the jumplist
nnoremap <C-m> <C-i>

" Convenient mappings for sideways.vim
nnoremap <leader>, :SidewaysLeft<cr>
nnoremap <leader>. :SidewaysRight<cr>

" Remap only used shortcuts for any-jump.vim
nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>x :AnyJumpLastResults<CR>

" Reload Ultisnips snippets
nmap <leader>u :call UltiSnips#RefreshSnippets()<CR>

" vim-floaterm
" List floaterms using fzf
" <C-l> hack to ensure floaterm always opens in right split
nmap <leader>i <C-k><C-l><C-l><C-l>:Floaterms<CR>
" Open new floaterm with hardcoded (iterm) name
" nmap <leader>q :FloatermNew --wintype=vsplit --height=1.0 --width=0.33 --title=iterm --position=right --autoclose=0<CR>
nmap <leader>q <C-l><C-l><C-l>:FloatermNew --wintype=vsplit --height=1.0 --width=120 --title=iterm --position=right --autoclose=0<CR>
" Allow specifying the name of the floaterm before opening
" nmap <leader>qn :FloatermNew --wintype=vsplit --height=1.0 --width=0.33 --position=right --autoclose=0 --title=
nmap <leader>qn <C-l><C-l><C-l>:FloatermNew --wintype=vsplit --height=1.0 --width=120 --position=right --autoclose=0 --title=
" Shortcut to hide all floaterms
nmap <leader>qt :FloatermHide!<CR>
" Shortcut for killing a floaterm - allows a floaterm name to be entered
" before killing
nmap <leader>qk :FloatermKill
" Allow normal window-switching mappings from floaterm
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" Allow escape to go to normal mode in floaterm
" (Don't use any existing mappings here because it breaks the equivalent
" mapping in vim in floaterm)
tnoremap <C-f>qq <C-\><C-n>
tnoremap <C-f>qt <C-\><C-n>:FloatermHide!<CR>

" ENDMAPPINGS

"" ABBREV

" Open help in a vertical split
cabbrev h vert h

" Don't jump to first result when searching with ack.vim
cnoreabbrev Ack Ack!

" ENDABBREV

" AUTOCMD

" Remove trailing whitespace on file save
autocmd BufWritePre * %s/\s\+$//e

" Make Vim jump to the last position when reopening a file, except for commit
" messages. https://stackoverflow.com/a/16728794
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit"
    \| exe "normal! g'\"" | endif
endif

" Open NERDTree automatically if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Enable spellcheck in commit msg editor, markdown files, .txt files
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_gb
autocmd BufRead *.aliases,*.extra,*.functions setlocal syntax=sh ft=sh
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown,*.txt setlocal spell spelllang=en_gb wrap linebreak nolist
autocmd BufNewFile,BufRead *.yaml,*.yml setlocal tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.cs setlocal tabstop=8 shiftwidth=8 noexpandtab autoindent
autocmd BufNewFile,BufRead *.bq setlocal syntax=sql
autocmd BufNewFile,BufRead *Dockerfile* setlocal syntax=dockerfile
autocmd BufNewFile,BufRead *requirements.* setlocal nospell
autocmd BufNewFile,BufRead .vimlocal setlocal ft=vim
autocmd FileType go nmap <leader>tf  <Plug>(go-test)
autocmd FileType go nmap <leader>tn  <Plug>(go-test-func)
" Enable coc completion on - separated words
autocmd FileType * let b:coc_additional_keywords = ["-", ".", "+"]

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" When switching panes in tmux, an escape sequence is printed. Redrawing gets
" rid of it. See https://gist.github.com/mislav/5189704#comment-951447
au FocusLost * :redraw!

" ENDAUTOCMD

" MISC

" Allows cursor change in tmux mode (to vertical bar)
" (Don't set these up in vim in floaterm because it breaks insert mode,
" where 50;CursorShape=1 gets inserted everywhere)
if exists('$TMUX') && !exists('$VIM_TERMINAL')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable red fg highlighting for spellcheck errors to work with cursorline
hi clear SpellBad
hi SpellBad ctermfg=red

" ENDMISC

" COC

let g:coc_global_extensions = ['coc-sh', 'coc-snippets', 'coc-pyright', 'coc-pairs']
" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

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
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Set Python interpreter to pyenv one for current directory
" https://github.com/neoclide/coc-python/issues/55#issuecomment-664764641
call coc#config('python', {'pythonPath': $PYENV_VIRTUAL_ENV})

" END COC

" PER_PROJECT VIM SETTINGS

" Sources a .vimlocal file in the directory from which Vim is launched
" silent! means it doesn't error if no .vimlocal file exists
" https://vim.fandom.com/wiki/Project_specific_settings
silent! so .vimlocal

