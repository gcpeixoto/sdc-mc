#!/bin/bash

a=3

if [ "$a" -gt 0 ]
then
  if [ "$a" -lt 5 ]
  then
    echo "O valor de \"a\" fica entre 0 e 5."
  fi
fi

# Tem o mesmo resultado que:

if [ "$a" -gt 0 ] && [ "$a" -lt 5 ]
then
  echo "O valor de \"a\" fica entre 0 e 5."
fi