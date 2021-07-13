FROM debian:bullseye-slim

RUN apt update; \
    apt install -y wget openssl; \
    wget https://github.com/cloudreve/Cloudreve/releases/download/3.3.2/cloudreve_3.3.2_linux_amd64.tar.gz; \
    tar -xf cloudreve_3.3.2_linux_amd64.tar.gz -C /srv; \
    rm -f cloudreve_3.3.2_linux_amd64.tar.gz; \
    apt remove -y --auto-remove wget openssl; \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/srv/cloudreve"]
