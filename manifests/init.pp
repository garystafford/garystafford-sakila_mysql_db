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
class install_sakila_db (
  $destination_dir   = '/tmp',
  $database          = 'sakila-db',
  $mysql_generic_cmd = 'mysql -u root -e',
  $account           = 'root') {
  Exec {
    path => ['/bin', '/usr/bin'], }

  service { "mysql": ensure => "running", } ->
  wget::fetch { "http://downloads.mysql.com/docs/${database}.tar.gz":
    destination => "${destination_dir}/${database}.tar.gz",
    cache_dir   => '/var/cache/wget',
  } ->
  exec { 'sakila_tar':
    command => "tar zxvf ${database}.tar.gz",
    cwd     => $destination_dir,
    user    => $account,
    group   => $account,
    creates => "${destination_dir}/${database}"
  } ->
  exec { 'sakila_schema':
    onlyif  => "${$mysql_generic_cmd} \"SELECT EXISTS(SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'sakila');\"",
    command => "${$mysql_generic_cmd} \"SOURCE ${destination_dir}/${database}/sakila-schema.sql;\"",
    cwd     => $destination_dir,
    user    => $account,
    group   => $account,
  } ->
  exec { 'sakila_data':
    onlyif  => "${$mysql_generic_cmd} \"SELECT EXISTS(SELECT 1 FROM sakila.store);\"",
    command => "${$mysql_generic_cmd} \"SOURCE ${destination_dir}/${database}/sakila-data.sql;\"",
    cwd     => $destination_dir,
    user    => $account,
    group   => $account,
  }
}
