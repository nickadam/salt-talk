#!/bin/bash

# Download and extract go
if [ ! -f /usr/local/go/bin/go ] 
then
  cd /root
  wget -q https://dl.google.com/go/go1.14.linux-amd64.tar.gz
  tar -C /usr/local -xzf /root/go1.14.linux-amd64.tar.gz
  rm /root/go1.14.linux-amd64.tar.gz
fi

# Add go bin path to global profile
if ! grep /usr/local/go/bin /etc/profile >/dev/null
then
  echo export PATH=\$PATH:/usr/local/go/bin >> /etc/profile
fi
