#!/bin/sh

BOARD_DIR="$(dirname $0)"

if [ ! -d "${BASE_DIR}/nfs" ]; then
  sudo mkdir ${BASE_DIR}/nfs
fi
sudo tar xvf ${BASE_DIR}/images/rootfs.tar -C ${BASE_DIR}/nfs