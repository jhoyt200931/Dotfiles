highlight clear

if exists("syntax_on")
	syntax reset
endif

let s:style = get(g:, "debris_style", "default")
let g:colors_name = "debris"

let s:gui = {}
let s:cterm = {}

let s:gui.none       = { "default": "NONE" }
let s:gui.foreground = { "default": "#D4D4D4" }
let s:gui.background = { "default": "#12181D" }

let s:gui.cursorline = { "default": "#171D22" }
let s:gui.comment    = { "default": "#3E444A" }

let s:gui.black      = { "default": "#3E444A" }
let s:gui.red        = { "default": "#917070" }
let s:gui.green      = { "default": "#798183" }
let s:gui.yellow     = { "default": "#82817E" }
let s:gui.blue       = { "default": "#6D6E75" }
let s:gui.magenta    = { "default": "#96858D" }
let s:gui.cyan       = { "default": "#949AA9" }

function! s:hi(group, guifg, guibg, attr)
	if s:gui(a:guifg) != ""
		exec "hi " . a:group . " guifg=" . s:gui(a:guifg)
	endif
	if s:gui(a:guibg) != ""
		exec "hi " . a:group . " guibg=" . s:gui(a:guibg)
	endif
	if a:attr != ""
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
	endif
endfunction

function! s:gui(color)
	if exists("g:debris_style")
		return a:color[s:style]
	else
		return a:color["default"]
	endif
endfunction

" NEOVIM TERMINAL COLORS
if has("nvim")
	let g:terminal_color_0  = s:gui(s:gui.black)
	let g:terminal_color_1  = s:gui(s:gui.red)
	let g:terminal_color_2  = s:gui(s:gui.green)
	let g:terminal_color_3  = s:gui(s:gui.yellow)
	let g:terminal_color_4  = s:gui(s:gui.blue)
	let g:terminal_color_5  = s:gui(s:gui.magenta)
	let g:terminal_color_6  = s:gui(s:gui.cyan)
	let g:terminal_color_7  = s:gui(s:gui.foreground)
	let g:terminal_color_8  = s:gui(s:gui.black)
	let g:terminal_color_9  = s:gui(s:gui.red)
	let g:terminal_color_10 = s:gui(s:gui.green)
	let g:terminal_color_11 = s:gui(s:gui.yellow)
	let g:terminal_color_12 = s:gui(s:gui.blue)
	let g:terminal_color_13 = s:gui(s:gui.magenta)
	let g:terminal_color_14 = s:gui(s:gui.cyan)
	let g:terminal_color_15 = s:gui(s:gui.foreground)
endif

" EDITOR COLORS
call s:hi("User1",              s:gui.none,          s:gui.none,          "bold,italic")
call s:hi("User2",              s:gui.background,    s:gui.red,           "bold,italic")
call s:hi("User3",              s:gui.background,    s:gui.green,         "bold,italic")
call s:hi("User4",              s:gui.background,    s:gui.yellow,        "bold,italic")
call s:hi("User5",              s:gui.background,    s:gui.blue,          "bold,italic")
call s:hi("User6",              s:gui.background,    s:gui.magenta,       "bold,italic")
call s:hi("User7",              s:gui.background,    s:gui.cyan,          "bold,italic")
call s:hi("User8",              s:gui.background,    s:gui.comment,       "bold,italic")

" STATUSLINE COLORS (basic/fallback as we have a separate statusline in ./plugin)
call s:hi("StatusLine",         s:gui.background,    s:gui.none,    "none")
call s:hi("StatusLineNC",       s:gui.foreground,    s:gui.none,    "none")
call s:hi("StatusLineTerm",     s:gui.background,    s:gui.none,    "none")
call s:hi("StatusLineTemrNC",   s:gui.foreground,    s:gui.none,    "none")

