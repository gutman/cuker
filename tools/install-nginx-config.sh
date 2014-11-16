#!/bin/sh -ex

if [ -d "/usr/local/etc/nginx" ]; then
  NGINX_HOME=/usr/local/etc/nginx #mac
elif [ -d /etc/nginx ]; then
  NGINX_HOME=/etc/nginx
else
  echo "Install nginx first"
  exit 1
fi

SITES_AVAILABLE=$NGINX_HOME/sites-available
SITES_ENABLED=$NGINX_HOME/sites-enabled

ROOT_DIR=`cd $(dirname $0)/..; pwd`

mkdir -p $SITES_AVAILABLE $SITES_ENABLED

cat cuker.conf.template | sed "s,@ROOT_DIR@,$ROOT_DIR,g" \
    > $SITES_AVAILABLE/cuker.conf

if [ ! -h $SITES_ENABLED/cuker.conf ]; then
    ln -s $SITES_AVAILABLE/cuker.conf $SITES_ENABLED
fi

nginx -s reload




