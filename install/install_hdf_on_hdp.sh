#!/bin/bash
source install.cfg

# AMBARI MPACK HDF
HOST=$HOSTPREFIX$AMBARI_NUMBER$DOMAIN
echo '============================================================================'
echo 'Installing HDF on Ambari on ' $HOST
echo '============================================================================'
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST << EOF
sudo wget $MPACK_AMBARI_HDF_URL
sudo ambari-server install-mpack --mpack=${MPACK_AMBARI_HDF_URL##*/} --verbose
sudo ambari-server restart
EOF
