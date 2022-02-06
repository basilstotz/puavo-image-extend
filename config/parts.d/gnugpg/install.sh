#!/bin/sh

cd $(dirname $0)

# install pubkeys
dir="/usr/local/lib/$(cat repository)"
mkdir -p  $dir
cp -r pkg $dir

#install preinit script
cat <<EOF > /etc/puavo-conf/scripts/setup_gnupg
#!/bin/sh
set -eu
if test -d /usr/local/lib/gnupg; then
    mkdir -p /root/.puavo/
    cp -r /usr/local/lib/gnupg /root/.puavo/
fi
EOF
chmod +x /etc/puavo-conf/scripts/setup_gnupg

#patch preinit script execution 
sed -i /etc/puavo-conf/scripts/.preinit -e"s/setup_chromium/setup_gnupg\nsetup_chromium/"
sed -i /etc/puavo-conf/scripts/.preinit.bootserver -e"s/setup_munin/setup_gnupg\nsetup_munin/"



