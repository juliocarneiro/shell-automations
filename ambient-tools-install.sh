#!/bin/bash

GO=go1.17.5.linux-amd64.tar.gz
bashRC=/root/.bashrc

if [ -e "$GO" ]; then
    echo "----------------------------------------------"
    echo "O arquivo $GO ja existe existe, instalando..."
    echo "----------------------------------------------"
    rm -rf /usr/local/go && tar -C /usr/local -xzf $GO
    echo 'export PATH=$PATH:/usr/local/go/bin' >>$bashRC
    echo "Go instalado com sucesso!"
else
    echo "----------------------------------------------"
    echo "Baixando Go..."
    wget https://go.dev/dl/$GO
    echo "----------------------------------------------"
    echo "Instalando Go..."
    rm -rf /usr/local/go && tar -C /usr/local -xzf $GO
    echo 'export PATH=$PATH:/usr/local/go/bin' >>$bashRC
    echo "----------------------------------------------"
    echo "Go instalado com sucesso!"
    echo "----------------------------------------------"
fi

echo "----------------------------------------------"
echo "Atualizando repos..."
echo "----------------------------------------------"
apt-get update

echo "----------------------------------------------"
echo "Instalando Python3..."
echo "----------------------------------------------"
apt-get install -y python3-pip

echo "----------------------------------------------"
echo "Instalando jq..."
echo "----------------------------------------------"
apt-get install -y jq

echo "----------------------------------------------"
echo "Config de ambiente feita com sucesso!"
echo "----------------------------------------------"
