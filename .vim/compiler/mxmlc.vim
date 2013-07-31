let &efm = ''
let &efm .= '%E%f:%l\ Error:\ %m,'
let &efm .= '%W%f:%l\ Warning:\ %m,'
let &efm .= '%-G%.%#'

" Filtring ^M at the end of lines + merge error/warning lines.
let &makeprg = 'make 2>&1 \| sed s///ge \| sed "/:[0-9]\+$/{N;s/\n/ /;}"'



