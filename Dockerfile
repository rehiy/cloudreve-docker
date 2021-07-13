FROM debain

RUN apt update &&
    apt install -y wget &&
    wget https://github.com/cloudreve/Cloudreve/releases/download/3.3.2/cloudreve_3.3.2_linux_amd64.tar.gz &&
    tar xvf cloudreve_3.3.2_linux_amd64.tar.gz -C /srv &&
    rm cloudreve_3.3.2_linux_amd64.tar.gz &&
    apt remove -y --auto-remove wget openssl &&
    rm -rf /var/lib/apt/lists/* &&
    echo "[Database]" >/srv/cloudreve.ini &&
    echo "DBFile=/data/cloudreve.db" >>/srv/cloudreve.ini

ENTRYPOINT ["/srv/cloudreve"]
