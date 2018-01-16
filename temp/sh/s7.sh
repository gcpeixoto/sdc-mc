#!/bin/bash  

# Comparação de inteiros

a=4
b=5
# igual: -eq 
if [ "$a" -eq "$b" ]; then echo 'a=b'; else echo 'a~=b'; fi

# diferente: -ne
if [ "$a" -ne "$b" ]; then echo 'a~=b'; else echo 'a=b'; fi

# maior do que: -gt
if [ "$a" -gt "$b" ]; then echo 'a>b'; else echo 'a<=b'; fi

# maior do que ou igual a: -ge
if [ "$a" -ge "$b" ]; then echo 'a>=b'; else echo 'a<b'; fi

# menor do que: -lt
if [ "$a" -lt "$b" ]; then echo 'a<b'; else echo 'a>=b'; fi

# menor do que ou igual a: -le
if [ "$a" -le "$b" ]; then echo 'a<=b'; else echo 'a>b'; fi

# menor do que (entre parênteses duplos): <
(("$a" < "$b")); echo $?

# menor do que ou igual a (entre parênteses duplos): <=
(("$a" <= "$b")); echo $?

# maior do que (entre parênteses duplos): >
(("$a" > "$b")); echo $?

# maior do que ou igual a (entre parênteses duplos): >=
(("$a" >= "$b")); echo $?
