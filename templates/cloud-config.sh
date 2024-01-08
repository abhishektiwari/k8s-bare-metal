#cloud-config
cat << EOF
- path: /usr/local/bin/init.sh
  content: |
EOF
sed 's/^[    ]*/    /'  <<EOF
$(<../init.sh)
EOF
cat << EOF
  permissions: '0755'

runcmd:
- [ sh, root, "/usr/local/bin/init.sh" ]
EOF