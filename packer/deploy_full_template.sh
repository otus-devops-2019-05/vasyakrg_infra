#!/bin/bash

#packer validate ./ubuntu16.json |

packer build -var-file=variables_full.json immutable.json
