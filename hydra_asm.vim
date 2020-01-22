" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

syn case ignore
syn match asmDirective		"\.[A-Za-z][0-9A-Za-z-_]*"
hi def link asmDirective	Statement

syn match decNumber		"#-\=0\+[1-7]\=[\t\n$,; ]"
syn match decNumber		"#-\=0\+[1-7]\=[\t\n$,; ]"
syn match decNumber		"#-\=[1-9]\d*"
syn match octNumber		"#0[0-7][0-7]\+"
syn match hexNumber		"#0[xX][0-9a-fA-F]\+"
syn match binNumber		"#0[bB][0-1]*"
hi def link hexNumber	Number
hi def link decNumber	Number
hi def link octNumber	Number
hi def link binNumber	Number

syn region asmComment		start="/\*" end="\*/" contains=asmTodo
syn region asmComment		start="//" end="$" keepend contains=asmTodo
hi def link asmComment	Comment

syn match asmMacro		"\.equ"
syn match asmMacro		"\.call"
syn match asmMacro		"\.macro"
syn match asmMacro		"\.endmacro"
hi def link asmMacro	Macro

syn match asmIdentifier		"^\s*[a-z_][a-z0-9_]*"
hi def link asmIdentifier	Identifier

let b:current_syntax = 'hydra_asm'

