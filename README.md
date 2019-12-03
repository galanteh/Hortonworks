# Hortonworks
Hortonworks Scripts &amp; Utils

# Install Folder
We have two scripts: install.sh and install_hdf_on_hdp.sh. 
Both scripts requires a configuration file called install.cfg.

## Configuration file
We need to setup a configuration file, the following is a sample we we need to define variables that will define the installation of the HDP servers. 
```ini
REMOTE_PATH=root
NUMINSTANCES=4
HOSTPREFIX='hgalante-hdp-sample-cluster-'
DOMAIN='.sample.anycloud.com'
START=1
AMBARI_NUMBER=1
MARIA_DB_NUMBER=2
GENERATE_KEYS=N
USER=root
PASSWORD=my_strong_password
AMBARI_REPO_URL=http://private-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.7.3.6-4/ambari.repo
MPACK_AMBARI_HDF_URL=http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.4.1.1/tars/hdf_ambari_mp/hdf-ambari-mpack-3.4.1.1-4.tar.gz
```
### Variable dictionary
| Type | Description |  
| ----------- | ----------- |  
| REMOTE_PATH | Path where we are going to use for temp downloads |
| NUMINSTANCES | Number of vm instances to use |
| HOSTPREFIX | name of the servers, usually, they have the same start up in the name |
| DOMAIN | Domain of the machines |
| START | Which machine should we start on |
| AMBARI_NUMBER | Number of vm instance where Ambari will be deployed |
| MARIA_DB_NUMBER | Number of vm where MariaDB will be deployed |
| GENERATE_KEYS | Do we need to generate SSH keys? Y/N |
| USER | User used to login into the linux boxes | 
| AMBARI_REPO_URL | URL where is the Repo file to download and install the Ambari software | 
| MPACK_AMBARI_HDF_URL | URL where is the HDF pack |



