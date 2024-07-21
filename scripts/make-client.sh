#/bin/bash

CLIENT_NAME=$1

easyrsa --batch build-client-full $CLIENT_NAME nopass
mkdir -p clients/$CLIENT_NAME
openssl rsa -in pki/private/$CLIENT_NAME.key -text > clients/$CLIENT_NAME/client.pem

