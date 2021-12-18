#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')

fetch https://dlcdn.apache.org/openmeetings/6.2.0/bin/apache-openmeetings-6.2.0.zip

cd /usr/local
fetch https://dlcdn.apache.org/openmeetings/6.2.0/bin/apache-openmeetings-6.2.0.zip
unzip apache-openmeetings-6.2.0.zip
rm apache-openmeetings-6.2.0.zip
mv apache-openmeetings-6.2.0 openmeetings

sysrc openmeetings_enable=YES

service openmeetings restart 2>/dev/null

echo -e "Open Meetings now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:5080 to configure Open Meetings.\n" >> /root/PLUGIN_INFO