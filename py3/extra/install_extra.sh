#!/bin/bash

# Install jupyter extensions
pip install jupyter_contrib_nbextensions

# It copies the nbextensions' javascript and css files 
# into the jupyter server's search directory, and edits
# some jupyter config files
jupyter contrib nbextension install --user

# Install jupyter themes
pip install jupyterthemes