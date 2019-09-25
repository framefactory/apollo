#!/bin/bash

# USAGE
# ./ubuntu-base

# update repos and system
sudo apt update && sudo apt upgrade -y

# install basic tools
sudo apt install -y wget curl vim nano git