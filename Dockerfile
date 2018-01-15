
# Installing JAVA and configuring in a container 
FROM centos:7
LABEL maintainer=poudelpra@gmail.com
RUN yum update -y
RUN yum install -y vim wget net-tools && useradd -ms /bin/bash userr
RUN cd /opt && wget --no-cookies --no-check-certificate --header \
                "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
                "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz" && tar xzf jdk-8u151-linux-x64.tar.gz && rm -f jdk*.tar.gz
USER userr
RUN echo "export PATH=$PATH:/opt/jdk1.8.0_151/bin:/opt/jdk1.8.0_151/jre/bin" >> ~/.bashrc && \
    echo "export JAVA_HOME=/opt/jdk1.8.0_151" >> ~/$USER/.bashrc && \
    echo "export JRE_HOME=/opt/jdk1.8.0_151/jre" >> ~/$USER/.bashrc



