" ==========================	basic config =======================
"
" 启用鼠标
set mouse=a
" 设置行号
set nu
" 设置语法高亮
syntax on
" 设置自动缩进
set autoindent
" 搜索忽略大小写
set ignorecase
"增量式搜索
set incsearch
"高亮搜索
set hlsearch
"有时中文会显示乱码，用一下几条命令解决
let &termencoding=&encoding
set fileencodings=utf-8,gbk
" 让vim可以使用系统剪贴板
set clipboard=unnamed
"很多插件都会要求的配置检测文件类型
:filetype on
:filetype plugin on
:filetype indent on
"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler
" 设置折叠
" set foldmethod=indent
" 设置制表符占4个空格
set tabstop=4
"用空格键替换制表符
set expandtab
"默认缩进4个空格大小
set shiftwidth=4

" icon配置
set encoding=UTF-8
set guifont=DroidSansMono_Nerd_Font:h11

" pyx 配置
set pyxversion=0

" ========================   map config ===========================
"
" insert下使用jj回到normal
" inoremap jj <Esc>`^ " 光标回到上次编辑的地方
inoremap jj <Esc>

" leader 键
let g:mapleader="\<space>"
let mapleader="\<space>"

" 使用 leader + w  直接保存
" inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
" nerdtree 映射
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" 窗口切换
noremap <leader>l <c-w>l
noremap <leader>h <c-w>h
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
" easyMotion
nmap ss <Plug>(easymotion-s2)
" tagbar
nmap <F8> :TagbarToggle<CR>
" fzf.vim
cnoremap F GFiles
"
"
"
"
" =======================   vim-plug  ============================
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin()

" Make sure you use single quotes
" 初始化界面
Plug 'mhinz/vim-startify'
" 状态栏美化
Plug 'vim-airline/vim-airline'
" 状态栏颜色
Plug 'vim-airline/vim-airline-themes'
" 缩进线
Plug 'yggdroot/indentline'
" 主题
Plug 'morhetz/gruvbox'
" 文件树
Plug 'preservim/nerdtree'
" ctrlP
Plug 'ctrlpvim/ctrlp.vim'
" easyMotion
Plug 'easymotion/vim-easymotion'
" icon
Plug 'ryanoasis/vim-devicons'
" icon 颜色
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" vim surround
Plug 'tpope/vim-surround'

" ============= vim surround demo ====================
" It's easiest to explain with examples. Press cs"' inside
" \"Hello world!"
" to change it to
" 'Hello world!'
" Now press cs'<q> to change it to
" <q>Hello world!</q>
" To go full circle, press cst" to get
" \"Hello world!"
" To remove the delimiters entirely, press ds".
" Hello world!
" Now with the cursor on 'Hello', press ysiw] (iw is a text object).
" [Hello] world!
" Let's make that braces and add some space (use } instead of { for no space): cs]{
" { Hello } world!
" cs (change surrounding)
" ds (delete surrounding)
" ys (you add a surrounding)
" =============== demo ends ===========================

" fzf.vim  模糊匹配
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 批量替换
Plug 'brooth/far.vim'
" tagbar (大纲)
Plug 'majutsushi/tagbar'
" 高亮关键字
" 快捷键为 leader + k 取消为 leader + K
Plug 'lfv89/vim-interestingwords'
" coc.vim 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 同词高亮
Plug 'rrethy/vim-illuminate'
" emmet
Plug 'mattn/emmet-vim'
" 注释工具
Plug 'scrooloose/nerdcommenter'
" git 包装器及相关插件 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
" Initialize plugin system
call plug#end()
" 状态栏颜色
let g:airline_theme='base16'
" 状态栏显示buffer
let g:airline#extensions#tabline#enabled = 1
" airline config
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
let g:airline_powerline_fonts = 1
" 缩进线配置
let g:indentLine_char_list = ['┆']
let g:indentLine_enabled=1
" nerdtree 配置
" 显示隐藏文件
let NERDTreeShowHidden=1
    " Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
    " Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    let NERDTreeIgnore = [
        \'\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$', 
        \'\.DS_Store$', '\.sass-cache$', 
        \ ]
" ctrlP唤醒
let g:ctrlp_map = '<c-p>'
" ctrlp忽略

" ctrlp, 在~/.agignore添加一行node_modules
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
  \ }
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" 主题
colorscheme gruvbox


" ============================ coc.nvim extensions ===========================
" ============================================================================
let g:coc_global_extensions = [
                                \'coc-marketplace',
                                \'coc-json',
                                \'coc-vimlsp',
                                \'coc-browser']


" 可以使用:CocList marketplace 查看coc商场里的插件
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" TextEdit might fail if hidden is not set.
set hidden
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-i> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" 跳转错误
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" 跳转定义 ctrl + o 回去
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight the symbol and its references when holding the cursor.
" 高亮关键字 (没生效)
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K to show documentation in preview window.
" 显示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" =============================  coc ends ====================================
" ============================================================================
"
" ============================== emmet config ================================
let g:user_emmet_leader_key='<tab>'
" ============================== emmet ends  =================================
"
"
"============================== 注释 setting ================================
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"使用方法
"[count]<leader>cc |NERDCommenterComment|

"Comment out the current line or text selected in visual mode.

"[count]<leader>cn |NERDCommenterNested|

"Same as cc but forces nesting.

"[count]<leader>c<space> |NERDCommenterToggle|

"Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

"[count]<leader>cu |NERDCommenterUncomment|

"Uncomments the selected line(s).
" ============================ 注释 ends ====================================
