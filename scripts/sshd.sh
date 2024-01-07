cat <<EOF

# Modify sshd
sudo sed -i 's/PermitRootLogin\ yes/PermitRootLogin\ no/g' /etc/ssh/sshd_config
systemctl restart sshd

EOF