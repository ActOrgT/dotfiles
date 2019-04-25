"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/root/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.')
  call dein#begin('/root/.')

  " Let dein manage dein
  " Required:
  call dein#add('/root/./repos/github.com/Shougo/dein.vim')     "
  call dein#add('airblade/vim-gitgutter')                       " 差分表示
  call dein#add('c9s/perlomni.vim')                             " perl補完強化
  call dein#add('chase/vim-ansible-yaml')                       "
  call dein#add('davidhalter/jedi-vim')                         " Python補完強化
  call dein#add('dhruvasagar/vim-table-mode')                   "
  call dein#add('editorconfig/editorconfig-vim')                "
  call dein#add('jistr/vim-nerdtree-tabs')                      "
  call dein#add('jiangmiao/auto-pairs')                         " 対応する括弧を自動入力
  "call dein#add('kevinw/pyflakes-vim')                         " python構文チェック
  call dein#add('majutsushi/tagbar')                            "
  call dein#add('reireias/vim-cheatsheet')                      " vim用チートシート
  call dein#add('ryanoasis/vim-devicons')                       "
  "call dein#add('prettier/vim-prettier')                        " コード自動成形
  call dein#add('scrooloose/nerdtree')                          "
  call dein#add('sheerun/vim-polyglot')                         "
  call dein#add('Shougo/neocomplcache')                         " 入力補完機能
  call dein#add('Shougo/neosnippet')                            "
  call dein#add('Shougo/neosnippet-snippets')                   "
  call dein#add('thinca/vim-quickrun')                          " バッファ上にあるコードを実行
  call dein#add('tpope/vim-fugitive')                           "
  call dein#add('tpope/vim-commentary')                         "
  call dein#add('vim-airline/vim-airline')                      " ステータスバーをカスタム
  call dein#add('vim-airline/vim-airline-themes')               " 上記のテーマ
  call dein#add('vim-jp/vimdoc-ja')                             "
  call dein#add('w0rp/ale')                                     "

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"----------------------------------------------------------
" neocomplete・neosnippet
"----------------------------------------------------------
" Vim起動時にneocompleteを有効にする
let g:neocomplcache_enable_at_startup = 1

" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1

" 3文字以上の単語に対して補完を有効にする
let g:neocomplcache_min_keyword_length = 3

" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1

" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"

" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"


"----------------------------------------------------------
" vim-airline
"----------------------------------------------------------
"set laststatus=2
"let g:airline_theme = 'wombat'
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#wordcount#enabled = 0
"let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
"let g:airline_section_c = '%t'
"let g:airline_section_x = '%{&filetype}'
"let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
"let g:airline#extensions#ale#error_symbol = '? '
"let g:airline#extensions#ale#warning_symbol = '? '
"let g:airline#extensions#default#section_truncate_width = {}
"let g:airline#extensions#whitespace#enabled = 1
let g:airline_theme = 'molokai'


"----------------------------------------------------------
" NEDTree
"----------------------------------------------------------
"let g:NERDTreeShowBookmarks=1
"let NERDTreeShowHidden = 1
"let g:nerdtree_tabs_open_on_console_startup=1

nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')


"----------------------------------------------------------
" vim-table-mode
"----------------------------------------------------------
let g:table_mode_corner = '|'


"----------------------------------------------------------
" Gitgutter
"----------------------------------------------------------
set updatetime=250
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd ctermfg=blue ctermbg=brown


"----------------------------------------------------------
" vim-cheatsheet
"----------------------------------------------------------
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'


"----------------------------------------------------------
" quickrun.vim
"----------------------------------------------------------
nmap <Leader>r <plug>(quickrun)
let g:quickrun_config={'*': {'split': ''}}
set splitbelow


"----------------------------------------------------------
" ale
"----------------------------------------------------------
" 保存時のみ実行する
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
" エラー間移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_open_list = 1
" エラーと警告がなくなっても開いたままにする
let g:ale_keep_list_window_open = 1

"----------------------------------------------------------
" prettier/vim-prettier
"----------------------------------------------------------
" let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_use_local_config = 1


"----------------------------------------------------------
" basic
"----------------------------------------------------------
" 改行コードの自動判別
set fileformat=unix

" □や○文字が崩れる問題を解決
set ambiwidth=double

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" バッファが編集中でもその他のファイルを開けるように
set hidden

" シンタックスを有効にする
syntax on
colorscheme molokai
"colorscheme koehler
"set background=dark

" ターミナル接続を高速化
set ttyfast

" 改行時自動インデント
set smartindent

" 行番号を表示
set number

" 不可視文字を表示
"set list

" インクリメントサーチを有効にする
set incsearch

" ハイライトサーチを有効にする
set hlsearch

" 検索時大文字小文字を区別しない
set ignorecase

" 検索時に大文字を入力した場合ignorecaseが無効になる
set smartcase

" カーソルラインを表示する
set cursorline

" ファイル更新で自動で読み直す
"set autoread

" 補完ウィンドウの設定
set completeopt=menuone

" ビープ音を可視化
"set visualbell

" 括弧入力時の対応する括弧を表示
set showmatch

" 対応括弧の表示秒数を3秒にする
set matchtime=5

" ステータスラインを常に表示
"set laststatus=2

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" タイトルを表示
set title

" カーソルの行数表示
set cursorline

" カーソルから相対的な行数を表示する
""set relativenumber

" マウス操作を有効にする
""set mouse=a

" 1 tab == 4 spaces
""set shiftwidth=4
""set tabstop=4

" タイムアウト時間設定
set timeout timeoutlen=1000 ttimeoutlen=50

" wildmenuを有効にする
set wildmenu
set wildmode=full

" 保存するコマンド履歴の数
set history=500

" バックスペースキーの有効化
"set backspace=indent,eol,start

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

set backspace=indent,eol,start


" 前回のカーソル位置へ戻る
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

"----------------------------------------------------------
" Keymap
"----------------------------------------------------------
"インサートモードでも移動
inoremap <c-d> <Del>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 新規タブ
nnoremap st :<C-u>tabnew<CR>

" 垂直分割
nnoremap sv :<C-u>vs<CR>

" 水平分割
nnoremap ss :<C-u>sp<CR>

" 分割移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" w!! でスーパーユーザーとして保存
cmap w!! w !sudo tee > /dev/null %