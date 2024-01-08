cat <<EOF

# Use ubuntu as user as script is run by same
# Alternatively source user from ssh.users list
# /home/`head -1 ./data/ssh.users`/encrypt.yaml

echo "$(<./data/httpbin.yaml)" > /home/ubuntu/httpbin.yaml

micrkk8s kubectl apply -f /home/ubuntu/httpbin.yaml

EOF