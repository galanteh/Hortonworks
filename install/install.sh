#!/bin/bash
source install.cfg

if [ "$GENERATE_KEYS" = "Y" ] ; then
	mkdir .ssh
	chmod 700 .ssh
	ssh-keygen -f .ssh/id_rsa -t rsa -N ""
	cat .ssh/id_rsa.pub >> authorized_keys
fi

n=$START
while [[ $n -le $NUMINSTANCES ]]; do
	HOST=$HOSTPREFIX$n$DOMAIN
	echo '============================================================================'
  echo 'Executing on ' $HOST
	echo '============================================================================'
	sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST 'bash -s' < prepare_host
	sshpass -p $PASSWORD scp -o StrictHostKeyChecking=no -o ServerAliveInterval=30 authorized_keys $USER@$HOST:/home/admin/.ssh/authorized_keys
	echo 'Rebooting ... ' $HOST
	sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST << EOF
sudo chmod 600 /home/admin/.ssh/authorized_keys
sudo hostname $HOST
sleep 5
/sbin/reboot
EOF
	let n++
done

# AMBARI
HOST=$HOSTPREFIX$AMBARI_NUMBER$DOMAIN
echo '============================================================================'
echo 'Installing Ambari on ' $HOST
echo '============================================================================'
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST << EOF
sudo wget -nv $AMBARI_REPO_URL -O /etc/yum.repos.d/ambari.repo
sudo yum repolist
sudo yum -y install ambari-server
sudo ambari-server setup -s
sudo ambari-server start
EOF

## MariaDB 10.1
HOST=$HOSTPREFIX$MARIA_DB_NUMBER$DOMAIN
echo '============================================================================'
echo 'Installing MariaDB on ' $HOST
echo '============================================================================'
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST 'bash -s' < prepare_mariadb
