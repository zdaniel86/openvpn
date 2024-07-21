FROM ubuntu
RUN apt update
RUN apt install -y easy-rsa openvpn

ENV PATH="$PATH:/usr/share/easy-rsa/"

COPY scripts/make-certificates.sh /bin/make-certificates.sh
COPY scripts/make-client.sh /bin/make-client.sh
COPY scripts/make_ovpn.sh /bin/make_ovpn.sh

WORKDIR /mnt/certificates

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["make-certificates.sh"]

