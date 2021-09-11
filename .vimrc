" 1. Vim-Plug {{{1 "
set nocompatible              " be iMproved, required
filetype off                  " required

" Reminder {{{2 "
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" 2}}} "

call plug#begin('~/.vim/plugged')

" Reminder {{{2 "
" Make sure you use single quotes
" Any valid git URL is allowed
" Multiple Plug commands can be written in a single line using | separators
" On-demand loading
" Using a non-master branch
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plugin options
" Plugin outside ~/.vim/plugged with post-update hook
" Unmanaged plugin (manually installed and updated)
" 2}}} "

" Plug 'mipmip/vim-fluid'
" Plug 'jasonwoodland/vim-html-indent'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-peekaboo'
Plug 'Yggdroot/indentLine'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
Plug 'ncm2/ncm2'
Plug 'majutsushi/tagbar'
Plug 'junegunn/limelight.vim'
Plug 'qpkorr/vim-renamer'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'nanotech/jellybeans.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'mechatroner/rainbow_csv'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'bronson/vim-visual-star-search'
Plug 'vim-scripts/searchfold.vim'
Plug 'justinmk/vim-sneak'
Plug 'michal-h21/vim-zettel'
Plug 'justinmk/vim-dirvish'
Plug 'christoomey/vim-tmux-navigator'
Plug 'KabbAmine/lazyList.vim'
Plug 'tpope/vim-unimpaired'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'blindFS/vim-taskwarrior'
Plug 'Shougo/unite.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'kyuhi/vim-emoji-complete'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'tmhedberg/SimpylFold'
Plug 'karoliskoncevicius/vim-sendtowindow'
" Unused plugins {{{2 "
" Plug 'jiangmiao/auto-pairs'
" Plug 'unblevable/quick-scope'
" Plug 'pi314/ime.vim'
" Plug 'pi314/ime-phonetic.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-vim-lsp'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" 2}}} "
" post install (yarn install | npm install) then load plugin only for editing supported files

" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()
" 1}}} "
" 2. Base {{{1 "
let mapleader=" "
set nofoldenable
set foldmethod=marker
augroup pymode
    autocmd!
    " autocmd FileType *.py setlocal foldmethod=manual
    autocmd FileType python setlocal relativenumber
    autocmd FileType python setlocal foldmethod=marker
    autocmd FileType python nmap <leader>pr :PymodeLintAuto<cr>
augroup END
" autocmd FileType python setlocal foldmethod=manual
" autocmd FileType python setlocal relativenumber
" autocmd InsertLeave *.py setlocal foldmethod=marker

" set foldmethod=indent
set inccommand=split "when you substute the words, there will be a po-up at the bottom.
set splitright

filetype plugin indent on    " required
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

syntax on
" filetype plugin indent on
set conceallevel=2

"tweak for netrw
" let g:netrw_banner=0
" let g:netrw_browse_split=2
" let g:netrw_altv=2
" let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

let g:markdown_enable_folding = 1 
"for markdown
"let g:markdown_enable_input_abbreviations = 1
let g:markdown_enable_conceal = 1

"Base
" set nocompatible
set autoread
set autowrite
set shortmess=atI
set backspace=indent,eol,start
set clipboard=unnamedplus
" Color Scheme
" colorscheme jellybeans
" colo molokai
colo seoul256
 
"colorscheme slate
set magic
set title
set nobackup

set visualbell
set noerrorbells
set visualbell t_vb=
set t_vb=
set tm=500
set statusline+=\ %F
"set path+=**
set wildmenu 
set number
" set relativenumber
set wrap
set undofile
set undodir=/tmp

set hlsearch
set incsearch
set ignorecase
set smartcase
"<Ctrl-l> redraws the screen and removes any search highlights
nnoremap <silent> nl :nohl<CR>

set expandtab
set smarttab
set shiftround

"indent
set autoindent smartindent shiftround
set formatoptions=qrnj1
set shiftwidth=4
set tabstop=4
set softtabstop=4

" status line
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar
set ruler
" set cursorcolumn
" set cursorline
"set showmode
set showmatch
set matchtime=2
set breakindent 
set breakindentopt=shift:2,min:40,sbr
set t_Co=256
" let g:clipboard = {
"       \   'name': 'myClipboard',
"       \   'copy': {
"       \      '+': 'clip',
"       \      '*': 'clip',
"       \    },
"       \   'paste': {
"       \      '+': 'lastclip',
"       \      '*': 'lastclip',
"       \   },
"       \   'cache_enabled': 1,
"       \ }
set clipboard+=unnamedplus
" 1}}} "
" 3. Mapping {{{1 "
" nnoremap p "0p

