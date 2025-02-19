#!/bin/sh

apk update
apk add curl iptables openrc

curl -sfL https://get.k3s.io/ | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -
until [ -f /etc/rancher/k3s/k3s.yaml ]; do
	echo "Waiting for k3s to start..."
	sleep 5
done
chmod 644 /etc/rancher/k3s/k3s.yaml
