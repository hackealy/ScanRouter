#!/bin/bash

# Identifica o IP do roteador
RHOST=$(ip route | grep default | awk '{print $3}')

# Executa o RouterSploit e exibe a lista de módulos de vulnerabilidades
./rsf.py -p

# Define o endereço IP do roteador como alvo
./rsf.py set RHOSTS $RHOST

# Executa todos os módulos de verificação de vulnerabilidades disponíveis e salva o resultado em um arquivo
./rsf.py use scanner/autopwn
./rsf.py set target 0
./rsf.py run | tee resultado_scan.txt
