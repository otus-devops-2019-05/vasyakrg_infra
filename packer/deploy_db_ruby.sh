#!/bin/bash

packer build -var-file=packer/variables.json packer/db.json
packer build -var-file=packer/variables.json packer/app.json
