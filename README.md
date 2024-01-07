# Kubernetes setup on bare metal 

# Add files into data folder

* `authorized_keys` - Public keys of the user for ssh. Each key on a new line.
* `ca.pub` - Cloudflare short-lived certificate [public key](https://developers.cloudflare.com/cloudflare-one/identity/users/short-lived-certificates/) for SSH
* `cf_token.txt` - Cloudflare token to setting up [tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-remote-tunnel/)
* `cluster-ips.txt` - List of IPs for `microk8s` cluster nodes. Each IP on a new line.

# Generate user data file

```
bash output.sh
```

Use use data file when creating host.

# Enable HA
On master node run [following](https://microk8s.io/docs/high-availability).

```
microk8s add-node
```
This will return some joining instructions which should be executed on the MicroK8s instance that you wish to join to the cluster.

For more information on clustering [see](https://microk8s.io/docs/clustering)

