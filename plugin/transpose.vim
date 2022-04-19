" Transpose.vim
" Author:      Euler-37
" Version:      0.0.1
if exists("g:loaded_transpose") || &cp || v:version < 700
  finish
endif
let g:loaded_transpose = 1
function! Transpose(Separator)
py3 << EOF
import vim
import re
separator=vim.eval('a:Separator')
vstring= vim.eval("getreg('\"')")
rows=vstring.split('\n')
flag=separator==""
cols=[]
for s in rows:
    if flag:
        cols.append(list(s))
    else:
        if separator==" ":
            cols.append(s.split())
        else:
            cols.append(s.split(separator))
trans = list(map(list, zip(*cols)))
res=[]
for l in trans:
        res.append(separator.join(l)+'\n')
res="".join(res)
res=res[:-1]
run="".join(["call setreg('\"',\"",res,"\",\"b\")"])
vim.command(run)
EOF
if col('.')==1
    exec "normal P"
else
    exec "normal p"
endif
endfunction
" vim:set ft=vim sw=4 sts=4 et:
