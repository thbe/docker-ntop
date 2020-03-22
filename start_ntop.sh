#! /bin/sh
#
# Start docker image that provides an NTOP instance
#
# Author:       Thomas Bendler <code@thbe.org>
# Date:         Sun Mar 22 21:44:30 CET 2020
#
# Release:      v1.0
#
# ChangeLog:    v1.0 - Initial release
#

### Run docker instance ###
docker run --detach --restart always \
  --cap-add=SYS_ADMIN -e "container=docker" \
  -e NTOP_ENV_HOST="$(hostname -f)" \
  -e NTOP_ENV_FRITZBOX_CAPTURE="${1}" \
  -e NTOP_ENV_FRITZBOX_IFACE="${2}" \
  -e NTOP_ENV_FRITZBOX_PASSWORD="${3}" \
  -e NTOP_ENV_DEBUG="${NTOPNG_DEBUG}" \
  --name ntop --hostname ntop.$(hostname -f | sed -e 's/^[^.]*\.//') \
  -p 3000:3000/tcp \
  thbe/ntop
