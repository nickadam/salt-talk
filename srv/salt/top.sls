base:
  '*':
    - screenfetch.installed
  'L@role:worker':
    - netdata.installed
  'salt':
    - go.installed
  'minion?':
    - users.init
