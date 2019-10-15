#!/bin/bash
echo "Waiting to complete"; while [ ! -f /open-cloud-native-intro ] ; do sleep 2; done; echo "Done"
source ~/.profile
