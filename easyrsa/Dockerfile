FROM ubuntu
RUN apt update
RUN apt install -y easy-rsa

ENV PATH="$PATH:/usr/share/easy-rsa/"

WORKDIR certificates

ENTRYPOINT ["/bin/bash"]
CMD ["./make-certificates.sh"]

