highlight clear

if exists("syntax_on")
	syntax reset
endif

let s:style = get(g:, "theme_style", "default")
let g:colors_name = "base"

let s:gui = {}
let s:cterm = {}

let s:gui.none       = { "default": "NONE" }
let s:gui.foreground = { "default": "#FCFCFC" }
let s:gui.background = { "default": "#232323" }

let s:gui.listchars  = { "default": "#404040" }
let s:gui.comment    = { "default": "#808080" }

let s:gui.black      = { "default": "#808080" }
let s:gui.red        = { "default": "#C7AA9C" }
let s:gui.green      = { "default": "#C7B9AC" }
let s:gui.yellow     = { "default": "#D4BAAD" }
let s:gui.blue       = { "default": "#C6BABA" }
let s:gui.magenta    = { "default": "#D4BCBC" }
let s:gui.cyan       = { "default": "#B9B9B9" }

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
	if exists("g:theme_style")
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
call s:hi("User1",              s:gui.background,    s:gui.background,    "")
call s:hi("User2",              s:gui.red,           s:gui.background,    "bold")
call s:hi("User3",              s:gui.green,         s:gui.background,    "bold")
call s:hi("User4",              s:gui.yellow,        s:gui.background,    "bold")
call s:hi("User5",              s:gui.blue,          s:gui.background,    "bold")
call s:hi("User6",              s:gui.magenta,       s:gui.background,    "bold")
call s:hi("User7",              s:gui.cyan,          s:gui.background,    "bold")
call s:hi("User8",              s:gui.comment,       s:gui.background,    "bold")

" STATUSLINE COLORS (basic/fallback as we have a separate statusline in ./plugin)
call s:hi("StatusLine",         s:gui.background,    s:gui.background,    "none")
call s:hi("StatusLineNC",       s:gui.black,         s:gui.background,    "none")
call s:hi("StatusLineTerm",     s:gui.background,    s:gui.background,    "none")
call s:hi("StatusLineTemrNC",   s:gui.black,         s:gui.background,    "none")

" ALE COLORS
call s:hi("ALEInfoSign",         s:gui.yellow,       s:gui.none,          "italic")
call s:hi("ALEErrorSign",        s:gui.red,          s:gui.none,          "italic")
call s:hi("ALEWarningSign",      s:gui.yellow,       s:gui.none,          "italic")
call s:hi("ALEStyleErrorSign",   s:gui.red,          s:gui.none,          "italic")
call s:hi("ALEStyleWarningSign", s:gui.yellow,       s:gui.none,          "italic")
call s:hi("ALEInfoLine",         s:gui.yellow,       s:gui.none,          "italic")
call s:hi("ALEErrorLine",        s:gui.red,          s:gui.none,          "italic")
call s:hi("ALEWarningLine",      s:gui.yellow,       s:gui.none,          "italic")

call s:hi("EndOfBuffer",  s:gui.background, "",               "")
call s:hi("ColorColumn",  s:gui.none,       s:gui.black,      "")
call s:hi("Cursor",       s:gui.foreground, "",               "")
call s:hi("CursorColumn", s:gui.none,       s:gui.none,       "")
call s:hi("SignColumn",   s:gui.red,        s:gui.none,       "")
call s:hi("LineNr",       s:gui.black,      s:gui.background, "")
call s:hi("CursorLine",   s:gui.none,       s:gui.none,       "")
call s:hi("CursorLineNr", s:gui.black,      s:gui.background, "bold")
call s:hi("Directory",    s:gui.blue,       "",               "")
call s:hi("FoldColumn",   "",               s:gui.none,       "")
call s:hi("Folded",       s:gui.background, s:gui.black,      "")
call s:hi("PMenu",        s:gui.black,      s:gui.foreground, "")
call s:hi("PMenuSel",     s:gui.background, s:gui.foreground, "")
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

call s:hi("NonText",      s:gui.listchars,  "",               "none")
call s:hi("helpExample",  s:gui.blue,       "",               "")
call s:hi("MatchParen",   s:gui.background, s:gui.black,      "")
call s:hi("Title",        s:gui.cyan,       "",               "")
call s:hi("Comment",      s:gui.comment,    "",               "bold")
call s:hi("String",       s:gui.green,      "",               "")
call s:hi("Normal",       s:gui.foreground, s:gui.none,       "")
call s:hi("Visual",       s:gui.background, s:gui.foreground, "")
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
call s:hi("Todo",         s:gui.background, "",               "")
call s:hi("Special",      s:gui.magenta,    "",               "")

