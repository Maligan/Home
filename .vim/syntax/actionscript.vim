" Vim syntax file
" Language:	actionscript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/actionscript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2010 Mar 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet actionSctipt_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'actionscript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("actionSctipt_fold")
  unlet actionSctipt_fold
endif


syn keyword actionScriptCommentTodo      TODO FIXME XXX TBD contained
syn match   actionScriptLineComment      "\/\/.*" contains=@Spell,actionScriptCommentTodo
syn match   actionScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  actionScriptComment	       start="/\*"  end="\*/" contains=@Spell,actionScriptCommentTodo
syn match   actionScriptSpecial	       "\\\d\d\d\|\\."
syn region  actionScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=actionScriptSpecial,@htmlPreproc
syn region  actionScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=actionScriptSpecial,@htmlPreproc

syn match   actionScriptSpecialCharacter "'\\.'"
syn match   actionScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  actionScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword actionScriptConditional	if else switch
syn keyword actionScriptRepeat		while for do in
syn keyword actionScriptBranch		break continue
syn keyword actionScriptOperator	new delete instanceof typeof
syn keyword actionScriptType		Array Boolean Date Function Number Object String RegExp int void 
syn keyword actionScriptStatement	return with
syn keyword actionScriptBoolean		true false
syn keyword actionScriptNull		null undefined
syn keyword actionScriptIdentifier	arguments this
syn keyword actionScriptLabel		case default
syn keyword actionScriptException	try catch finally throw
syn keyword actionScriptReserved	abstract var boolean byte char class const debugger double enum export extends override final float goto implements import interface long native package private protected public short static super synchronized throws transient volatile 


if exists("actionSctipt_fold")
    syn match	actionScriptFunction	"\<function\>"
    syn region	actionScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match actionScriptSync	grouphere actionScriptFunctionFold "\<function\>"
    syn sync match actionScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword actionScriptFunction	function
    syn match	actionScriptBraces	"[{}\[\]]"
    syn match	actionScriptParens	"[()]"
    syn match	actionScriptCustomType	"\<[A-Z]\(\a\|0-9\)*[a-z]\(\a|\0-9\)*\>"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "actionscript"
  syn sync ccomment actionScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink actionScriptComment		Comment
  HiLink actionScriptLineComment	Comment
  HiLink actionScriptCommentTodo	Todo
  HiLink actionScriptSpecial		Special
  HiLink actionScriptStringS		String
  HiLink actionScriptStringD		String
  HiLink actionScriptCharacter		Character
  HiLink actionScriptSpecialCharacter	actionScriptSpecial
  HiLink actionScriptNumber		String
  HiLink actionScriptConditional	Conditional
  HiLink actionScriptRepeat		Repeat
  HiLink actionScriptBranch		Conditional
  HiLink actionScriptOperator		Operator
  HiLink actionScriptType		Type
  HiLink actionScriptCustomType		Type
  HiLink actionScriptStatement		Statement
  HiLink actionScriptFunction		actionScriptReserved
  HiLink actionScriptBraces		Function
  HiLink actionScriptError		Error
  HiLink javaScrParenError		actionScriptError
  HiLink actionScriptNull		Keyword
  HiLink actionScriptBoolean		Boolean
  HiLink actionScriptRegexpString	String

  HiLink actionScriptIdentifier		Identifier
  HiLink actionScriptLabel		Label
  HiLink actionScriptException		Exception
  HiLink actionScriptReserved		Keyword
  HiLink actionScriptDebug		Debug
  HiLink actionScriptConstant		Label

  delcommand HiLink
endif

let b:current_syntax = "actionscript"
if main_syntax == 'actionscript'
  unlet main_syntax
endif

" vim: ts=8
