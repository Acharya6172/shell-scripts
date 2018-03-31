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
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98
tar -xvf jdk-8u161-linux-x64.tar.gz
mv jdk1.8.0_161 java && cd java

clear
 alternatives --install /usr/bin/java java /opt/java/bin/java 2
# alternatives --config java
 alternatives --install /usr/bin/jar jar /opt/java/bin/jar 2
 alternatives --install /usr/bin/javac javac /opt/java/bin/javac 2
 alternatives --set jar /opt/java/bin/jar
 alternatives --set javac /opt/java/bin/javac

export JAVA_HOME=/opt/java
export JRE_HOME=/opt/java/jre
export PATH=$PATH:/opt/java/bin:/opt/java/jre/bin
echo "  JAVA IS INSTALLED"
printf "\n\n\n"
echo "Your JAVA-HOME=" $JAVA_HOME
echo "Your JRE-HOME=" $JRE_HOME
echo "Your SYSTEM-PATH=" $PATH
printf "\n\n"
echo " YOUR JAVA ENVIRONMENT IS SET UP!! "
printf "\n\n"
sleep 10
clear
