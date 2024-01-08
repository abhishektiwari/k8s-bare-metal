cat <<EOF

# SSH using Cloudflare short-lived certificate public key

sudo echo  "$(<./data/ca.pub)" >> /etc/ssh/ca.pub
sudo sed -i 's/^#PubkeyAuthentication\ yes/PubkeyAuthentication\ yes/g' /etc/ssh/sshd_config
sudo echo "TrustedUserCAKeys /etc/ssh/ca.pub" >> /etc/ssh/sshd_config.d/TrustedUserCAKeys.conf
sudo systemctl restart sshd

# Install Remotely managed CloudFlare Tunnel

curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb

sudo dpkg -i cloudflared.deb

sudo cloudflared service install "$(<./data/cf_token.txt)"

EOF