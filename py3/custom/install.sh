#!/bin/bash
# pip config
echo "> Initial pip configuration file ..."
mkdir -p /home/jovyan/.config/pip
cp pip.conf /home/jovyan/.config/pip/

echo "> Install pipenv ..."
sudo -H pip install pipenv 2>&1 > package_install.log

rm Pipfile.lock
echo "> Creating Pipfile.lock"
pipenv lock 2>&1 >> package_install.log

echo "> Install required packages from Pipfile ..."
# Ref: https://github.com/pypa/pipenv/issues/2183
# > --deploy: current directory must have Pipfile.lock and it should be up-to-date.
# > --system: Required Pipfile.lock presents.
pipenv install --deploy --system 2>&1 > nbextensions_install.log

echo "> Setting up notebook extensions ..."
# Install jupyter themes
sudo -H pip install --no-cache-dir jupyterthemes 2>&1 >> nbextensions_install.log

# Install jupyter extensions
sudo -H pip install --no-cache-dir jupyter_contrib_nbextensions 2>&1 >> nbextensions_install.log

# It copies the nbextensions' javascript and css files 
# into the jupyter server's search directory, and edits
# some jupyter config files
jupyter contrib nbextension install --debug

echo "$(jupyter notebook list | grep -oP '(?<=token=)[\d\w]*')"