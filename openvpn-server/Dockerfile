FROM ubuntu
RUN apt update
RUN apt install -y openvpn

RUN sed -i 's/#net.ipv4.ip_forward/net.ipv4.ip_forward/g' /etc/sysctl.conf

RUN openvpn --genkey secret /etc/openvpn/server/ta.key

COPY certificates/pki/ca.crt /etc/openvpn/server/ca.crt
COPY certificates/pki/issued/server.crt /etc/openvpn/server/server.crt
COPY certificates/pki/private/server.key /etc/openvpn/server/server.key
COPY certificates/pki/dh.pem /etc/openvpn/server/dh.pem

COPY openvpn-server/server.conf /etc/openvpn/server.conf

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["service openvpn start && tail -F /var/log/openvpn/openvpn.log"]

