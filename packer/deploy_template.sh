#!/bin/bash

#packer validate ./ubuntu16.json | 

packer build -var-file=variables.json ubuntu16.json
