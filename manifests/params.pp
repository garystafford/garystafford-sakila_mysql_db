# Class: sakila_mysql_db::params
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
class sakila_mysql_db::params (
  $download_dir = '/tmp',
  $database_dir = 'sakila-db',
  $mysql_cmd    = 'mysql -u root -e') {
  Exec {
    path => ['/bin', '/usr/bin'], }
}
