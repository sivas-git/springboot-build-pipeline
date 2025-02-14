#!/bin/bash

curl -is --max-redirs 10 http://localhost:8000 -L | grep -w "HTTP/1.1 200" > /dev/null
if [ $? -ne "0" ]; then
   echo "============================================================="
   echo "Unable to reach sample springboot application on port 8000 !!"
   echo "============================================================="
else
   echo "================="
   echo "Smoke Test passed"
   echo "================="
fi

grep "CRITICAL" trivyresults.txt > /dev/null
if [ $? -ne "0" ]; then
   echo "============================================================="
   echo "Docker Image siva3r/spring:latest is ready for testing"
   echo "============================================================="
else
   echo "============================================================="
   echo "Docker Image siva3r/spring:latest has vulnerabilities!!"
   echo "============================================================="
fi
