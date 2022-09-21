
# Communicate with the ETCD using certificates
ETCDCTL_API=3 etcdctl --endpoints 127.0.0.1:2379 \
   --cert=${ETCD_SERVER_CERT} \
   --key=${ETCD_SERVER_KEY} \
   --cacert=${ETCD_CA} \
   member list