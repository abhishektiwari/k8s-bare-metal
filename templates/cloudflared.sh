cat <<EOF

# SSH using Cloudflare short-lived certificate public key

echo  "$(<./data/ca.pub)" >> /etc/ssh/ca.pub
sed -i 's/^#PubkeyAuthentication\ yes/PubkeyAuthentication\ yes/g' /etc/ssh/sshd_config
echo "TrustedUserCAKeys /etc/ssh/ca.pub" >> /etc/ssh/sshd_config.d/TrustedUserCAKeys.conf
systemctl restart sshd

# Install Remotely managed CloudFlare Tunnel

curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb

sudo dpkg -i cloudflared.deb

sudo cloudflared service install "$(<./data/cf_token.txt)"

EOF