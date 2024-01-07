rm -f init.sh
cd scripts

# Disable any scripts not required
bash update.sh >> ../init.sh
bash users.sh >> ../init.sh
bash sshd.sh >> ../init.sh
bash microk8s.sh >> ../init.sh
bash encrypt.sh >> ../init.sh
bash mk8s-addons.sh >> ../init.sh
bash cloudflared.sh >> ../init.sh
bash ufw-basic.sh >> ../init.sh
bash ufw-cluster.sh >> ../init.sh
bash httpbin.sh >> ../init.sh