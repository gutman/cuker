#!/bin/sh -ex

SITES_AVAILABLE=/usr/local/etc/nginx/sites-available
SITES_ENABLED=/usr/local/etc/nginx/sites-enabled

ROOT_DIR=`cd $(dirname $0)/..; pwd`

mkdir -p $SITES_AVAILABLE $SITES_ENABLED

cat cuker.conf.template | sed "s,@ROOT_DIR@,$ROOT_DIR,g" \
    > $SITES_AVAILABLE/cuker.conf

if [ ! -h $SITES_ENABLED/cuker.conf ]; then
    ln -s $SITES_AVAILABLE/cuker.conf $SITES_ENABLED
fi

nginx -s reload




