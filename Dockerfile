# This docker file is for creating OpenSUSE42.2 + JDK1.8
FROM opensuse:42.2

ARG JDK_PACKAGE=jdk-8u131-linux-x64.tar.gz
ARG JDK_INSTALL_PATH=/usr/lib/java

ENV JAVA_HOME=$JDK_INSTALL_PATH/jdk1.8.0_131
ENV PATH=$JAVA_HOME/bin:$PATH


MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

RUN zypper update -y \
	&& zypper install -y wget \
	&& zypper clean --all \
	
	# Install Oracle JDK
	&& mkdir $JDK_INSTALL_PATH \
	&& cd $JDK_INSTALL_PATH \
	&& wget https://github.com/yexianyi/docker-assets/raw/master/JDK/$JDK_PACKAGE \
	&& tar -xzvf $JDK_PACKAGE \
	&& rm -f ./$JDK_PACKAGE \
