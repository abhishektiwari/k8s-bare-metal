cat <<EOF
# Add SSH users
EOF
for user in `cat ./data/ssh.users`;
do
cat <<EOF

# Add user ${user}
sudo adduser ${user} --disabled-password
sudo usermod -aG sudo,adm,dialout,cdrom,floppy,audio,dip,video,plugdev,netdev,lxd ${user}
sudo echo "${user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo echo  "$(<./data/authorized_keys)" >> /home/${user}/.ssh/authorized_keys

EOF
done
