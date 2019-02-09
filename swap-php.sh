#!/bin/bash

read -p "Which version? [7.1, 7.2, 7.3] " version

sudo brew services stop php@7.1
sudo brew services stop php@7.2
sudo brew services stop php@7.3

brew unlink php
brew unlink php@7.1
brew unlink php@7.2
brew unlink php@7.3

brew link php@$version --force

valet uninstall
valet install