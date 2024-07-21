FROM ubuntu
RUN apt update
RUN apt install -y openvpn

RUN yes| unminimize
RUN apt install -y iproute2 net-tools tcpdump curl

COPY certificates/pki/ca.crt /etc/openvpn/ca.crt
COPY certificates/ta.key /etc/openvpn/ta.key

COPY certificates/pki/issued/client.crt /etc/openvpn/client/client.crt
COPY certificates/pki/private/client.key /etc/openvpn/client/client.key

COPY openvpn-client/client.conf /etc/openvpn/client.conf

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["service openvpn start && tail -F /var/log/openvpn/openvpn.log"]


