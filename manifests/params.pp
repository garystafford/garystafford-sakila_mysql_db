# Class: install_sakila_db::params
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
class install_sakila_db::params (
  $download_dir = '/tmp',
  $database_dir = 'sakila-db',
  $mysql_cmd    = 'mysql -u root -e',
  $account      = 'root') {
  Exec {
    path => ['/bin', '/usr/bin'], }
}
