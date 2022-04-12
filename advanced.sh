#!/bin/sh

if ["${DRONE_FAILED_STEPS}" != ""];
then 
   echo "\n\nyour build is good, have a nice day\n\n"
   curl wttr.in/BFS
else
   echo "\n\nyour build is bad\n\n"
   curl -X "POST" "https://api.github.com/repos/tphoney/bash_plugin/issues?state=all" \
     -H "Cookie: logged_in=no" \
     -H "Authorization: token $PLUGIN_KEY" \
     -H "Content-Type: text/plain; charset=utf-8" \
     -d '{
  "title": "Broken build",
  "body": "'${DRONE_FAILED_STEPS}'"}'
fi
