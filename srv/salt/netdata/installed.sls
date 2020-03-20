
include:
  - netdata.deps

netdata:
  cmd.script:
    - source: https://my-netdata.io/kickstart.sh
    - creates: /usr/sbin/netdata
