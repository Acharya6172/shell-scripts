#! /bin/bash
clear
echo "MAINTAINER PRAKASH"
/usr/bin/sleep 20
#ifconfig -a
#cat /sys/class/dmi/id/product_uuid

#######REMOVING YOUR STALE APPLICATION
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine \
	          kubelet \
                  kubeadmin \
                  kubelet

####IF YOUR SYSTEM IS MESSED WITH PREVIOUS INSTALL
####BELOW COMMANDS WILL TAKE CARE ----CHEERS
kubeadm reset
rm -rf /etc/kubernetes/*.conf /etc/kubernetes/manifests/*
clear

#####ADDING DOCKER REPO
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

####ADDING KUBERNATES REPO 
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

#####COMPLETELY OPTIONAL -- UPDATING THE APPLICATION / REPO
yum update -y

######INSTALLING DOCKER DEPENDENCIES
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

#####INSTALLING PACKAGES
yum install -y docker-ce \
               kubeadm  \
               kubectl \
               kubelet 

####DISABLING SELINUX, SO PODS CAN TALK EACH OTHER INTERNALLY
setenforce 0

#####K8S CONF
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

#####KUBERNATES HATE SWAP, SO YOU NEED TO DISABLE 
#####YOU CAN COMMIT SWAP BY ISSUWING THE FOLLOWING CONNAMD
#vim /etc/fstab
#####TURNING SWAP OFF FROM COMMANDLINE
#####I WOULD RECOMMAND TO COMMENT SWAP AND ISSUE THE BELOW LISTED COMMAND 
swapoff -a

######ENABLING APPLICATION
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet

####FYI --
sysctl --system

###### DOCKER CGROUP AND KUBERNATES CGROUP SHOULD BE SAME
######YOU CAN CHECK CGROUP OF DOCKER BY ISSUING THE FOLLOWING COMMAND
#docker info | grep -i cgroup
######YOU CAN CHECK CGROUP OF KUBERNATES BY ISSUING THE FOLLOWING COMMAND
#cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

##### YOU CAN FIX THE CGROUP OF KUBERNATES BY ISSUING THE FOLLOWING COMMAND
##### MY ASSUMPTION HERE IS DOCKER IS USING SYSTEMD / CHANGE IT ACCORDINGLY
#####OTHERWISE YOU WILL SUFFER A LOT AS I DID :)
clear



docker_cgroup=docker info | grep cgroup | cut -d':' -f2
echo "docker-cgroup = $docker_cgroup"
sleep 5


sed -i "s/cgroup-driver=systemd/cgroup-driver=$docker_cgroup/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
sed -i "s/cgroup-driver=cgroupfs/cgroup-driver=$docker_cgroup/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    
cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf 

sleep 20

#####RESTARTING DAEMON AND KUBELET
systemctl daemon-reload
systemctl restart kubelet


#### YOUR GAME START FROM HERE..
####USE THE TOKEN PROVIDED TO AND RUN IT IN YOUR SALVE
#kubeadm init

#####EXPORTING KUBECONFIG
#export KUBECONFIG=/etc/kubernetes/admin.conf

######COPYING KUBECONFIG IN $HOME
######--BEING CLEVER --- LOL
#cp etc/kubernetes/admin.conf $HOME/

####POST INSTALLATION WORK FOR BRINGING DNS UP
#kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

#export KUBECONFIG=/etc/kubernetes/admin.conf
echo "============================================================================================================"
echo "============================================================================================================"
echo " K8S is installed"
echo "........!!!!! If you get the below error, run the below command" 
echo " ERROR ==> The connection to the server localhost:8080 was refused - did you specify the right host or port?"
echo " COMMAND ==> export KUBECONFIG=/etc/kubernetes/admin.conf "
echo "============================================================================================================="
echo "============================================================================================================="
sleep 5
echo "===============================================YOU ARE ALL SET==============================================="
sleep 20
