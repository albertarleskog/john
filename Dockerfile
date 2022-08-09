FROM ubuntu:jammy

ENV JOHN=${JOHN:-/john}

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y apt-transport-https ca-certificates && \
update-ca-certificates

RUN apt-get install -y --no-install-recommends git build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev

RUN git clone https://github.com/openwall/john -b bleeding-jumbo ${JOHN} && \
cd ${JOHN}/src && \
./configure && \
make -s clean && \
make -sj4 && \
make shell-completion

COPY --chown=root:root john /bin

COPY --chown=root:root docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
