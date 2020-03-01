base:
  '*':
    - screenfetch.installed
  'G@role:worker':
    - netdata.installed
  'salt':
    - go.installed
  'minion?':
    - users.init
