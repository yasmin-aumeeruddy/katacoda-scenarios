#!/bin/bash
git clone https://github.com/gcharters/open-cloud-native-intro.git
echo "export JAVA_HOME=/usr" >> .profile
docker pull open-liberty:latest