FROM ubuntu
RUN apt update
RUN apt install -y socat

COPY relay/relay.service /etc/systemd/system/relay.service

RUN systemctl enable relay

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["tail -F /var/log/messages"]

