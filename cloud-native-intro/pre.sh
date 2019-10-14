#!/bin/bash
echo "export JAVA_HOME=/usr" >> ~/.profile
source ~/.profile
git clone https://github.com/gcharters/open-cloud-native-intro.git
docker pull open-liberty:latest
