let &makeprg = 'mxmlc'

" Clean up
let &efm = ''

" /path/to/file:10
" Error: Error Message
"	int i = 0; 
"			^
let &efm .= '%A%f:%l,'
let &efm .= '%C%t%*[^:]: %m,'
let &efm .= '%Z%p^,'

" Ignore other
let &efm .= '%-G%.%#'
