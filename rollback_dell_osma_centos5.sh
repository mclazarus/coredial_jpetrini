#!/bin/bash

#### Dell OMSA and SNMP Uninstall 09/16/2014 jpetrini. 

sudo yum -y update

sudo yum -y remove srvadmin-base srvadmin-idrac7 srvadmin-idracadm7 srvadmin-storageservices ipmitool srvadmin-omcommon

sudo yum -y remove net-snmp-utils


