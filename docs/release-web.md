# Release web

Este repositório agora possui uma workflow para gerar e publicar o build web sempre que uma tag no formato `web-vx.y.z` for enviada ao GitHub.

## O que a workflow faz

Quando uma tag como `web-v1.0.0` é publicada:

1. exporta o projeto Godot para HTML5;
2. publica o conteúdo do build na branch `web`.

O build publicado na branch `web` é o que deve ser usado como origem do GitHub Pages, em vez da `main`.

## Pré-requisitos

Antes do primeiro release, configure estes pontos no repositório do GitHub:

1. Em `Settings > Pages`, escolha `Deploy from a branch`.
2. Selecione a branch `web` e a pasta `/(root)`.
3. Em `Settings > Actions > General`, confirme que o `GITHUB_TOKEN` pode ter permissão de escrita em conteúdo do repositório, caso a organização use política mais restritiva.

## Como gerar uma nova release web

Com a branch `main` atualizada:

```bash
git checkout main
git pull origin main
git tag web-v1.0.0
git push origin web-v1.0.0
```

Depois do push da tag:

1. a action `Release Web` será executada;
2. a branch `web` será atualizada com o build estático;
3. o GitHub Pages passará a servir a nova versão publicada nessa branch.

## Convenção de versão

Use sempre o formato:

```text
web-vMAJOR.MINOR.PATCH
```

Exemplos válidos:

- `web-v1.0.0`
- `web-v1.2.4`
- `web-v2.0.0`

## Observações

- A workflow usa Godot `3.5.1`, seguindo a versão já registrada em `android/.build_version`.
- O repositório versiona `export_presets.template.cfg`, e a action gera `export_presets.cfg` em tempo de execução.
- Esse formato evita versionar diretamente o arquivo final de presets, o que reduz risco quando futuros presets Android exigirem configuração mais sensível.
- Se a branch `web` ainda não existir, a própria action cria essa branch no primeiro release.
