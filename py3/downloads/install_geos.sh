#!/bin/bash

# geos
wget http://download.osgeo.org/geos/geos-3.9.0.tar.bz2
# basemap
wget https://github.com/matplotlib/basemap/archive/master.zip
# unpacking
bzip2 -d geos-3.9.0.tar.bz2
tar -xf geos-3.9.0.tar

cd /downloads/geos-3.9.0
# 安装需要该变量
export GEOS_DIR=/usr/local/geos
echo ">> GEOS configure phase ..."
./configure --prefix=$GEOS_DIR 2>&1 > ../geos_install.log
echo ">> GEOS make phase ..."
make 2>&1 >> ../geos_install.log
echo ">> GEOS make install phase ..."
make install 2>&1 >> ../geos_install.log
echo ">> Basemap install phase ..."

cd ..
# Basemap
pip install master.zip