"call"
" NERDTREE COLORS
call s:hi("NERDTreeOpenable",   s:gui.comment,       s:gui.none,          "")
call s:hi("NERDTreeClosable",   s:gui.comment,       s:gui.none,          "")
call s:hi("NERDTreeCWD",        s:gui.magenta,       s:gui.none,          "italic")
call s:hi("NERDTreeDir",        s:gui.comment,       s:gui.none,          "bold")
call s:hi("NERDTreeDirSlash",   s:gui.background,    s:gui.none,          "")
call s:hi("NERDTreeExecFile",   s:gui.blue,          s:gui.none,          "")

" ALE COLORS
call s:hi("ALEInfoSign",         s:gui.yellow,    s:gui.cursorline, "")
call s:hi("ALEErrorSign",        s:gui.red,       s:gui.cursorline, "")
call s:hi("ALEWarningSign",      s:gui.yellow,    s:gui.cursorline, "")
call s:hi("ALEStyleErrorSign",   s:gui.red,       s:gui.cursorline, "")
call s:hi("ALEStyleWarningSign", s:gui.yellow,    s:gui.cursorline, "")
call s:hi("ALEInfoLine",         s:gui.comment,   s:gui.none,       "bold")
call s:hi("ALEErrorLine",        s:gui.red,       s:gui.none,       "bold")
call s:hi("ALEWarningLine",      s:gui.yellow,    s:gui.none,       "bold")

call s:hi("EndOfBuffer",  s:gui.background, "",               "")
call s:hi("ColorColumn",  s:gui.none,       s:gui.black,      "")
call s:hi("Cursor",       s:gui.foreground, "",               "")
call s:hi("CursorColumn", s:gui.none,       s:gui.none,       "")
call s:hi("SignColumn",   s:gui.red,        s:gui.none,       "")
call s:hi("LineNr",       s:gui.black,      "",               "")
call s:hi("CursorLine",   s:gui.none,       s:gui.none, "")
call s:hi("CursorLineNr", s:gui.foreground, s:gui.cursorline, "")
call s:hi("Directory",    s:gui.blue,       "",               "")
call s:hi("FoldColumn",   "",               s:gui.none,       "")
call s:hi("Folded",       s:gui.background, s:gui.black,      "")
call s:hi("PMenu",        s:gui.blue,       s:gui.cursorline, "")
call s:hi("PMenuSel",     s:gui.cursorline, s:gui.blue,       "")
call s:hi("ErrorMsg",     s:gui.red,        s:gui.none,       "")
call s:hi("Error",        s:gui.red,        s:gui.none,       "")
call s:hi("WarningMsg",   s:gui.yellow,     "",               "")
call s:hi("SpellBad",     s:gui.red,        s:gui.none,       "none")
call s:hi("VertSplit",    s:gui.black,      s:gui.none,       "none")
call s:hi("Conceal",      s:gui.comment,    s:gui.none,       "")

call s:hi("DiffAdded",    s:gui.green,      "", "")
call s:hi("DiffRemoved",  s:gui.red,        "", "")

call s:hi("DiffAdd",      "",               s:gui.cyan,       "")
call s:hi("DiffChange",   "",               s:gui.cyan,       "")
call s:hi("DiffDelete",   s:gui.red,        s:gui.black,      "")
call s:hi("DiffText",     s:gui.background, s:gui.black,      "")

call s:hi("NonText",      s:gui.black,      "",               "none")
call s:hi("helpExample",  s:gui.blue,       "",               "")
" call s:hi("MatchParen",   s:gui.background, s:gui.black,    "")
call s:hi("Title",        s:gui.cyan,       "",               "")
call s:hi("Comment",      s:gui.comment,    "",               "italic")
call s:hi("String",       s:gui.green,      "",               "")
call s:hi("Normal",       s:gui.foreground, s:gui.none,       "")
call s:hi("Visual",       s:gui.background, s:gui.blue,       "")
call s:hi("Constant",     s:gui.blue,       "",               "")
call s:hi("Type",         s:gui.blue,       "",               "")
call s:hi("Define",       s:gui.cyan,       "",               "")
call s:hi("Statement",    s:gui.blue,       "",               "")
call s:hi("Function",     s:gui.magenta,    "",               "")
call s:hi("Conditional",  s:gui.cyan,       "",               "")
call s:hi("Float",        s:gui.green,      "",               "")
call s:hi("Noise",        s:gui.cyan,       "",               "")
call s:hi("Number",       s:gui.yellow,     "",               "")
call s:hi("Identifier",   s:gui.blue,       "",               "")
call s:hi("Operator",     s:gui.cyan,       "",               "")
call s:hi("PreProc",      s:gui.blue,       "",               "")
call s:hi("Search",       s:gui.background, s:gui.yellow,     "")
call s:hi("InSearch",     s:gui.background, s:gui.yellow,     "")
call s:hi("Todo",         s:gui.comment,    "",               "")
call s:hi("Special",      s:gui.magenta,    "",               "") " @decorators my dude

