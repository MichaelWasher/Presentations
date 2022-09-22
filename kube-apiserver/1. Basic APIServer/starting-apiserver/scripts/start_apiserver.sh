#!/bin/bash
# This script is used to start the KubeAPIServer

source ./env_vars.sh

export DEFAULT_ADMISSION_PLUGINS="NamespaceLifecycle,LimitRanger,ServiceAccount,TaintNodesByCondition,PodSecurity,Priority,DefaultTolerationSeconds,DefaultStorageClass,StorageObjectInUseProtection,PersistentVolumeClaimResize,RuntimeClass,CertificateApproval,CertificateSigning,CertificateSubjectRestriction,DefaultIngressClass,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota"


"$KUBE_APISERVER"  \
--disable-admission-plugins=${DEFAULT_ADMISSION_PLUGINS} \
--advertise-address="${IP}" \
--allow-privileged=true \
--authorization-mode=AlwaysAllow \
--client-ca-file="${CA}" \
--enable-bootstrap-token-auth=true \
--etcd-servers=https://"${IP}":2379 \
--etcd-cafile="${ETCD_CA}" \
--etcd-certfile="${ETCD_SERVER_CERT}"  \
--etcd-keyfile="${ETCD_SERVER_KEY}" \
--service-account-issuer="${SA_ISSUER}" \
--service-account-key-file="${ETCD_SERVER_CERT}" \
--service-account-signing-key-file="${ETCD_SERVER_KEY}" \
--tls-cert-file="${ETCD_SERVER_CERT}" \
--tls-private-key-file="${ETCD_SERVER_KEY}"

# /--cert-dir="${KUBERNETES_CERT_DIR}" \
