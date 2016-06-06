#!/bin/sh
date +"%Y-%m-%d: " | tr -d 'n' >> /var/log/external-ip.log
curl http://ip.thomashunter.name?newline -s >> /var/log/external-ip.log