" TYPESCRIPT
call s:hi("typescriptImport",               s:gui.blue,        "", "bold")
call s:hi("typescriptExport",               s:gui.blue,        "", "bold")
call s:hi("typescriptAssign",               s:gui.cyan,        "", "")
call s:hi("typescriptVariable",             s:gui.magenta,     "", "bold")
call s:hi("typescriptBOM",                  s:gui.foreground,  "", "bold")
call s:hi("typescriptVariableDeclaration",  s:gui.red,         "", "")
call s:hi("typescriptCastKeyword",          s:gui.cyan,        "", "")
call s:hi("typescriptTypeBracket",          s:gui.cyan,        "", "bold")
call s:hi("typescriptTypeReference",        s:gui.yellow,      "", "bold")
call s:hi("typescriptTypeAnnotation",       s:gui.cyan,        "", "")
call s:hi("typescriptTypeArguments",        s:gui.foreground,  "", "")
call s:hi("typescriptTypeQuery",            s:gui.magenta,     "", "")
call s:hi("typescriptBraces",               s:gui.cyan,        "", "")
call s:hi("typescriptParens",               s:gui.cyan,        "", "")
call s:hi("typescriptCall",                 s:gui.foreground,  "", "")
call s:hi("typescriptDotAnnotation",        s:gui.cyan,        "", "")
call s:hi("typescriptDotNotation",          s:gui.cyan,        "", "")
call s:hi("typescriptArrowFunc",            s:gui.magenta,     "", "")
call s:hi("typescriptFuncType",             s:gui.red,         "", "")
call s:hi("typescriptFuncCallArg",          s:gui.foreground,  "", "")
call s:hi("typescriptParenExp",             s:gui.foreground,  "", "")
call s:hi("typescriptEndColons",            s:gui.cyan,        "", "")
call s:hi("typescriptMember",               s:gui.foreground,  "", "")
call s:hi("typescriptMemberOptionality",    s:gui.magenta,     "", "")
call s:hi("typescriptPredefinedType",       s:gui.yellow,      "", "")
call s:hi("typescriptArrayMethod",          s:gui.blue,        "", "")
call s:hi("typescriptNumber",               s:gui.yellow,      "", "")
call s:hi("typescriptBoolean",              s:gui.yellow,      "", "")
call s:hi("typescriptNull",                 s:gui.yellow,      "", "")
call s:hi("typescriptObjectLabel",          s:gui.foreground,  "", "")
call s:hi("typescriptObjectLiteral",        s:gui.cyan,        "", "")
call s:hi("typescriptObjectSpread",         s:gui.magenta,     "", "")
call s:hi("typescriptObjectColon",          s:gui.magenta,     "", "")
call s:hi("typescriptInterfaceKeyword",     s:gui.magenta,     "", "")
call s:hi("typescriptAliasKeyword",         s:gui.blue,        "", "bold")
call s:hi("typescriptInterfaceName",        s:gui.yellow,      "", "bold")
call s:hi("typescriptAliasDeclaration",     s:gui.yellow,      "", "bold")
call s:hi("typescriptInterfaceHeritage",    s:gui.green,       "", "")
call s:hi("typescriptInterfaceExtends",     s:gui.magenta,     "", "")
call s:hi("typescriptUnion",                s:gui.cyan,        "", "")
call s:hi("typescriptParamImpl",            s:gui.cyan,        "", "")
call s:hi("typescriptTemplate",             s:gui.green,       "", "")
call s:hi("typescriptTemplateSB",           s:gui.cyan,        "", "")
call s:hi("typescriptTemplateSubstitution", s:gui.foreground,  "", "")
call s:hi("typescriptTernaryOp",            s:gui.cyan,        "", "")
call s:hi("typescriptBinaryOp",             s:gui.cyan,        "", "")
call s:hi("typescriptLineComment",          s:gui.comment,     "", "bold")
call s:hi("typescriptComment",              s:gui.comment,     "", "bold")
call s:hi("typescriptDotComment",           s:gui.comment,     "", "bold")
call s:hi("typescriptCommentTodo",          s:gui.comment,     "", "bold")
call s:hi("typescriptGlobal",               s:gui.blue,        "", "bold")
call s:hi("typescriptStatementKeyword",     s:gui.cyan,        "", "bold")

