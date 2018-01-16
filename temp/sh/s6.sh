#!/bin/bash

echo

echo "Teste de \"0\""
if [ 0 ]      # zero
then
  echo "0 eh falso."
else          # Or else ...
  echo "0 eh falso."
fi            # 0 eh falso.

echo

echo "Teste de \"1\""
if [ 1 ]      # um
then
  echo "1 eh falso."
else
  echo "1 eh falso."
fi            # 1 eh falso.

echo

echo "Teste de \"-1\""
if [ -1 ]     # menos um
then
  echo "-1 eh falso."
else
  echo "-1 eh falso."
fi            # -1 eh falso.

echo

echo "Teste de \"NULL\""
if [ ]        # NULL (condicao vazia)
then
  echo "NULL eh falso."
else
  echo "NULL eh falso."
fi            # NULL eh falso.

echo

echo "Teste de \"xyz\""
if [ xyz ]    # string
then
  echo "Random string eh falso."
else
  echo "Random string eh falso."
fi            # Random string eh falso.

echo

echo "Teste de \"\$xyz\""
if [ $xyz ]   # Testa se $xyz eh null, mas...
              # eh apenas uma variavel não inicializada.
then
  echo "Variavel não inicializada eh falso."
else
  echo "Variavel não inicializada eh falso."
fi            # Variavel não inicializada eh falso.

echo

echo "Teste de \"-n \$xyz\""
if [ -n "$xyz" ]            # Mais pedantemente correto.
then
  echo "Variavel não inicializada eh falso."
else
  echo "Variavel não inicializada eh falso."
fi            # Variavel não inicializada eh falso.

echo


xyz=          # não inicializada, mas set para null.

echo "Teste de \"-n \$xyz\""
if [ -n "$xyz" ]
then
  echo "Variavel Null eh falso."
else
  echo "Variavel Null eh falso."
fi            # Variavel Null eh falso.


echo


# Quando "falso" eh falso?

echo "Teste de \"falso\""
if [ "falso" ]               #  Parece que "falso" eh apenas uma string ...
then
  echo "\"falso\" eh falso." #+ e ela testa para falso.
else
  echo "\"falso\" eh falso."
fi            # "falso" eh falso.

echo

echo "Teste de \"\$falso\""  # De novo, variavel não inicializada.
if [ "$falso" ]
then
  echo "\"\$falso\" eh falso."
else
  echo "\"\$falso\" eh falso."
fi            # "$falso" eh falso.
              # Agora, chegamos ao resultado esperado.

echo

exit 0