" Quick send
map <leader>qs :!neomutt -s "quicksend" chiangiii@mac.com < %


" Quick exit
im jk <ESC>
nnoremap <leader>l >>
nnoremap <leader>h <<

" Quick find
map <leader>wf :find ~/vimzettel/Weekly Finance\ Meeting\ Minutes.wiki<cr>

" Four questions for drafting emails
nnoremap ,q :-1read ~/vimzettel/4q.txt<CR>

" For daily refelction
nnoremap ,r :-1read ~/vimzettel/reflection.txt<CR>


noremap [i 0C

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easier moving code blocks
vnoremap < <gv
vnoremap > >gv

" Switch windows
map <C-l> <C-W><Right>
map <C-h> <C-W><Left>
map <C-k> <C-W><Up>
map <C-j> <C-W><Down>


noremap <Leader>e :qa<CR>
" Quick exit
noremap <Leader>E :qa!<CR>
" Quick exit a window
noremap <Leader>q :q<CR>

" place holder
nmap <Leader>pl i<++>

" jump into place holder
map <Space><Space> /<++><cr>ca<

" split the window horizonrtally
map <Leader>- :sp<cr>

" split the window vertically
map <Leader>] :vsp<cr>


:inoremap ( ()<ESC>i
" :inoremap [ []<ESC>i
:inoremap { {}<ESC>i
" :inoremap < <><ESC>i

map <leader>6 :find ~/.vimrc<cr>

"colorscheme slate

" im § <ESC>
" im <c-s> <ESC>:w<CR>
" nnoremap <c-s> <ESC>:w<cr> 
" im <c-e> <ESC><CR>
"set guifont=Monaco:h30
set wrap linebreak

" set linebreak 
im <M-1> <ESC>:EnableAutocorrect<cr>i
im <M-2>2 <ESC>:DisableAutocorrect<cr>i
im <M-3>3 <ESC> 
im <M-4>4 <ESC>:set breakindentopt=shift:2,min:40,sbr<cr>a
im <M-5>5 <ESC>:set breakindentopt=shift:0,min:40,sbr<cr>a
map <leader>4 :set breakindentopt=shift:2,min:40,sbr<cr>
map <leader>5 :set breakindentopt=shift:0,min:40,sbr<cr>

map <leader>1 :EnableAutocorrect<cr>a
map <leader>2 :DisableAutocorrect<cr>a
nnoremap <Up> g<Up>
nnoremap g<Up> <Up>
nnoremap <Down> g<Down>
nnoremap g<Down> <Down>
im <Up> <ESC>g<Up>a
im <Down> <ESC>g<Down>a
im <D-Right> <ESC>l)i
im <D-Left> <ESC>(i
map <D-Left> (
map <D-Right> )
im \4q <ESC><Leader>4q
im \0 <ESC><Leader>e}<d-1><cr>
map \0 <Leader>e}<d-1><cr>
im \q <ESC><D-s>:q<cr><c-s>j
noremap <Leader>q :wq<cr><c-s>
" im <Leader><Right> <ESC><c-w>wa
" im <Leader><Up> <ESC><c-w>wa
" im <Leader><Left> <ESC><c-w>Wa
" im <Leader><Down> <ESC><c-w>Wa
map <Leader><Right> <c-w>w
map <Leader><Up> <c-w>w
map <Leader><Left> <c-w>W
map <Leader><Down> <c-w>W
map <Leader>5q <Leader>4q<Leader>r<ESC>zRa
nnoremap .q :-1read $HOME/.vim/bundle/4q.txt<CR>
nmap <C-Right> :vert resize+30<cr>
nmap <C-Left> :vert resize-30<cr>
nmap <C-Up> :resize+10<cr>
nmap <C-Down> :resize-10<cr>
" :nnoremap ; :
"vertical to horizontal
:noremap <c-w>- <c-w>t<c-w>K
:noremap <c-w>\ <c-w>t<c-w>H 
:nmap <Space> \
:xmap <Space> \
nnoremap tt "=strftime("%F %T%z")<cr>p
tnoremap <Esc> <C-\><C-n>:q!<CR>
imap jk <ESC>
nnoremap <leader>sop :source %<cr>
" bold, italic, and url, etc
vmap <Leader>b di**<ESC>pa**<ESC>
vmap <Leader>h di^<ESC>pa^<ESC>
vmap <Leader>it di*<ESC>pa*<ESC>
vmap <Leader>li di[<ESC>pa](<++>)<ESC>

