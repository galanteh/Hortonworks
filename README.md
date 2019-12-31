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

# Repositories from Cloudera
All scripts developed on this repo are only for CentOS 7.x 
## HDP - Hortonworks Data Platform
### ​HDP 2.4 Repositories
| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-installation/content/hdp_24_repositories.html | 
| CentOS7 Repo | http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.4.3.0/hdp.repo | 

### ​HDP 2.5 Repositories
| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-installation/content/hdp_25_repositories.html | 
| CentOS7 Repo | http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.5.3.0/hdp.repo |

### ​HDP 2.6 Repositories
| Description | URL | 
|---|---|
| Documentation |  https://docs.cloudera.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-installation/content/hdp_26_repositories.html | 
| CentOS 7 Repo | http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.2.2/ambari.repo |

#### Troubleshooting
##### SSL Error
 If you get an error while installing the cluster or a node to HDP like **SSLError: Failed to connect. Please check openssl library versions**, please edit the configuration on all nodes for the agent
 ```
# vi /etc/ambari-agent/conf/ambari-agent.ini
force_https_protocol=PROTOCOL_TLSv1_2
```
Please refer to the following article for more information:
https://techtalks.tech/knowledge-base/error-while-adding-a-node-to-hdp-sslerror-failed-to-connect-please-check-openssl-library-versions/


### ​HDP 3.0.0 Repositories
| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.7.0.0/bk_ambari-installation/content/hdp_30_repositories.html |
| CentOS 7 Repo | http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.0.0.0/hdp.repo |

### ​HDP 3.0.1 Repositories
| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.7.1.0/bk_ambari-installation/content/hdp_30_repositories.html|
| CentOS 7 Repo | http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.0.1.0/hdp.repo |

### ​HDP 3.1.0 Repositories
| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.7.3.0/bk_ambari-installation/content/hdp_31_repositories.html | 
| CentOS 7 Repo | http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.1.0.0/hdp.repo |

### HDP 3.1.4 Repositories
| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.7.4.0/bk_ambari-installation/content/hdp_314_repositories.html | 
| CentOS 7 Repo | http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.1.4.0/hdp.repo |
### HDP 3.1.5 Repositories
Starting with the **HDP 3.1.5** release, access to HDP repositories requires authentication. To access the binaries, you must first have the required authentication credentials (**username** and **password**).

| Description | URL | 
|---|---|
| Documentation | https://docs.cloudera.com/HDPDocuments/Ambari-2.7.5.0/bk_ambari-installation/content/hdp_315_repositories.html |
| CentOS 7 Repo | https://username:password@archive.cloudera.com/p/HDP/centos7/3.1.5.0/hdp.repo |

## HDF - Hortonworks DataFlow
All scripts developed on this repo are only for CentOS 7.x 

| Version | Documentation |  MPACK URL | 
|---|---|---|
|2.0.0.0-579|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.0.0/bk_release-notes/content/ch_hdf_relnotes.html#hdf_download_location|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.0.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.0.0-579.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.0.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.0.0-579.tar.gz)|
|2.0.1.0-12|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.0.1/bk_release-notes/content/ch_hdf_relnotes.html#hdf_download_location|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.0.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.1.0-12.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.0.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.1.0-12.tar.gz)|
|2.0.2.0-17|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.0.2/bk_release-notes/content/ch_hdf_relnotes.html#hdf_download_location|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.0.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.2.0-17.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.0.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.2.0-17.tar.gz) |
|2.1.0.0-165|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.1.0/bk_dataflow-release-notes/content/ch_hdf_relnotes.html#d6e395|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.0.0-165.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.0.0-165.tar.gz) |
|2.1.1.0-2|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.1.1/bk_dataflow-release-notes/content/index.html|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.1.0-2.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.1.0-2.tar.gz)|
|2.1.2.0-10|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.1.2/bk_dataflow-release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.2.0-10.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.2.0-10.tar.gz)|
|2.1.4.0-5|https://docs.cloudera.com/HDPDocuments/HDF2/HDF-2.1.4/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.4.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.4.0-5.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/2.x/updates/2.1.4.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.4.0-5.tar.gz)|
|3.0.0.0-453|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.0.0/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.0.0-453.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.0.0-453.tar.gz)|
|3.0.1.0-43|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.0.1/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.1.0-43.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.1.0-43.tar.gz)|
|3.0.1.1-5|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.0.1.1/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.1.1/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.1.1-5.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.1.1/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.1.1-5.tar.gz)|
|3.0.2.0-76|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.0.2/bk_release-notes/content/ch_hdf_relnotes.html|[https://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.2.0-76.tar.gz](https://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.0.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.2.0-76.tar.gz)|
|3.0.3-6|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.0.3/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7-ppc/3.x/updates/3.0.3.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.3.0-6.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7-ppc/3.x/updates/3.0.3.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.0.3.0-6.tar.gz)|
|3.1.0.0-564|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.1.0/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.0.0-564.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.0.0-564.tar.gz)|
|3.1.1.0-35|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.1.1/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.1.0-35.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.1.0-35.tar.gz)|
|3.1.2.0-7|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.1.2/bk_release-notes/content/ch_hdf_relnotes.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.2.0-7.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.2.0-7.tar.gz)|
|3.2.0.0-520|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.2.0/release-notes/content/hdf_repository_locations.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.2.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.2.0.0-520.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.2.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.2.0.0-520.tar.gz)|
|3.3.0.0-165|https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.3.0/release-notes/content/hdf_repository_locations.html|[http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.3.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.3.0.0-165.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.3.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.3.0.0-165.tar.gz)|
|3.3.1.0-10| https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.3.1/release-notes/content/hdf_repository_locations.html | [http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.3.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.3.1.0-10.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.3.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.3.1.0-10.tar.gz)| 
| 3.4.0.0-155 |https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.4.0/release-notes/content/hdf_repository_locations.html | [http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.4.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.4.0.0-155.tar.gz](http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.4.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.4.0.0-155.tar.gz)| 
| 3.4.1.1-4 | https://docs.cloudera.com/HDPDocuments/HDF3/HDF-3.4.1.1/release-notes/content/hdf_repository_locations.html| http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.4.1.1/tars/hdf_ambari_mp/hdf-ambari-mpack-3.4.1.1-4.tar.gz | 


