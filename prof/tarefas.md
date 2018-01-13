# Lista de Tarefas: mini-curso _bash_ SDC-CI 2018

- Baixar o arquivo `.gz` do curso do Github usando `curl` (ou `wget`) 
(_Obs:_ n„o introduzir `git clone` ainda) 
- Descomprimir usando `tar -xv`


## Exercícios 

### Parte 1

- Verificar versão do `bash`:

```bash
$ echo $BASH_VERSION 
```

- Acessar o diretório padrão:

```bash
$ cd ~/sdc-mc
```

- Listar o conteúdo de todo o diretório do curso de modo recursivo em lista e com cores:

```bash
$ ls -lRG 
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
$ open pop-pb-2017-2sem.csv
# ou use open -a <nome_programa>
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
# no macOS
$ curl https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/2000px-Tux.svg.png > pinguim.png
# no Linux (verificar!)
$ wget https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/2000px-Tux.svg.png > pinguim.png 
```

- Criar uma cópia da imagem em `.tiff`:

```bash
$ sips -s format png pinguim.png --out pinguim2.tiff
```

- Pedindo ajuda sobre o comando `sips` no manual

```bash 
$ man sips
```

- Deletar a imagem `.tiff` com pergunta de segurança:

```bash 
$ rm -i pinguim2.tiff
# y: yes n: no
$ remove pinguim2.tiff? y
# para remover na força bruta, use rm -f (COM CUIDADO!)
```



### Parte 2

### Parte 3


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