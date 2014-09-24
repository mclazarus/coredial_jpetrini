#!/bin/bash

#### Test OSMA tools

snmpwalk -v2c -c Oxaihi5puv localhost .1.3.6.1.4.1.674.10892.1 &> `hostname`_OSMA_fail.log
retval=$?
if [ $retval -ne 0 ]; then
    scp -o "StrictHostKeyChecking no" "`hostname`_OSMA_fail.log" voiceaxis@castor.coredial.com:/home/voiceaxis/OSMA_FAILS && rm `hostname`_OSMA_fail.log
    else rm `hostname`_OSMA_fail.log
fi

