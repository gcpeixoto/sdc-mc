#!/bin/bash
# ---
# Lógico E

(( 0 && 1 ))
echo $?   
# 1

let "num = (( 0 && 1 ))"
echo $num 	
# 0

let "num = (( 0 && 1 ))"
echo $? 
# 1

# o status de saída de uma 
# operação aritmética não é um valor de erro
var=-2 && (( var+=2 ))
echo $?
# 1

# ---

# Lógico OU
# ---

(( 200 || 11 ))              
echo $? 
# 0

let "num = (( 200 || 11 ))"
echo $num  
# 1 

let "num = (( 200 || 11 ))"
echo $?     
# 0