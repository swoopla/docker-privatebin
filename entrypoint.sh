#!/bin/sh

UID=${UID:-991}
GID=${GID:-991}

addgroup -g ${GID} privatebin && \
adduser -h /privatebin -H -s /bin/sh -D -G privatebin -u ${UID} privatebin

if [ ! -f /privatebin/cfg/conf.php ]; then
	cp /privatebin/conf.sample.php /privatebin/cfg/conf.php
fi

chown -R privatebin:privatebin /privatebin/data /var/tmp/nginx
supervisord -c /usr/local/etc/supervisord.conf
