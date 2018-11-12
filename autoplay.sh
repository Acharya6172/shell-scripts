#! /bin/bash
clear
printf "\n\t\tThis Script install GIT MAVEN JENKINS ANSIBLE & DOCKER \n\n"
printf " \t\t  It only works for %s Family\n\n" "RedHat"
printf "\n"
printf "\n\t\t\t Maintainer PRAKASH POUDEL"
printf "\n\n\n\n"
sleep 3
clear
printf "\n\n\n\n"
echo " UPDATING YOUR SYSTEM"
echo "UPDATING YOUR REPO GIVES THE LATEST PACKAGES"
sleep 5
suoo yum update -y
#scripts/installing-java.sh
sudo yum install java-1.8.0-openjdk -y
clear
echo " Installing the following Package"
printf "\n\tGIT\n\tMAVEN\n\tANSIBLE\n\tJENKINS\n\tDOCKERS\n\tPYTHON\n\tPYTHON-DEVL\n\tPYTHON-PIP\n\tAnd all their Dependencies needed . . ."
sleep 10
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

sudo yum install -y git \
               maven \
               epel-release \
               ansible \
               docker \
               jenkins
               python \
               python-devel \
               python-pip

sudo systemctl restart jenkins && systemctl enable jenkins
sudo systemctl restart docker && systemctl enable docker
clear
echo "Following Packages are installed:"
printf "\n\tGIT\n\tMAVEN\n\tANSIBLE\n\tJENKINS\n\tAnd all their Dependencies needed . . .\n\n"
sleep 3
printf "\nYour JENKINS IS UPTO DATE , YOU CAN BROWSE IT IN PORT 8080\n"
sleep 5
printf "\n Your ANSIBLE is all set, but you still you need to configure HOST file\n"
echo "The host file is located in /etc/ansible/hosts"
printf "\n\n========== You are all set==========\n\n"
sleep 10
echo " Your System is RESTARTING in 20 secs"
echo " Press CTRL + C to bypass restarting"
sleep 20
printf "\n\nREBOOTING . . . . . . . . . . "
sleep 3
/usr/sbin/reboot

