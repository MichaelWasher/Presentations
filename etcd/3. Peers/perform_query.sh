# /bin/bash
source ./env_vars.sh


# Communicate with the ETCD using certificates
ETCDCTL_API=3 etcdctl --endpoints 127.0.0.1:2370 \
   --cert=etcdctl.crt \
   --key=etcdctl.key \
   --cacert=${ETCD_CLIENT_CA}.crt \
   --write-out=table \
   member list

ETCDCTL_API=3 etcdctl --endpoints 127.0.0.1:2370,127.0.0.1:2371,127.0.0.1:2372 \
   --cert=etcdctl.crt \
   --key=etcdctl.key \
   --cacert=${ETCD_CLIENT_CA}.crt \
   --write-out=table \
   endpoint health
