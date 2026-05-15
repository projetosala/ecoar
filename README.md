# Ecoar - Build Web

Esta branch (`web`) armazena o build web publicado do jogo **Ecoar - A Lenda do Carcará**.

O objetivo desta branch aqui não é manter o código-fonte do projeto, e sim os arquivos gerados para execução no navegador.

## O que tem nesta branch

- `index.html`: página principal que carrega o jogo.
- `index.js`: runtime JavaScript gerado pelo export do Godot.
- `index.wasm`: binário WebAssembly usado pela engine.
- `index.pck`: pacote com os assets e dados do jogo.
- `index.icon.png`, `index.apple-touch-icon.png`, `index.png`: ícones e imagens auxiliares do build.
- `index.audio.worklet.js`: suporte de áudio para execução no navegador.

## Sobre o build

Este conteúdo corresponde a um **export web do Godot**, pronto para ser hospedado em um servidor estático.

Para rodar localmente, você pode usar Docker Compose:

```bash
docker compose up
```

Se preferir iniciar em background:

```bash
docker compose up -d
```

Depois, abra:

```text
http://localhost:8080
```

Para parar o serviço:

```bash
docker compose down
```

Se preferir rodar sem Docker, também dá para servir os arquivos com um servidor HTTP simples:

```bash
python3 -m http.server 8000
```

Depois, abra:

```text
http://localhost:8000
```

## Observações

- Alguns navegadores bloqueiam partes do funcionamento quando os arquivos são abertos diretamente pelo sistema (`file://`), por isso use um servidor HTTP.
- O arquivo `compose.yml` usa `nginx:alpine` para servir o build localmente sem depender de `python3`.
- Alterações nesta branch devem ser, de preferência, atualizações de novos builds exportados.
- O desenvolvimento do jogo e a manutenção do código-fonte devem acontecer na branch principal do projeto (`main`).
