ARG FROM_IMAGE=debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive

FROM $FROM_IMAGE as builder

COPY install.sh /tmp/install-ipopt.sh
RUN /tmp/install-ipopt.sh

FROM $FROM_IMAGE as runtime

ARG DEBIAN_FRONTEND
RUN apt-get update && \
    apt-get install -y \
        gcc \
        g++ \
        gfortran \
        make \
        cppad \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/* /usr/local/bin/
COPY --from=builder /usr/local/include/coin /usr/local/include/coin
COPY --from=builder /usr/local/lib/* /usr/local/lib/
COPY --from=builder /usr/local/share/coin /usr/local/share/coin

RUN ldconfig
