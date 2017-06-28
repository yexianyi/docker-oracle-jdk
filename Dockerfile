# This docker file is for creating CentOS7 + JDK1.8
FROM centos:7.3.1611

ARG JDK_VERSION=jdk-8u131
ARG JDK_PACKAGE=$JDK_VERSION-linux-x64.tar.gz
ARG JDK_INSTALL_PATH=/usr/lib/java

ENV JAVA_HOME=$JDK_INSTALL_PATH/$JDK_VERSION
ENV PATH=$JAVA_HOME/bin


MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

RUN yum update -y \
	&& yum install -y wget \
	&& yum clean all \
	&& yum autoremove -y \
	
	# Install Oracle JDK
	&& mkdir $JDK_INSTALL_PATH \
	&& cd $JDK_INSTALL_PATH \
	&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDK_PACKAGE \
	&& tar -xzvf $JDK_PACKAGE \
	&& rm ./$JDK_PACKAGE \
