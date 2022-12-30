## Aplicativo para lista de tarefas - Projeto_Flutter_One
> Aplicativo móvel desenvolvido para apresentação de trabalho de conclusão de curso - Mobile Flutter

[![Flutter Badge](https://img.shields.io/badge/-Flutter-000?style=flat-square&logo=Flutter&logoColor=white&link=https://flutter.dev/)](https://flutter.dev/)
[![Dart Badge](https://img.shields.io/badge/-Dart-blue?style=flat-square&logo=Dart&logoColor=white&link=https://dart.dev/)](https://dart.dev/)

<img align="right" width="400" height="250" src="https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/flutter_dart.png">

## Descrição da Aplicação
A aplicação móvel desenvolvido para a listagem de tarefas a serem realizadas para o projeto Startup One (FIAP), na qual possui uma lista que as ordena de modo vertical e um formulário para informar sua descrição, caminho da imagem e grau de dificuldade a fim de ser avaliada pelo seu proprietário.

![Lista de Tarefas](https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/lista_tarefas.png)

## Sobre o uso do Widgets (Flutter)
Antes de descrever o que são ***Widgets***, vamos entender o que é o framework **Flutter**. O Flutter foi desenvolvido pela Google para criação de aplicações móveis multiplataformas utilizando uma única base de código, baseada na linguagem **Dart**. 
O Dart é uma linguagem de programação fortemente tipada, atualmente ela é considerada uma linguagem multi-paradigma, embora a linguagem apresente fortes estruturas típicas de linguagens orientadas a objeto.
Já o Flutter está ganhando muito respeito pelo mercado por sua robusteis e vasta documentação, além de ser muito clamado por sua facilidade no desenvolvimento de aplicações com uma interface intuitiva e agradável.
Toda interface de um aplicativo desenvolvido com o Flutter que é criada com base em um conjunto de Widgets. Basicamente, um widget é um componente visual para definir a interface de um aplicativo.
Os widgets do Flutter permite estruturar componentes para montaem avançada de aplicativos IOS, Android, Web, Windows, macOS e Linux. São altamente personalizáveis e funcionam com qualquer componente de layout. Além disso, são imutáveis onde não podem ser alterados, sendo suas propriedades finais e só podem ser definidas quando o widget é inicializado, permitindo mante-los leves.

### Wigdet Material (Scaffold)
As *screens* que são as páginas (ou telas) são desenvolvidas com o layout do framework [*Material Design*](https://m3.material.io/), que possui um designer pré-modulado que possui diretrizes adaptáveis, compomentes e ferramentas a fim de estrutura-las. Já o widget **Scaffold**, que é um destes componentes, permite definir outros widgets do Material Design Os padrões mais universais e de alto nível são os padrões de arquitetura . Os desenvolvedores podem implementar esses padrões em praticamente qualquer idioma. Ao contrário de outros padrões, eles podem ser usados ​​para projetar a arquitetura de um aplicativo
Todas as screens desenvolvidas para o aplicativo foram utilizada o componente *Scaffold*, onde utilizamos os dois parâmetros mínimos deste widget, que são o *AppBar*, que é um componente que pode ser alocado na parte superior ou inferior, e *Body*, onde pode ser inserido outros componentes ao centro da screen, na qual consome maior parte, em sua maioria.

#### Screen Principal (Lista de Tarefas)
A *screen principal* é a tela inicial do aplicativo, na qual lista as tarefas cadastradas permitindo atualizar seu nível conforme a dificuldade. Conforme a dificuldade da tarefa é aplicável um calculo para determintar o quanto de trabalho será necessário para realizá-la. Além disso, quando esta não existem tarefas é apresentada uma mensagem sobre seu estado.

![Main Screen](https://github.com/willdkdevj/first_project_flutter/blob/master/assets/doc/flutter_dart.png)

O parâmetro AppBar é constituído de


## Aplicação do Design Patterns no Projeto
Cada uma destas categorias possuem seus próprios mecanismos, que são sub-categorias, que possuem funcionalidades distintas conforme a estrutura de código a ser implementada. 
Neste projeto, eu utilizei somente a **Categoria Comportamental** a fim de deixar o código mais coeso e simples, na qual o primeiro a ser utilizado foi a sub-categoria **Strategy**.
### State Pattern
No cenário em que ela foi aplicada foi no contexto de vários impostos, como ICMS, ISS, entre outros, onde para cada imposto a uma alíquota a ser calculada. Desta forma, poderiamos criar um método que recebesse o orçamento e calculasse aliquota através de um ENUM que representaria o imposto. Mas veja, este método poderia ficar gigante, pois a cada novo imposto seria necessário incluir mais uma cadeia no **IF** ou **SWITCH**.

Sempre que uma nova funcionalidade for implementada, o ideal é que possamos criar código novo e editar o mínimo possível de código já existente. Este é um dos principais pontos do princípio Aberto-Fechado *(Open-Closed Principle)* do **SOLID**. Ao editar código existente, podemos acabar quebrando funcionalidades já implementadas e funcionais.
Desta forma, seguindo este conceitos podemos colocar os cálculos (regras) encapsulados em métodos em classes distintas, uma para cada imposto.


## Agradecimentos
Obrigado por ter acompanhado aos meus esforços no desenvolvimento de um aplicativo móvel utilizando o Flutter :octocat:

Como diria um velho mestre:
> *"Cedo ou tarde, você vai aprender, assim como eu aprendi, que existe uma diferença entre CONHECER o caminho e TRILHAR o caminho."*
>
> *Morpheus - The Matrix*