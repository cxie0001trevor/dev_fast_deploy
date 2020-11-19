#!/bin/bash

docker-compose --compatibility down --rmi all

docker-compose --compatibility up -d --build
