# mDNS Bash Service
 Script that publishes hostsnames pointing to IP in LAN.


![Repo Size][size-shield] ![Last Commit][lastCommit-shield] ![Downloads][downloads-shield]

# Installation
 The script can be executed directly, or it can be added as a system service 
 and ran automatically in the background.
 ## Prerequisites
 - You need `avahi-publish` installed on your system.
 ```
 sudo apt install avahi-utils
 ```
 
 ## Download Script
 - Login as root
 ```
 sudo -i
 ```
 - Create script directory
 ```
 mkdir -p /scripts/mdns_bash_service
 ```
 - Download the repo:
 ```
 cd /scripts/mdns_bash_service
 wget https://github.com/kotsiossp97/mdns_bash_service/releases/latest/download/mDnsScript.sh
 wget https://github.com/kotsiossp97/mdns_bash_service/releases/latest/download/mDnsScript.service
 wget https://github.com/kotsiossp97/mdns_bash_service/releases/latest/download/domains.conf
 ```
  - Give execution permissions to script
 ```
 chmod +x /scripts/mdns_bash_service/mDnsScript.sh
 ```
 
 ## Service Installation
 - Edit the `domains.conf` file as your preference
 ```
 vi /scripts/mdns_bash_service/domains.conf
 ```
 - Create symbolic link of .service file
 ```
 ln -s /scripts/mdns_bash_service/mDnsScript.service /lib/systemd/system/
 ```
 - Run following commands to enable and start the service on boot:
 ```
 systemctl daemon-reload 
 systemctl enable mDnsScript.service
 systemctl start mDnsScript.service
 ```
 - Check service status with:
 ```
 systemctl status mDnsScript.service
 ```
 - If you make any changes to domains.conf file, restart the service so the changes are applied:
 ```
 systemctl restart mDnsScript.service
 ```
 # Run Directly
 - Edit the `domains.conf` file as your preference
 ```
 vi /scripts/mdns_bash_service/domains.conf
 ```
 - Give execution permissions to script
 ```
 chmod +x /scripts/mdns_bash_service/mDnsScript.sh
 ```
 - Run the script 
 ```
 /scripts/mdns_bash_service/mDnsScript.sh
 ```
 
 # Test
 - Open any command line on any device on your local network and ping the domain name:
 e.g domain name `kotsios-mainpc.local` points to IP address `192.168.178.36`
 ```
 ping kotsios-mainpc.local
 ```
 ```
 Pinging kotsios-mainpc.local [192.168.178.36] with 32 bytes of data:
 Reply from 192.168.178.36: bytes=32 time<1ms TTL=128
 Reply from 192.168.178.36: bytes=32 time<1ms TTL=128
 Reply from 192.168.178.36: bytes=32 time<1ms TTL=128
 Reply from 192.168.178.36: bytes=32 time<1ms TTL=128
 ```

[lastCommit-shield]: https://img.shields.io/github/last-commit/kotsiossp97/mdns_bash_service?style=for-the-badge
[size-shield]: https://img.shields.io/github/languages/code-size/kotsiossp97/mdns_bash_service?style=for-the-badge
[downloads-shield]: https://img.shields.io/github/downloads/kotsiossp97/mdns_bash_service/total?style=for-the-badge
