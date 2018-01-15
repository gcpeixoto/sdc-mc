# Lista de Tarefas: mini-curso _bash_ SDC-CI 2018


## Obtendo o diretório padrão 

- Baixar o arquivo `.zip` do curso do [Github](https://github.com/gcpeixoto/sdc-mc)

## Exercícios 

### Parte 1: navegação em diretórios e manipulação de arquivos

- Verificar versão do `bash`:

```bash
$ echo $BASH_VERSION 
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

*Obs.:* padrões complexos podem ser habilitados no bash com o comando de _extended blobs_: `shopt -s extglob`. Exemplo:

```bash
$ shopt -s extglob

# lista qualquer arquivo começando por 'be' ou 'r'
$ ls @(be|r)*
$ bett rad
```

### Parte 2

- Executar editor de texto, inserir o nome do aluno, salvar, fechar o editor, retornar ao `bash` e imprimir o conte˙do na tela. 
  
**Como fazer:**

```bash
# Depois de executar 'nano', realizar comandos com o teclado e sair
# no macOS: 'Ctrl+O' (escrever); 'Ctrl+M' (formato); Ctrl+X (sair)
$ cd ~/sdc-mc
$ nano eusou.txt 
$ cat eusou.txt
$ Gustavo 
```

#### Entendo melhor a gramática do _bash_

##### Comandos simples 

Tipo mais comum. Especifica o nome do comando juntamente com um conjunto opcional de _argumentos_, _variáveis de ambiente_ e _redirecionamentos de descritores de arquivo_. 

- Definir duas variáveis em `sdc-mc`:

```bash 
$ dat=./data/; mis=./misc/;

# Para imprimir o conteúdo das variáveis, use '$'.
# O uso de aspas duplas é fundamental aqui porque var{1,2}
# está se expandindo
$ echo "$dat $mis"
```

- Definir variável com base em entrada de usuário: 

```bash
# aguarda input do usuário e salva valor em 'name'
$ read name 
Hello 
$ echo $name
Hello
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


##### _Pipelines_ e redirecionamentos: `>`, `>>`, `<`, `|` e `tee`

O operador `>` redireciona a saída de um comando para um arquivo no disco. Se o arquivo já existir, será apagado e substituído sem aviso (CUIDADO!)

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
O operador `<` lê a entrada de um comando a partir de um arquivo no disco e não do usuário. Atenção para não digitar `>` por engano, senão o conteúdo do arquivo que você está tentando ler será apagado.


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

### Parte 3

- Escrever um script básico: 

```bash 
$ cd $sdc
$ which bash > principal.sh

# abra principal.sh com 'nano' ou 'vim' e edite com script abaixo 
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
echo -e "Quais são suas cores favoritas ? "
# -a permite que 'read' leia como array
read -a colours
echo "Minhas cores favoritas são ${cores[0]}, ${cores[1]} and ${cores[2]}:-)"

# volte ao bash e torne o arquivo executável
$ chmod +x principal.sh

# execute o arquivo 
$ ./principal.sh
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
