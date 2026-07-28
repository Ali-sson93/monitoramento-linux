# Monitoramento Linux

Projeto simples em Bash para monitoramento básico do sistema Linux.

## O que o script verifica

- Uso de disco
- Uso de memória RAM
- Uso de CPU
- Conectividade com a internet
- Geração de relatório em arquivo `.log`

## Tecnologias usadas

- Linux
- Bash
- Comandos do sistema
- curl
- awk
- df
- free

## Como executar

Dê permissão de execução:

```bash
chmod +x monitoramento.sh
```

Execute o script:

```bash
./monitoramento.sh
```

## Estrutura do projeto

```text
monitoramento-linux/
├── monitoramento.sh
├── README.md
├── .gitignore
└── relatorios/
```

## Observação

A pasta `relatorios/` é usada para armazenar os relatórios gerados pelo script.

Os arquivos `.log` não são enviados para o GitHub porque são gerados automaticamente.
