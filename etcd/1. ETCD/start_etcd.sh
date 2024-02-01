#!/bin/bash
# This script is used to start the ETCD

echo "ETCD will be started shortly. Please open another terminal to run any of the following comamnds to interract with the ETCD server."
echo "We are running the ETCDv3 API, to instruct the 'etcdctl' tool to use this version. We MUST set ETCDCTL_API=3."
echo "> export ETCDCTL_API=3"
echo "Check the:"
echo " > ETCD Health: etcdctl --endpoints 127.0.0.1:2379 --write-out=table endpoint health"
echo " > ETCD Endpoints: etcdctl --endpoints 127.0.0.1:2379 --write-out=table member list"
echo " > ETCD Endpoints Status: etcdctl --endpoints 127.0.0.1:2379 --write-out=table endpoint status"
echo ""
echo "Using ETCD:"
echo " > PUT Key-Value to ETCD: etcdctl --endpoints=http://127.0.0.1:2379 put mykey myvalue"
echo " > GET Key-Value to ETCD: etcdctl --endpoints=http://127.0.0.1:2379 get mykey"

echo "Press Enter to start ETCD"
read 

echo "Starting ETCD..."
echo "Press 'ctrl + c' to close the ETCD instance"
etcd  --config-file=./etcd-config.yaml