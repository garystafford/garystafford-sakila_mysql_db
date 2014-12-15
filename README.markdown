# garystafford-sakila_mysql_db #

Puppet module for installing MySQL Sakila example database. The `sakila_mysql_db` Puppet module downloads and installs the MySQL Sakila example database onto an Ubuntu-based target node running MySQL. Note, if MySQL does not exist on target node, the `sakila_mysql_db` class will install MySQL using [puppetlabs-mysql](https://forge.puppetlabs.com/puppetlabs/mysql) module's `mysql::server` class (currently version 5.5.x).  
There are also two other classes, `sakila_mysql_db::cleanup` and `sakila_mysql_db::uninstall`, which can be used to drop the database and to remove all install files.

### Support
This module is currently tested on:
* Ubuntu 12.04
* Ubuntu 14.04  
It may work on other distros. You will need to test.

### Usage
`include sakila_mysql_db`  
`include sakila_mysql_db::uninstall`  
`include sakila_mysql_db::cleanup`  

### Module Classes
* `sakila_mysql_db` (`init.pp`) - Downloads and installs Sakila database
* `sakila_mysql_db::params` - Parameters inherited by all other classes
* `sakila_mysql_db::cleanup` - Removes all files from download and install
* `sakila_mysql_db::uninstall` - Drops the Sakila database from MySQL instance

### Dependencies
The `sakila_mysql_db` class (`init.pp`) depends on:
* [puppetlabs-mysql](https://forge.puppetlabs.com/puppetlabs/mysql) module - `mysql::server class`
* [maestrodev-wget](https://forge.puppetlabs.com/maestrodev/wget) module - `wget::fetch class`

### Testing Install
On the node, run any of the following commands in the terminal:
* `sudo service mysql status`
* `mysql -u root sakila -e "SHOW TABLES;"`
* `mysql -u root sakila -e "SELECT * FROM category;"`  

### MySQL Links
* Example Databases: [http://dev.mysql.com/doc/index-other.html](http://dev.mysql.com/doc/index-other.html)
* Sakila Documentation: [http://dev.mysql.com/doc/sakila/en/index.html](http://dev.mysql.com/doc/sakila/en/index.html)
* Sakila Installation: [http://dev.mysql.com/doc/sakila/en/sakila-installation.html](http://dev.mysql.com/doc/sakila/en/sakila-installation.html)

### Removing MySQL
* `sudo apt-get remove --purge mysql-server mysql-client mysql-common`
* `sudo apt-get autoremove`
* `sudo apt-get autoclean`
* `sudo reboot`
* `sudo service mysql status`
