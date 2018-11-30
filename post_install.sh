#/bin/sh
sysrc bxtest_enable="YES"


mkdir -p /usr/local/bx
cd /usr/local/bx
wget -v https://d96i82q710b04.cloudfront.net/res/product/NAKIVO_Backup_Replication_v8.0.0_Updater.sh
chmod +x NAKIVO_Backup_Replication_v8.0.0_Updater.sh
./NAKIVO_Backup_Replication_v8.0.0_Updater.sh -f -i /usr/local/nakivo --eula-accept

# Start the service
service bxtest start
