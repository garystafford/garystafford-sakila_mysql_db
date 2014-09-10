##Puppet Module: Install MySQL Sakila Database#

The 'install_sakila_db' Puppet module downloads and installs the MySQL Sakila example database onto an Ubuntu-based target node running MySQL. There are also classes included to drop the database and remove all install files. Note, if MySQL does not exist on target node, the 'install_sakila_db' class will install MySQL (currently version 5.5.x).

#####Module Classes
* install_sakila_db (init.pp) - Downloads and installs Sakila database
* install_sakila_db::params - Parameters inherited by all other classes
* install_sakila_db::cleanup - Removes all files from download and install
* install_sakila_db::uninstall - Drops the Sakila database from MySQL instance

#####Dependencies
* install_sakila_db class (init.pp) depends on:
  * [puppetlabs-mysql](https://forge.puppetlabs.com/puppetlabs/mysql) module - mysql::server class
  * [maestrodev-wget](https://forge.puppetlabs.com/maestrodev/wget) module - wget::fetch class

#####Testing Install
* On the node, run any of the following commands in the terminal:
  * sudo service mysql status
  * mysql -u root sakila -e "SHOW TABLES;"
  * mysql -u root sakila -e "SELECT * FROM category;"  

#####MySQL Links
* Example Databases: [http://dev.mysql.com/doc/index-other.html](http://dev.mysql.com/doc/index-other.html)
* Sakila Documentation: [http://dev.mysql.com/doc/sakila/en/index.html](http://dev.mysql.com/doc/sakila/en/index.html)
* Sakila Installation: [http://dev.mysql.com/doc/sakila/en/sakila-installation.html](http://dev.mysql.com/doc/sakila/en/sakila-installation.html)

#####Removing MySQL
* sudo apt-get remove --purge mysql-server mysql-client mysql-common
* sudo apt-get autoremove
* sudo apt-get autoclean
* sudo reboot
* sudo service mysql status


