# Aplicativo para lista de tarefas - Projeto_Flutter_One
> Aplicativo móvel desenvolvido para apresentação de trabalho de conclusão de curso - Mobile Flutter

[![Flutter Badge](https://img.shields.io/badge/-Flutter-000?style=flat-square&logo=Flutter&logoColor=white&link=https://flutter.dev/)](https://flutter.dev/)
[![Dart Badge](https://img.shields.io/badge/-Dart-blue?style=flat-square&logo=Dart&logoColor=white&link=https://dart.dev/)](https://dart.dev/)

<img align="right" width="200" height="120" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/flutter_dart.png">

## Descrição da Aplicação
A aplicação móvel desenvolvido para a listagem de tarefas a serem realizadas para o projeto Startup One (FIAP), na qual possui uma lista que as ordena de modo vertical e um formulário para informar sua descrição, caminho da imagem e grau de dificuldade a fim de ser avaliada pelo seu proprietário.

<img align="middle" width="200" height="450" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/lista_tarefas.png">

## Sobre o uso do Widgets (Flutter)
Antes de descrever o que são ***Widgets***, vamos entender o que é o framework **Flutter**. O Flutter foi desenvolvido pela Google para criação de aplicações móveis multiplataformas utilizando uma única base de código, baseada na linguagem **Dart**.

O Dart é uma linguagem de programação fortemente tipada, atualmente ela é considerada uma linguagem multi-paradigma, embora a linguagem apresente fortes estruturas típicas de linguagens orientadas a objeto.

Já o Flutter está ganhando muito respeito pelo mercado por sua robusteis e vasta documentação, além de ser muito clamado por sua facilidade no desenvolvimento de aplicações com uma interface intuitiva e agradável.

Toda interface de um aplicativo desenvolvido com o Flutter que é criada com base em um conjunto de Widgets. Basicamente, um widget é um componente visual para definir a interface de um aplicativo.
Os widgets do Flutter permite estruturar componentes para montaem avançada de aplicativos IOS, Android, Web, Windows, macOS e Linux. São altamente personalizáveis e funcionam com qualquer componente de layout. Além disso, são imutáveis onde não podem ser alterados, sendo suas propriedades finais e só podem ser definidas quando o widget é inicializado, permitindo mante-los leves.

## Persistência de Dados (Floor)
Para possuir a lista das tarefas, mesmo após encerrar o aplicativo é necessário utilizar uma função de **persistência de dados**. Para este app, mesmo sendo um aplicativo para uso de dático, será utilizado uma fonte local para obter os dados utilizando o **Floor**.

O *Floor* fornece uma camada de abstração *SQLite*, permitindo mapear automaticamente os objetos instanciados em memória e as linhas da database, enquanto fornece controle total do banco de dados com o uso de SQL. Para isso, foi necessário injetar este framework ao projeto a fim de utiliza-lo na aplicação ao implementar suas dependências no *pucspec* que tem a função de gerenciar as dependências do projeto.

```yml
dependencies:
  flutter:
    sdk: flutter
  floor: ^1.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  floor_generator: ^1.3.0
  build_runner: ^2.2.0

```

*   floor - contém a biblioteca do framework para uso;
*   floor_generator - contém a biblioteca necessária para gerar classes do banco de dados;
*   builder_runner - permite gerar os arquivos de código-fonte.

### Entidade
Criada a classe *TaskEntity* que repreenta a tabela no banco de dados, onde a anotação entity (@Entity) a marca como uma clase de persistência e a anotação PrimaryKey (@Primarykey) marca o atributo *id* como chave primária desta tabela.

### Data Access Object (DAO)
É a camada responsável por gerenciar o acesso ao banco de dados SQLite. Desta forma, foi criado o diretório *repository* que possuem as classes responsáveis por esta gerencia.
A interface *IRepositoryDao* tem as funções **CRUD** onde são aplicadas suas funcionalidades de persistência. Já a classe *RepositoryDaoTask* estende a interface e implementa a funcionalidade de consultar os elementos da base de dados.

### Criando a Base de Dados
Depois de criada a classe responsável pelo relacinamento da aplicação com a base de dados, na qual precisará de um interpretador do objeto do aplicativo com o objeto do banco de dados, que é a entidade. Além da criação na camada de gerenciamento das funcionalidades para realização dos comandos para manipulação da base de dados utilizando a linguagem SQL, foi criada a **Classe abstrata** AppDatabase que estende de ***FloorDatabase*** a fim de mapear as classes que serão gerenciadas com entidades, implementado no arquivo **database.dart**.

```java
part 'database.g.dart';

@Database(version: 1, entities: [TaskEntity])
abstract class AppDatabase extends FloorDatabase {
  RepositoryDaoTask get repositoryDaoTask;
}

```

A partir do execução do compando PUB é gerado o arquivo extensivo **database.g.dart**, e a partir daí é possível acessar esta base através do método *databaseBuilder* da classe estática *FloorAppDatabase*.

## Wigdet Material (Scaffold)
As *screens* que são as páginas (ou telas) são desenvolvidas com o layout do framework [*Material Design*](https://m3.material.io/), que possui um designer pré-modulado que possui diretrizes adaptáveis, compomentes e ferramentas a fim de estrutura-las. Já o widget **Scaffold**, que é um destes componentes, permite definir outros widgets do Material Design Os padrões mais universais e de alto nível são os padrões de arquitetura . Os desenvolvedores podem implementar esses padrões em praticamente qualquer idioma. Ao contrário de outros padrões, eles podem ser usados ​​para projetar a arquitetura de um aplicativo.

Todas as screens desenvolvidas para o aplicativo foram utilizada o componente *Scaffold*, onde utilizamos os dois parâmetros mínimos deste widget, que são o *AppBar*, que é um componente que pode ser alocado na parte superior ou inferior, e *Body*, onde pode ser inserido outros componentes ao centro da screen, na qual consome maior parte, em sua maioria.

### Screen Principal (Lista de Tarefas)
A *screen principal* é a tela inicial do aplicativo, na qual é um widget ***StatefulWidget*** pois é utilizado algumas mudanças de estados dos componentes que precisam ser atualizados. A lista as tarefas cadastradas permitindo atualizar seu nível conforme a dificuldade. Conforme a dificuldade da tarefa é aplicável um calculo para determintar o quanto de trabalho será necessário para realizá-la. Além disso, quando esta não existem tarefas é apresentada uma mensagem sobre seu estado.

<img align="center" width="200" height="450" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/tela1_semtarefa.png">

O parâmetro AppBar é a barra que está na parte superior do widget, na qual apresenta um componente **Text** para ser utilizado como título (Title).
Já o *body*, como a lista de entidades retornadas pelo banco de dados que terá atualização constante, desta forma é utilizado o widget *FutureBuilder* a fim de obter o estado da *database* (base de dados) a fim de obter seu estado.

### Screen Form (Formulário)
Para a inserção de tarefas é necessário um documento para formalizar seu entrada, desta forma, foi implementado um widget que tem esta funcionalidade. O Widget ***Form*** que permite inserir componentes que possuem funções para receber dados e valida-los.

<img align="center" width="200" height="450" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/form_preenchido.png">

A *screen de formulário* é um widget ***StetefulWidget*** por utilizarmos validações para verificar o estado da database, nele são inseridos compoenentes a fim de validados e também verificado quais os componentes a serem apresentados no formulario conforme a operação CRUD a ser realizada.

<img align="center" width="200" height="450" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/valida_tipo.png">

## O Componente Tarefa (Task)
Como já mencionado, o Flutter nos permite estruturar Widget com outros widgets e partir deste injetá-los a outro, já que ele é um widget. É este conceito que é utilizado com o Widget ***Task*** que e um StatefulWidget também, já que necessita atualizar seu estado com os dados que estão sendo aplicados a componentes e realizar a passagem de dados a outro Widget. Abaixo segue como está estruturado este componente.

<img align="center" width="700" height="400" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/strutucture_model.png">

Abaixo segue o descritivo de como estão estes componentes:
*   Stack - é o componente principal que "empilha" os widgets que o compõem;
*   Container (Azul) - é o widget que é a base do cartão que compõem a tarefa;
*   Container (Branco) - é o widget que compõem quase por completo o widget, mas também é base para outros widgets;
    *   Container (ClipRRect) - é o widget que tem como "filha" o componente ClipRRect que permite trabalhar com objetos externos, este manipula imagem que está relacionada a tarefa;
    *   Column (SizedBox, Row) - é um widget que também tem a função de empilhar widgets, mas apresenta mais recursos para parametriza-los, nele existe mais duas filhas, que são o SizedBox que possuí um componente Text que permite a inserção da descrição da tarefa, e o componente Row, que é um widget que alinha os componentes de modo horizontal, onde são implementados widgets do tipo Icon;
    *   SizedBox (ElevedButton) - é um widget do tipo container, mas que não tem tantas funcionalidades como o widget de mesmo nome, nele está inserido o widget ElevedButton que é do tipo botão para implementação da lógica para atribuir a execução da tarefa conforme sua dificuldade;
*   Row - é o widget que alinha os componentes de modo horizontal, na qual possuem dois componentes;
    *   Padding (LinearProgressIndicator) - é um widget que permite inserir uma margem a ser aplicada para alinhar o componente, como filha ele possuí o componente LinearProgressIndicator que mostra uma barra de progressão;
    *   Padding (Text) - é um widget de alinhamento de componente, que tem um componente filho de texto (Text).








## Agradecimentos
Obrigado por ter acompanhado aos meus esforços no desenvolvimento de um aplicativo móvel utilizando o Flutter :octocat:

Como diria um velho mestre:
> *"Cedo ou tarde, você vai aprender, assim como eu aprendi, que existe uma diferença entre CONHECER o caminho e TRILHAR o caminho."*
>
> *Morpheus - The Matrix*