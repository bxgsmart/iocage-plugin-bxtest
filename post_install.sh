#/bin/sh
sysrc bxtest_enable="YES"


#pkg fetch -y openjdk8-jre 
#mkdir -p /usr/local/nakivo/director
#CACHE=`pkg config PKG_CACHEDIR`
#ARCHIVE=`ls -lt -1 ${CACHE:-/var/cache/pkg}/openjdk8-jre-8.* | head -n 1`
#if [ "x$ARCHIVE" != "x" ]; then
#    tar -xpf "$ARCHIVE" -C /usr/local/nakivo/director/ -s '#usr/local/openjdk8-jre#jre#' /usr/local/openjdk8-jre  
#fi

mkdir -p /usr/local/bx
cd /usr/local/bx
wget -v "http://172.16.2.20:8111/repository/download/bt2/52751:id/NAKIVO_Backup_&_Replication_v8.5.0.28535_Installer-TRIAL.sh"
chmod +x "NAKIVO_Backup_&_Replication_v8.5.0.28535_Installer-TRIAL.sh"
./"NAKIVO_Backup_&_Replication_v8.5.0.28535_Installer-TRIAL.sh" -f -i /usr/local/nakivo --eula-accept

#wget -v https://d96i82q710b04.cloudfront.net/res/product/NAKIVO_Backup_Replication_v8.0.0_Updater.sh
#chmod +x NAKIVO_Backup_Replication_v8.0.0_Updater.sh
#./NAKIVO_Backup_Replication_v8.0.0_Updater.sh -f -i /usr/local/nakivo --eula-accept

# Start the service
service bxtest start
