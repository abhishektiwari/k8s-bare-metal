cat <<EOF

# Install Microk8s and configure it
sudo apt install snapd -y
sudo snap install microk8s --classic --channel=1.29
sudo usermod -a -G microk8s ubuntu
sudo chown -f -R ubuntu ~/.kube
sudo usermod -a -G microk8s abhishek
sudo chown -f -R abhishek ~/.kube

sudo microk8s status --wait-ready
sudo echo "alias kubectl='microk8s kubectl'" >> /home/abhishek/.bash_aliases
sudo echo "alias kubectl='microk8s kubectl'" >> /home/ubuntu/.bash_aliases

sudo microk8s enable prometheus
sudo microk8s enable helm
sudo microk8s enable hostpath-storage
sudo microk8s enable community
sudo microk8s enable cloudnative-pg
sudo microk8s enable ha-cluster

EOF