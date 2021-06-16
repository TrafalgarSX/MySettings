
call plug#begin('D:/Neovim/plugged')
" switch keyboard
"Plug 'lyokha/vim-xkbswitch', {'as': 'xkbswitch'}
Plug 'Neur1n/neuims'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'


Plug 'machakann/vim-highlightedyank'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"comments-auto
Plug 'tpope/vim-commentary'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"multiple selections
Plug 'terryma/vim-multiple-cursors'

" vim easymotion
Plug 'easymotion/vim-easymotion'

"vim surround
 Plug 'tpope/vim-surround'

" automatic closing of quotes,parenthesis,barckets,etc
Plug 'Raimondi/delimitMate'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" Clear highlight search automatically for you
Plug 'romainl/vim-cool'

" Super fast movement with vim-sneak
Plug 'justinmk/vim-sneak'

" Show current search term in different color
Plug 'PeterRincker/vim-searchlight'

" File search, tag search and more
Plug 'Yggdroot/LeaderF' ", {'do': ':LeaderfInstallCExtension'}

" colorful status line and theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Highlight URLs inside vim
Plug 'itchyny/vim-highlighturl'

" Automatic insertion and deletion of a pair of characters
Plug 'jiangmiao/auto-pairs'

" Autosave files on certain events
Plug '907th/vim-auto-save'

" 缩进指示线
Plug 'Yggdroot/indentLine' 
Plug 'luochen1990/rainbow'

Plug 'jackguo380/vim-lsp-cxx-highlight'

" python 配置插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kkoomen/vim-doge'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
call plug#end()

""""""""""""""""""""""""""""""""""""""
"    plug-setting
""""""""""""""""""""""""""""""""""""""
let g:python3_host_skip_check=1
let g:python3_host_prog = 'D:/python/python.exe'
let g:doge_doc_standard_python = 'google'
"暂时没有东西写"
let mapleader=' '
"switch keyboard 
"let g:XkbSwitchLib = 'D:/Neovim/bin/libxkbswitch64.dll'
"let g:XkbSwitchLib = 'C:/Users/guo/AppData/Local/nvim/libxkbswitch64.dll'
"let g:XkbSwitchEnabled = 1
"let g:XkbSwitchIMappings   = ['cn']
"let g:XkbSwitchIMappingsTr = {'cn': {'<': '', '>': ''}}
"if has('nvim') && has('win64') 
"    autocmd InsertEnter * set iminsert=2
"endif
autocmd VimEnter * :IMSToggle 
nnoremap <silent> <leader>it :call neuims#Toggle()<CR>

"
let g:vim_json_syntax_conceal = 0
autocmd FileType json,markdown let g:indentLine_conceallevel = 0

"{{ Search related
"""""""""""""""""""""""""""""vim-sneak settings"""""""""""""""""""""""
" Use sneak label mode
let g:sneak#label = 1

nmap f <Plug>Sneak_s
xmap f <Plug>Sneak_s
onoremap <silent> f :call sneak#wrap(v:operator, 2, 0, 1, 1)<CR>
nmap F <Plug>Sneak_S
xmap F <Plug>Sneak_S
onoremap <silent> F :call sneak#wrap(v:operator, 2, 1, 1, 1)<CR>


"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

""""""""""""""""""""""""vim-auto-save settings"""""""""""""""""""""""
" Enable autosave on nvim startup
let g:auto_save = 1

" A list of events to trigger autosave
let g:auto_save_events = ['InsertLeave', 'TextChanged']

" Whether to show autosave status on command line
let g:auto_save_silent = 0

"""""""""""""""""""""""coc.vim settings"""""""""""""""""""""""
nnoremap <leader>nt :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

set cmdheight=2
set updatetime=300
" Don't pass messages to |ins-complietion-menu|.
set shortmess+=c
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
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"主题设置"
""let g:onedark_termcolors=256
colorscheme gruvbox
set termguicolors
" Use 256 colors in gui_running mode
if !has('gui_running')
  set t_Co=256
endif
let g:airline_theme='simple'
    " Use Gruvbox colors for python semshi semantic highlighter
hi semshiGlobal          ctermfg=167 guifg=#fb4934
hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
hi semshiParameter       ctermfg=142  guifg=#98971a
hi semshiParameterUnused ctermfg=106 guifg=#665c54
hi semshiBuiltin         ctermfg=208 guifg=#fe8019
hi semshiAttribute       ctermfg=108  guifg=fg
hi semshiSelf            ctermfg=109 guifg=#85a598
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

"configuration
"map <leader>nt :NERDTreeToggle<CR>


" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set number
set relativenumber
syntax on
set autoindent
set tabstop=4
set shiftwidth=4
set showmode
set showmatch
set mouse=a "启用鼠标

set ignorecase
set smartcase

set bs=indent,eol,start
set viminfo='20,\"50
set history=1024
set ruler

set nobackup
set noswapfile
set clipboard=unnamed

set hlsearch
set incsearch


set tenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               keyboard-binding
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移动分割窗口
  nmap <leader>tn :tabnew<cr>
  nmap <leader>tc :tabclose<cr>
  " last tab
  nmap <leader>th :tabp<cr>
  " next tab
  nmap <leader>tl :tabn<cr>
  
"quicker window movement 
  nnoremap <C-j> <C-w>j 
  nnoremap <C-k> <C-w>k 
  nnoremap <C-h> <C-w>h 
  nnoremap <C-l> <C-w>l 

  "quicker move to line end
 nmap <C-;> <End> 
 imap <C-;> <End>
