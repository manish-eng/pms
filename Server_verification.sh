#!/bin/bash
echo -e "\n========================= Artifactory and Rundeck service status check =========================\n" >> server_verify.txt
systemctl status artifactory >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status rundeckd >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### FQDN verification #####
echo -e "\n============================ FQDN Verify ==============================\n" >> server_verify.txt
echo -e "\n============================ App-config ============================\n" >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /var/lib/digivalet/digivalet-config/app-config.json | grep -i 'fqdn' >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /var/lib/digivalet/digivalet-config/app-config.json | grep -i 'hotel' >> server_verify.txt
echo -e "\n" >> server_verify.txt
echo -e "\n============================ DB-config ============================\n" >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /var/lib/digivalet/digivalet-config/database-config.json | grep -i 'host' >> server_verify.txt
echo -e "\n" >> server_verify.txt
echo -e "\n============================ dgjava ============================\n" >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /var/lib/digivalet/digivalet-config/dgjava | grep -i 'http' >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /var/lib/digivalet/digivalet-config/dgjava | grep -i 'hotel' >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### verify cron #####
echo -e "\n============================ CRON Verify ============================\n" >> server_verify.txt
cat /etc/cron.d/dvs >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### verify cron permission #####
ls -al /etc/cron.d/dvs >> server_verify.txt
echo -e "\n" >> server_verify.txt
######### DVS #########
##### to verify version #####
echo -e "\n============================ Version Verify ============================\n" >> server_verify.txt
yum list installed | grep dgrepo >> server_verify.txt
echo -e "\n" >> server_verify.txt
yum list installed | grep cms >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### DAS #####
##### verify dgjava evn variables #####
echo -e "\n============================ dgjava Verify ============================\n" >> server_verify.txt
cat /var/lib/digivalet/digivalet-config/dgjava | grep -i 'https' >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### verify push maanager config #####
echo -e "\n============================ Push Manager Verify ============================\n" >> server_verify.txt >> server_verify.txt
cat /var/lib/digivalet/push-manager/push_manager_config.xml | grep -i 'https' >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /var/lib/digivalet/push-manager/pushmanagerlog4j.xml | grep -i 'log' >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### verify system monitor config #####
echo -e "\n============================ System Monitor Verify ============================\n" >> server_verify.txt 
cat /digivalet/pkg/config/push_manager_config.xml | grep -i 'http' >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /digivalet/pkg/config/pushmanagerlog4j.xml | grep -i 'log' >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /digivalet/pkg/config/system-monitor-config.xml | grep -i 'http' >> server_verify.txt
echo -e "\n" >> server_verify.txt
cat /digivalet/pkg/config/system-monitor-log4j.xml | grep -i 'log' >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### push manager and system monitor service status check #####
echo -e "\n============================ Push Manger and System Monitor Service Verify ============================\n" >> server_verify.txt
systemctl status push-manager >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status system-monitor >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### verify property files and templates #####
echo -e "\n============================ Propert Flies and Templates Verify ============================\n" >> server_verify.txt
ls -al /digivalet/pkg/config >> server_verify.txt
echo -e "\n" >> server_verify.txt
##### Service status check #####
echo -e "\n============================ Services Status Check ============================\n" >> server_verify.txt
systemctl status push-manager >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status system-monitor >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status digivalet-pmsi >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status digivalet-posi >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status printer-mailer >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status gateway-services >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status service-assistance >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status nodejs-core >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status nodejs-cloud-core >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status nodejs-dashboard >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status digivalet-butler >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status digivalet-entertainment >> server_verify.txt
echo -e "\n" >> server_verify.txt
systemctl status nodejs-butler >> server_verify.txt
echo -e "\n" >> server_verify.txt
######### MDS #########
##### DB service status check #####
echo -e "\n============================ DB Service Verify ============================\n" >> server_verify.txt
systemctl status mariadb >> server_verify.txt
