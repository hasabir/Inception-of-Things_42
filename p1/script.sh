#!/bin/sh

apk update
apk add curl iptables openrc

if [ "$1" = "server" ]; then
#   curl -sfL https://get.k3s.io/ | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -
  curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1 --disable traefik --tls-san 192.168.56.110 --node-ip 192.168.56.110" sh -
  
  until [ -f /etc/rancher/k3s/k3s.yaml ]; do
    echo "Waiting for k3s to start..."
    sleep 5
  done




  chmod 644 /etc/rancher/k3s/k3s.yaml



  NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
  cat ${NODE_TOKEN} > /vagrant/node-token










# elif [ "$1" = "agent" ]; then
#   SERVER_IP="192.168.56.110"
#   TOKEN=$(ssh -o StrictHostKeyChecking=no root@$SERVER_IP "cat /var/lib/rancher/k3s/server/node-token")
#   curl -sfL https://get.k3s.io/ | K3S_URL="https://$SERVER_IP:6443" K3S_TOKEN="$TOKEN" sh -s - agent --node-name hasabirSW --flannel-iface eth1
fi
























# #!/bin/sh

# apk update


# apk add curl iptables openrc

# curl -sfL https://get.k3s.io/ | sh -


# k3s server &
# chmod 644 /etc/rancher/k3s/k3s.yaml

# curl -s https://api.github.com/repos/k3s-io/k3s/releases/latest | grep tag_name
# k3s --version
# kubectl get nodes
# kubectl get nodes
# history




# wget https://github.com/k3s-io/k3s/releases/download/v1.31.5%2Bk3s1/k3s

# chmod +x k3s

# mv k3s /usr/local/bin/k3s

# if [ "$1" ]; then
#   k3s server &
# else
#   k3s agent --server https://$1:6443 --token $2 &
# fi




# # Update the package list


# # Install Apache2
# apk add apache2

# # Start the Apache2 service
# rc-service apache2 start

# # Enable Apache2 to start on boot
# rc-update add apache2 default
# # Create a simple HTML file to serve
# # echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/localhost/htdocs/index.html