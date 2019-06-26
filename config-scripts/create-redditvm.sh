#!/bin/bash

#VARIABLES
    ID_PROJECT=indigo-medium-242214
    INST_NAME=reddit-full-app
    # the port is known in advance, but you change it
    PORT=9292
    TAGS=puma-server
    # env for instance
    #IMAGE_FAMILY=reddit-base
    IMAGE_FAMILY=reddit-full
    DISK_SIZE=10GB
    TYPE_MACHINE=g1-small
    DEFZONE=us-central1-a
    #START_SCRIPT=start_script.sh


# Create instance from template
gcloud compute instances create $INST_NAME \
--boot-disk-size=$DISK_SIZE \
--image-family $IMAGE_FAMILY \
--machine-type=$TYPE_MACHINE \
--tags $TAGS \
--restart-on-failure \
--zone $DEFZONE
#--metadata-from-file startup-script=$START_SCRIPT

# Add firewall rul
gcloud compute --project=$ID_PROJECT firewall-rules create default-puma-server \
--direction=INGRESS --priority=1000 --network=default --action=ALLOW \
--rules=tcp:$PORT \
--source-ranges=0.0.0.0/0 \
--target-tags=$TAGS
