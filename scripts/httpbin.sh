cat <<EOF

sudo -i -u `head -1 ./data/ssh.users`

echo "$(<./data/httpbin.yaml)" > /home/`head -1 ./data/ssh.users`/httpbin.yaml

micrkk8s kubectl apply -f /home/`head -1 ./data/ssh.users`/httpbin.yaml

EOF