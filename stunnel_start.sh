#set LD directory path
export CONFIG_FILE="/opt/stunnel/config/stunnel.conf"
export LD_LIBRARY_PATH=/opt/stunnel/lib
# set openssl_conf env variable
export OPENSSL_CONF=/opt/stunnel/config/openssl.cnf
# start stunnel process
/opt/stunnel/bin/stunnel $CONFIG_FILE
