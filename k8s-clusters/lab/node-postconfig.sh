# in master node
# kubeadm reset -f
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.56.11 --apiserver-cert-extra-sans=controlplane
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# in worker node run this
# kubeadm join 192.168.56.11:6443 --token iak2x5.rjfupke509s8ijs5 \
#         --discovery-token-ca-cert-hash sha256:44c36179f6556772b0be90956cb6c33766cd2bf974ce2d9360e3e4d467574b65
# if some config already existed
# run: kubeadm reset
# generate if you lost above token
# on controlplane node run:
# kubeadm token create --print-join-command

# after upgrade
# export KUBECONFIG=/etc/kubernetes/kubelet.conf