cat <<EOF

echo "$(<./data/httpbin.yaml)" >> /home/ubuntu/httpbin.yaml
kubectl apply -f /home/ubuntu/httpbin.yaml

EOF