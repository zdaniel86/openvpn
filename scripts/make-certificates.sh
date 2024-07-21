#/bin/bash

openvpn --genkey secret ta.key

easyrsa init-pki
easyrsa --batch --req-cn="zdaniel-ca" build-ca nopass
easyrsa --batch build-server-full server nopass
easyrsa gen-dh


