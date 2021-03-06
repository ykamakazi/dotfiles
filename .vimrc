" Use Vim settings, rather then Vi settings (much better!) {
    set nocompatible
" }

" Set leader key to a comma {
    let mapleader=","
    let g:mapleader = ","
" }

" Include Pathogen {
    source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
    call pathogen#infect()
    call pathogen#helptags()
" }

" Include phpDocumentor, since ctrl+p is taken for CtrlP use ctrl+d {
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
    nnoremap <C-D> :call pdv#DocumentWithSnip()<CR>
" }

" Turn on Omni Completion {
    filetype plugin on
    set ofu=syntaxcomplete#Complete
" }

" Map NERDTree and TagList keys, TagList on right side {
    nnoremap <silent> <F2> :NERDTreeToggle<CR>
    nnoremap <silent> <F3> :TlistToggle<CR>
    let Tlist_Use_Right_Window = 1
    let tlist_php_settings='php;f:function' "only list functions in php files (no variables, classes)
" }

" Turn on ctrlp {
    set runtimepath^=~/.vim/bundle/ctrlp.vim
" }

" Syntastical - PHP Code_Sniffer {
    let g:phpcs_std_list="PSR2"
    let g:syntastic_check_on_open=1
    "let g:syntastic_enable_highlighting = 0
    "let g:syntastic_quiet_warnings=1
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:phpcs_max_output = 0 " Unlimited output.
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['php'],
                               \ 'passive_filetypes': [] }
" }

" phpcomplete-extended {
    autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
    let g:phpcomplete_index_composer_command="composer"
" }

" vim-php-namespace {
    inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
    noremap <Leader>u :call PhpInsertUse()<CR>
" }

" Map shift+h to tab left, shift+l to tab right {
    nnoremap <S-h> :tabp<CR>
    nnoremap <S-l> :tabn<CR>
    let Tlist_Use_Right_Window = 1
" }

" Snipmate: let smarty's .tpl files use the html snippets too
    au BufRead *.tpl set ft=html
    au BufNewFile *.tpl set ft=html

" Highlight extra line spacing on end of lines {
    highlight ExtraWhitespace ctermbg=blue guibg=blue
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
" }

" Set color scheme {
    syntax enable
"    let g:solarized_termcolors=256         " uncomment this if colors look messed up
    :autocmd ColorScheme * highlight ExtraWhitespace ctermbg=blue guibg=blue
    colorscheme solarized
    set background=dark
" }

" Text formatting {
    set autoindent                          " copy indent from current line when starting a new line
    set infercase                           " infer case when doing keyword completion
    set shiftround                          " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartindent                         " smart autoindenting for c-like languages
" }

" Tab settings {
    set expandtab                           " expand tabs to spaces
    set shiftwidth=4                        " number of spaces to use with autoindent
    set smarttab                            " tab and backspace are smart
    set softtabstop=4                       " bumber of spaces used by expandtab
    set tabstop=4                           " size of a real tab character
    set autoindent                  " indent at the same level of the previous line
" }

" Set tabs to 2 spaces for javascript files
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2
    autocmd FileType scss setlocal shiftwidth=2 tabstop=2
    autocmd FileType less setlocal shiftwidth=2 tabstop=2
" }

" UI settings {
    syntax on                               " enable syntax highlighting

    set cmdheight=2                         " command line two lines high
    set laststatus=2                        " always show status line
    set lazyredraw                          " don't redraw when don't have to
    set linebreak                           " smarter wordwrap
    set more                                " listings pause when the whole screen is filled
    set nowrap                              " wordwrap turned off
    set number                              " turn on line numbers
    set report=0                            " always report changes
    set ruler                               " always show current position in file
    set scrolloff=10                        " always keep 10 lines above and below cursor
    set showcmd                             " show partial command in the last line of the screen
    set showfulltag                         " show full completion tags
    set showmode                            " show mode on last line of the screen
"    set showtabline=0                       " don't use tabs
    set sidescrolloff=10                    " always keep 10 lines to the left and right of cursor

    " status line
    if has('statusline')
        function! SetStatusLineStyle()
            let &stl="%f %y "                       .
                        \"%([%R%M]%)"                   .
                        \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
                        \"%{'$'[!&list]}"               .
                        \"%{'~'[&pm=='']}"              .
                        \"%="                           .
                        \"#%n %l/%L,%c%V "              .
                        \""
        endfunc
        call SetStatusLineStyle()
    endif
" }

" Search options {
    set ignorecase                          " case insensitve searching by default
    set smartcase                           " do case sensitive searches when caps are present
    set incsearch                           " seach for text as you enter it
" }

" EasyMotion settings {
    let g:EasyMotion_do_shade = 0
" }

" Airline - FontForge/Powerline {
    let g:airline_powerline_fonts = 1
    let g:bufferline_echo = 0
" }

" GitGutter - Make sign column clear {
    hi! link SignColumn Background
"    highlight clear SignColum              " Use instead of above to make same as line numbers bg
" }

" Fix backspace not working {
    set backspace=indent,eol,start
" }
