#! /bin/bash
clear
printf "\t  It only works for %s Family\n\n" "RedHat"
printf "\n\n"
printf "\n\tMaintainer PRAKASH POUDEL"
printf "\n\n"
sleep 5
printf "\n\t Configuring JAVA in your System \n\n"
sleep 3
printf "\n\n"
cd /opt
sudo rm -rf /opt/jdk*
yum install -y net-tools wget vim 
sudo wget --no-cookies --no-check-certificate --header \
		"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
                "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz"
sudo tar xzf jdk-8u151-linux-x64.tar.gz && rm -f jdk*.tar.gz
cd  /opt/jdk1.8.0_151/
clear
echo "export PATH=$PATH:/opt/jdk1.8.0_151/bin:/opt/jdk1.8.0_151/jre/bin" > ~/.bashrc
echo "export JAVA_HOME=/opt/jdk1.8.0_151" >> ~/.bashrc
echo "export JRE_HOME=/opt/jdk1.8.0_151/jre" >> ~/.bashrc
echo "  JAVA IS INSTALLED"
printf "\n\n\n"
echo "Your JAVA-HOME=" $JAVA_HOME
echo "Your JRE-HOME=" $JRE_HOME
echo "Your SYSTEM-PATH=" $PATH
printf "\n\n"
echo " YOUR JAVA ENVIRONMENT IS SET UP!! "
printf "\n\n"
source ~/.bash_profile
sleep 10
clear
