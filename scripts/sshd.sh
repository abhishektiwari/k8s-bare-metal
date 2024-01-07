cat <<EOF

# Modify sshd
sed -i 's/PermitRootLogin\ yes/PermitRootLogin\ no/g' /etc/ssh/sshd_config
systemctl restart sshd

EOF