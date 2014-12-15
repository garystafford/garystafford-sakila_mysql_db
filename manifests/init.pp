# Class: sakila_mysql_db
#
# This module manages sakila_mysql_db
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sakila_mysql_db (
  $download_dir = $sakila_mysql_db::params::download_dir,
  $database_dir = $sakila_mysql_db::params::database_dir,
  $mysql_cmd    = $sakila_mysql_db::params::mysql_cmd) inherits 
sakila_mysql_db::params {
  include mysql::server

  wget::fetch { "http://downloads.mysql.com/docs/${database_dir}.tar.gz":
    destination => "${download_dir}/${database_dir}.tar.gz",
    cache_dir   => '/var/cache/wget',
  } ->
  exec { 'sakila_tar':
    command => "tar zxvf ${database_dir}.tar.gz",
    cwd     => $download_dir,
    creates => "${download_dir}/${database_dir}"
  } ->
  exec { 'sakila_import_schema':
    onlyif  => "${$mysql_cmd} \"SELECT EXISTS(SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'sakila');\"",
    command => "${$mysql_cmd} \"SOURCE ${download_dir}/${database_dir}/sakila-schema.sql;\"",
  } ->
  exec { 'sakila_import_data':
    onlyif  => "${$mysql_cmd} \"SELECT EXISTS(SELECT 1 FROM sakila.store);\"",
    command => "${$mysql_cmd} \"SOURCE ${download_dir}/${database_dir}/sakila-data.sql;\"",
  }
}
