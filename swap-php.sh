#!/bin/bash

read -p "Which version? [7.1, 7.2, 7.3] " version

echo "Stopping php-fpm services"
sudo brew services stop php@7.1 >> /dev/null 2>&1
sudo brew services stop php@7.2 >> /dev/null 2>&1
sudo brew services stop php@7.3 >> /dev/null 2>&1

echo "Unlinking php"
brew unlink php >> /dev/null 2>&1
brew unlink php@7.1 >> /dev/null 2>&1
brew unlink php@7.2 >> /dev/null 2>&1
brew unlink php@7.3 >> /dev/null 2>&1

echo "Relinking php@$version"
brew link php@$version --force >> /dev/null 2>&1

echo "Refreshing Valets installation"
valet uninstall >> /dev/null 2>&1
valet install >> /dev/null 2>&1

echo "Done"
which php
php -v