#!/usr/bin/env bash

sudo yum update
sudo yum localinstall -y http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
sudo yum install -y Percona-XtraDB-Cluster-server
wget http://pkgs.repoforge.org/socat/socat-1.7.1.3-1.el6.rf.x86_64.rpm
rpm -ivh socat-1.7.1.3-1.el6.rf.x86_64.rpm
# curl -L http://pkgs.repoforge.org/socat/socat-1.7.1.3-1.el6.rf.x86_64.rpm | rpm -ivh
wget ftp://195.220.108.108/linux/centos/6.6/os/x86_64/Packages/tcp_wrappers-7.6-57.el6.x86_64.rpm
sudo rpm -ivh tcp_wrappers-7.6-57.el6.x86_64.rpm
sudo rpm -ivh tcp_wrappers-7.6-57.el6.x86_64.rpm

echo <<ECHO > /etc/my.cnf
[mysqld]
#datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
 
datadir = /var/lib/mysql
binlog_format = ROW
wsrep_cluster_name = threenode
wsrep_cluster_address = gcomm://192.168.70.2,192.168.70.3,192.168.70.4
wsrep_node_address = 192.168.70.4
wsrep_provider = /usr/lib64/libgalera_smm.so
wsrep_sst_method = xtrabackup
wsrep_sst_auth = sst:secret
innodb_locks_unsafe_for_binlog = 1
innodb_autoinc_lock_mode = 2
 
[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
ECHO

sudo service mysql bootstrap-pxc


mysql -uroot -e "GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sst'@'localhost' IDENTIFIED BY 'secret'; flush privileges; "
