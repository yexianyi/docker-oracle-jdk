# This docker file is for creating CentOS7 + JDK1.8
FROM centos:7.3.1611

ARG JDK_VERSION=jdk-8u131
ARG JDK_PACKAGE=$JDK_VERSION-linux-x64.tar.gz
ARG JDK_INSTALL_PATH=/usr/lib/java

ENV JAVA_HOME=$JDK_INSTALL_PATH/$JDK_VERSION
ENV PATH=$JAVA_HOME/bin:$PATH


MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

RUN yum update -y \
	&& yum install -y wget \
	&& yum clean all \
	&& yum autoremove -y \
	
	# Install Oracle JDK
	&& mkdir $JDK_INSTALL_PATH \
	&& cd $JDK_INSTALL_PATH \
	&& wget https://github.com/yexianyi/docker-assets/raw/master/JDK/$JDK_PACKAGE
	&& tar -xzvf $JDK_PACKAGE \
	&& rm -f ./$JDK_PACKAGE \
