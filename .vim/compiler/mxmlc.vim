let &efm = ''
let &efm .= '\ %#[mxmlc]\ %f(%l):\ Столбец:\ %c\ Ошибка:\ %m' . ','
let &efm .= '%-G%.%#'

let &makeprg = 'ant'
