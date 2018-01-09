
#! /bin/bash
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
yum -y update && yum -y install epel-release \
gcc \
dkms \ 
make \
qt \
libgomp \ 
patch \
kernel-headers \ 
kernel-devel  \
binutils \
glibc-headers \ 
glibc-devel \
font-forge \
VirtualBox-5.1
echo "Virtual Box is Installed"
/sbin/vboxconfig
echo " EXPECT THE BELOW 3 LINES"
sleep 2
echo "vboxdrv.sh: Stopping VirtualBox services."
echo "vboxdrv.sh: Building VirtualBox kernel modules."
echo "vboxdrv.sh: Starting VirtualBox services."
echo "Installing Vagrant in your system"
cd /opt && wget https://releases.hashicorp.com/vagrant/1.9.7/vagrant_1.9.7_x86_64.rpm
yum localinstall -y vagrant_1.9.7_x86_64.rpm
mkdir /$HOME/development && cd /$HOME/development && vagrant init
echo " Cheers !!!!!!"
sleep 5
