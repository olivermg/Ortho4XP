#!/usr/bin/env bash

# for allowing docker container user to write to custom_scenery/

setfacl -Rm d:u:9876:rwx,d:u:$USER:rwx,u:9876:rwx,u:$USER:rwx .

