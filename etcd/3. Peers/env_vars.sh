#!/bin/bash
# This script is used as a configuration point to provide settings without having to make changes to the other scripts.

# Security / Certificate Environments

export ETCD_CLIENT_CA=client-ca
export ETCD_PEER_CA=peer-ca

# Client Serving Certificates
export ETCD0_CLIENT_CERT_SERV=etcd-0/client-serving
export ETCD1_CLIENT_CERT_SERV=etcd-1/client-serving
export ETCD2_CLIENT_CERT_SERV=etcd-2/client-serving

# PEER Certificates
export ETCD0_PEER_CERT_SERV=etcd-0/peer-serving
export ETCD1_PEER_CERT_SERV=etcd-1/peer-serving
export ETCD2_PEER_CERT_SERV=etcd-2/peer-serving