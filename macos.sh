
#!/bin/bash

brew install cloudflared

# Update hostname (node.cloudflare-cname.com) to your CloudFlare Tunnel domain name
# This will use public SSH keys we uploaded by user
echo "node.cloudflare-cname.com
    HostName node.cloudflare-cname.com
    ProxyCommand /opt/homebrew/bin/cloudflared access ssh --hostname %h" >> .ssh/config