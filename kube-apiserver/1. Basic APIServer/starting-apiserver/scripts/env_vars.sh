#!/bin/bash
# This script is used as a configuration point to provide settings without having to make changes to the other scripts.

# TODO: Should work out the workdir with a better way but for now it works
export ROOT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/.."
export IP=127.0.0.1

# Security / Certificate Environments
export PKI="${ROOT_DIR}/pki"
export CA="${PKI}/ca.crt"
export ETCD_CA="${PKI}/ca.crt"
export ETCD_SERVER_KEY="${PKI}/server.key"
export ETCD_SERVER_CERT="${PKI}/server.crt"

# TODO: This works by binaries of Kubernetes tools present in the `bin/` folder of the Git base
export KUBE_APISERVER=../../../../bin/kube-apiserver
export KUBERNETES_CERT_DIR="${PKI}/kubernetes"
export SA_ISSUER=https://kubernetes.default.svc.cluster.local    