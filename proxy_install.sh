#!/bin/bash



#Run proxy
docker run -v /var/run/docker.sock:/tmp/docker.sock:ro \
     -p 443:443 --name djbot-proxy --restart always -d krahser/djbot-proxy

#Create certificate
docker exec -t djbot-proxy create_cert

#Restart Container
docker restart djbot-proxy 
