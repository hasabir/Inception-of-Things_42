#!/bin/bash

apk update
apk add curl iptables openrc git


curl -sfL https://get.k3s.io/ | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -
until [ -f /etc/rancher/k3s/k3s.yaml ]; do
	echo "Waiting for k3s to start..."
	sleep 5
done
chmod 644 /etc/rancher/k3s/k3s.yaml

echo "192.168.56.110 app1.com" | tee -a /etc/hosts
echo "192.168.56.110 app2.com" | tee -a /etc/hosts
echo "192.168.56.110 app3.com" | tee -a /etc/hosts



kubectl apply -f /vagrant/app1.yaml --validate=false
kubectl apply -f /vagrant/app2.yaml --validate=false
kubectl apply -f /vagrant/app3.yaml --validate=false
kubectl apply -f /vagrant/ingress.yaml --validate=false




echo "Setup complete!"


# bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"