command! AlignCommand :normal gg=G

" 関数を呼び出すコマンド定義
function! SimpleFunction()
   echo "SimpleFunction() is called."
endfunction

command! SimpleCommand :call SimpleFunction()

" パラメータ数チェック付きのコマンドを定義する
function! SimpleFunction2()
   echo "SimpleFunction2() is called."
endfunction
command! -nargs=0 SimpleCommand2 :call SimpleFunction2()

" パラメータお必要なファンクションを呼び出すコマンドを定義する
function! SimpleFunction3(var1, var2)
   echo "SimpleFunction3() is called."
   " argsのaっぽい
   echo "parameter1:".a:var1
   echo "parameter2:".a:var2
   sleep 2
endfunction
command! -nargs=+ SimpleCommand3 :call SimpleFunction3(<f-args>)

function! MArgsFunction(...)
   echo "MArgsFunction() is called."
   echo "parameter1:".a:1
   echo "parameter2:".a:2
   echo "parameter3:".a:3
   echo "parameter4:".a:4
   echo "parameter count: ".len(a:000)
   sleep 2
endfunction
command! -nargs=+ SimpleCommand4 :call MArgsFunction(<f-args>)

" コマンドパラメータの補完の種類を指定する
function! CompleteFuntion(args)
   echo args
endfunction
command! -complete=file -nargs=1 CompleteFuntion :call CompleteFuntion(<f-args>)
command! -complete=help -nargs=1 CompleteFuntion2 :call CompleteFuntion(<f-args>)
