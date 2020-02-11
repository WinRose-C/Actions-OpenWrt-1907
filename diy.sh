#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# Delete default password
#sed -i 's/V4UetPzk$CYXluq4wUazHjmCDBCqXF./reD9PyMM$AAqUHZiyzB6KFuEiRiVu91/g' package/default-settings/files/zzz-default-settings
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/default-settings/files/zzz-default-settings
#支持32M闪存
sed -i '/DTS := K2P/{n;s/16/32/g;}' target/linux/ramips/image/mt7621.mk
#斐讯分区布局
sed -i 's/0xa0000 0xf60000/0xa0000 0x1fb0000/g' target/linux/ramips/dts/K2P.dts
#公版分区布局
#sed -i 's/0xa0000 0xf60000/0x50000 0x1fb0000/g' target/linux/ramips/dts/K2P.dts
#添加smartdns软件包
git clone https://github.com/pymumu/smartdns package/smartdns
scripts/feeds update -a
scripts/feeds install -pd smartdns luci-app-smartdns
