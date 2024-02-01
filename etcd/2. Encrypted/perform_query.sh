# /bin/bash
set -x

# Setting variables
export PKI="./pki"
export CA=${PKI}/ca.crt
export ETCD_CA=${PKI}/ca.crt
export ETCD_SERVER_KEY=${PKI}/server.key
export ETCD_SERVER_CERT=${PKI}/server.crt

# Communicate with the ETCD using certificates
ETCDCTL_API=3 etcdctl --endpoints 127.0.0.1:2379 \
   --cert=${ETCD_SERVER_CERT} \
   --key=${ETCD_SERVER_KEY} \
   --cacert=${ETCD_CA} \
   --write-out=table \
   endpoint health

ETCDCTL_API=3 etcdctl --endpoints 127.0.0.1:2379 \
   --cert=${ETCD_SERVER_CERT} \
   --key=${ETCD_SERVER_KEY} \
   --cacert=${ETCD_CA} \
   --write-out=table \
   member list
