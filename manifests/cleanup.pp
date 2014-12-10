# Class: sakila_mysql_db::cleanup
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
class sakila_mysql_db::cleanup (
  $download_dir = $sakila_mysql_db::params::download_dir,
  $database_dir = $sakila_mysql_db::params::database_dir,
  $delete_cache = true) inherits sakila_mysql_db::params {
  file { "${download_dir}/${database_dir}.tar.gz": ensure => absent, }

  file { "${download_dir}/${database_dir}":
    ensure => absent,
    force  => true
  }

  if $delete_cache == true {
    file { "/var/cache/wget/${database_dir}.tar.gz": ensure => absent, }
  }
}
