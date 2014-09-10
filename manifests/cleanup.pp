# Class: install_sakila_db::cleanup
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
class install_sakila_db::cleanup (
  $download_dir = $install_sakila_db::params::download_dir,
  $database_dir = $install_sakila_db::params::database_dir,
  $delete_cache = true) inherits install_sakila_db::params {
  file { "${download_dir}/${database_dir}.tar.gz": ensure => absent, }

  file { "${download_dir}/${database_dir}":
    ensure => absent,
    force  => true
  }

  if $delete_cache == true {
    file { "/var/cache/wget/${database_dir}.tar.gz": ensure => absent, }
  }
}
