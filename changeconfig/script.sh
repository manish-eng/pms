# !/bin/sh

USER=$1
PASSWORD=$2
fqdn=$3

echo $USER 

cd /var/lib/digivalet/digivalet-config/
cp -r /var/lib/digivalet/digivalet-config/app-config.json /var/lib/digivalet/digivalet-config/backup/


# php /var/lib/digivalet/digivalet-config/app-config-creation.php --git-user=$USER --git-password=$PASSWORD --env=qa --mds-server-fqdn=mds$fqdndigivalet.com --oneauth-server-fqdn=das$fqdndigivalet.com --dvs-server-fqdn=dvs$fqdndigivalet.com --inpremise-his-server-fqdn=his$fqdndigivalet.com --cloud-his-server-fqdn=his$fqdndigivalet.com --butler-his-server-fqdn=butler$fqdndigivalet.com --digisteward-folder-name=digisteward --digisteward-his-server-fqdn=his$fqdndigivalet.com --analytics-his-server-fqdn=analytics$fqdndigivalet.com --analytics-his-server-username=admin --analytics-his-server-password=adminadmin --jasper-his-server-fqdn=analytics$fqdndigivalet.com --report-name=Digivalet_Reports --report-directory=DigiValet

# diff -a --suppress-common-lines -y /var/lib/digivalet/digivalet-config/app-config.json /var/lib/digivalet/digivalet-config/backup/app-config.json > /var/lib/digivalet/digivalet-config/diff.txt
diff -a --suppress-common-lines -y /var/lib/digivalet/digivalet-config/file2.json /var/lib/digivalet/digivalet-config/backup/file1.json > /var/lib/digivalet/digivalet-config/diff.txt

awk 'NR==FNR{print; n=NR; next} {if(FNR > n) print}' /var/lib/digivalet/digivalet-config/backup/app-config.json /var/lib/digivalet/digivalet-config/app-config.json > app-config-diff.json

# chmod 775 /var/lib/digivalet/digivalet-config/app-config-diff.json
# cp app-config-diff.json /var/lib/digivalet/digivalet-config/app-config.json
# chmod 775 /var/lib/digivalet/digivalet-config/app-config.json