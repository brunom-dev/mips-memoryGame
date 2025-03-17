# Jogo da Memória em Assembly MIPS

## Súmario
- [Sobre o projeto](#sobre-o-projeto)
- [Equipe](#equipe)
- [Simulador](#simulador)
- [Funcionamento do jogo](#funcionamento-do-jogo)
- [Implementação do Jogo](#implementação-do-jogo)

  

## Sobre o projeto
  Este projeto foi desenvolvido na disciplina de Arquitetura de Computadores do curso de Bacharelado em Ciência da Computação na Universidade Federal do Cariri (UFCA). Seu objetivo é implementar um Jogo da Memória em Assembly MIPS, utilizando um tabuleiro 4x4 onde cada posição contém um número, e cada número aparece em duas cartas diferentes. O funcionamento do jogo consiste em selecionar duas posições por vez; se as cartas forem iguais, elas permanecem reveladas; caso contrário, são novamente ocultadas. O jogo encerra quando todos os pares são descobertos.
  
  
  
## Equipe
  - [Bruno Macedo (GitHub)](https://github.com/brunom-dev);
  - [Sebastião Soares (GitHub)](https://github.com/sebastiaosoares);
  - **Professor:** [Ramon Nepomuceno (e-mail institucional)](mailto:ramon.nepomuceno@ufca.edu.br).
  
  
  
## Simulador
  O jogo foi desenvolvido e testado utilizando o MARS (MIPS Assembler and Runtime Simulator), um ambiente que permite simular a execução de programas Assembly MIPS. ([Download](https://dpetersanderson.github.io/download.html) - Link externo).

  

## Funcionamento do jogo
  O jogo da memória é baseado na mecânica tradicional, onde o jogador precisa encontrar pares de cartas iguais. No início, todas as cartas estão ocultas e são organizadas em uma matriz de 4x4, contendo 8 pares de símbolos. Neste caso, os símbolos são números inteiros.
  
  ### Como jogar ?
  1. O jogador escolhe duas cartas por vez, informando suas coordenadas (linha e coluna).
  2. Para cada nova jogada, o usuário terá que inserir:
       - A linha e a coluna da primeira carta
       - A linha e a coluna da segunda carta
  3. Se as cartas escolhidas forem iguais, elas permanecem visíveis.
  4. Se forem diferentes, ambas são ocultadas novamente.
  5. O jogo continua até que todas as 8 duplas de cartas sejam encontradas.

  

## Implementação do jogo

