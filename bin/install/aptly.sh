#!/bin/bash
echo 'deb http://repo.aptly.info/ squeeze main' | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED75B5A4483DA07C
sudo apt update -yq
sudo apt install -yq aptly
