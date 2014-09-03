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
  $destination_dir = '/tmp',
  $database        = 'sakila-db',
  $mysql_command   = 'mysql -u root -e',
  $account         = 'root') {
  Exec {
    path => ['/bin', '/usr/bin'], }

  # for debug output on the puppet master
  notice("destination_dir: ${destination_dir}")
  notice("database: ${database}")
  notice("mysql_command: ${mysql_command}")

  wget::fetch { "http://downloads.mysql.com/docs/${database}.tar.gz":
    destination => "${destination_dir}/${database}.tar.gz",
    cache_dir   => '/var/cache/wget',
  } ->
  exec { 'sakila_tar':
    onlyif  => 'sss',
    command => "tar zxvf ${database}.tar.gz",
    cwd     => $destination_dir,
    user    => $account,
    group   => $account,
    creates => "${destination_dir}/${database}"
  } ->
  exec { 'sakila_schema':
    command => "${mysql_command} \"SOURCE ${destination_dir}/${database}/sakila-schema.sql;\"",
    cwd     => $destination_dir,
    user    => $account,
    group   => $account,
  } ->
  exec { 'sakila_data':
    command => "${mysql_command} \"SOURCE ${destination_dir}/${database}/sakila-data.sql;\"",
    cwd     => $destination_dir,
    user    => $account,
    group   => $account,
  }
}