" TYPESCRIPT COLORS
call s:hi("typescriptComment",                   s:gui.comment,      "", "italic")
call s:hi("typescriptCommentSkip",               s:gui.comment,      "", "italic")
call s:hi("typescriptCommentTodo",               s:gui.comment,      "", "italic")
call s:hi("typescriptLineComment",               s:gui.comment,      "", "italic")
call s:hi("typescriptRefComment",                s:gui.comment,      "", "italic")
call s:hi("typescriptRefD",                      s:gui.comment,      "", "")
call s:hi("typescriptRefS",                      s:gui.comment,      "", "")

call s:hi("typescriptDocComment",                s:gui.comment,      "", "italic")
call s:hi("typescriptDocTags",                   s:gui.comment,      "", "")
call s:hi("typescriptDocParam",                  s:gui.comment,      "", "")
call s:hi("typescriptDocSeeTag",                 s:gui.comment,      "", "")

call s:hi("typescriptSpecial",                   s:gui.cyan,         "", "")
call s:hi("typescriptStringD",                   s:gui.green,        "", "")
call s:hi("typescriptStringS",                   s:gui.green,        "", "")
call s:hi("typescriptStringB",                   s:gui.green,        "", "")
call s:hi("typescriptInterpolation",             s:gui.green,        "", "")
call s:hi("typescriptNumber",                    s:gui.yellow,       "", "")
call s:hi("typescriptRegexpString",              s:gui.cyan,         "", "")
call s:hi("typescriptPrototype",                 s:gui.magenta,      "", "")
call s:hi("typescriptBrowserObjects",            s:gui.magenta,      "", "")
call s:hi("typescriptDOMObjects",                s:gui.blue,         "", "")
call s:hi("typescriptDOMMethods",                s:gui.yellow,       "", "")
call s:hi("typescriptDOMProperties",             s:gui.yellow,       "", "")
call s:hi("typescriptHtmlElemProperties",        s:gui.cyan,         "", "")
call s:hi("typescriptEventListenerKeywords",     s:gui.cyan,         "", "")
call s:hi("typescriptEventListenerMethods",      s:gui.cyan,         "", "")

call s:hi("typescriptSource",                    s:gui.blue,         "", "") " import export from as
call s:hi("typescriptIdentifier",                s:gui.green,        "", "bold") " arguments this void
call s:hi("typescriptStorageClass",              s:gui.magenta,      "", "bold,italic") " let var const
call s:hi("typescriptOperator",                  s:gui.yellow,       "", "bold") " delete new instanceof typeof
call s:hi("typescriptBoolean",                   s:gui.yellow,       "", "bold") " true false
call s:hi("typescriptNull",                      s:gui.yellow,       "", "bold") " null undefined
call s:hi("typescriptMessage",                   s:gui.green,        "", "") " alert confirm prompt status

call s:hi("typescriptConditional",               s:gui.cyan,         "", "bold") " if else switch
call s:hi("typescriptRepeat",                    s:gui.cyan,         "", "") " do while for in of
call s:hi("typescriptBranch",                    s:gui.cyan,         "", "bold") " break continue yield await
call s:hi("typescriptLabel",                     s:gui.cyan,         "", "") " case default async readonly
call s:hi("typescriptDecorators",                s:gui.magenta,      "", "italic") " @action @computed, etc
call s:hi("typescriptStatement",                 s:gui.cyan,         "", "bold") " return with

