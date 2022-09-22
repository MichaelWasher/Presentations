#!/bin/bash
# This script is used to start the KubeAPIServer

source ./env_vars.sh

etcd \
  --name=kubernetes \
  --cert-file="${ETCD_SERVER_CERT}" \
  --key-file="${ETCD_SERVER_KEY}" \
  --trusted-ca-file="${ETCD_CA}"  \
  --client-cert-auth \
  --advertise-client-urls=https://127.0.0.1:2379 \
  --listen-client-urls=https://127.0.0.1:2379 &
