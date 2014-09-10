# Class: install_sakila_db::uninstall
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
class install_sakila_db::uninstall (
  $mysql_cmd = $install_sakila_db::params::mysql_cmd,) inherits 
install_sakila_db::params {
  exec { 'sakila_import_schema':
    unless  => "${$mysql_cmd} \"SELECT EXISTS(SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'sakila');\"",
    command => "${$mysql_cmd} \"DROP DATABASE sakila;\"",
  }
}