call s:hi("typescriptGlobalObjects",             s:gui.blue,         "", "bold") " Array Boolean Date Function Infinity Math Number NaN Object Packages RegExp String Symbol
call s:hi("typescriptExceptions   ",             s:gui.green,        "", "") " try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
call s:hi("typescriptReserved",                  s:gui.blue,         "", "bold") " constructor as interface module enum int export interface static extends super class private implements import public type from get set keyof...
call s:hi("typescriptVars",                      s:gui.green,        "", "")
call s:hi("typescriptParameters",                s:gui.green,        "", "")
call s:hi("typescriptType",                      s:gui.yellow,       "", "bold") " void any string boolean number symbol never object

call s:hi("typescriptDomErrNo",                  s:gui.magenta,      "", "")
call s:hi("typescriptDomNodeConsts",             s:gui.magenta,      "", "")

call s:hi("typescriptHtmlEvents",                s:gui.foreground,   "", "") " onblur onclick onfocus onkeydown onkeypress onkeyup ...

call s:hi("typescriptCssStyles",                 s:gui.yellow,       "", "") " not sure where these ever occur... ?

call s:hi("typescriptFuncKeyword",               s:gui.blue,         "", "")
call s:hi("typescriptFunction",                  s:gui.magenta,      "", "")

call s:hi("typescriptBraces",                    s:gui.blue,         "", "")
call s:hi("typescriptParens",                    s:gui.blue,         "", "")
call s:hi("typescriptOpSymbols",                 s:gui.yellow,       "", "")
call s:hi("typescriptEndColons",                 s:gui.cyan,         "", "")
call s:hi("typescriptLogicSymbols",              s:gui.magenta,      "", "")
call s:hi("typescriptDotNotation",               s:gui.magenta,      "", "")

" Javascript colors
" yajs
" call s:hi("javascriptArrayMethod",      s:gui.blue,       "", "")
" call s:hi("javascriptBlock",            s:gui.cyan,       "", "")
" call s:hi("javascriptBraces",           s:gui.cyan,       "", "")
" call s:hi("javascriptBrackets",         s:gui.cyan,       "", "")
" call s:hi("javascriptClassName",        s:gui.magenta,    "", "")
" call s:hi("javascriptClassSuperName",   s:gui.yellow,     "", "")
" call s:hi("javascriptExport",           s:gui.red,        "", "")
" call s:hi("javascriptFuncKeyword",      s:gui.magenta,    "", "")
" call s:hi("javascriptIdentifierName",   s:gui.foreground, "", "")
" call s:hi("javascriptLabel",            s:gui.foreground, "", "")
" call s:hi("javascriptMethod",           s:gui.blue,       "", "")
" call s:hi("javascriptObjectLabel",      s:gui.foreground, "", "")
" call s:hi("javascriptObjectLabelColon", s:gui.cyan,       "", "")
" call s:hi("javascriptObjectMethodName", s:gui.blue,       "", "")
" call s:hi("javascriptOperator",         s:gui.magenta,    "", "")
" call s:hi("javascriptProperty",         s:gui.cyan,       "", "")
" call s:hi("javascriptStringMethod",     s:gui.blue,       "", "")
" call s:hi("javascriptVariable",         s:gui.magenta,    "", "")

