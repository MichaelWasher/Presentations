# /bin/bash

# Configure Certificates
echo "Configuring Certificates"
# Create CAcert to be shared for all communication
openssl req -nodes -x509 -newkey rsa:2048  -config san.cnf  -keyout ca.key -out ca.crt -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=root/emailAddress=sample@sample.com"

# Generate CSR and Sign.
### NOTE: >> All ETCD Certificates are signed by the same CA <<
# ETCD1
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout etcd1.key -out etcd1.csr -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out etcd1.crt -extfile ./san.cnf -extensions v3_req

# ETCD2
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout etcd2.key -out etcd2.csr -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out etcd2.crt -extfile ./san.cnf -extensions v3_req

# ETCD 3
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout etcd3.key -out etcd3.csr -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out etcd3.crt -extfile ./san.cnf -extensions v3_req
