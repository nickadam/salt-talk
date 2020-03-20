
include:
  - netdata.deps

netdata:
  cmd.script:
    - source: https://my-netdata.io/kickstart.sh
    - args: --non-interactive
    - creates: /usr/sbin/netdata
