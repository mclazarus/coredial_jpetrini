#!/bin/bash
 
#### Dell OMSA and SNMP Install 09/12/2014 jpetrini. 
 
sudo touch /etc/yum.repos.d/dell-omsa-repository.repo

sudo chmod 666 /etc/yum.repos.d/dell-omsa-repository.repo

sudo wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

sudo rm -rf /var/cache/yum/*

sudo yum -y install srvadmin-base srvadmin-idrac7 srvadmin-idracadm7 srvadmin-storageservices ipmitool srvadmin-omcommon

sudo yum -y install net-snmp-utils

sudo /etc/init.d/dataeng stop

sleep 10

sudo /etc/init.d/dataeng start

sleep 10

sudo /opt/dell/srvadmin/sbin/srvadmin-services.sh stop

sleep 10

sudo /opt/dell/srvadmin/sbin/srvadmin-services.sh start

sleep 10

sudo /etc/init.d/snmpd stop

sleep 10

sudo /etc/init.d/snmpd start

sleep 30

snmpwalk -v2c -c Oxaihi5puv localhost .1.3.6.1.4.1.674.10892.1