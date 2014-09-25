#!/bin/bash

#### Test OSMA tools

##Run snmpwalk and dump output to *_OSMA_fail.log
snmpwalk -v2c -c Oxaihi5puv localhost .1.3.6.1.4.1.674.10892.1 &> `hostname`_OSMA_fail.log

##Check if return code is 0 or 1. If not 0; scp *_OSMA_fail.log to Castor and delete local version; else just delete local version.
retval=$?
if [ $retval -ne 0 ]; then
    scp -o "StrictHostKeyChecking no" "`hostname`_OSMA_fail.log" voiceaxis@castor.coredial.com:/home/voiceaxis/OSMA_FAILS && rm `hostname`_OSMA_fail.log
    else rm `hostname`_OSMA_fail.log
fi

