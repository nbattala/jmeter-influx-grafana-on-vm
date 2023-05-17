#!/usr/bin/env bash

sudo apt install openjdk-11-jre-headless
sudo apt install openjdk-11-jdk

curl -L https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.tgz -o ~/apache-jmeter-5.5.tgz

tar xvzf ~/apache-jmeter-5.5.tgz -C ~

#download plugin manager
curl -L https://jmeter-plugins.org/get/ -o ~/apache-jmeter-5.5/lib/ext/plugins-manager.jar

