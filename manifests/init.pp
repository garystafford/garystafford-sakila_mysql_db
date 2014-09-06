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
  $download_dir = '/tmp',
  $database_dir = 'sakila-db',
  $mysql_cmd    = 'mysql -u root -e',
  $account      = 'root') {
  Exec {
    path => ['/bin', '/usr/bin'], }

  include mysql::server

  wget::fetch { "http://downloads.mysql.com/docs/${database_dir}.tar.gz":
    destination => "${download_dir}/${database_dir}.tar.gz",
    cache_dir   => '/var/cache/wget',
  } ->
  exec { 'sakila_tar':
    command => "tar zxvf ${database_dir}.tar.gz",
    cwd     => $download_dir,
    user    => $account,
    group   => $account,
    creates => "${download_dir}/${database_dir}"
  } ->
  exec { 'sakila_import_schema':
    onlyif  => "${$mysql_cmd} \"SELECT EXISTS(SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'sakila');\"",
    command => "${$mysql_cmd} \"SOURCE ${download_dir}/${database_dir}/sakila-schema.sql;\"",
    cwd     => $download_dir,
    user    => $account,
    group   => $account,
  } ->
  exec { 'sakila_import_data':
    onlyif  => "${$mysql_cmd} \"SELECT EXISTS(SELECT 1 FROM sakila.store);\"",
    command => "${$mysql_cmd} \"SOURCE ${download_dir}/${database_dir}/sakila-data.sql;\"",
    cwd     => $download_dir,
    user    => $account,
    group   => $account,
  }
}