" nnoremap <Leader>h :LspHover<cr>
" 1}}} "
" 4. Plugin Related {{{1 "
" 1. UltiSnip {{{2 "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" 2}}} "
" 2. deoplete {{{2 "
let g:deoplete#enable_at_startup = 1
let python_highlight_all = 1
" let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#show_call_signatures = 0
map <leader>acd :call deoplete#custom#buffer_option('auto_complete', v:false)
map <leader>ac :call deoplete#custom#buffer_option('auto_complete', v:true)
" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <S-l> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" inoremap <expr> <S-l> (pumvisible() ? "\<c-y>" : "<S-l>")
" inoremap <M-l> <c-y>

" Use <TAB> to select the popup menu:
" inoremap <expr><C-ENTER> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><C-Bslash> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Registering servers
"
"function! s:on_lsp_buffer_enabled() abort
    "setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> <f2> <plug>(lsp-rename)
    "" refer to doc to add more commands
"endfunction
"
"augroup lsp_install
    "au!
    "" call s:on_lsp_buffer_enabled only for languages that has the server registered.
    "autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
" 2}}} "
" 3. Vim-markdown {{{2 "
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_auto_extension_ext = 'txt'
let g:tex_conceal="admgs"
" 2}}} "
" 4. NERDTree {{{2 "
"Fix NERDTree problem
let g:NERDTreeNodeDelimiter = "\u00a0" 
map <leader>n :NERDTreeToggle<CR>
" 2}}} "
" 5. LimeLight {{{2 "
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^'
let g:limelight_eop = '$'

" nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
" 2}}} "
" 6. Toggle Focus {{{2 "
" map <c-d> :call ToggleFocus()<cr>
" let g:tf = 1
" function! ToggleFocus()
"     if g:tf == 1
"         exe "Goyo200"
"         exe "Limelight"
"         let g:tf = 0
"     else
"         exe "Goyo!"
"         exe "Limelight!"
"         let g:tf = 1
"     endif
" endfunction    

" im <c-d> <ESC><c-d><cr>
" 2}}} "
" 7. FZF {{{2 "
"for fzf
"set rtp+=/usr/local/opt/fzf
nnoremap <C-f> :FZF<cr>
" 2}}} "
" 8. MyScript {{{2 " 
source ~/.vim/bundle/myscript.vim
" 2}}} "
" 9. Startify {{{2 "
let g:startify_custom_header = [
        \ ' #####  #    #   ##   #####  #      ######  ####   ',
        \ ' #      #    #  #  #  #    # #      #      #      ',
        \ ' #      ###### #    # #    # #      #####   ####  ',
        \ ' #      #    # ###### #####  #      #           # ',
        \ ' #      #    # #    # #   #  #      #      #    # ',
        \ ' #####  #    # #    # #    # ###### ######  ####   ',
        \ ]


" Mapping for Startify
map <leader>st :Startify<cr>
" 2}}} "
" 10. Vimwiki {{{2 "
" Vimwiki https://github.com/vimwiki/vimwiki 
" let g:vimwiki_list = [{"path":"~/vimzettel/", 'auto_tags': 1, 'auto_toc': 1}, {'path': '~/vimrasp/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{"path":"~/vimzettelmd/", 'auto_tags': 1, 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/vimrasp/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_use_mouse = 1
let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1
" let g:zettel_options = [{"front_matter" : {"tags" : ":<++>"}, "template" :  "~/Templates/zettel.tpl"}]
" let g:disable_front_matter = 1
let g:zettel_options = [{"template" :  "~/Templates/zettel.tpl","disable_front_matter": 1}]
" let g:zettel_format = '%Y%m%d%H%M%S'
let g:zettel_format = '%Y-%m%d-%H%M-%title'
" In insert mode when you type [[ the ZettelSearch function is triggered

let g:zettel_default_mappings = 0

