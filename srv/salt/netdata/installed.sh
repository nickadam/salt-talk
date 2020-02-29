#!/bin/bash
if [ ! -f "/usr/sbin/netdata" ]
then
  bash <(curl -Ss https://my-netdata.io/kickstart.sh)
fi
