#!/bin/bash

# USAGE
# ./ubuntu-caddy.sh

# install Caddy server
curl https://getcaddy.com | bash -s personal hook.service,http.ipfilter,http.mailout,http.webdav
