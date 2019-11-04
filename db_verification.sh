#!/bin/bash
# d=`date '+%d%m%Y_%H%M%S'`

##### DB Version Verify #####

echo -e "\n=== DB Version Verify ===\n" >> db_verification.txt
yum list installed | grep "digivalet-" | grep db >> db_verification.txt

##### DB Logs Verify #####

echo -e "\n=== DB Logs Verify ===\n" >> db_verification.txt

mysql -e 'show variables like "server_audit_logging"' >> db_verification.txt
echo -e "\n" >> db_verification.txt
mysql -e 'show variables like "log_error"' >> db_verification.txt
echo -e "\n" >> db_verification.txt
mysql -e 'show variables like "slow_query_log"' >> db_verification.txt      
echo -e "\n" >> db_verification.txt

##### FQDN verification in DB table - hotels #####

echo -e "\n=== FQDN verification in DB (digivalet) : table - hotels ===\n" >> db_verification.txt
mysql -e 'select hotel_id,hotel_name,hotel_code,ip_address from digivalet.hotels' >> db_verification.txt
echo -e "\n=== FQDN verification in DB (digivalet_cloud) : table - hotels ===\n" >> db_verification.txt
mysql -e 'select hotel_id,hotel_name,hotel_code,ip_address from digivalet_cloud.hotels' >> db_verification.txt

##### Verification in Digivalet DB table - java_configs #####

echo -e "\n=== Verification in DB (digivalet) : table - java_configs ===\n" >> db_verification.txt
mysql -e 'select config_id,module,config_key,config_val,val_type from digivalet.java_configs where `config_key` ="currencyName" AND `module`="PRINTER_MAILER"' >> db_verification.txt
echo -e "\n" >> db_verification.txt
mysql -e 'select config_id,module,config_key,config_val,val_type from digivalet.java_configs where `config_key` ="currencySymbol" AND `module`="PMSI"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in Digivalet DB - master_configs #####

echo -e "\n=== Verification in DB (digivalet) : table - master_configs ===\n" >> db_verification.txt
mysql -e 'select module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="cloud_his_url"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="inpremise_his_url"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="site_enabled_lang_code"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="default_currency" AND hotel_id!=0' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="zigbee_lock_address"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="push_update_device_types"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet.master_configs where config_key="global_deployed_features"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in Digivalet Cloud DB - master_configs #####

echo -e "\n=== Verification in DB (digivalet_cloud) : table - master_configs ===\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet_cloud.master_configs where config_key="cloud_his_url"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet_cloud.master_configs where config_key="inpremise_his_url"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet_cloud.master_configs where config_key="site_enabled_lang_code"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet_cloud.master_configs where config_key="default_currency" AND hotel_id!=0' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select config_id,module,config_key,config_val,val_type,hotel_id from digivalet_cloud.master_configs where config_key="global_deployed_features"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in DVS DB - master_configs #####

echo -e "\n=== Verification in DB (dvs) : table - master_configs ===\n" >> db_verification.txt

mysql -e 'select mconfig_id,config_key,config_val,val_type from dvs.master_configs where config_key="dvs_hotel_hotelname"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select mconfig_id,config_key,config_val,val_type from dvs.master_configs where config_key="dvs_hotel_hotelbrand"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select mconfig_id,config_key,config_val,val_type,is_active from dvs.master_configs where config_key="dvs_hotel_activesince"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select mconfig_id,config_key,config_val,val_type,is_active from dvs.master_configs where config_key="dvs_hotel_country"' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select mconfig_id,config_key,config_val,val_type,is_active from dvs.master_configs where config_key="dvs_network_country_code"' >> db_verification.txt
echo -e "\n" >> db_verification.txt


##### Verification in DB table - control_system_drivers #####
echo -e "\n=== Verification in DB (digivalet) : table - control_system_drivers ===\n" >> db_verification.txt
mysql -e 'select id,name,connection_type,connection_info,feature from dvs.control_system_drivers' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in DB table - tv_drivers #####
echo -e "\n=== Verification in DB (digivalet) : table - tv_drivers ===\n" >> db_verification.txt
mysql -e 'select id,name,brand_id,model_id,connection_type,connection_info,input_source from dvs.tv_drivers' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in DB table - spa_salon_configs #####

echo -e "\n=== Verification in DB (digivalet) : table - spa_salon_configs ===\n" >> db_verification.txt
mysql -e 'select config_id,config_key,config_val,val_type from digivalet.spa_salon_configs where config_key="spa_etiquettes"' >> db_verification.txt

echo -e "\n" >> db_verification.txt
mysql -e 'select config_id,config_key,config_val,val_type from digivalet_cloud.spa_salon_configs where config_key="spa_etiquettes"' >> db_verification.txt

##### Verification in DB table - weather_cities #####

echo -e "\n=== Verification in DB (digivalet) : table - weather_cities ===\n" >> db_verification.txt
mysql -e 'select city_name,location_code,hotel_id,is_active from digivalet.weather_cities' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in DB table - butler_push_notification_messages #####

echo -e "\n=== Verification in DB (digivalet) : table - butler_push_notification_messages ===\n" >> db_verification.txt
mysql -e 'select butler_push_notification_messages_id,message,type from digivalet.butler_push_notification_messages' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification of Templates #####
echo -e "\n=== Verification in DB (digivalet) : table - cmc_template ===\n" >> db_verification.txt
mysql -e 'select template_id,message_type_id,template_name,template_type,media_component,template_path from digivalet.cmc_template' >> db_verification.txt
echo -e "\n" >> db_verification.txt

echo -e "\n=== Verification in DB (digivalet_cloud) : table - promotions_template ===\n" >> db_verification.txt
mysql -e 'select cat_id,template_name,template_type,template_path from digivalet_cloud.promotions_template;' >> db_verification.txt
echo -e "\n" >> db_verification.txt

echo -e "\n=== Verification in DB (digivalet_cloud) : table - welcome_letter_template ===\n" >> db_verification.txt
mysql -e 'select cat_name,template_name,template_type,sub_template_type,template_path from digivalet_cloud.welcome_letter_template;' >> db_verification.txt
echo -e "\n" >> db_verification.txt

echo -e "\n=== Verification in DB (digivalet_cloud) : table - service_amenities_feature ===\n" >> db_verification.txt
mysql -e 'select feature_id,feature_code,is_active from digivalet_cloud.service_amenities_feature;' >> db_verification.txt
echo -e "\n" >> db_verification.txt

##### Verification in DB table - oneauth_info #####
echo -e "\n=== Verification in DB (digivalet) : table - oneauth_info ===\n" >> db_verification.txt
mysql -e 'select oneauth_info_id,client_id,hotel_id,fqdn,service from digivalet.oneauth_info' >> db_verification.txt
echo -e "\n" >> db_verification.txt

mysql -e 'select oneauth_info_id,client_id,hotel_id,fqdn,service from digivalet_cloud.oneauth_info' >> db_verification.txt
echo -e "\n" >> db_verification.txt