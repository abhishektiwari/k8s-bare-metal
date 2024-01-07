rm -f user_data.sh
cd scripts

# Disable any scripts not required
bash update.sh >> ../user_data.sh
bash users.sh >> ../user_data.sh
bash sshd.sh >> ../user_data.sh
bash microk8s.sh >> ../user_data.sh
bash cloudflared.sh >> ../user_data.sh
bash ufw-basic.sh >> ../user_data.sh
# bash ufw-cluster.sh >> ../user_data.sh
bash httpbin.sh >> ../user_data.sh
