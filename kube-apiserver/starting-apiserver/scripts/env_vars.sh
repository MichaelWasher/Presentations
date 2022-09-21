#!/bin/bash
# This script is used as a configuration point to provide settings without having to make changes to the other scripts.

# TODO: Should work out the workdir with a better way but for now it works
export ROOT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/.."
export IP=127.0.0.1

# Security / Certificate Environments
export PKI="${ROOT_DIR}/pki"
export CA=${PKI}/ca.crt
export ETCD_CA=${PKI}/ca.crt
export ETCD_SERVER_KEY=${PKI}/server.key
export ETCD_SERVER_CERT=${PKI}/server.crt

export SA_ISSUER=https://kubernetes.default.svc.cluster.local    
export DEFAULT_ADMISSION_PLUGINS="NamespaceLifecycle,LimitRanger,ServiceAccount,TaintNodesByCondition,PodSecurity,Priority,DefaultTolerationSeconds,DefaultStorageClass,StorageObjectInUseProtection,PersistentVolumeClaimResize,RuntimeClass,CertificateApproval,CertificateSigning,CertificateSubjectRestriction,DefaultIngressClass,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota"

# Setup Environments
export RESOURCE_DIR="${ROOT_DIR}/resources/"
export KUBE_APISERVER="${RESOURCE_DIR}/kube-apiserver"
export KINE_BIN="${RESOURCE_DIR}/kine_bin"
export KINE_DIR="${RESOURCE_DIR}/kine"

# Kine Configuration
export KINE_HEALTH_ENDPOINT="/kubernetes.io/health"
export KINE_MUSTGATHER_DIR="${ROOT_DIR}/must-gather"
export KINE_RESOURCE_BINDING="${KINE_DIR}/assets/resource-map.yaml"
