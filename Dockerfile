FROM centos:7
ENV container docker
VOLUME [ "/sys/fs/cgroup" ]
RUN mkdir /sac
RUN mkdir /sac/tools
RUN yum update -y && yum install -y nfs-utils dos2unix openssh-clients wget git
ADD ./docker-entrypoint.sh docker-entrypoint.sh
ADD ./nokia.repo /etc/yum.repos.d/nokia.repo
ADD ./redhat.repo /etc/yum.repos.d/redhat.repo
RUN rm -rf /etc/yum.repos.d/CentOS-*
RUN yum clean all
RUN yum -y install xinetd autofs net-tools wget iptables-services telnet iptraf openssl java-1.8.0-openjdk-headless-1.8.0.212.b04-0.el7_6.x86_64 java-1.8.0-openjdk-devel-1.8.0.212.b04-0.el7_6.x86_64 tigervnc-server xorg-x11-fonts-Type1
RUN dos2unix docker-entrypoint.sh
ENTRYPOINT ./docker-entrypoint.sh