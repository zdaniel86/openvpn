FROM ubuntu
RUN apt update
RUN apt install -y openvpn

COPY certificates/pki/ca.crt /etc/openvpn/client/ca.crt
COPY certificates/pki/issued/client.crt /etc/openvpn/client/client.crt
COPY certificates/pki/private/client.key /etc/openvpn/client/client.key
COPY certificates/ta.key /etc/openvpn/client/ta.key

COPY openvpn-client/client.conf /etc/openvpn/client.conf

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["service openvpn start && tail -F /var/log/openvpn/openvpn.log"]


