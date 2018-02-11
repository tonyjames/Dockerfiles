#!/bin/bash

CONF_URL=https://raw.githubusercontent.com/tonyjames/Dockerfiles/master/znc/znc.conf

if [ ! -d "/var/lib/znc/.znc" ]; then
  mkdir -p /var/lib/znc/.znc/configs
  /usr/bin/znc -p -d /var/lib/znc/.znc
  curl -o /var/lib/znc/.znc/configs/znc.conf $CONF_URL
fi

/usr/bin/znc -f -d /var/lib/znc/.znc