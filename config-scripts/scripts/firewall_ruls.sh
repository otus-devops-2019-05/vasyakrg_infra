#!/bin/bash

# the port is known in advance, but you change it
PORT=9292

gcloud compute --project=indigo-medium-242214 firewall-rules create default-puma-server \
--direction=INGRESS --priority=1000 --network=default --action=ALLOW \
--rules=tcp:$PORT \
--source-ranges=0.0.0.0/0 \
--target-tags=puma-server
