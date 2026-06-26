#!/bin/bash
cat > package/base-files/files/etc/uci-defaults/99-auto-setup << EOF
#!/bin/sh
echo "root:xxoo1314." | chpasswd
uci set system.@system[0].hostname='FPGAPC'
uci commit system

uci set network.lan.ipaddr='192.168.8.8'
uci set network.lan.netmask='255.255.255.0'
uci set dhcp.lan.start='100'
uci set dhcp.lan.limit='150'
uci set dhcp.lan.local='/lan/'

uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci

uci commit network
uci commit dhcp

/etc/init.d/dnsmasq restart
/etc/init.d/network reload
EOF
chmod 755 package/base-files/files/etc/uci-defaults/99-auto-setup