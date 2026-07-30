# Monitoramento Linux

Projeto autoral em Bash para monitoramento básico de recursos de um sistema Linux.

O script coleta informações sobre disco, memória, CPU e conectividade, gera alertas com base em limites definidos e mantém um histórico em arquivo de log.

## O que o script verifica

- Uso de disco
- Uso de memória RAM
- Uso de CPU
- Conectividade com a internet
- Geração de relatório com histórico na pasta relatórios/

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
## Automação com systemd

O projeto inclui os arquivos:

- `systemd/monitoramento-linux.service`
- `systemd/monitoramento-linux.timer`

Copie os arquivos para o diretório do systemd:

```bash
sudo cp systemd/monitoramento-linux.service /etc/systemd/system/
sudo cp systemd/monitoramento-linux.timer /etc/systemd/system/

## Observação

A pasta `relatorios/` é usada para armazenar os relatórios gerados pelo script.

Os arquivos `.log` não são enviados para o GitHub porque são gerados automaticamente.
