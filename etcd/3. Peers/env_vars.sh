#!/bin/bash
# This script is used as a configuration point to provide settings without having to make changes to the other scripts.

# Security / Certificate Environments
export PKI="./certs"
export CA=${PKI}/ca.crt
export ETCD_CA=${PKI}/ca

export ETCD0_SERVER=${PKI}/etcd0/server
export ETCD1_SERVER=${PKI}/etcd1/server
export ETCD2_SERVER=${PKI}/etcd2/server