" vim-javascript
call s:hi("jsArrowFuncArgs",   s:gui.green,       "", "")
call s:hi("jsArrowFunction",   s:gui.magenta,     "", "")
call s:hi("jsBooleanFalse",    s:gui.yellow,      "", "")
call s:hi("jsBooleanTrue",     s:gui.yellow,      "", "")
call s:hi("jsClassBraces",     s:gui.cyan,        "", "")
call s:hi("jsClassDefinition", s:gui.yellow,      "", "")
call s:hi("jsClassKeyword",    s:gui.cyan,        "", "")
call s:hi("jsCommentTodo",     s:gui.comment,     "", "")
call s:hi("jsConditional",     s:gui.cyan,        "", "")
call s:hi("jsFuncArgs",        s:gui.green,       "", "")
call s:hi("jsFuncBraces",      s:gui.magenta,     "", "")
call s:hi("jsFuncCall",        s:gui.cyan,        "", "")
call s:hi("jsFuncParens",      s:gui.cyan,        "", "")
call s:hi("jsFunction",        s:gui.blue,        "", "")
call s:hi("jsFunctionKey",     s:gui.magenta,     "", "")
call s:hi("jsGlobalObjects",   s:gui.yellow,      "", "")
call s:hi("jsNoise",           s:gui.magenta,     "", "")
call s:hi("jsObjectKey",       s:gui.foreground,  "", "")
call s:hi("jsOperator",        s:gui.magenta,     "", "")
call s:hi("jsNumber",          s:gui.yellow,      "", "")
call s:hi("jsParens",          s:gui.cyan,        "", "")
call s:hi("jsReturn",          s:gui.green,       "", "")
call s:hi("jsStorageClass",    s:gui.magenta,     "", "")
call s:hi("jsThis",            s:gui.blue,        "", "")

" yats
" call s:hi("typescriptAccessibilityModifier", s:gui.magenta,  "", "")
" call s:hi("typescriptCall",                  s:gui.magenta,  "", "")
" call s:hi("typescriptClassName",             s:gui.yellow,  "", "")
" call s:hi("typescriptExport",                s:gui.red,     "", "")
" call s:hi("typescriptImport",                s:gui.blue,    "", "")
" call s:hi("typescriptInterfaceName",         s:gui.yellow,  "", "")
" call s:hi("typescriptPredefinedType",        s:gui.cyan,    "", "")
" call s:hi("typescriptVariable",              s:gui.magenta,  "", "")
" call s:hi("typescriptOperator",              s:gui.magenta,  "", "")

" HTML colors
call s:hi("htmlTag",            s:gui.cyan,    "", "")
call s:hi("htmlEndTag",         s:gui.cyan,    "", "")
call s:hi("htmlTagName",        s:gui.magenta, "", "")
call s:hi("htmlSpecialTagName", s:gui.green,   "", "")
call s:hi("htmlArg",            s:gui.yellow,  "", "")

" JSX
call s:hi("tsxTag",             s:gui.green,     "", "")
call s:hi("tsxTagName",         s:gui.yellow,    "", "bold")
call s:hi("tsxCloseString",     s:gui.yellow,    "", "bold")
call s:hi("tsxString",          s:gui.cyan,      "", "")
call s:hi("tsxCloseTag",        s:gui.green,     "", "")
call s:hi("tsxAttrib",          s:gui.blue,      "", "")
call s:hi("tsxEqual",           s:gui.magenta,   "", "")
call s:hi("tsxIfOperator",      s:gui.magenta,   "", "")
call s:hi("tsxAttributeBraces", s:gui.magenta,   "", "")
call s:hi("tsxElseOperator",    s:gui.magenta,   "", "")

" XML
call s:hi("xmlTag",     s:gui.cyan,    "", "")
call s:hi("xmlEndTag",  s:gui.cyan,    "", "")
call s:hi("xmlTagName", s:gui.magenta, "", "")
call s:hi("xmlAttrib",  s:gui.yellow,  "", "")

" VIM
call s:hi("VimVar",     s:gui.yellow,  "", "")
call s:hi("VimString",  s:gui.blue,    "", "")
call s:hi("VimFuncVar", s:gui.green,   "", "")
call s:hi("VimNumber",  s:gui.cyan,    "", "")

" Shell
call s:hi("shSetList",     s:gui.green,      "", "")
call s:hi("shTestOpr",     s:gui.blue,       "", "")
call s:hi("shNumber",      s:gui.yellow,     "", "")
call s:hi("shConditional", s:gui.cyan,       "", "")
