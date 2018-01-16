#!/bin/bash
DIR=$DIR_SDC/temp 

if mv $DIR/$1 ~/.Trash/; 
	then echo "$1 movido para a lixeira."
elif 
	rm $DIR/$FILE; 
	then echo "$1 deletado."
else 
	echo "$FILE não removido" >&2; 
	exit 1; 
fi
