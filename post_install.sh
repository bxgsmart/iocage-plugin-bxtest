#/bin/sh

URL="http://10.30.30.80:8000/00/NAKIVO_Transporter_Installer-8.5.0.r28673-x86_64.sh"
SHA256="99bd680c3a528528855b04e577251e8ecee207e0ecd449dcfd526091805b2179"

PRODUCT_ROOT="/usr/local/nakivo"
INSTALL="inst.sh"

curl --fail --tlsv1.2 -o $INSTALL $URL
if [ $? -ne 0 -o ! -e $INSTALL ]; then
    echo 'ERROR: Failed to get NAKIVO Backup and Replication Transporter installer'
    rm $INSTALL
    exit 1
fi

CHECKSUM=`sha256 -q $INSTALL`
if [ "$SHA256" != "$CHECKSUM" ]; then
    echo 'ERROR: NAKIVO Backup and Replication Transporter incorrect checksum'
    rm $INSTALL
    exit 2
fi

sh ./$INSTALL -s -i "$PRODUCT_ROOT" --eula-accept
if [ $? -ne 0 ]; then
    echo 'ERROR: NAKIVO Backup and Replication Transporter install failed'
    rm $INSTALL
    exit 3
fi
rm $INSTALL

exit 0


