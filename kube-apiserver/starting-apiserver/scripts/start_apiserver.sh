#!/bin/bash
# This script is used to start the KubeAPIServer

source ./env_vars.sh

$KUBE_APISERVER  \
--advertise-address=${IP} \
--allow-privileged=true \
--authorization-mode=AlwaysAllow \
--client-ca-file=${CA} \
--enable-bootstrap-token-auth=true \
--etcd-servers=https://${IP}:2379 \
--etcd-cafile=${ETCD_CA} \
--etcd-certfile=${ETCD_SERVER_CERT}  \
--etcd-keyfile=${ETCD_SERVER_KEY} 