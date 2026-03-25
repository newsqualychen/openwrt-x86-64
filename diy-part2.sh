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

# ====================== 你的基础修改 ======================

# 1. 修改默认 IP 为 10.10.10.212
sed -i 's/192.168.1.1/10.10.10.212/g' package/base-files/files/bin/config_generate

# 2. 修改默认主机名
sed -i 's/ImmortalWrt/SqualyWrt/g' package/base-files/files/bin/config_generate

# 3. 修改 Banner（SSH 登录时的字符画 Logo）
cat > package/base-files/files/etc/banner << 'EOF'
 ____                              ___                               __      
/\  _`\                           /\_ \                             /\ \__   
\ \,\L\_\     __   __  __     __  \//\ \    __  __  __  __  __  _ __\ \ ,_\  
 \/_\__ \   /'__`\/\ \/\ \  /'__`\  \ \ \  /\ \/\ \/\ \/\ \/\ \/\`'__\ \ \/  
   /\ \L\ \/\ \L\ \ \ \_\ \/\ \L\.\_ \_\ \_\ \ \_\ \ \ \_/ \_/ \ \ \/ \ \ \_ 
   \ `\____\ \___, \ \____/\ \__/.\_\/\____\\/`____ \ \___x___/'\ \_\  \ \__\
    \/_____/\/___/\ \/___/  \/__/\/_/\/____/ `/___/> \/__//__/   \/_/   \/__/
                 \ \_\                          /\___/                       
                  \/_/                          \/__/                        

 --- Welcome to SqualyWrt | 万兆版 | ImmortalWrt Base ---
EOF

# 4. 修改版本号后缀
sed -i "s/OpenWrt /Built by SqualyWrt /g" package/base-files/files/etc/openwrt_release

# ====================== 默认主题（Bootstrap）Web UI 修改 ======================

# 修改网页标题、顶部 Logo 文字和页脚
echo "=== 开始修改默认 Bootstrap 主题的 Web UI Logo 和页脚 ==="

# 替换 header 中的品牌名称
find feeds/luci -name "header.htm" -path "*/themes/bootstrap/*" -exec sed -i 's/ImmortalWrt/SqualyWrt/g' {} + 2>/dev/null || true
find feeds/luci -name "header.htm" -path "*/themes/bootstrap/*" -exec sed -i 's/OpenWrt/SqualyWrt/g' {} + 2>/dev/null || true

# 替换 footer 中的 Powered by 文字
find feeds/luci -name "footer.htm" -path "*/themes/bootstrap/*" -exec sed -i 's/Powered by .*OpenWrt.*/Powered by SqualyWrt (基于 ImmortalWrt)/g' {} + 2>/dev/null || true
find feeds/luci -name "footer.htm" -path "*/themes/bootstrap/*" -exec sed -i 's/ImmortalWrt/SqualyWrt/g' {} + 2>/dev/null || true

# 额外修改 LuCI 基础模块中的标题（防止某些页面仍显示原名称）
sed -i 's/ImmortalWrt/SqualyWrt/g' feeds/luci/modules/luci-base/luasrc/controller/admin/index.lua 2>/dev/null || true
sed -i 's/OpenWrt/SqualyWrt/g' feeds/luci/modules/luci-base/luasrc/controller/admin/index.lua 2>/dev/null || true

# 如果你的 config 里还勾选了 luci-theme-material，也可以顺便改一下（保险起见）
find feeds/luci -name "header.htm" -path "*/themes/material/*" -exec sed -i 's/ImmortalWrt/SqualyWrt/g' {} + 2>/dev/null || true
find feeds/luci -name "header.htm" -path "*/themes/material/*" -exec sed -i 's/OpenWrt/SqualyWrt/g' {} + 2>/dev/null || true

echo "=== diy-part2.sh 执行完成：默认 IP、主机名、Banner、Bootstrap 默认主题 Web Logo & Footer 已修改 ==="
