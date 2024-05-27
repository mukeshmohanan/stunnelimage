FROM ubi9/ubi as dev
# Take in all global args
ARG INSTALLDIR_OPENSSL
ARG SIG_ALG
ARG STUNNEL_DIR_CERTS=/opt/stunnel/certs
ARG STUNNEL_DIR_BIN=/opt/stunnel/bin
ARG STUNNEL_DIR_CONFIG=/opt/stunnel/config
ARG STUNNEL_DIR_LIB=/opt/stunnel/lib

WORKDIR /

RUN yum update -y && \
    yum install -y \
    glibc 
RUN mkdir -p ${STUNNEL_DIR_CERTS}
RUN mkdir -p ${STUNNEL_DIR_BIN}
RUN mkdir -p ${STUNNEL_DIR_CONFIG}

# copy the files 
COPY stunnel ${STUNNEL_DIR_BIN}
COPY openssl.cnf ${STUNNEL_DIR_CONFIG}
COPY stunnel.conf ${STUNNEL_DIR_CONFIG}
COPY stunnelstart.sh ${STUNNEL_DIR_BIN}
COPY libcrypto.so ${STUNNEL_DIR_LIB}/
COPY libssl.so ${STUNNEL_DIR_LIB}/
COPY liboqs.so.0.10.1-dev ${STUNNEL_DIR_LIB}/
COPY oqsprovider.so ${STUNNEL_DIR_LIB}/

RUN chmod -R 755 ${STUNNEL_DIR_LIB}
RUN chmod 755 ${STUNNEL_DIR_CONFIG}
RUN chmod 640 ${STUNNEL_DIR_CONFIG}/stunnel.conf
RUN chmod 640 ${STUNNEL_DIR_BIN}/stunnel
RUN chmod -R 750 ${STUNNEL_DIR_BIN}/stunnelstart.sh

# Enable a normal user to create new server keys off set CA

# entry point  # /opt/stunnel/bin/stunnelstart.sh"
ENTRYPOINT ["sleep", "infinity"]
