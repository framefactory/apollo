#!/bin/bash

# USAGE
# ./ubuntu-samba.sh <user> <password>

# install samba
sudo apt install -y samba

# replace samba configuration file
sudo cat > /etc/samba/smb.conf <<EOL
workgroup = Frame Factory
server string = Apollo Ubuntu Server

security = user
map to guest = bad user
unix password sync = yes

[root]
  comment = Apollo File System
  path = /
  browseable = yes
  guest ok = no
  read only = no
  create mask = 0755
  directory mask = 0755
EOL

# add user
(echo $2 && echo $2) | smbpasswd -a $1

# restart services
sudo service smbd restart
sudo service nmbd restart
