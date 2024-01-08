cat <<EOF

# Use ubuntu as user as script is run by same
# Alternatively source user from ssh.users list
# /home/`head -1 ./data/ssh.users`/encrypt.yaml

sudo echo "$(<./data/httpbin.yaml)" > /root/httpbin.yaml

sg microk8s -c 'sudo microk8s kubectl apply -f /root/httpbin.yaml'

EOF