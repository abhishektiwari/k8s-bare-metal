cat <<EOF

# Add user abhishek
adduser abhishek --disabled-password
usermod -aG sudo,adm,dialout,cdrom,floppy,audio,dip,video,plugdev,netdev,lxd
echo "abhishek ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo  "$(<./data/authorized_keys)" >> /home/abhishek/.ssh/authorized_keys

EOF