# ETCD

In Kubernetes, etcd serves as a distributed key-value store, essential for storing configuration data, cluster state, and metadata. It provides reliable and consistent data access, vital for cluster management and coordination.

The simplest form of running etcd is a Single-Node etcd instance, which involves setting up a standalone etcd server on a single machine. This configuration is suitable for development or testing environments and doesn't provide high availability or fault tolerance.

Production deployments of etcd involve running 3 (or 5 in legacy deployments) instances on separated Machines, with mTLS configured for the etcd instances to communicate with eachother. The etcd instances perform atomic operations and ensure integrity ithin the cluste rusing the RAFT algorithm.
---

OpenShift Repo: https://github.com/openshift/etcd
Upstream Repo: https://github.com/etcd-io/etcd
Configuration Options: https://etcd.io/docs/v3.5/op-guide/configuration/
---

# Getting Started:
http://play.etcd.io/install
