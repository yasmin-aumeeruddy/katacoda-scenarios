#!/bin/bash
echo "export JAVA_HOME=/usr" >> ~/.bashrc
git clone https://github.com/gcharters/open-cloud-native-intro.git
exec bash
docker pull open-liberty:latest
