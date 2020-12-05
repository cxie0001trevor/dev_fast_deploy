#!/bin/bash
# pip config
echo "> Initial pip configuration file ..."
mkdir -p /home/jovyan/.config/pip
cp pip.conf /home/jovyan/.config/pip/

echo "> Install pipenv ..."
sudo -H pip install pipenv > package_install.log

echo "> Creating Pipfile.lock"
pipenv lock > package_install.log

echo "> Install required packages from Pipfile ..."
# Ref: https://github.com/pypa/pipenv/issues/2183
# > --deploy: current directory must have Pipfile.lock and it should be up-to-date.
# > --system: Required Pipfile.lock presents.
pipenv install --deploy --system > package_install.log

echo "> Setting up notebook extensions ..."
# Install jupyter themes
sudo -H pip install --no-cache-dir jupyterthemes > package_install.log

# Install jupyter extensions
sudo -H pip install --no-cache-dir jupyter_contrib_nbextensions > package_install.log

# It copies the nbextensions' javascript and css files 
# into the jupyter server's search directory, and edits
# some jupyter config files
jupyter contrib nbextension install

echo "$(jupyter notebook list | grep -oP '(?<=token=)[\d\w]*')" > nb_token