#!/bin/sh

cd /kippo
exec /sbin/setuser kippo twistd -n -y kippo.tac -l /log/kippo.log
