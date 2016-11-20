#!/bin/bash
# Checks external IP and send a mail to root if updated

# First we get last known external IP
LastKnownIP=$(tail -1 /var/log/external-ip.log| awk '{print $2}')

# Then we need our current external IP
CurrentIP=$(curl http://ip.thomashunter.name?newline -s)

# Do we got a new IP? If so, log it and inform root
if [[ "$CurrentIP" != "$LastKnownIP" ]]
then
        date +"%Y-%m-%d: " | tr -d '\n' >> /var/log/external-ip.log
        echo "$CurrentIP"  >> /var/log/external-ip.log
        echo "`hostname` as a new IP, $CurrentIP"  |mail -s "`hostname` ip" root
fi
