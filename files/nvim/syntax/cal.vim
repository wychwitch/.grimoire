set nonumber
iabbrev todo+ ●
iabbrev done+ × 
iabbrev week+ week x -------------
set formatprg=sort\ -V
syntax match JournalAll /.*/        " captures the entire buffer
syntax match JournalDone /^×.*/     " lines containing 'done'  items: ×
syntax match JournalTodo /^●.*/     " lines containing 'todo'  items: ·
syntax match JournalEvent /^o.*/    " lines containing 'event' items: o
syntax match JournalNote /^- .*/    " lines containing 'note'  items: -
syntax match JournalMoved /^>.*/    " lines containing 'moved' items: >
syntax match JournalWeek /^week.*/    " lines containing 'moved' items: >

highlight JournalAll    guifg=#797491 
highlight JournalDone   guifg=#504D60
highlight JournalTodo   guifg=#B6AFDA 
highlight JournalEvent  guifg=#CCFCD4 
highlight JournalMoved  guifg=#7E4A4A
highlight JournalNote   guifg=#E3B0C7
highlight JournalWeek   guifg=#35B7F3

highlight Conceal ctermbg=none ctermfg=none guibg=none guifg=#FFFFFF gui=bold

syntax region magician start="^m: " end="$" 
highlight magician guifg=#5459b6
syntax match magIcon '^m:' conceal cchar=理 containedin=magician contained 
highlight! default link Conceal magIcon

"Witch
syntax region witch start="^w: " end="$" 
highlight witch guifg=#D1A0EA
syntax match witchIcon '^w:' conceal cchar=術 containedin=witch contained 

"Celeste
syntax region celeste start="^c: " end="$"  
syntax match celesIcon '^c:' conceal cchar=󱄿 containedin=celeste contained 
highlight link Conceal celesIcon
highlight celeste guifg=#ec51cd


" Gidgit
syntax region gidget start="^g: " end="$" 
syntax match gidIcon '^g:' conceal cchar=󰠠 containedin=gidget contained 
highlight link Conceal gidIcon
highlight gidget guifg=#76e37a


" Nyx
syntax region nyx start="^n: " end="$" 
syntax match nyxIcon '^n:' conceal cchar= containedin=nyx contained 
highlight link Conceal nyxIcon
highlight nyx guifg=#6a6273
highlight nyxIcon guifg=#6a6273 gui=bold 
