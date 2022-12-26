#!/bin/bash

microdnf update -y
microdnf install wget -y
mkdir /usr/local/maven
wget ${MAVEN_DOWNLOAD_URL}
tar xzf ${MAVEN_FILE} -C /usr/local/maven/ --strip-components=1
echo export 'PATH=$PATH:/usr/local/maven/bin/' > /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -Pnative clean compile package native:compile-no-fork