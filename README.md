# transpose.vim
transpose text in vim
## depend
- `+python3` ,plugin write with python
- `"`, this plugin will change the `"` register
- only work in `visual block mode`

## usage
- First,in Visual block mode ,chooseing some text ,and press `x` to cut the text ,and it will push in `"` resegter
- Second, `call Transpose('&')` ,this `&` is a seperator, you can change it

## suggest map

``` vim
vnoremap tt7 x:call Transpose("&")<cr>
vnoremap tt, x:call Transpose(",")<cr>
vnoremap ttb x:call Transpose(" ")<cr>
vnoremap ttn  x:call Transpose("")<cr>
vnoremap tt;  x:call Transpose(";")<cr>
```


