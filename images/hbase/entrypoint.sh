#!/usr/bin/env bash

HBASE_DIR=/opt/hbase
sed -i "s/zookeeper:2181/$(hostname):2181/" $HBASE_DIR/conf/hbase-site.xml
$HBASE_DIR/bin/hbase zookeeper &> "$HBASE_DIR/logs/zookeeper.log" &
$HBASE_DIR/bin/hbase-daemon.sh start master
$HBASE_DIR/bin/hbase-daemon.sh start regionserver
tail -f /dev/null $HBASE_DIR/logs/* &

CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
    touch /$CONTAINER_FIRST_STARTUP
    /create-tables.sh
fi

wait || :

