#!/bin/bash
#### Calomel.org  ad_servers_newlist.sh 
#
## get new ad server list
curl -sS -L --compressed "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&mimetype=plaintext" > /etc/squid/ad_block.txt 
curl -sS -L --compressed "https://www.malwaredomainlist.com/hostslist/hosts.txt"| awk '{print $NF }' >> /etc/squid/ad_block.txt
curl -sS -L --compressed "http://www.squidblacklist.org/downloads/squid-ads.acl" | sed  's/^.//' >> /etc/squid/ad_block.txt
## refresh squid
/usr/sbin/squid -k reconfigure
