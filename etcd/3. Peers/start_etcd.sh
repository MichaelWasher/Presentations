#!/bin/bash
# This script is used to start the KubeAPIServer

source ./env_vars.sh

# set -x
for I in {0..2}; do
  echo "Press enter to start ETCD instance ${I}"
  read 

  cd "etcd-${I}"
  etcd  --config-file=./etcd-config.yaml >etcd.log  2>&1 & 
  cd ..
  echo "ETCD ${I} Started."
  echo "To review the log, see ./etcd-${I}/etcd.log"
done

echo "------------------------------"
echo "All ETCD instances have started. To experiment with the ETCD cluster, the 'etcdctl' directory contains client certificates to use."
echo "There is are some example ETCDCTL comands in the 'perform_query.sh' script. All ETCD instances should communicate using RAFT and queries to each of the instances should return the same result."
echo "The ETCD instances are ready to be separated onto different Machines and provide redundancy for high availability." 
echo "------------------------------"

echo ""
echo ""
echo "To close the ETCD instances, close this script with 'ctrl + c'."
echo "If this fails you may require cleaning up any remaining etcd processes."
echo ""
echo ""

sleep 100000