#!/bin/sh
#  take this out ??? env

if ["${DRONE_FAILED_STEPS}" != ""];
then 
   echo "\n\nyour build is good, have a nice day\n\n"
   curl wttr.in/BFS
else
   echo "\n\nyour build is bad\n\n"
   curl -k -X PUT -d '{"alert":"lselect"}' https://${PLUGIN_IP}/api/zpSMgrRfIA-JC8BQQrqGquobI-SsT0v7hsm5gV7R/groups/5/action
fi
