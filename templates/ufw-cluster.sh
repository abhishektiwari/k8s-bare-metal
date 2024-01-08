cat <<EOF
# Allow all traffic from cluster node IPs
EOF
for ip in `cat ./data/cluster-ips.txt`;
do
cat <<EOF
sudo ufw sudo ufw allow from ${ip}
EOF
done
cat <<EOF
# Reload the update firewall
sudo ufw reload
EOF
