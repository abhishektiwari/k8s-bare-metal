# Bare metal Kubernetes using microk8s
Instead of virtual machines (VMs), deploy mini production-grade Kubernetes cluster (*ideally 3-4 nodes*) directly on bare metal servers. We will use [microk8s](https://microk8s.io) as it is a lightweight Kubernetes distribution and probably easiest and fastest way to get Kubernetes up and running.

**Caution ⚠️⚠️⚠️** 
* `microk8s` may not be right choice for large clusters. Use `kubeadm` or other Kubernetes provisioning tools.
* `snap` updates are disabled for `microk8s` to avoid automated refresh and breaking your production cluster.

**Minimum node requirements:**
* CPU: 4c/8t or more
* RAM: 16GB or more
* Disk: 256GB SSD/NVMe or more

**For high-available setup:**
* Minimum 3 or more nodes
* Network connectivity between nodes

Network connectivity between nodes can be private or public although private connectivity is recommended.

# Step-by-step

## Add files into `data` folder
See `example` files for your reference.

* `authorized_keys` [Required] - Public keys of the user for ssh. Each key on a new line.
* `ssh.users` [Required] - List of users to enabled for SSH on node. Each user on a new line.
* `cluster-ips.txt` [Optional] - List of IPs for `microk8s` cluster nodes. Each IP on a new line.
* `cf_token.txt` [Optional]- Cloudflare token to setting up [tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-remote-tunnel/)
* `ca.pub` [Optional]- Cloudflare short-lived certificate [public key](https://developers.cloudflare.com/cloudflare-one/identity/users/short-lived-certificates/) for SSH via [native terminal](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/use-cases/ssh/#native-terminal) and/or [browser-rendered terminal](https://developers.cloudflare.com/cloudflare-one/applications/non-http/#rendering-in-the-browser).




You can use Cloudflare tunnels to: (1) Connect cluster nodes with SSH. (2) Expose a Kubernetes app/service to the internet.

Setup also includes a Kubernetes manifest file to deploy [httpbin](https://httpbin.org) service so you can test everything is working as expected. 


## Generate user data file
In `output.sh` comment out any scripts you want to exclude from generated `init.sh` file. Execute following, 

```
bash output.sh
```

Use `init.sh` file when provisioning Kubernetes cluster nodes. Depending on your provider, either copy paste the file content or upload it to a secure location and use the URL as part of cloud-init (when creating node) or post installation script (after creating node). 

## Access nodes from native terminal
First configure your native terminal for SSH via Cloudflare tunnel. For macOS please run following,

```
bash macos.sh
```



## Enable HA
On master node execute [following](https://microk8s.io/docs/high-availability),

```
microk8s add-node
```

This will return some joining instructions which should be executed on the other microK8s nodes that you wish to join to the cluster.

For more information on clustering [see](https://microk8s.io/docs/clustering)


## Test scripts using Multipass

```
bash test.sh
```

## Notes

- `microk8s` was installed using Ubuntu `snap`. Automated `snap` refresh for `microk8s` is [disabled](https://snapcraft.io/docs/managing-updates#heading--control). If you want to update then you will need to run following command on each host

```
snap refresh
```