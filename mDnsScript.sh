#!/bin/bash
#---------------------------------------------------------------
#       Name            : mDNS Bash Script
#       Description     : Define domain names to point to
#                         IP addresses in your local network.
#       Author          : Konstantinos Andreou
#       Date            : 22-Feb-2023
#---------------------------------------------------------------

exitFunction(){
        echo
        echo "Exiting, killing all avahi-publish processes."
        echo
        trap - SIGINT SIGTERM
        kill -- -$$
}

testAvahiPublish(){
        if [ "$#" -ne 1 ]; then
                echo "Illegal number of parameters"
                exit -1
        fi
        $1 --version
        status=$?

        if [[ $status != 0 ]]
        then
                echo "Fatal: avahi-publish not found on this system."
                echo "Install it with: apt install avahi-utils"
                echo
                exit -1
        else
                echo "Success: avahi-publish is installed"
                echo
        fi
}

trap exitFunction SIGINT SIGTERM

#Change the following path to your dir
SCRIPT_PATH="/scripts/mdns_bash_service"

DOMAINS_FILE=$SCRIPT_PATH"/domains.conf"
HOST_IP=$(hostname -I | cut -d ' ' -f1)
AVAHI_CMD="avahi-publish"

testAvahiPublish $AVAHI_CMD

echo "Starting reading file $DOMAINS_FILE..."

while read -r line
do
        [[ $line =~ ^#.* || $line =~ ^$.* ]] && continue
        cut1=$(echo $line | cut -d "|" -f1)
        cut2=$(echo $line | cut -d "|" -f2)
        HOST=$(sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'<<<"${cut1}")
        IP=$(sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'<<<"${cut2}")

        if [[ $HOST == $IP ]]
        then
                IP=$HOST_IP
        fi

        echo
        echo "Adding <$HOST> to redirect to <$IP>"

        $AVAHI_CMD -a $HOST $IP -R &

done < $DOMAINS_FILE

echo "Done adding hosts, sleeping..."
sleep infinity