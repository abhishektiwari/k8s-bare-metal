cat <<EOF

# Encrypting secrets at rest in microK8s
# Use ubuntu as user as script is run by same
# Alternatively source user from ssh.users list
# /home/`head -1 ./data/ssh.users`/encrypt.yaml

$(<./partials/random32)

if ! test -f /root/encrypt.yaml
then
echo "Encryption file does not exist."
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
          secret: $(<./partials/encryption)
    - identity: {}" > /root/encrypt.yaml

# Find location of API Server args file by running: pgrep -an kubelite
# Find microk8s revision which can be found by running: microk8s version
else
echo "Encryption file exists Skipping encryption key creation."
fi


$(<./partials/revision)

# Append encryption provider to API Server args file 
if grep -E "^--encryption-provider-config" $(<./partials/apiserver)
then
    sudo echo "Encryption at rest for secret already configured. Skipping configuraiton."
else
    sudo echo "Encryption at rest for secret not configured"
    sudo echo "--encryption-provider-config=/root/encrypt.yaml" >> $(<./partials/apiserver)
    # Restart kubelite
    sudo systemctl restart snap.microk8s.daemon-kubelite
    # Replace old secrets - if any
    # sg microk8s -c 'sudo microk8s kubectl get secrets --all-namespaces -o json | sudo microk8s kubectl replace -f -'
fi

EOF