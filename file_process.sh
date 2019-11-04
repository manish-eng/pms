#/bin/bash

echo $1     
echo $2
echo $3
echo $4
ssh-keyscan -H $4 >> ~/.ssh/known_hosts
if [ $1 == "pear" ] 
then 
    cd /var/lib/
    tar -zcvf $1.tar.gz $1
    sshpass -p $3 scp -r /var/lib/$1.tar.gz $2@$4:/tmp/
elif [ $1 == "pms" ]
then
    cd /var/lib/digivalet/digivalet-config/
    tar -zcvf $1.tar.gz $1
    sshpass -p $3 scp -r /var/lib/digivalet/digivalet-config/$1.tar.gz $2@$4:/tmp/ 
elif [ $1 == "tpm" ]
then
    cd /var/lib/
    tar -zcvf $1.tar.gz $1
    sshpass -p $3 scp -r /var/lib/$1.tar.gz $2@$4:/tmp/ 
else
    cd /var/lib/
    tar -zcvf $1.tar.gz $1
    sshpass -p $3 scp -r /var/lib/$1.tar.gz $2@$4:/tmp/
fi
