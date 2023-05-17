#!/usr/bin/env bash

# influxdata-archive_compat.key GPG Fingerprint: 9D539D90D3328DC7D6C8D3B9D8FF8E1F7DF8B07E
wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list


sudo apt-get update && sudo apt-get install influxdb
sudo service influxdb start

influx --execute 'CREATE DATABASE jmeter'

#connect to jmeter database

influx -database jmeter -execute 'show measurements'

#edit host on influxdb config
sudo sed -i.bak "s/# bind-address = \":8086\"/bind-address = \"$(hostname -i):8086\"/g" /etc/influxdb/influxdb.conf 

#restart
sudo service influxdb restart

