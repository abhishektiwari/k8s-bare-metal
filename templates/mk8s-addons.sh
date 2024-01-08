cat <<EOF

# Enable microk8s required add-ons
# Comment out if any addons not applicable to your use case
sudo microk8s enable observability
sudo microk8s enable helm
sudo microk8s enable hostpath-storage
sudo microk8s enable community
sudo microk8s enable cloudnative-pg
sudo microk8s enable ha-cluster
sudo microk8s enable rbac
sudo microk8s enable argocd
# sudo microk8s enable metallb:10.64.140.43-10.64.140.49
# sudo microk8s enable keda
# sudo microk8s enable minio
# sudo microk8s enable cert-manager

EOF