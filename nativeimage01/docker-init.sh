#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y zip unzip curl build-essential libz-dev zlib1g-dev

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 22.3.r17-grl
sdk install maven 3.8.6

gu install native-image
mvn -Pnative clean compile package native:compile-no-fork
