FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    automake \
    gcc \
    build-essential \
    g++ \
    git \
    cpp \
    libc6-dev \
    man-db \
    autoconf \
    libssl-dev \
    pkg-config

RUN env GIT_SSL_NO_VERIFY=true git clone --depth 1 https://github.com/simulationcraft/simc.git
WORKDIR simc/engine
RUN make OPENSSL=1 optimized
COPY apikey.txt /simc/engine/

#CMD ./simc data/*.simc && cp *.html data/ && cp *.simc data/
CMD ./simc data/*.simc

#COPY richo_druid.simc /simc/engine/

#RUN ./simc richo_druid.simc

