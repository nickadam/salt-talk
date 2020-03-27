install_go:
  archive.extracted:
    - name: /usr/local
    - source: https://dl.google.com/go/go1.14.linux-amd64.tar.gz
    - skip_verify: True
    - archive_format: tar
    - options: z
    - enforce_toplevel: False
    - failhard: True
    - overwrite: True
    - unless:
      - test "$(go version)" == "go version go1.14 linux/amd64"
  file.managed:
    - name: /etc/profile.d/go_path.sh
    - mode: '0644'
    - contents: |
        export PATH=$PATH:/usr/local/go/bin
