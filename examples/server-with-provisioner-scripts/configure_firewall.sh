#!/bin/bash

# Configure the firewall
ufw allow ssh
ufw allow http
ufw allow https

exit 0