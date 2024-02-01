# Starting a Single-Node ETCD instance with TLS

In Kubernetes, etcd is the core storage mechanism for cluster state. As such, all communications are encrypted to enusre the TLS chain of trust. It is common (and seen in OpenShift) that ETCD will enforce mTLS communication, issuing certificates to all users and 

For this step, we will be investigating configuring an ETCD instance with mTLS and a self-signed certificate authority.

Steps:
1) create_certs.sh
2) start_etcd.sh
3) perform_query.sh