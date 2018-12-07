#/bin/sh

#URL="http://10.30.30.80:8000/NAKIVO_Transporter_Installer-8.5.0.r28673-x86_64.sh"
URL="http://10.30.30.80:8000/Installer-TRIAL.sh"
SHA256="db530342d142ca11bfb45d5001c3ad6673e09448acc3651ad08ae09eefd71fa4"

PRODUCT_ROOT="/usr/local/nakivo"
INSTALL="inst.sh"

curl --fail --tlsv1.2 -o $INSTALL $URL
if [ $? -ne 0 -o ! -e $INSTALL ]; then
    echo 'ERROR: Failed to get NAKIVO Backup and Replication installer'
    rm $INSTALL
    exit 1
fi

CHECKSUM=`sha256 -q $INSTALL`
if [ "$SHA256" != "$CHECKSUM" ]; then
    echo 'ERROR: NAKIVO Backup and Replication incorrect checksum'
    rm $INSTALL
    exit 2
fi

sh ./$INSTALL -f -i "$PRODUCT_ROOT" --eula-accept --extract
if [ $? -ne 0 ]; then
    echo 'ERROR: NAKIVO Backup and Replication install failed'
    rm $INSTALL
    exit 3
fi
rm $INSTALL

#disable default HTTP ports redirect
SVC_PATH="$PRODUCT_ROOT/director"
awk 'BEGIN{A=0} /port="80/{A=1} {if (A==0) print $0} />/{A=0}' $SVC_PATH/tomcat/conf/server-linux.xml >$SVC_PATH/tomcat/conf/server-linux.xml_
mv $SVC_PATH/tomcat/conf/server-linux.xml_ $SVC_PATH/tomcat/conf/server-linux.xml

#enforce EULA
PROFILE=`ls "$SVC_PATH/userdata/"*.profile 2>/dev/null | head -1`
if [ "x$PROFILE" != "x" ]; then
    sed -e 's@"system.licensing.eula.must.agree": true@"system.licensing.eula.must.agree": false@' "$PROFILE" >"${PROFILE}_"
    mv "${PROFILE}_" "$PROFILE"
fi

#service nkv_dirsvc start
