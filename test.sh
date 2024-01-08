# multipass launch focal --name k8s-master -vvvv --timeout 600
multipass delete k8s-master && multipass purge
multipass launch focal --name k8s-master --cloud-init cloud-config.yaml -vvvv --timeout 600
multipass shell k8s-master