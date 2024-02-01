# /bin/bash
source ./env_vars.sh

# Configure Certificates
echo "Configuring Certificates"

# Create CAcert to be shared for all communication
openssl req -nodes -x509 -newkey rsa:2048  -config san.cnf  -keyout ${ETCD_CLIENT_CA}.key -out ${ETCD_CLIENT_CA}.crt -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=client-ca/emailAddress=sample@sample.com"
openssl req -nodes -x509 -newkey rsa:2048  -config san.cnf  -keyout ${ETCD_PEER_CA}.key -out ${ETCD_PEER_CA}.crt -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=peer-ca/emailAddress=sample@sample.com"

# Generate CSR and Sign.
# Create Client Serving Certificates
for CRT in ${ETCD0_CLIENT_CERT_SERV} ${ETCD1_CLIENT_CERT_SERV} ${ETCD2_CLIENT_CERT_SERV} ; do
    openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout "${CRT}.key" -out "${CRT}.csr" -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
    openssl x509 -req  -in "${CRT}.csr" -CA "${ETCD_CLIENT_CA}.crt" -CAkey "${ETCD_CLIENT_CA}.key" -CAcreateserial -out "${CRT}.crt" -extfile ./san.cnf -extensions v3_req
done

# Create Peer Serving and Auth Certificates
for CRT in ${ETCD0_PEER_CERT_SERV} ${ETCD1_PEER_CERT_SERV} ${ETCD2_PEER_CERT_SERV}
    openssl req -nodes -newkey rsa:2048  -config san.cnf  -keyout "${CRT}.key" -out "${CRT}.csr" -subj "/C=AU/ST=QLD/L=Brisbane/O=RedHat/OU=root/CN=localhost/emailAddress=sample@sample.com"
    openssl x509 -req  -in "${CRT}.csr" -CA "${ETCD_PEER_CA}.crt" -CAkey "${ETCD_PEER_CA}.key" -CAcreateserial -out "${CRT}.crt" -extfile ./san.cnf -extensions v3_req
done
