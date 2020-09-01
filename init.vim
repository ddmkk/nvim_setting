" deinの読み込み前に指定
let mapleader = "\<Space>"

" let g:python_host_prog='C:\Python27/python.exe'
let g:python3_host_prog='C:\Python38/python.exe'

" dein.vim
runtime! plugins/dein.rc.vim

"---------------------------------------------------------------
"基本
"---------------------------------------------------------------
syntax on
set title
set showcmd
" 行を表示
set number
"文字コードをUTF-8にする
set encoding=UTF-8
" set fileencoding=UTF-8
set termencoding=UTF-8
" 自動判別機能追加
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" 改行コードの自動認識
set fileformats=unix,dos,mac
"ファイル変更中でも他のファイルを開けるようにする
set hidden
"ファイル内容が変更されると自動読み込みする
set autoread
"バックアップディレクトリを指定する
set backupdir=$HOME/.config/nvim/backup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"スワップファイルディレクトリを指定する
set directory=$HOME/.config/nvim/backup
"履歴保存数
set history=1000
set undodir=$HOME/.config/nvim/undo
"インクリメンタルサーチを行う
set incsearch
"検索結果をハイライトする
set hlsearch
"検索時に文字の大小を区別しない
set ignorecase
"検索時に大文字を含んでいたら大小を区別する
set smartcase
"検索をファイルの先頭へループする
set wrapscan
" set autoindent
set smartindent
"行頭での<Tab>の幅
set shiftwidth=4
"行頭以外での<Tab>の幅
set tabstop=4
"<Tab>の代わりに<Space>を挿入する
set expandtab
"expandtabで<Tab>が対応する<Space>の数
"キーボードでTabキーを押したときに挿入される空白の量。0の場合はtabstopの値を引き継ぐ
set softtabstop=0
set backspace=indent,eol,start
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"クリップボードを利用する
set clipboard=unnamed
"勝手に改行しないようにする
set tw=0
"勝手に改行しないようにする
set textwidth=0
"勝手に改行しないようにする
set formatoptions=q
"勝手に改行しないようにする
autocmd Filetype text setlocal textwidth=0
"タブ、行末等の不可視文字を表示する
set list
set listchars=tab:>\ ,trail:_,eol:$
set modifiable
set write
" ステータスラインを常に表示
set laststatus=2
" 編集中のファイルのディレクトリに自動的にカレントディレクトリを切り替える
set autochdir
"カーソル行の背景色を変更
set cursorline
" 長すぎるシンタックスのカラーリングOFF
" set synmaxcol=200

" 折り畳み設定
" 勝手に折りたたまれないようにする
" set foldmethod=syntax
set foldmethod=manual
set foldlevel=100

" -----------------------------------------
" キーマッピング
" -----------------------------------------
" ESCでIMEオフの為
inoremap <C-c> <ESC>
" 折り返し時に表示単位での移動をできるようにする
nnoremap j gj
nnoremap k gk
"インサートモードからjjでノーマルモードに戻れるようにする
" inoremap <silent> jj <ESC>
" 2回ESCを押したら検索のハイライトをやめる
nmap <Esc><Esc> :nohlsearch<CR><ESC>
" 自動的に日本語入力モードを解除する
" inoremap <ESC><ESC> :set iminsert=0<CR>
" ハイライトを一時的に無効化するショートカット
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"Yを行末までのヤンクとする
nnoremap Y y$
"貼り付けたテキストの末尾へ自動的に移動する
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
"インサートモードからjjでノーマルモードに戻れるようにする
inoremap <silent> jj <ESC>
" 2回ESCを押したら検索のハイライトをやめる
nmap <Esc><Esc> :nohlsearch<CR><ESC>
" 自動的に日本語入力モードを解除する
" inoremap <ESC><ESC> :set iminsert=0<CR>
" ハイライトを一時的に無効化するショートカット
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"Yを行末までのヤンクとする
nnoremap Y y$
"貼り付けたテキストの末尾へ自動的に移動する
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"貼りつけ時にペーストバッファが上書きされないようにする
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=brown
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" .vimrcを一瞬で開く、反映させる
nnoremap <F5> :<C-u>edit $MYVIMRC<CR>
nnoremap <F6> :<C-u>edit ~/.config/nvim/ginit.vim<CR>
nnoremap <F9> :<C-u>source $MYVIMRC<CR>
            \ :source ~/.config/nvim/ginit.vim<CR>

" dein.tomlを一瞬で開く
nnoremap <F7> :<C-u>edit ~/.config/nvim/dein.toml<CR>
nnoremap <F8> :<C-u>edit ~/.config/nvim/dein_lazy.toml<CR>

" .vimrcを更新したら自動で反映させる
augroup AutoloadVimrc
    autocmd!
    autocmd BufWritePost init.vim source $MYVIMRC | set foldmethod=marker
    autocmd BufWritePost ginit.vim source ~/.config/nvim/ginit.vim
augroup END

" ファイルの種類別インデント設定
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.pug setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.toml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

