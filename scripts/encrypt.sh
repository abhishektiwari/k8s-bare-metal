cat <<EOF

# Encrypting secrets at rest in microK8s
sudo -i -u `head -1 ./data/ssh.users`

sudo echo "---
apiVersion: apiserver.config.k8s.io/v1
kind: EncryptionConfiguration
resources:
  - resources:
    - secrets
    providers:
    - aescbc:
        keys:
        - name: k8s-crypto
          secret: $(<./data/encryption.key)
    - identity: {}" > /home/`head -1 ./data/ssh.users`/encrypt.yaml

# Find location of API Server args file by running: pgrep -an kubelite
# Find microk8s revision which can be found by running: microk8s version

$(<./data/revision)

# Append encryption provider to API Server args file 
if grep -E "^--encryption-provider-config" $(<./data/apiserver)
then
    sudo echo "Encryption at rest for secret already configured"
else
    sudo echo "Encryption at rest for secret not configured"
    sudo echo "--encryption-provider-config=/home/`head -1 ./data/ssh.users`/encrypt.yaml" >> $(<./data/apiserver)
    # Restart kubelite
    sudo systemctl restart snap.microk8s.daemon-kubelite
    # Replace old secrets - if any
    microk8s kubectl get secrets --all-namespaces -o json | microk8s kubectl replace -f -
fi

EOF