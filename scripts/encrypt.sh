cat <<EOF

# Encrypting secrets at rest in microK8s

sudo -i -u `head -1 ./data/ssh.users`

echo "---
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
    - identity: {}" >> /home/`head -1 ./data/ssh.users`/encrypt.yaml

# Find location of API Server args file by running: pgrep -an kubelite
# Find microk8s revision which can be found by running: microk8s version

$(<./data/revision)

# Append encryption provider to API Server args file 
echo "--encryption-provider-config=/home/`head -1 ./data/ssh.users`/encrypt.yaml" >> $(<./data/apiserver)

# Restart kubelite
sudo systemctl restart snap.microk8s.daemon-kubelite

# Replace old secrets - if any
kubectl get secrets --all-namespaces -o json | kubectl replace -f -


EOF