OPENVPN_SERVER_IMAGE = openvpn-server
OPENVPN_CLIENT_IMAGE = openvpn-client
EASYRSA_IMAGE = easyrsa

.PHONY: start-openvpn-server
start-openvpn-server: openvpn-server
	mkdir -p shared
	docker run -v ./shared:/mnt/shared --privileged --cap-add=NET_ADMIN -d -p 45733:1194/udp --name openvpn-server $(OPENVPN_SERVER_IMAGE)

.PHONY: start-openvpn-client
start-openvpn-client: openvpn-client
	docker run --privileged --cap-add=NET_ADMIN -d openvpn-client

.PHONY: openvpn-client
openvpn-client:
	docker build -t $(OPENVPN_CLIENT_IMAGE) -f openvpn-client/Dockerfile .

.PHONY: openvpn-server
openvpn-server:
	docker build -t $(OPENVPN_SERVER_IMAGE) -f openvpn-server/Dockerfile .

certificates: easyrsa
	mkdir -p certificates
	docker run -v ./certificates:/mnt/certificates $(EASYRSA_IMAGE) make-certificates.sh
	docker run -v ./certificates:/mnt/certificates $(EASYRSA_IMAGE) "make-client.sh client"

.PHONY: easyrsa
easyrsa:
	docker build -t $(EASYRSA_IMAGE) -f easyrsa/Dockerfile .

.PHONY: clean
clean:
	rm -rf certificates

.PHONY: gc
gc:
	docker container prune
	docker image prune
	docker volume prune
