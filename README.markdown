##Puppet Module: Install MySQL Sakila Database#

The 'install_sakila_db' Puppet module downloads and installs the MySQL Sakila example database onto an Ubuntu system running MySQL. There are also classes included to drop the database and remove all install files.

#####Module Classes
* install_sakila_db (init.pp) - Downloads and installs the MySQL Sakila example database
* install_sakila_db::params - Parameters inherited by all other classes
* install_sakila_db::cleanup - Removes all files from download and install
* install_sakila_db::uninstall - Drops the Sakila database from MySQL instance

#####Dependencies
* install_sakila_db class (init.pp) depends on:
  * [puppetlabs-mysql](https://forge.puppetlabs.com/puppetlabs/mysql) module - mysql::server class
  * [maestrodev-wget](https://forge.puppetlabs.com/maestrodev/wget) module - wget::fetch class

#####MySQL Links
* Example Databases: [http://dev.mysql.com/doc/index-other.html](http://dev.mysql.com/doc/index-other.html)
* Sakila Documentation: [http://dev.mysql.com/doc/sakila/en/index.html](http://dev.mysql.com/doc/sakila/en/index.html)
* Sakila Installation: [http://dev.mysql.com/doc/sakila/en/sakila-installation.html](http://dev.mysql.com/doc/sakila/en/sakila-installation.html)  

