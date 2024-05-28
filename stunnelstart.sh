#set LD directory path
export LD_LIBRARY_PATH=/opt/stunnel/lib
# set openssl_conf env variable
export OPENSSL_CNF=/opt/stunnel/conf/openssl.cnf
# start stunnel process
/opt/stunnel/bin/stunnel /opt/stunnel/conf/stunnel.conf

