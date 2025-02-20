#!/bin/bash

apk update
apk add curl iptables openrc git

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

curl -sfL https://get.k3s.io/ | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -
until [ -f /etc/rancher/k3s/k3s.yaml ]; do
	echo "Waiting for k3s to start..."
	sleep 5
done
chmod 644 /etc/rancher/k3s/k3s.yaml


# kubectl create namespace ingress-nginx
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

# until kubectl get pods -n ingress-nginx | grep -m1 'Running'; do
#     echo "Waiting for ingress-nginx to start..."
#     sleep 5
# done

echo "192.168.56.110 app-one.com" | tee -a /etc/hosts

echo "Setup complete!"

