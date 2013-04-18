let &efm = ''
let &efm .= '\ %#[mxmlc]\ %f(%l):\ col:\ %c\ Error:\ %m' . ','
let &efm .= '%-G%.%#'

let &makeprg = 'ant'
