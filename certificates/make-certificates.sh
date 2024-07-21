#/bin/bash

easyrsa init-pki
easyrsa --batch --req-cn="zdaniel-ca" build-ca nopass
easyrsa --batch build-server-full server nopass
easyrsa --batch build-client-full client nopass
easyrsa gen-dh

