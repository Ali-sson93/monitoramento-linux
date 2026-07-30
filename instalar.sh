#!/bin/bash

set -e

USUARIO_ATUAL="${SUDO_USER:-$USER}"
PASTA_PROJETO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_USUARIO="$(getent passwd "$USUARIO_ATUAL" | cut -d: -f6)"

echo "Usuário: $USUARIO_ATUAL"
echo "Projeto: $PASTA_PROJETO"
echo "Home: $HOME_USUARIO"

sudo tee /etc/systemd/system/monitoramento-linux.service > /dev/null <<EOF
[Unit]
Description=Monitoramento de recursos do sistema Linux
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
User=$USUARIO_ATUAL
Environment=HOME=$HOME_USUARIO
WorkingDirectory=$PASTA_PROJETO
ExecStart=$PASTA_PROJETO/monitoramento.sh
EOF

sudo cp "$PASTA_PROJETO/systemd/monitoramento-linux.timer" \
    /etc/systemd/system/monitoramento-linux.timer

sudo systemctl daemon-reload
sudo systemctl enable --now monitoramento-linux.timer

echo "Instalação concluída."
systemctl status monitoramento-linux.timer --no-pager
