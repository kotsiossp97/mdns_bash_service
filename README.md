# mDNS Bash Service
 Script that publishes hostsnames pointing to IP in LAN.

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
 - Clone the repo:
 ```
 git clone https://github.com/kotsiossp97/mdns_bash_service.git /scripts/mdns_bash_service
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
 - If you make any changes to domains.conf file, restart the service so the changes are applied:
 ```
 systemctl restart mDnsScript.service
 ```
 ## Run Directly
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
 
 ## Test
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
