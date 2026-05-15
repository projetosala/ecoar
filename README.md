# Ecoar - A Lenda do Carcará

`Ecoar - A Lenda do Carcará` é um jogo 2D em Godot com foco em plataforma, exploração e educação ambiental. A aventura acompanha um turista guiado pelo Carcará por diferentes cenários de Alagoas, misturando fauna local, memória histórica e problemas ambientais reais.

## Visão Geral

Ao longo da campanha, o jogador atravessa mapas inspirados em cidades alagoanas, conversa com personagens, enfrenta obstáculos e inimigos, coleta aves e desbloqueia novas áreas. O projeto já possui início, progressão entre regiões e encerramento com créditos.

Temas presentes no jogo:

- preservação ambiental;
- fauna alagoana;
- memória e identidade local;
- poluição e degradação urbana;
- impactos da extração de sal-gema em Maceió.

## O Que Já Existe No Projeto

### Fluxo principal

- menu inicial com `Start`, `Credits`, `Quit` e opções de áudio;
- sistema de continuação por save local;
- transições entre cenas;
- créditos ao final da jornada.

### Regiões e fases implementadas

#### 1. Maravilha

- `1-Cidade.tscn`: introdução da aventura e chegada ao município;
- `1-Museu.tscn`: visita ao museu com guia e contexto histórico;
- `1-Caatinga.tscn`: trecho de plataforma no período pré-histórico;
- `1-Cidade-2.tscn`: retorno e ligação para a próxima cidade.

Nesta parte, a narrativa apresenta a missão principal: resgatar aves que se perderam no tempo enquanto o Carcará explica a importância ambiental e histórica da região.

#### 2. Arapiraca

- `2-Mangabeiras.tscn`;
- `2-Centro.tscn`;
- `2-Bosque.tscn`;
- `2-LagoPerucaba.tscn`.

Arapiraca amplia a exploração com novos cenários, diálogos sobre a cidade e desafios ligados a poluição, lixo e navegação entre áreas. O mapa do Lago da Perucaba também utiliza checkpoints.

#### 3. Maceió

- `MundauBebedouro.tscn`;
- `Orla.tscn`.

O trecho final aborda problemas como língua negra e os impactos da extração de sal-gema em bairros de Maceió. A campanha termina em um confronto final e segue para os créditos.

## Mecânicas Principais

- movimentação lateral e pulo;
- sistema de vidas com 3 corações;
- inimigos com dano por contato;
- derrota de inimigos pulando sobre eles;
- diálogos guiados por caixas de texto;
- coleta de aves com tela informativa;
- banners de identificação das cidades;
- pause menu dentro das fases;
- botões touchscreen para suporte a telas móveis.

## Controles

No teclado, o projeto usa majoritariamente as ações padrão do Godot:

- `Seta para a esquerda` e `Seta para a direita`: mover;
- `Seta para cima`: pular;
- `Enter`, `Espaço`, clique/toque e `X`: avançar diálogos e interações (`ui_accept`);
- `Home`: abrir pausa durante a fase.

Também existem botões na tela para movimento, pulo, interação e pausa, o que indica suporte pensado para mobile.

## Save E Progressão

O jogo salva a cena atual em `user://save.dat`.

- Se o arquivo existir, o botão `Start` continua da última cena salva.
- Se não existir save, o jogo começa em `Assets/1-Maravilha/1-Cidade.tscn`.
- O botão de reinício no menu remove o save local.
- Ao final do jogo, o save também é apagado antes de abrir os créditos.

## Estrutura Do Projeto

```text
.
├── Assets/
│   ├── 1-Maravilha/        # primeira região e fases ligadas a Maravilha
│   ├── 2-Arapiraca/        # segunda região e fases de Arapiraca
│   ├── 3-Maceió/           # terceira região e encerramento
│   ├── Menu/               # menu inicial, opções e créditos
│   ├── Player/             # personagem, HUD e botões de controle
│   ├── Songs/              # trilhas e áudios
│   └── Utils/              # transições, save, inimigos e utilitários
├── android/build/          # estrutura de exportação Android
├── project.godot           # arquivo principal do projeto Godot
└── README.md
```

Autoloads configurados em `project.godot`:

- `SceneTransition`: transições visuais entre cenas;
- `Save`: persistência simples da cena atual;
- `Global`: estado global usado por checkpoints.

## Tecnologias

- Godot Engine;
- GDScript;
- Aseprite e assets 2D rasterizados;
- exportação Android já iniciada dentro do repositório.

## Como Rodar

### Pelo editor Godot

1. Instale o **Godot 3.5.1** ou outra versão 3.5.x compatível
2. Abra o Godot.
3. Escolha `Import` e selecione o arquivo [`project.godot`](project.godot).
4. Abra o projeto importado.
5. Execute pela cena principal configurada no projeto

## Release Web

O fluxo automatizado de publicação web via tag está documentado em [`docs/release-web.md`](docs/release-web.md).

## Créditos

Os créditos abaixo foram transcritos da própria tela de créditos do jogo:

- Programadores: Alex da Silva Custódio, Namur Sebastião da Silva e Tiago Vinícius Guimarães Santos;
- Pixel Art: Gabriel Anderson Alves da Silva e Alex da Silva Custódio;
- Design, roteiro e logo: Carlos Eduardo Ferreira da Silva;
- Música: Alex da Silva Custódio;
- Orientador: Geraldo Ramires de Lima Júnior.

## Recursos De Terceiros

O próprio jogo credita os seguintes assets externos, com origem em `itch.io`:

- `Cave Platformer Tileset [16x16][FREE]` por RottingPixels;
- `SunnyLand Enemies Pack 1` por ansimuz;
- `Sunny Land - Pixel Game Art` por ansimuz;
- `Kings and Pigs` por Pixel Frog;
- `Free Sky Backgrounds` por Free Game Assets (GUI, Sprite, Tilesets).

## Licença

O código deste repositório está acompanhado de [`LICENSE`](LICENSE). Recursos de terceiros mantêm seus respectivos créditos e eventuais termos próprios de uso.
