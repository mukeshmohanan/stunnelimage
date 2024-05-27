FROM alpine:3.13 as dev
# Take in all global args
ARG INSTALLDIR_OPENSSL
ARG SIG_ALG
ARG STUNNEL_DIR_CERTS=/opt/stunnel/certs
ARG STUNNEL_DIR_BIN=/opt/stunnel/bin
ARG STUNNEL_DIR_CONFIG=/opt/stunnel/config

WORKDIR /

RUN mkdir -p ${STUNNEL_DIR_CERTS}
RUN mkdir -p ${STUNNEL_DIR_BIN}
RUN mkdir -p ${STUNNEL_DIR_CONFIG}


COPY stunnel.conf ${STUNNEL_DIR_CONFIG}
COPY stunnelstart.sh ${STUNNEL_DIR_BIN}
RUN chmod -R 755 ${STUNNEL_DIR_CONFIG}
RUN chmod -R 755 ${STUNNEL_DIR_CONFIG}/stunnel.conf
RUN chmod -R 755 ${STUNNEL_DIR_BIN}
RUN chmod -R 755 ${STUNNEL_DIR_BIN}/stunnelstart.sh

# Enable a normal user to create new server keys off set CA

# entry point  # /opt/stunnel/bin/stunnelstart.sh"
ENTRYPOINT ["sleep", "infinity"]
