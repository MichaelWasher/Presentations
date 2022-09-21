# /bin/bash

# Configure Certificates
echo "Configuring Certificates"
# Create CAcert to be shared for all communication
openssl req -nodes -x509 -newkey rsa:2048  -config san.cnf  -keyout ca.key -out ca.crt -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=root/emailAddress=sample@sample.com"

# Generate CSR and Sign
openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout server.key -out server.csr -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
openssl x509 -req  -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -extfile ./san.cnf -extensions v3_req
