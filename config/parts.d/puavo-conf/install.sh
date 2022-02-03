#!/bin/sh

cd $(dirname $0)


cp scripts/dot.preinit /etc/puavo-conf/scripts/.preinit
cp scripts/dot.preinit.bootserver /etc/puavo-conf/scripts/.preinit.bootserver

cp scripts/setup_extra_vars /etc/puavo-conf/scripts/.


touch /etc/puavo-conf/puavo-conf.extra

for PKG in $(cat packages.list); do
    echo "puavo.pkg.$PKG"                >> /etc/puavo-conf/puavo-conf.extra 
done



