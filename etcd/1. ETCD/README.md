# Starting a Single-Node ETCD instance

In Kubernetes, etcd serves as a distributed key-value store, essential for storing configuration data, cluster state, and metadata. It provides reliable and consistent data access, vital for cluster management and coordination.

The simplest form of running etcd is a Single-Node etcd instance, which involves setting up a standalone etcd server on a single machine. This configuration is suitable for development or testing environments and doesn't provide high availability or fault tolerance.

To run a single-node etcd cluster, run the `start_etcd.sh` script in the current working directory.

NOTE that this script requires the ETCD binary to be located within your systems PATH.

To test connectivity with the running ETCD server: 
```
# ETCD Health: 
etcdctl --endpoints 127.0.0.1:2379 --write-out=table endpoint health"

# ETCD Endpoints: 
etcdctl --endpoints 127.0.0.1:2379 --write-out=table member list

# ETCD Endpoints Status: 
etcdctl --endpoints 127.0.0.1:2379 --write-out=table endpoint status
```