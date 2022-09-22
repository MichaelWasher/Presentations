# /bin/bash
source ./env_vars.sh

# Configure Certificates
echo "Configuring Certificates"

# Create CAcert to be shared for all communication
openssl req -nodes -x509 -newkey rsa:2048  -config san.cnf  -keyout ${ETCD_CA}.key -out ${ETCD_CA}.crt -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=root/emailAddress=sample@sample.com"

# Generate CSR and Sign.
### NOTE: >> All ETCD Certificates are signed by the same CA <<
# ETCD0
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout "${ETCD0_SERVER}.key" -out "${ETCD0_SERVER}.csr" -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in "${ETCD0_SERVER}.csr" -CA "${ETCD_CA}.crt" -CAkey "${ETCD_CA}.key" -CAcreateserial -out "${ETCD0_SERVER}.crt" -extfile ./san.cnf -extensions v3_req

# ETCD1
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout "${ETCD1_SERVER}.key" -out "${ETCD1_SERVER}.csr" -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in "${ETCD1_SERVER}.csr" -CA "${ETCD_CA}.crt" -CAkey "${ETCD_CA}.key" -CAcreateserial -out "${ETCD1_SERVER}.crt" -extfile ./san.cnf -extensions v3_req

# ETCD2
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout "${ETCD2_SERVER}.key" -out "${ETCD2_SERVER}.csr" -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in "${ETCD2_SERVER}.csr" -CA "${ETCD_CA}.crt" -CAkey "${ETCD_CA}.key" -CAcreateserial -out "${ETCD2_SERVER}.crt" -extfile ./san.cnf -extensions v3_req