#!/bin/bash

# Generate Private Key
openssl genrsa -out $1.key 2048

# Generate CSR
openssl req -new -key $1.key -out $1.csr -subj "/C=CA/ST=Nova Scotia/L=Yarmouth/O=Spencer Muise/OU=IT Department/CN=$1"

# Generate ext file
printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $1" > $1.ext

# Issue cert
openssl x509 -req -in $1.csr -CA myPersonalCA.pem -CAkey myPersonalCA.key -CAcreateserial \
-out $1.crt -days 1825 -sha256 -extfile $1.ext
