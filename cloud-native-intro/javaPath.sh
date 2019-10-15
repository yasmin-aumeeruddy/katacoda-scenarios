#!/bin/bash
echo "Waiting to complete"; while [ ! -d /open-cloud-native-intro ] ; do sleep 2; done; echo "Done"
source ~/.profile
