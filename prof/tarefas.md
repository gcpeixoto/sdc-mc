# Lista de Tarefas: mini-curso _bash_ SDC-CI 2018


## Obtendo o diretório padrão 

- Baixar o arquivo `.zip` do curso do [Github](https://github.com/gcpeixoto/sdc-mc)

## Exercícios 

### Parte 1: navegação em diretórios e manipulação de arquivos

- Verificar versão do `bash`:

```bash
$ echo $BASH_VERSION 
```

- Verificar lista de shells disponíveis: 

```bash
$ cat /etc/shells
/bin/bash 
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

- Acessar o diretório padrão:

```bash
$ cd ~/sdc-mc
```

- Listar o conteúdo de todo o diretório do curso de modo recursivo em lista:

```bash
$ ls -lR 
``` 

- Criar novo diretório `data` com dois subdiretórios `pb` e `rn`

```bash
$ mkdir -p data/pb data/rn
``` 

- Copiar arquivo `csv/pop-X-2017.csv` para o diretório `data/X`, `X=pb,rn`

```bash 
$ cp csv/pop-pb-2017.csv data/pb; 
$ cp csv/pop-rn-2017.csv data/rn; 
```

- Renomear arquivo `data/pb/pop-pb-2017.csv` para `pop-pb-2017-2sem.csv`

```bash 
$ mv data/pb/pop-pb-2017.csv data/pb/pop-pb-2017-2sem.csv
```

- Acessar diretório `data/pb` e verificar tipo de arquivo

```bash 
$ cd data/pb
$ file pop-pb-2017-2sem.csv
# arquivo deve ser Non-ISO extended-ASCII text, with CR line terminators
```
**Obs.:** o arquivo original possui terminação com _carriage return_ (CR), do DOS. Caso se queira convertê-lo em tipo UNIX, devemos usar algum artifício. Um caminho mais simples é instalar `dos2unix` por `apt-get` ou por `brew` no macOS. 

- Abrir o arquivo `.csv` com o programa padrão apenas para demonstração (interface gráfica) e depois fechar janela (na interface).

```bash
# no macOS; ou use open -a <nome_programa>
$ open pop-pb-2017-2sem.csv
# no Linux
$ xtg-open pop-pb-2017-2sem.csv
```

- Criar uma variável de ambiente temporária para o nosso diretório padrão

```bash
$ cd ~/sdc-mc; 
# pwd imprime o diretório atual
$ pwd
# este comando cria a variável 'sdc' com o valor 
# do diretório atual
$ export sdc=$PWD; 
# o comando 'echo' imprime na tela
$ echo $sdc
$ /Users/gustavo/sdc-mc
``` 

**Obs.:** A partir da definição da variável temporária `sdc` como o caminho para nosso diretório padrão, podemos usá-la na sessão de login atual para ir diretamente para nosso diretório de qualquer lugar do computador. 

- Visitando o `root` e voltando para o nosso diretório:

```bash
$ cd /; cd $sdc
```

- Visitando `csv` e voltando para o topo do nosso diretório:

```bash 
$ cd csv; cd ..
```


- Visualizando o nosso histórico de comandos

```bash
$ history
# repetir último comando digitado
$ !!
# repetir 2o. evento para trás
$ !-2

```
- Criar um diretório novo `img` um nível abaixo de `sdc-mc`

```bash
$ mkdir -p $sdc/img
```

- Fazer download da imagem do pinguim do Linux da Wikipedia e salvar em `img` como um `.png`: 

```bash
$ cd $sdc/img
# no macOS, usar 'curl' 
# no Linux
$ wget https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/2000px-Tux.svg.png
$ mv 2000px-Tux.svg.png pinguim.png 
```

- Criar uma cópia da imagem em `.tiff`:

```bash
# no macOS
$ sips -s format png pinguim.png --out pinguim2.tiff
# no Linux (caso necess?rio, instalar
# apt-get install imagemagick
$ convert pinguim.png pinguim.tiff
```

- Pedindo ajuda sobre o comando `sips`/`convert` no manual

```bash 
# no macOS
$ man sips
# no Linux, ver 'convert'
$ man convert
```

- Deletar a imagem `.tiff` com pergunta de segurança:

```bash 
$ rm -i pinguim2.tiff
# y: yes n: no
$ remove pinguim2.tiff? y
# para remover na força bruta, use rm -f (COM CUIDADO!)
```

- Criar um diretório temporário `temp` com os seguintes arquivos vazios: `baum`, `ball`, `buch`, `bett`, `rad`

```bash
$ cd $sdc-mc
$ mkdir temp; cd temp; 
$ touch baum ball buch bett rad
```

#### Usando _wildcards_

- Comandos em `temp` usando _wildcards_

```bash 
# O wildcard * combina qualquer string. 
# Exemplos:

# lista arquivos que comecem com o caracter 'b':
$ ls b*
$ ball baum bett buch

# lista arquivos que comecem com a string 'ba':
$ ls ba*
$ ball baum

# lista arquivos que contenham 'u' em posição intermediária:
$ ls *u*
$ baum bauch

# lista arquivos que terminem com 'd':
$ ls *d
$ rad

# lista arquivos que comecem com 'b' e terminem com 'h'
$ ls b*h
$ buch

# lista tudo (sem combinação de padrão)
$ ls * 
ball baum bett buch rad
```

#### Usando _wildcards_ e expansões 

- Criar mais 3 arquivos `fluss` com extensões `.c,.h,.o,.py,.rb`:

```bash
$ touch fluss.{c,h,o,py,rb}; ls fluss.*
$ fluss.c  fluss.h  fluss.o  fluss.py fluss.rb
```

- Listar arquivos com extensão no intervalo alfabético entre 'c' e 'r'

```bash
$ ls *.[c-r]
$ fluss.c fluss.h fluss.o

# mesmo efeito aqui
$ ls [flu]*.?
```
*Obs.:*: a expressão entre colchetes é refere-se a um intervalo `[a-c]`, ou padrão `[flu]`


- Listar arquivos com extensão começando no intervalo alfabético entre 'c' e 'r' e que possua um caracter adicional:

```bash ls 
$ ls *.[c-r]?
$ fluss.py fluss.rb
```

- Ainda em `temp`, criar os arquivos: `fluSS.c`, `fluSS.C`, `fluss-1.py`, fluss-2.py`, `fluss-1.2.py`

```bash 
$ touch fluSS.{c,C} fluss-{1.py,2.py,1.2.py}
```

*Obs.*: macOS HFS+ é _case preserving_. Aqui, _case insensitive_ não difere. `fluss = fluSS`

- Listar diversos casos:

```bash
# lista os arquivos que possuem dígitos intermediários em seu nome:
$ ls *[0-9]*.*
$ fluss-1.2.py fluss-1.py   fluss-2.py

# lista os arquivos que possuam o padrão com traço, seguido de um dígito diferente de 2:
$ ls *[-][!2].*
$ fluss-1.2.py fluss-1.py

# idem 
$ ls *[-][1]*.*
```
- Exemplo de expansão com `~`:

```bash 
$ echo 'O que é' ~ 'não é' ~root
$ O que é /Users/gustavo não é /var/root
```

- Criar e deletar diretório vazio:

```bash
$ mkdir test; rmdir test
```
- Criar e deletar diretório não vazio:

```bash
$ mkdir -p test/subtest; rm -R test
```

- Duplicar um diretório mantendo todas as características dos arquivos internos:

```bash
$ ditto misc misc2;
# use 'ls -d mis*' para listar os diretórios e 
# remova misc2 com 'rm -r misc2'
```

**Obs.:** diferentemente de `cp -R`, com `ditto`, se um diretório de mesmo nome de destino já existir, o conteúdo existente será mesclado com o conteúdo do diretório que está sendo copiado.

*Obs.:* padrões complexos podem ser habilitados no bash com o comando de _extended blobs_: `shopt -s extglob`. Exemplo:

```bash
$ shopt -s extglob

# lista qualquer arquivo começando por 'be' ou 'r'
$ ls @(be|r)*
$ bett rad
```

### Parte 2

- Executar editor de texto, inserir o nome do aluno, salvar, fechar o editor, retornar ao `bash` e imprimir o conteúdo na tela. 
  

```bash
# Depois de executar 'nano', realizar comandos 
# com o teclado e sair
# no macOS: 
# 'Ctrl+O' (escrever); 'Ctrl+M' (formato); Ctrl+X (sair)
$ cd ~/sdc-mc
$ nano eusou.txt 
# faça operações no arquivo
$ cat eusou.txt
$ Gustavo 
```

#### Entendo melhor a gramática do _bash_

##### Comandos simples 

Tipo mais comum. Especifica o nome do comando juntamente com um conjunto opcional de _argumentos_, _variáveis de ambiente_ e _redirecionamentos de descritores de arquivo_. 

- Encerrar sessão:

```bash
$ exit
```
- Iniciar nova sessão, verificar existência da variável `sdc` e redefini-la de modo permanente. 

```bash 
# A variável não está mais na lista
$ env | grep sdc 

# Recriando a variável de modo permanente
$ cd ~/sdc-mc
# no macOS

# envia diretório atual para o arquivo oculto de opções 
# `.bashrc` (explicar adiante a expansão de $PWD e o 
# redirecionamento de append `>>`)
$ echo "export sdc=$PWD" >> ~/.bashrc
# verifica o acréscimo da informação na última linha
$ tail -1 ~/.bashrc
# faz 'include' e verifique na lista
$ source ~/.bashrc ; env | grep sdc
$ exit 

# abra nova sessão e constate
$ echo $sdc
```

**Obs.:** Neste exemplo, listamos as variáveis de ambiente do sistema com `env` e buscamos pelo padrão `sdc` com `grep`. A saída deve estar vazia, a princípio, vazia. Se desejarmos, podemos fazer `unset` para remover uma variável de ambiente da sessão e incluí-la novamente com `source ~/.bashrc`. 


- Definir variável com base em entrada de usuário e removê-la: 

```bash
# aguarda input do usuário e salva valor em 'name'
$ read name 
Hello 
$ echo $name
Hello
$ unset name
```

- Criar diretório para scripts e realizar teste lógico:

```bash
$ mkdir -p temp/sh; cd temp/sh
$ touch s1
# escrever código em no script s1

# Retornará b = 0, pois 3 > 10 é falso
:<<S1 
a=3
b=`expr $a \> 10`
echo 'b=`expr $a \> 10`, therefore...'
echo "If a > 10, b = 0 (false)"
echo "b = $b"
echo
S1
# Torna s1 executável
$ chmod +x s1
``` 

**Obs.:** o comando `expr` é invocado para avaliar a operação lógica `$a \> 10`. Os sinais de crase disponibilizam a saída de `expr $a \> 10` para atribuição à variável `b`. A `\` é usada como função de escape em `expr` para que `>` seja interpretado como `maior do que`. O valor de `b` é retornado como `0`, isto é, o teste lógico é falso.

- Obtendo parâmetros com `awk`

```bash
$ echo um dois | awk '{print $1}'
$ echo um dois | awk '{print $2}'
# campo #0 são todos! 
$ echo um dois | awk '{print $0}'
```
**Obs.:** `awk` quebra cada linha de entrada passada em _campos_. Por padrão, um campo é uma sequencia de caracteres consecutivos delimitados por espaços em branco, embora existam opções para alterar isso. `awk` analisa e opera em cada campo separadamente. Comando ideal para manusear arquivos de texto estruturados - especialmente tabelas - dados organizados em partes consistentes, como linhas e colunas.

##### _Pipelines_ e redirecionamentos: `>`, `>>`, `<`, `|` e `tee`

Redirecionamento é a prática de alterar a fonte ou destino de um descritor de arquivo.

O operador `>` ("escreva para") redireciona a saída de um comando para um arquivo no disco. Se o arquivo já existir, será apagado e substituído sem aviso (CUIDADO!)

- Direcionar a lista de processos em operação para arquivo `procs.txt`: 

```bash
$ ps -ax > $sdc/misc/procs.txt
```

O operador `>>` apensa a saída de um comando para um arquivo no disco. Se o arquivo já existir, não será sobrescrito.

```bash
$ ps -ax >> $sdc/misc/procs.txt
```

- Redirecionar conteúdo de 'ball' para 'bett':
 
```bash
# abra o arquivo 'ball' e insira 'texto' como conteúdo
$ nano ball
$ cat ball > bett;
$ cat bett
texto
```
O operador `<` ("leia de") lê a entrada de um comando a partir de um arquivo no disco e não do usuário. Atenção para não digitar `>` por engano, senão o conteúdo do arquivo que você está tentando ler será apagado.


O 'pipe' (`|`) conecta dois comandos vinculando a saída padrão do primeiro processo com a entrada padrão do segundo.

- Listar processos e passar a saída para o comando `grep`, que deve procurar pelo padrão `bash` na lista.

```bash
$ ps -ax | grep bash
```

- Listar todos os arquivos abertos no diretório `/` e passar saída para o comando `more`, para imprimir resultados em sequencia:

```bash
$ lsof +d / | more
```
O comando `tee` cria uma espécie de "túnel", no sentido de redirecionar a saída de um comando para um arquivo que, posteriormente pode ser usado para entrada em demais comandos. 

- Listar processos, salvar em arquivo e visualizar conteúdo em sequencia:

```bash
$ ps -ax | tee misc/procs.txt | more
```

##### Aliases 

- Vamos melhorar o nosso acesso ao diretório padrão criando um `alias` (atalho): 

```bash
$ cd ~/sdc
$ echo "alias sdc='cd $PWD'" >> ~/.bashrc
$ source ~/.bashrc
```

**Obs.:** agora temos um atalho que já nos levará diretamente para o nosso diretório padrão, pois embutimos o comando `cd` nele. A partir de agora, vamos adicionar a variável de ambiente `DIR_SDC` para o caminho do diretório e deixar `sdc` como um 'alias' para o abrir o diretório. 

```bash
$ sdc
$ echo "export DIR_SDC=$PWD'" >> ~/.bashrc
$ source ~/.bashrc
```

##### Descritores de arquivos 

Descritores de arquivo servem para controlar os 'fluxos' de processos. Cada processo geralmente possui 3 descritores: 

1. uma _entrada padrão_: teclado, (_file descriptor_ 0 ou FD0)
2. uma _saída padrão_: tela, (_file descriptor_ 1 ou FD1)
3. um _erro padrão_: tela, (_file descriptor_ 2 ou FD2)

Vamos estudar os fluxos de um processo `ls` para entender como  manipulamos redirecionamentos.


- Executar comando que produz mensagem na saída padrão: 

```bash
$ sdc; ls temp/bett temp/buch
```

**Obs.:** ambos os arquivos `bett` e `buch` estão no diretório, de modo que `ls` produz uma saída para a tela em FD1.

- Executar comando que produz mensagem de erro padrão:

```bash
$ sdc; ls temp/but
ls: temp/but: No such file or directory  
```
**Obs.:** neste caso, `but` não existe. Portanto, o processo `ls` produz uma mensagem de erro padrão na tela em FD2.

- Executar comando que produz mensagens na saída padrão e erro

```bash
$ ls temp/bett temp/but
temp/bett
ls: temp/but: No such file or directory
```
**Obs.:** neste exemplo, o mesmo processo gera uma saída padrão e uma mensagem de erro, jogando fluxo tanto em FD1 quanto em FD2.

- Enviar apenas a mensagem de erro padrão para o arquivo `temp/erro.log`

```bash
$ ls temp/bett temp/but 2>temp/erro.log
$ cat temp/erro.log
```

**Obs.:** neste exemplo, a saída FD2 é enviada para o arquivo com o operador de redirecionamento `>` e apenas a saída FD1 é mostrada na tela.

- Apensar a saída padrão e a mensagem de erro para o arquivo `temp/erro.log`

```bash
$ ls temp/bett temp/but >> temp/erro.log 2>&1
$ cat temp/erro.log
```

**Obs.:* neste exemplo, a mensagem de erro em FD2 é apensada no arquivo e, posteriormente, o fluxo é passado para o descritor FD1, que, por sua vez, é também apensado no arquivo.

- Apensar a saída padrão e a mensagem de erro para o arquivo `temp/erro.log` de modo mais conciso:

```bash
$ ls temp/bett temp/but &> temp/erro.log 
$ cat temp/erro.log
```

**Obs.:* neste exemplo, a mensagem de erro em FD2 e a saída padrão em FD1 são ambas redirecionadas para o arquivo através do operador `&>`.

##### Cópia de descritores de arquivos com `>&` e `<&`

A expressão arbitrária `x >& y` significa que o FD `x` escreve no fluxo do FD `y`. Inversamente, a expressão arbitrária `x <& y` significa que o FD `x` lê o fluxo do FD `y`. Assim, a conexão  de um FD é copiada para a do outro. 

##### _Here-strings_

_Here-strings_ são usadas para que FD0 seja lida a partir de uma string. 

- Criar `here-string`:

```bash
$ cat <<<"Bem, isso aqui em $PWD, é interessante."
```

##### Aspas e plicas 

No _bash_, há casos em que o uso de plicas (aspas simples) `'...'` é desnecessário. Por exemplo, os dois comandos abaixo produzem resultados idênticos: 

```bash 
$ ls README.md 
$ ls 'README.md'
```
Em geral, usar plicas é uma segurança a mais. Então, em caso de dúvida, use-as. Entretanto, não tente "forçar a barra" removendo-as na tentativa de fazer algo funcionar.

Aspas duplas `"..."` são usadas em qualquer argumento que contenha expansões, tais como expansões de variáveis (e.g. `$ var`) ou de comandos (e.g. `$(comando)`) e plicas para quaisquer outros argumentos. 

As plicas garantem que tudo nas citações permaneça literal, ao passo que as aspas permitem alguma sintaxe `bash`, como é o caso das expansões:

```bash
# Aqui, as aspas permitem que $USER seja expandido
$ echo "Como vai, $USER?" 
$ Como vai, gustavo?

# Aqui, as plicas impedem que '$' seja 
# interpretado como código bash e expandido
$ echo 'Qual é a cotação de US$ para R$ hoje?'
$ Qual é a cotação de US$ para R$ hoje?
```

**Regra de ouro:** se houver caracter de espaço em branco ou um símbolo em seu argumento, você deve usar as plicas ou aspas. Se não houver, elas são geralmente opcionais, mas você ainda pode uáa-las por segurança. Todavia, o uso de plicas ou aspas em _bash_ é quase indelével, já que são bastante usadas em argumentos.

##### Heredocs 

A tralha ou hashtag, `#` é usada para comentários em linha. Comentários em bloco são chamados _heredocs_ e podem ser iniciados por uma palavra-chave arbitrária e fechada pela mesma da seguinte maneira: 

```bash 
# Esta linha é um comentário 
VAR=sdc-mc # outro comentário aqui

# PALAVRA é usada como palavra-chave 
# para o comentário em bloco 
echo "imprime"
:<<PALAVRA
echo "isto"
echo "aquilo"
echo "não imprime"
PALAVRA
echo "imprime de novo"
```

**Obs.:** o operador `:` é um operador "neutro", ou "nulo". É bastante usado em estruturas de controle.

##### `source`

Este comando funciona como um "import" ou "include". Útil, por exemplo para reinicializar o arquivo de opções `.bashrc`.

### Parte 3

- Escrever um script básico: 

```bash 
$ sdc
$ which bash > temp/sh/s0

# abra principal com 'nano' ou 'vim' e edite com script abaixo 
# adicionar '!' na primeira linha 

#!/bin/bash
echo -e "Olá, digite uma palavra: \c "
read  palavra
echo "A palavra digitada é: $palavra"
echo -e "Poderia digitar mais duas palavras? "
read palavra1 palavra2
echo "OK, aqui estão: \"$palavra1\" \"$palavra2\""
echo -e "O que você acha sobre bash scripting? "
# le comando e armazena resposta na variável residente padrao $REPLY
read
echo "Você disse $REPLY, legal! "

# volte ao bash e torne o arquivo executável
$ chmod +x /temp/sh/s0

# execute o arquivo com './'
$ ./temp/sh/s0
```

**Obs.:** o cabeçalho de um shell script começa com um `#!` (_sha-bang_), seguido pelo caminho de um comando. Por exemplo, se os cabeçalhos abaixo fossem aplicados a `principal.sh`, gerariam diferentes saídas: 

- Esta linha executa o script como deve ser:

```bash
#!/bin/bash
```

- Esta linha apenas imprime `./principal.sh`:

```bash
#!/bin/echo
```

- Esta linha imprime na tela o conteúdo do arquivo, inclusive os comentários:

```bash
#!/bin/cat
```

Opções também podem ser adicionadas na linha da `sha-bang`. 

- A linha abaixo, por exemplo, permite que executemos o arquivo em modo de depuração - `debug mode`, i.e. opção `-x`:

```bash
#!/bin/bash -x
```

##### Condicionais 

- Vamos criar um segundo script para ver o funcionamento de um condicional:

```bash
$ sdc; touch temp/sh/s2; nano s2
$ read -p "Gostaria de café? [s/n] "
# $REPLY
> if [[ $REPLY = s ]]; then
>   echo "Bora lá. :-) "
> else
>   echo "Toma aí... Só um cafezinho. :/"
> fi
# tornar arquivo executável
$ chmod +x /temp/sh/s2
$ bash /temp/sh/s2 # outra forma de executar, em vez de ./
```

**Obs.:** `[[ ]]` é uma construção para testes lógicos. É uma _keyword_, e não um comando.


- Vamos criar outro script, agora com extensão, a saber `/temp/sh/s3.sh`: 

```bash
$ touch temp/sh/s3.sh; nano temp/sh/s3.sh;
:<<S3
Script s3.sh
Aplica 'if' com variáveis globais 
S3
#!/bin/bash
DIR=$DIR_SDC/temp 
FILE=fluss.rb # escolhendo arquivo

if mv $DIR/$FILE ~/.Trash/; 
	then echo "$FILE movido para a lixeira."
elif 
	rm $DIR/$FILE; 
	then echo "$FILE deletado."
else 
	echo "$FILE não removido" >&2; 
	exit 1; 
fi

# executa
$ chmod +x temp/sh/s3.sh
$ ./temp/sh/s3.sh

# verifica 
$ ls ~/.Trash | grep fluss
```

- Vamos criar um script `temp/sh/s4.sh`, similar a `s3.sh`, mas com passagem de argumento. 

```bash
$ ditto temp/sh/s3.sh temp/sh/s4.sh; 
$ nano temp/sh/s4.sh

:<<S4
Script s4.sh
Aplica 'if' com variáveis globais e passagem 
de parâmetro na linha de comando
S4
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
$ chmod +x temp/sh/s3.sh

# vamos recriar fluss.rb e executar
$ touch /temp/fluss.rb 
$ ./temp/sh/s4.sh fluss.rb
```

**Obs.:** um `if` pode testar qualquer comando; não apenas condições entre colchetes.

##### Status de saída 

- Vamos entender um pouco sobre status de saída.

```bash
$ echo ola
$ echo $? 
# Estado 0 retornado porque o comando 
# foi executado com sucesso.

$ lskdf 
$ echo $? 
# Estado de saída não-zero retornado 
# porque o comando falhou ao executar. 
# 'lskdf' não é reconhecido pelo bash. 
# '127' é associado ao erro "command not found"

:<<STATUS 
Por convenção, uma saída '0' indica sucesso.
Um valor de saída diferente de zero significa 
erro ou condição anômala.
STATUS
```

#### `true` e `false`

```bash
$ true
$ echo $?
# 0

$ false 
$ echo $?
# 1

# negaçao 
$ ! true 
$ echo $?
# 1

# Nota: 
# "!" precisa de um espaço entre ele e o comando.
# '!true' leva a erro de "comando não encontrado"
# '!' sem espaço é o operador que invoca o 
#     mecanismo do histórico do Bash.
$ true
$ !true
# Aqui não há erro, mas também não há negação.
# Simplesmente repetição do comando anterior (true).

```

- Vamos criar outro script com testes lógicos mais "explícitos": 

```bash
$ ditto temp/sh/s5.sh
$ nano temp/sh/s4.sh
:<<S5
Script s5.sh 
Realiza vários testes lógicos
S5
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
```

**Obs.:** `$?` lê o status de saída do último comando. O comando `let` executa operações aritméticas sobre variáveis e é uma versão menos complexa de `exec`. Ambas as construções `((...))` e `let` retornam um status de saída, de acordo com as expressões aritméticas que avaliam, se expandem para um valor diferente de zero ou não.

- Script com vários testes (REVISAR)

```bash
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
```

- Script com operadores de **comparação de inteiros**:

```bash
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
```

- Script com `if` aninhado: 

```bash
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
```

##### Laços 

Em bash, um laço `for` é escrito como:

```bash
for arg in [list]
do 
 comando(s)... 
done
```
- Exemplo de laço `for` com expansão: 

```bash
# expansão como lista
for i in {0..9}
do
 echo $i;
done
```

- Script com laço `for` e parâmetros:

```bash
#!/bin/bash

fname="*txt"
for f in $fname
do
 echo "Conteúdo de $f"
 echo "---"
 cat "$f"
 echo
done
```

##### Laço `while`

Em bash, um laço `while` é escrito como: 

```bash
while [ condicao ]
do 
 comando(s)... 
done
```

### Parte 4 

Miscelânea. Guia de sobrevivência. 

- Como obter ajuda de um comando: `info`, `help`, `man` e `apropos`

```bash 
# exemplo com 'ls'
$ ls --help
$ info ls
$ man ls
$ apropos ls
```
- Como fazer um login remoto simples usando `ssh`:

```bash
# ssh -v usuario@host
# opção -v para 'verbose'. Exemplo:
$ ssh -v peixoto@100.10.111.111
```

- Como fazer uma cópia remota de arquivo usado `scp`:

```bash
# scp -v local_file to@server:path
# Exemplo: copia arquivo 'lamep.tar' para 
# conta do LaMEP no server do CI
$ scp -v lamep.tar l_lamep@ci.ufpb.br:~/site/
```

- Verificar conexão com servidor: 

```bash
# exemplo para o CI
$ ping ci.ufpb.br
```

- Exemplo de aliases para `~/.bashrc`: 

```bash
alias op='open -a Paraview'
alias l='ls -l'
alias rmdat='find . -name "*.dat" -exec rm -rf {} \;'
```

- Verificar processos:

```bash
$ top
```
- Rede: 

```bash
$ ifconfig
```

- Versão completa do SO: 

```bash
$ uname -a
```

- Diferenciar arquivos: 

```bash
$ diff -w [file1] [file2] > [diffFile]
```

- Ping para vários hosts: 

```bash
# 0 a 24
$ nmap -n -sP 10.0.0.0/24 
```

- Processos em background:

```bash
$ screen -S [name_of_background_screen]; 
$ ctrl-a-d (escape screen mode); 
$ ctrl-a-[ (enable scrollback mode)
```

- Encoding de arquivos:

```bash
$ file -I <filename>
```

- Executar Matlab em background:

```bash
$ matlab -nodesktop -nosplash
```

## TODO

- [ ] Adicionar script com operadores de **comparação de strings**
- [ ] Miscelânea: comando de espelhamento remoto com `sshfs`.