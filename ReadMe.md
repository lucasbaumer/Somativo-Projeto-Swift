# Sistema de Notificações em Swift (Protocol-Oriented Programming)

Alunos: Lucas Baumer, Matheus Kormann, Murilo Mayer

Este projeto demonstra a implementação de um sistema de notificações em Swift utilizando o paradigma Protocol-Oriented Programming (POP).

## Funcionalidades

* Definição de um protocolo `Notificavel` para representar canais de notificação.
* Implementação de structs `Email`, `SMS` e `PushNotification` que conformam ao protocolo `Notificavel`.
* Utilização de um array para armazenar objetos de diferentes tipos de canais de notificação.
* Implementação de um enum `TipoMensagem` e uma struct `Mensagem` para representar mensagens com diferentes tipos e conteúdos.
* Implementação de um enum `Prioridade` para mensagens, com os casos baixa, media e alta.

## Decisões de Design

* **Protocol-Oriented Programming (POP):** A utilização de POP permite criar um sistema de notificações flexível e extensível, onde novos tipos de canais de notificação podem ser adicionados facilmente, desde que conformem ao protocolo `Notificavel`.
* **Protocol Composition:** O uso de protocol composition permite armazenar objetos de diferentes tipos em um único array, desde que todos conformem ao protocolo `Notificavel`.
* **Enum `TipoMensagem` e Struct `Mensagem`:** A utilização de um enum e uma struct para representar mensagens permite organizar e estruturar as mensagens de forma clara e concisa.

## Como Executar

1.  Clone o repositório ou copie o código para um compilador Swift online (como o [Replit](https://replit.com/)).
2.  Execute o código.
3.  O programa exibirá as mensagens de notificação para cada canal no console.

## Desafios Adicionais (Implementados)

* **Prioridade de Notificação:** Foi adicionada uma propriedade `prioridade` ao protocolo `Notificavel` e implementada nas structs de canais de notificação.
* **Filtro de Canais:** Foi implementada uma função `filtrarCanais` que recebe um array de canais e um tipo específico de canal e retorna um novo array contendo apenas os canais do tipo especificado.
