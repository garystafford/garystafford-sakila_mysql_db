# Class: sakila_mysql_db::uninstall
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
class sakila_mysql_db::uninstall (
  $mysql_cmd = $sakila_mysql_db::params::mysql_cmd,) inherits 
sakila_mysql_db::params {
  exec { 'sakila_import_schema':
    unless  => "${$mysql_cmd} \"SELECT EXISTS(SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'sakila');\"",
    command => "${$mysql_cmd} \"DROP DATABASE sakila;\"",
  }
}
