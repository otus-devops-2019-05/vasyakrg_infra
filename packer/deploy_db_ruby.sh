#!/bin/bash

#packer validate -var-file=variables.json ubuntu16.json |
packer build -var-file=variables.json db.json
packer build -var-file=variables.json app.json
