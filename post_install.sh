#/bin/sh

#D+T=Full

SHA256="e6f95b6c39fee01581e3e144c11b70526b859d49808eb6fb8ec239efd1fc011b"


# run in 10.30.30.80  python -m SimpleHTTPServer

wget -v -O inst.sh http://10.30.30.80:8000/00/Installer-TRIAL.sh
if [ $? -eq 0 -a inst.sh ]; then
	CHECKSUM=`sha256 -q inst.sh`
	if [ "$SHA256" == "$CHECKSUM" ]; then
		sh ./inst.sh -f -i /usr/local/nakivo --eula-accept
	fi	
fi

rm inst.sh


#wget -v https://d96i82q710b04.cloudfront.net/res/product/NAKIVO_Backup_Replication_v8.0.0_Updater.sh
#chmod +x NAKIVO_Backup_Replication_v8.0.0_Updater.sh
#./NAKIVO_Backup_Replication_v8.0.0_Updater.sh -f -i /usr/local/nakivo --eula-accept

