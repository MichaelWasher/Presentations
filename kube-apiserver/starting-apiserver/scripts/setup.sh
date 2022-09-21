#!/bin/bash
# This script can be used to setup the required resources and binaries for running testing

source ./env_vars.sh

# Setup KubeAPI
if [[ -f $KUBE_APISERVER ]] ; then
  echo "Using the kube-apiserver located at $KUBE_APISERVER"
else
  echo "Unable to locate a kube-apiserver within the resource directory. Returning"
fi

# Configure Certificates
echo "Configuring Certificates"
cd ${PKI}

# Create CAcert to be shared for all communication
openssl req -nodes -x509 -newkey rsa:2048  -config san.cnf  -keyout ca.key -out ca.crt -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=root/emailAddress=sample@sample.com"

# Generate CSR and Sign
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout server.key -out server.csr -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -extfile ./san.cnf -extensions v3_req

# Create KubeConfig
export KUBECONFIG="${PKI}/kubeconfig"
export CA_DATA=`cat ca.crt | base64`
export KUBECONFIG_CERT_DATA=`cat server.crt | base64`
export KUBECONFIG_KEY_DATA=`cat server.key  | base64`

cat kubconfig_template | envsubst > kubeconfig
cd -

# Setup Deployments
echo "##############################################"
echo "To start using the cluster"
echo "----------------------------------------------"
echo "1) Set the KUBECONFIG environment variable to point at the kubeconfig file located at ${KUBECONFIG}"
echo "3) Start the ETCD Server with the start_etcd.sh script"
echo "4) Start the KubeAPI Server with the start_apiserver.sh script"
