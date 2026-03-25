#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
#!/bin/bash
# 1. 修改默认 IP 为 10.10.10.212
sed -i 's/192.168.1.1/10.10.10.252/g' package/base-files/files/bin/config_generate

# 2. 修改默认主机名
sed -i 's/ImmortalWrt/MyOpenWrt/g' package/base-files/files/bin/config_generate

# 3. 移除一些不需要的默认包（可选）
# sed -i 's/default-settings-chn//g' include/target.mk
# 修改默认 Banner (登录时的字符画)
echo "
     ███╗   ███╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗██╗    ██╗██████╗ ████████╗
     ████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██║    ██║██╔══██╗╚══██╔══╝
     ██╔████╔██║███████║██████╔╝   ██║   ██║██╔██╗ ██║██║ █╗ ██║██████╔╝   ██║   
     ██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║██║███╗██║██╔══██╗   ██║   
     ██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ██║██║ ╚████║╚███╔███╔╝██║  ██║   ██║   
     ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   
                                                                               
 --- Welcome to MartinWrt | 128.0GB 万兆版 | ImmortalWrt Base ---
" > package/base-files/files/etc/banner
# 将主机名从 ImmortalWrt 改为 MyRouter
sed -i 's/ImmortalWrt/MartinlWrt/g' package/base-files/files/bin/config_generate
# 在版本号后面加上你的专属后缀
sed -i "s/OpenWrt /Built by MartinlWrt /g" package/base-files/files/etc/openwrt_release
