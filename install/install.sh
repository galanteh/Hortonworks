#!/bin/bash
source install.cfg

if [ "$GENERATE_KEYS" = "Y" ] ; then
	mkdir .ssh
	chmod 700 .ssh
	ssh-keygen -f .ssh/id_rsa -t rsa -N ""
	cat .ssh/id_rsa.pub >> authorized_keys
fi

n=$START
echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" > hosts
echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> hosts
while [[ $n -le $NUMINSTANCES ]]; do
	HOST=$HOSTPREFIX$n$DOMAIN
	IP=$(nslookup $HOST | awk '/^Address: / { print $2 }')
	echo "$IP $HOST $HOSTPREFIX$n" >> hosts
        let n++
done

n=$START
while [[ $n -le $NUMINSTANCES ]]; do
	HOST=$HOSTPREFIX$n$DOMAIN
	echo '============================================================================'
  echo 'Executing on ' $HOST
	echo '============================================================================'
	sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST 'bash -s' < prepare_host
	sshpass -p $PASSWORD scp -o StrictHostKeyChecking=no -o ServerAliveInterval=30 .ssh/authorized_keys $USER@$HOST:/home/admin/.ssh/authorized_keys
        sshpass -p $PASSWORD scp -o StrictHostKeyChecking=no -o ServerAliveInterval=30 hosts $USER@$HOST:/etc/hosts_cluster
	echo 'Rebooting ... ' $HOST
	sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST << EOF
sudo chmod 600 /home/admin/.ssh/authorized_keys
sudo hostname $HOST
sudo mv /etc/hosts /etc/hosts_original
sudo mv /etc/hosts_cluster /etc/hosts
sleep 5
/sbin/reboot
EOF
	let n++
done

## MariaDB 10.1
HOST=$HOSTPREFIX$MARIA_DB_NUMBER$DOMAIN
echo '============================================================================'
echo 'Installing MariaDB on ' $HOST
echo '============================================================================'
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST 'bash -s' < prepare_mariadb

# AMBARI
HOST=$HOSTPREFIX$AMBARI_NUMBER$DOMAIN
echo '============================================================================'
echo 'Installing Ambari on ' $HOST
echo '============================================================================'
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 $USER@$HOST << EOF
sudo wget -nv $AMBARI_REPO_URL -O /etc/yum.repos.d/ambari.repo
sudo yum repolist
sudo yum -y install ambari-server
sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz -P ~
sudo tar zxf ~/mysql-connector-java-5.1.46.tar.gz -C ~
sudo mkdir -p /usr/share/java/
sudo cp ~/mysql-connector-java-5.1.46/mysql-connector-java-5.1.46-bin.jar /usr/share/java/mysql-connector-java.jar
sudo ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java.jar
sudo ambari-server setup -s
sudo ambari-server start
EOF