augroup filetype_vimwiki
    autocmd!
    autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
    " If you want to insert a link to the current note in another note you can type T in normal mode to copy a formatted wiki link with the current note title as the link text that you can paste in other notes.
    autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
    " You can create a new note with the selected text as the note title by typing z.
    autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
    " And you can turn a file name under the cursor in your note into a link to the file with gZ.
    autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
    " I created several mappings to make some other useful features easier to use. <leader>vt starts a tag search letting you open files with matching tags.
    " This mapping and the even more convenient [[ insert mode mapping let you search for existing notes to insert as a link to the current file.
    autocmd FileType vimwiki nnoremap <leader>zl :ZettelSearch<cr>
    "<leader>zn creates a new zettel based on the template we defined earlier named with a unique zettel ID.
    autocmd FileType vimwiki nnoremap <leader>zn :ZettelNew<cr><cr>:4d<cr>:w<cr>ggA
augroup END

nnoremap <leader>vt :VimwikiSearchTags<space>
" <leader>vs does the same thing but with a full text search.
nnoremap <leader>vs :VimwikiSearch<space>
" This mapping runs two Vimwiki functions that keep the Vimwiki tags file up-to-date and generates an index by tag of file links in the index.wiki file.
nnoremap <leader>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr><c-l>
" This one is useful when you want to know what zettels link to the current one. It opens a window split with a list of those files.
nnoremap <leader>bl :VimwikiBacklinks<cr>

" let g:vimwiki_list = [{'path': '~/vimrasp/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_list = [{'path': '~/vimipad/', 'auto_tags': 1, 'auto_generate_links': 1, 'auto_generate_tags': 1, 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_folding='custom'
" let g:vimwiki_folding='expr'
let g:vimwiki_table_mappings = 0
" set conceallevel=0
set conceallevel=2
let g:vim_markdown_strikethrough = 1
let g:markdown_enable_folding = 1
let g:markdown_enable_conceal = 1

