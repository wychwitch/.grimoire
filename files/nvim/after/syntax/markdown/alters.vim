"Magician
syntax region magician start="^m: " end="$" containedin=mkdNonListItemBlock contained 
highlight magician guifg=#5459b6
highlight link mkdNonListItemBlock magician
highlight mkdNonListItemBlock guifg=#FFFFFF

" magicon
syntax match magIcon '^m:' conceal cchar=理 containedin=magician contained 
highlight! default link Conceal magIcon
hi magIcon guifg=NONE

"Witch
syntax region witch start="^w: " end="$" containedin=mkdNonListItemBlock contained 
highlight witch guifg=#D1A0EA
highlight link mkdNonListItemBlock witch 
highlight mkdNonListItemBlock guifg=#FFFFFF

" witchIcon
syntax match witchIcon '^w:' conceal cchar=術 containedin=witch contained 
highlight! witchIcon guifg=#FFFFFF

"Celeste
syntax region celeste start="^c: " end="$" containedin=mkdNonListItemBlock contained 
syntax match celesIcon '^c:' conceal cchar=󱄿 containedin=celeste contained 
highlight link mkdNonListItemBlock celeste 
highlight link Conceal celesIcon
highlight celeste guifg=#ec51cd
highlight celesIcon guifg=#ec51cd gui=bold 
highlight mkdNonListItemBlock guifg=#ffffff


" Gidgit
syntax region gidget start="^g: " end="$" containedin=mkdNonListItemBlock contained 
syntax match gidIcon '^g:' conceal cchar=󰠠 containedin=gidget contained 
highlight link mkdNonListItemBlock gidget
highlight link Conceal gidIcon
highlight gidget guifg=#76e37a
highlight gidIcon guifg=#76e37a gui=bold 
highlight mkdNonListItemBlock guifg=#ffffff


" Nyx
syntax region nyx start="^n: " end="$" containedin=mkdNonListItemBlock contained 
syntax match nyxIcon '^n:' conceal cchar= containedin=nyx contained 
highlight link mkdNonListItemBlock nyx
highlight link Conceal nyxIcon
highlight nyx guifg=#6a6273
highlight nyxIcon guifg=#6a6273 gui=bold 
highlight mkdNonListItemBlock guifg=#ffffff
