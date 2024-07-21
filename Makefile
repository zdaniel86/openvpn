OPENVPN_IMAGE = openvpn-server
EASYRSA_IMAGE = easyrsa

.PHONY: openvpn_server
openvpn_server: build_openvpn
	docker run --privileged --cap-add=NET_ADMIN -d -p 45733:1194/udp --name openvpn-server $(OPENVPN_IMAGE)

.PHONY: openvpn_client
openvpn_client: build_openvpn_client
	docker run --privileged --cap-add=NET_ADMIN -d openvpn-client

extract_ta_key: build_openvpn
	docker run -v ./certificates:/certificates $(OPENVPN_IMAGE) "cp /etc/openvpn/server/ta.key /certificates/"

.PHONY: build_openvpn_client
build_openvpn_client:
	docker build -t openvpn-client -f openvpn-client/Dockerfile .

.PHONY: build_openvpn
build_openvpn:
	docker build -t $(OPENVPN_IMAGE) -f openvpn-server/Dockerfile .

.PHONY: build_easyrsa
build_easyrsa:
	docker build -t $(EASYRSA_IMAGE) -f easyrsa/Dockerfile .

.PHONY: certificates
certificates: build_easyrsa
	docker run -v ./certificates:/certificates $(EASYRSA_IMAGE) ./make-certificates.sh
