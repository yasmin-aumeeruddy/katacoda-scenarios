#!/bin/bash
git clone https://github.com/gcharters/open-cloud-native-intro.git
docker pull open-liberty:latest
echo "export JAVA_HOME=/usr" >> .bashrc
source ~/.bashrc