" Mapping
nmap g1  :VimwikiChangeSymbolInListTo 1.<CR>
map <Leader>. :VimwikiToggleListItem<cr>
nmap ,gt yi:/===<cr>opIall_tags#<cr>/===<cr>Op<cr>
nmap ,tt :find $HOME/vimrasp/all_tags.md<cr>
nmap <Leader><Enter> :VimwikiVSplitLink<cr>
" Grep
" command! -nargs=1 Ngrep vimgrep "<args>" $HOME/vimipad/**/*.md
" nnoremap <leader>[ :Ngrep 
nnoremap <leader>[ :VWS 

" Preview for quickfix window
nnoremap <leader>p 0<C-w><C-o><C-w><C-f><C-w><Down>
" vmap <leader>p 0<C-w><C-o><C-w><C-f><C-w><Down>

" Unhide
" let g:vimwiki_conceal_onechar_markers = 0
" let g:markdown_enable_conceal = 0

hi LightSteelBlue ctermfg=147
hi link VimwikiHeader1 LightSteelBlue
hi Purple ctermfg=129
hi link VimwikiHeader2 Purple
" Vimwiki color scheme
" hi VimwikiHeader1 guifg=#FF0000
" hi VimwikiHeader2 guifg=#00FF00
" hi VimwikiHeader3 guifg=#00FFFF
" hi VimwikiHeader4 guifg=#FF00FF
" hi VimwikiHeader5 guifg=#0000FF
" hi VimwikiHeader6 guifg=#FFFF00

" 2}}} "
" 11. IME {{{2 "
" input method https://github.com/pi314/ime.vim
let g:ime_plugins = ['zhuyin']
" let g:ime_plugins = ['builtin_chewing']
let g:ime_toggle_english = ',,'
let g:ime_select_mode = ',m'
let g:ime_menu = ';;'
let g:ime_switch_2nd = ',.'
let g:ime_phonetic_custom_table = '~/.phonetic.table'
let g:ime_cancel_input = '<C-h>'
" let g:ime_boshiamy_custom_table = '~/.boshiamy.table'
" let g:ime_enable_ime_buffer = 1
" imap <S-tab> <c-n>
imap <c-j> <c-n>
imap <c-k> <c-p>
" let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#enabled = 1
" https://github.com/pi314/ime-phonetic.vim
" let g:ime_phonetic_cache_size = 2000
let g:ime_select_mode_style = 'interactive'
im <c-j> <c-n>
im <c-k> <c-p>
" let g:ime_plugins = [
"     \ 'builtin_boshiamy',
"     \ 'builtin_kana',
"     \ 'builtin_chewing',
"     \ 'builtin_unicode',
"     \ 'wide', 'runes', 'braille', 'emoji']
" 2}}} "
" 12. Quick Scope {{{2 "
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" 2}}} "
" 13. Vim-you-autocorrect {{{2 "
autocmd Filetype vimwiki EnableAutocorrect
autocmd Filetype mail EnableAutocorrect

nmap <Leader>u <Plug>VimyouautocorrectUndo

im <c-e> <ESC>:EnableAutocorrect<cr>i
im <c-s> <ESC>:DisableAutocorrect<cr>i

map <c-e> :EnableAutocorrect<cr>
map <c-s> :DisableAutocorrect<cr>

" 14. Vim-Sneak {{{2 "
let g:sneak#label = 1

" 2}}} "
" 15. Vim-Dirvish {{{2 "
nmap <leader>9 :Dirvish %<cr>
" 2}}} "
" 16. LazyList {{{2 "
nnoremap ,li :LazyList 
vnoremap ,li :LazyList 
let g:lazylist_omap = 'il'
let g:lazylist_maps = [
			\ ',l',
			\ {
				\ 'l'  : '',
				\ '*'  : '* ',
				\ '-'   : '- ',
				\ 't'   : '- [ ] ',
				\ '2'  : '%2%. ',
				\ '3'  : '%3%. ',
				\ '4'  : '%4%. ',
				\ '5'  : '%5%. ',
				\ '6'  : '%6%. ',
				\ '7'  : '%7%. ',
				\ '8'  : '%8%. ',
				\ '9'  : '%9%. ',
				\ '.1' : '1.%1%. ',
				\ '.2' : '2.%1%. ',
				\ '.3' : '3.%1%. ',
				\ '.4' : '4.%1%. ',
				\ '.5' : '5.%1%. ',
				\ '.6' : '6.%1%. ',
				\ '.7' : '7.%1%. ',
				\ '.8' : '8.%1%. ',
				\ '.9' : '9.%1%. ',
			\ }
		\ ]
" 2}}} "
" 17. Vim Warrior {{{2 "
let g:task_rc_override = 'defaultwidth=999'
nnoremap <leader>t :tabnew <bar> :TW<CR>

highlight taskwarrior_tablehead ctermbg=white ctermfg=green guifg=#000057

highlight default link taskwarrior_tablehead   Tabline
highlight default link taskwarrior_field       IncSearch
highlight default link taskwarrior_selected    Visual
highlight default link taskwarrior_id          VarId
highlight default link taskwarrior_project     String
highlight default link taskwarrior_Status      Include
highlight default link taskwarrior_priority    Class
highlight default link taskwarrior_due         Todo
highlight default link taskwarrior_end         Keyword
highlight default link taskwarrior_description Normal
highlight default link taskwarrior_entry       Special
highlight default link taskwarrior_depends     Todo
highlight default link taskwarrior_tags        Keyword
highlight default link taskwarrior_uuid        VarId
highlight default link taskwarrior_urgency     Todo

" 2}}} "
" 18. Unite {{{2 "
    nnoremap    [unite]   <Nop>
	nmap    \ [unite]

	nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
	        \ -buffer-name=files buffer bookmark file<CR>
	nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
	        \ -buffer-name=files buffer bookmark file<CR>
	nnoremap <silent> [unite]r  :<C-u>Unite
	        \ -buffer-name=register register<CR>
	nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
	nnoremap <silent> [unite]f
	        \ :<C-u>Unite -buffer-name=resume resume<CR>
	nnoremap <silent> [unite]ma
	        \ :<C-u>Unite mapping<CR>
	nnoremap <silent> [unite]me
	        \ :<C-u>Unite output:message<CR>
	nnoremap  [unite]f  :<C-u>Unite source<CR>

	nnoremap <silent> [unite]s
	        \ :<C-u>Unite -buffer-name=files -no-split
	        \ jump_point file_point buffer_tab
	        \ file_rec:! file file/new<CR>
	nnoremap <silent> [unite]e :UniteClose<cr>

" 2}}} "
" 19. Font color {{{2 "
vmap <leader>tb "adi<span style="color:blue"><ESC>"apa</span><ESC>
vmap <leader>tbit "adi<span style="color:blue">*<ESC>"apa*</span><ESC>
vmap <leader>tbb "adi<span style="color:blue">**<ESC>"apa**</span><ESC>
vmap <leader>tbbit "adi<span style="color:blue">***<ESC>"apa***</span><ESC>
vmap <leader>tr "adi<span style="color:red"><ESC>"apa</span><ESC>
vmap <leader>trit "adi<span style="color:red">*<ESC>"apa*</span><ESC>
vmap <leader>trb "adi<span style="color:red">**<ESC>"apa**</span><ESC>
vmap <leader>trbit "adi<span style="color:red">***<ESC>"apa***</span><ESC>
" 2}}} "
" 20. markdown to PDF {{{2 "
map <leader>pdf :!cd %:h && pandoc % -o %:r.pdf<cr>
" 2}}} "
" 21. Table Mode {{{2 "
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" 2}}} "
" 22. yank to iOS clip board {{{2 "
" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction
noremap <silent> <C-c> y:<C-U>call Yank(@0)<CR>
" 2}}} "
" 23. SimplyFold {{{2 "
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
" 2}}} "
" 24. Pymode {{{2 "
" let g:pymode_lint = 1
" let g:pymode_rope = 1
" let g:pymode_rope_show_doc_bind = '<Leader>d'
" let g:pymode_rope_goto_definition_bind = '<Leader>g'
" let g:pymode_doc=1

" let g:pymode_rope_completion = 1
" let g:pymode_rope_complete_on_dot = 1
" let g:pymode_indent = 1
" let g:pymode_rope_completion_bind = '<C-l>'
" let g:pymode_trim_whitespaces = 0
" let g:pymode_rope_show_doc_bind = '<C-c>d'

" let g:pymode_rope_goto_definition_bind = '<C-c>g'
" let g:pymode_python='python3'
" 2}}} "
" 25. Vim-format {{{2 "
" let g:python3_host_prog="usr/bin/python"
" 2}}} "
" 26. Sendtowindow {{{2 "
" back to the insert mode in terminal: <c-\><c-n>
nmap ju :new term://python3<cr><C-w>R<C-w>H<C-w>R
let g:sendtowindow_use_defaults=0
nmap L <Plug>SendRight
xmap L <Plug>SendRightV
nmap H <Plug>SendLeft
xmap H <Plug>SendLeftV
nmap K <Plug>SendUp
xmap K <Plug>SendUpV
nmap J <Plug>SendDown
xmap J <Plug>SendDownV
" 2}}} "
" 27. Vim-signify {{{2 "
set updatetime=100
" 2}}} "
" 5. Remove IME and Switch to Python programming  {{{1 "
" Remove ime for pymode:
map <leader>ri :!mv .vim/pack/ivim/start/ime.vim/ ~/ime.vim/<cr>
" Enable this for pymode:
set completeopt=menuone,noinsert
" Turn off this for pymode:
" source $HOME/autosave.vim

" Add this for IME:
map <leader>im :!mv ~/ime.vim/ .vim/pack/ivim/start/ime.vim/<cr>
" Ebable this for IME:
" let g:airline_statusline_ontop=1
" set completeopt=menuone
" source $HOME/autosave.vim

nnoremap <silent> <D-l> :nohl<cr>


" 1}}} "
" 6. Others {{{1 "
" set completeopt=menuone,noinsert
map <Leader>ppt :!cd %:h && pandoc --pdf-engine=xelatex --template=$HOME/Desktop/default.latex % -t beamer -o %:r.pdf && open -a preview %:r.pdf<cr>
"map <Leader>pdf :!cd %:h && pandoc --pdf-engine=xelatex --template=Desktop/default.latex % -o %:r.pdf && open -a preview %:r.pdf<cr>
" map <Leader>pdf :!cd %:h && pandoc --pdf-engine=xelatex --template=$HOME/Desktop/default.latex % -o %:r.pdf && open -a preview %:r.pdf<cr>
map <Leader>pdf :!cd %:h && pandoc --pdf-engine=xelatex % -o %:r.pdf && pdf %:r.pdf<cr>
source ~/vimzettel/myscript.vim
source ~/vimzettel/autosave.vim
source ~/vimzettel/focus.vim
" 1}}} "
