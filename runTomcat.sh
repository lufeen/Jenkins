#!/bin/bash
function startTomcat() {
    if [ -e "/opt/apache-tomcat-9.0.26/bin/startup.sh" ]
    then
        cd /opt/apache-tomcat-9.0.26/bin
        ./startup.sh
    fi
}
startTomcat
echo "Tomcat9 started"
exec $@
