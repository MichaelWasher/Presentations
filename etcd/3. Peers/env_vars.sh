#!/bin/bash
# This script is used as a configuration point to provide settings without having to make changes to the other scripts.

# Security / Certificate Environments
export PKI="./"
export CA=${PKI}/ca.crt
export ETCD_CA=${PKI}/ca.crt
export ETCD_SERVER_KEY=${PKI}/server.key
export ETCD_SERVER_CERT=${PKI}/server.crt