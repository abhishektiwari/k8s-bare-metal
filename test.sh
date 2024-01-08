multipass delete k8s-master-1
multipass purge
multipass launch focal --name k8s-master-1 -vvvv --timeout 600 -m 2G
echo "k8s-master-1 created"
multipass transfer init.sh k8s-master-1:
echo "Added init.sh to k8s-master-1"
multipass exec k8s-master-1 -d /home/ubuntu -- sudo -i bash /home/ubuntu/init.sh
echo "Finished running init.sh"