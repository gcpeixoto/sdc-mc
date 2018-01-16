#!/bin/bash

DIR=$DIR_SDC/temp
FILE=fluss.rb

if mv $DIR/$FILE ~/.Trash/; 
	then echo "$FILE movido para a lixeira."
elif 
	rm $DIR/$FILE; 
	then echo "$FILE deletado."
else 
	echo "$FILE não removido" >&2; 
	exit 1; 
fi

