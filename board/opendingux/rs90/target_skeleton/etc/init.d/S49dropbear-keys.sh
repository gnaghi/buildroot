#!/bin/sh

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

mkdir -p /etc/local/dropbear

RSA_KEY=/etc/dropbear/dropbear_rsa_host_key
ECDSA_KEY=/etc/dropbear/dropbear_ecdsa_host_key

if [ ! -r $RSA_KEY ]
then
	echo -n "generating rsa key... "
	/usr/bin/dropbearkey -t rsa -f $RSA_KEY > /dev/null 2>&1
	echo "done"
fi

if [ ! -r $ECDSA_KEY ]
then
	echo -n "generating ecdsa key... "
	/usr/bin/dropbearkey -t ecdsa -f $ECDSA_KEY > /dev/null 2>&1
	echo "done"
fi