" TSX / JSX
call s:hi("jsxOpenPunct",                   s:gui.cyan,        "", "")
call s:hi("jsxClosePunct",                  s:gui.cyan,        "", "")
call s:hi("jsxCloseString",                 s:gui.cyan,        "", "")
call s:hi("jsxTagName",                     s:gui.red,         "", "")
call s:hi("jsxComponentName",               s:gui.yellow,      "", "bold")
call s:hi("jsxAttrib",                      s:gui.magenta,     "", "")
call s:hi("jsxElement",                     s:gui.magenta,     "", "")
call s:hi("jsxString",                      s:gui.green,       "", "")
call s:hi("jsxBraces",                      s:gui.cyan,        "", "")


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
call s:hi("jsCommentTodo",     s:gui.comment,     "", "bold")
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

" HTML colors
call s:hi("htmlTag",            s:gui.cyan,    "", "")
call s:hi("htmlEndTag",         s:gui.cyan,    "", "")
call s:hi("htmlTagName",        s:gui.magenta, "", "")
call s:hi("htmlSpecialTagName", s:gui.green,   "", "")
call s:hi("htmlArg",            s:gui.yellow,  "", "")

" XML
call s:hi("xmlTag",     s:gui.cyan,    "", "")
call s:hi("xmlEndTag",  s:gui.cyan,    "", "")
call s:hi("xmlTagName", s:gui.magenta, "", "")
call s:hi("xmlAttrib",  s:gui.yellow,  "", "")

" VIM
call s:hi("VimVar",     s:gui.yellow,  "", "")
call s:hi("VimString",  s:gui.blue,    "", "")
call s:hi("VimFuncVar", s:gui.green,   "", "")
call s:hi("VimNumber",  s:gui.yellow,  "", "")

" Shell
call s:hi("shSetList",     s:gui.green,      "", "")
call s:hi("shTestOpr",     s:gui.blue,       "", "")
call s:hi("shNumber",      s:gui.yellow,     "", "")
call s:hi("shConditional", s:gui.cyan,       "", "")

" NERDTree
call s:hi("NERDTreeOpenable",   s:gui.black,         s:gui.none,          "")
call s:hi("NERDTreeClosable",   s:gui.black,         s:gui.none,          "")
call s:hi("NERDTreeCWD",        s:gui.blue,          s:gui.none,          "")
call s:hi("NERDTreeDir",        s:gui.black,         s:gui.none,          "bold")
call s:hi("NERDTreeDirSlash",   s:gui.background,    s:gui.none,          "")
call s:hi("NERDTreeExecFile",   s:gui.blue,          s:gui.none,          "")

function! NERDTreeHighlightFile(extension, guifg, guibg)
	exec "autocmd filetype nerdtree syn match " . a:extension . ' #^\s\+.*' . a:extension . "$#"
	exec "autocmd filetype nerdtree highlight " . a:extension . " guibg=" . s:gui(a:guibg) . " guifg=" . s:gui(a:guifg)
endfunction

call NERDTreeHighlightFile("ts",               s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("tsx",              s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("conf",             s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("config",           s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("yml",              s:gui.cyan,        s:gui.none)

call NERDTreeHighlightFile("js",               s:gui.yellow,      s:gui.none)
call NERDTreeHighlightFile("jsx",              s:gui.yellow,      s:gui.none)
call NERDTreeHighlightFile("json",             s:gui.yellow,      s:gui.none)

call NERDTreeHighlightFile("css",              s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("scss",             s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("less",             s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("html",             s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("xml",              s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("md",               s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("vim",              s:gui.green,       s:gui.none)


call NERDTreeHighlightFile("dockerignore",     s:gui.black,       s:gui.none)
call NERDTreeHighlightFile("gitignore",        s:gui.black,       s:gui.none)
call NERDTreeHighlightFile("eslint",           s:gui.black,       s:gui.none)
call NERDTreeHighlightFile("babelrc",          s:gui.black,       s:gui.none)

call NERDTreeHighlightFile("sh",               s:gui.blue,        s:gui.none)
call NERDTreeHighlightFile("lua",              s:gui.blue,        s:gui.none)
call NERDTreeHighlightFile("php",              s:gui.blue,        s:gui.none)

call NERDTreeHighlightFile("jpg",              s:gui.foreground,  s:gui.none)
call NERDTreeHighlightFile("png",              s:gui.foreground,  s:gui.none)
call NERDTreeHighlightFile("svg",              s:gui.foreground,  s:gui.none)
