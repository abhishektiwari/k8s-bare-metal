multipass delete k8s-master
multipass purge
multipass launch focal --name k8s-master -vvvv --timeout 600 -m 4G -c 2
echo "k8s-master created"
multipass transfer init.sh k8s-master:
echo "Added init.sh to k8s-master"
multipass exec k8s-master -d /home/ubuntu -- sudo -i bash /home/ubuntu/init.sh
echo "Finished running init.sh on k8s-master"