#!/bin/bash
echo "export JAVA_HOME=/usr" >> ~/.bashrc
echo "source ~/.bashrc" >> ~/.bashrc
git clone https://github.com/gcharters/open-cloud-native-intro.git
docker pull open-liberty:latest
