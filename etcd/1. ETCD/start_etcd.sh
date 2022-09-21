#!/bin/bash
# This script is used to start the ETCD

echo "Starting ETCD..."
etcd --advertise-client-urls=http://127.0.0.1:2379 --listen-client-urls=http://127.0.0.1:2379

echo "ETCD Started"
echo "We are running the ETCDv3 API, to instruct the `etcdctl` tool to use this version. We MUST set ETCDCTL_API=3."
echo "> export ETCDCTL_API=3"
echo "Check the:"
echo " > ETCD Health: etcdctl --endpoints 127.0.0.1:2379 --write-out=table endpoint health"
echo " > ETCD Endpoints: etcdctl --endpoints 127.0.0.1:2379 --write-out=table member list"
echo " > ETCD Endpoints Status: etcdctl --endpoints 127.0.0.1:2379 --write-out=table endpoint status"

