"Turn on syntax highlighting"
syntax on

"Dark background by default"
set background=dark

"Show line numbers"
set nu

"Tab stop"
set ts=4

"Always use spaces instead of tabs"
set expandtab

"Always use unix line endings"
set ff=unix

"Set autoindent"
set ai

"Show (partial) command in status line.
set showcmd

"Show matching brackets.
set showmatch

"Do case insensitive matching
set ignorecase

"Do smart case matching
set smartcase

"Incremental search
set incsearch

"Automatically save before commands like :next and :make
set autowrite

"Hide buffers when they are abandoned
set hidden

" Enable mouse usage (all modes) in terminals
set mouse=a

" Turn off default mappings imposed by macvim
let macvim_skip_cmd_opt_movement = 1

" From http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Toggle the window manager plugin at startup to visible
autocmd GUIEnter * WMToggle "call ToggleWindowsManager()
"autocmd VIMEnter * WMToggle "call ToggleWindowsManager()
