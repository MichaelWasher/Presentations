#!/bin/bash
# This script is used to start the KubeAPIServer

source ./env_vars.sh

etcd \
  --name=etcd0 \
  --initial-cluster-state=new \
  --log-level=debug \
  --cert-file=${ETCD0_SERVER}.crt \
  --key-file=${ETCD0_SERVER}.key \
  --listen-peer-urls=https://127.0.0.1:2380 \
  --initial-advertise-peer-urls=https://127.0.0.1:2380 \
  --initial-cluster="etcd0=https://127.0.0.1:2380,etcd1=https://127.0.0.1:2381,etcd2=https://127.0.0.1:2382"  \
  --peer-trusted-ca-file=${ETCD_CA}.crt \
  --peer-key-file=${ETCD0_SERVER}.key \
  --peer-cert-file=${ETCD0_SERVER}.crt \
  --trusted-ca-file=${ETCD_CA}.crt \
  --client-cert-auth \
  --advertise-client-urls=https://127.0.0.1:2370 \
  --listen-client-urls=https://127.0.0.1:2370  &

sleep 3
etcd \
  --name=etcd1 \
  --initial-cluster-state=new \
  --cert-file=${ETCD1_SERVER}.crt \
  --key-file=${ETCD1_SERVER}.key \
  --listen-peer-urls=https://127.0.0.1:2381 \
  --initial-advertise-peer-urls=https://127.0.0.1:2381 \
  --initial-cluster="etcd0=https://127.0.0.1:2380,etcd1=https://127.0.0.1:2381,etcd2=https://127.0.0.1:2382"  \
  --peer-trusted-ca-file=${ETCD_CA}.crt \
  --peer-key-file=${ETCD1_SERVER}.key \
  --peer-cert-file=${ETCD1_SERVER}.crt \
  --trusted-ca-file=${ETCD_CA}.crt \
  --client-cert-auth \
  --advertise-client-urls=https://127.0.0.1:2371 \
  --listen-client-urls=https://127.0.0.1:2371 &

sleep 3
  etcd \
  --name=etcd2 \
  --initial-cluster-state=new \
  --cert-file=${ETCD2_SERVER}.crt \
  --key-file=${ETCD2_SERVER}.key \
  --listen-peer-urls=https://127.0.0.1:2382 \
  --initial-advertise-peer-urls=https://127.0.0.1:2382 \
  --initial-cluster="etcd0=https://127.0.0.1:2380,etcd1=https://127.0.0.1:2381,etcd2=https://127.0.0.1:2382"  \
  --peer-trusted-ca-file=${ETCD_CA}.crt \
  --peer-key-file=${ETCD2_SERVER}.key \
  --peer-cert-file=${ETCD2_SERVER}.crt \
  --trusted-ca-file=${ETCD_CA}.crt \
  --client-cert-auth \
  --advertise-client-urls=https://127.0.0.1:2372 \
  --listen-client-urls=https://127.0.0.1:2372 &

