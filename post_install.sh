#/bin/sh
#sysrc bxtest_enable="YES"

#pkg fetch -y openjdk8-jre 
#mkdir -p /usr/local/nakivo/director
#CACHE=`pkg config PKG_CACHEDIR`
#ARCHIVE=`ls -lt -1 ${CACHE:-/var/cache/pkg}/openjdk8-jre-8.* | head -n 1`
#if [ "x$ARCHIVE" != "x" ]; then
#    tar -xpf "$ARCHIVE" -C /usr/local/nakivo/director/ -s '#usr/local/openjdk8-jre#jre#' /usr/local/openjdk8-jre  
#fi

#mkdir -p /usr/local/bx
#cd /usr/local/bx

# run in 10.30.30.80  python -m SimpleHTTPServer
#
wget -v -O inst.sh http://10.30.30.80:8000/00/Installer-TRIAL.sh
chmod +x inst.sh

#if [ $? -eq 0 -a inst.sh ]; then
#  sh ./inst.sh -f -i /usr/local/nakivo --eula-accept
#  rm inst.sh
#fi

#wget -v https://d96i82q710b04.cloudfront.net/res/product/NAKIVO_Backup_Replication_v8.0.0_Updater.sh
#chmod +x NAKIVO_Backup_Replication_v8.0.0_Updater.sh
#./NAKIVO_Backup_Replication_v8.0.0_Updater.sh -f -i /usr/local/nakivo --eula-accept

# Start the service
#service bxtest start
