cat <<EOF

for x in `cat ./cluster-ips.txt`;
    do
        ufw sudo ufw allow from $x
done
ufw reload > /dev/null

EOF