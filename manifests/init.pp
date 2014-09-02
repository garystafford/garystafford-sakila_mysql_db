# Class: install_sakila_db
#
# This module manages install_sakila_db
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class install_sakila_db {
  wget::fetch { 'http://downloads.mysql.com/docs/sakila-db.tar.gz':
    destination => '/tmp/sakila-db.tar.gz',
    cache_dir   => '/var/cache/wget',
  }

  exec { 'sakila_tar':
    command => 'tar zxvf sakila-db.tar.gz',
    cwd     => '/tmp',
    path    => ['/bin', 'usr/bin'],
    user    => 'root',
    group   => 'root',
    creates => "/tmp/sakila-db"
  }
}
