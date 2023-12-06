#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Execute o script como usuário root (ou sudo)"
  exit
fi

cat /etc/hosts | grep -i "127.0.0.1 giropops-senhas.kubernetes.docker.internal" >> /dev/null || echo "127.0.0.1 giropops-senhas.kubernetes.docker.internal" >> /etc/hosts
cat /etc/hosts | grep -i "127.0.0.1 alertmanager.kubernetes.docker.internal" >> /dev/null || echo "127.0.0.1 alertmanager.kubernetes.docker.internal" >> /etc/hosts
cat /etc/hosts | grep -i "127.0.0.1 prometheus.kubernetes.docker.internal" >> /dev/null || echo "127.0.0.1 prometheus.kubernetes.docker.internal" >> /etc/hosts
cat /etc/hosts | grep -i "127.0.0.1 grafana.kubernetes.docker.internal" >> /dev/null || echo "127.0.0.1 grafana.kubernetes.docker.internal" >> /etc/hosts

echo "Hosts adicionados!"