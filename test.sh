multipass delete k8s-master-1
multipass purge
multipass launch focal --name k8s-master-1 -vvvv --timeout 600
multipass transfer init.sh k8s-master-1:
multipass exec k8s-master-1 -d /home/ubuntu -- sudo -i bash init.sh