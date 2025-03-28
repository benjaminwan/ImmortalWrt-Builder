#!/bin/bash

ENABLE_PKG=0

while getopts "p" arg; do
    case $arg in
    p)
        echo "p's arg:$OPTARG"
        ENABLE_PKG=1
        ;;
    ?)
        echo -e "unkonw argument."
        exit 1
        ;;
    esac
done

# 打印 info
make info
# 主配置名称
PROFILE="generic"
PACKAGES=""
# 基础组件
PACKAGES="$PACKAGES curl bash git"
# 界面翻译补全
PACKAGES="$PACKAGES luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn luci-i18n-opkg-zh-cn"
# 主题
PACKAGES="$PACKAGES luci-theme-argon luci-app-argon-config luci-i18n-argon-config-zh-cn"
# 常用kmod组件
PACKAGES="$PACKAGES kmod-usb2 kmod-usb3 kmod-usb-ohci kmod-usb-uhci usbutils"
PACKAGES="$PACKAGES kmod-usb-printer"
# USB打印机
PACKAGES="$PACKAGES luci-app-usb-printer luci-i18n-usb-printer-zh-cn"
# 终端
PACKAGES="$PACKAGES luci-app-ttyd luci-i18n-ttyd-zh-cn"
# KMS服务
PACKAGES="$PACKAGES luci-app-vlmcsd luci-i18n-vlmcsd-zh-cn"
# 网络唤醒
PACKAGES="$PACKAGES luci-app-wol luci-i18n-wol-zh-cn"
# DDNS
PACKAGES="$PACKAGES luci-app-ddns-go luci-i18n-ddns-go-zh-cn"
# Socat网络工具
PACKAGES="$PACKAGES luci-app-socat luci-i18n-socat-zh-cn"
# upnp
PACKAGES="$PACKAGES luci-app-upnp luci-i18n-upnp-zh-cn"
# SmartDns
PACKAGES="$PACKAGES luci-app-smartdns luci-i18n-smartdns-zh-cn"
# 文件管理
#PACKAGES="$PACKAGES luci-app-filemanager luci-i18n-filemanager-zh-cn"
# Passwall
PACKAGES="$PACKAGES luci-app-passwall luci-i18n-passwall-zh-cn haproxy"
# Passwall依赖
PASSWALL_EXT="kmod-nft-socket kmod-nft-tproxy chinadns-ng dns2socks geoview hysteria ipt2socks microsocks naiveproxy"
PASSWALL_EXT+=" shadowsocks-libev-ss-local shadowsocks-libev-ss-redir shadowsocks-libev-ss-server shadowsocksr-libev-ssr-local"
PASSWALL_EXT+=" shadowsocksr-libev-ssr-redir shadowsocksr-libev-ssr-server"
PASSWALL_EXT+=" shadowsocks-rust-sslocal shadowsocks-rust-ssserver simple-obfs sing-box tcping trojan-plus tuic-client"
PASSWALL_EXT+=" v2ray-geoip v2ray-geosite v2ray-plugin xray-core xray-plugin"
# nikki
NIKKI="nikki luci-app-nikki luci-i18n-nikki-zh-cn"
if [ $ENABLE_PKG -eq 1 ]; then
    echo "启用附加包"
    PACKAGES="$PACKAGES $PASSWALL_EXT"
    PACKAGES="$PACKAGES $NIKKI"
else
    echo "禁用附加包"
fi
# zsh 终端
PACKAGES="$PACKAGES zsh"
# Vim 完整版，带语法高亮
PACKAGES="$PACKAGES vim-fuller"

# mosdns 组件
#PACKAGES="$PACKAGES luci-app-mosdns luci-i18n-mosdns-zh-cn"
# 宽带监控 Nlbwmon
#PACKAGES="$PACKAGES luci-i18n-nlbwmon-zh-cn"
# Diskman 磁盘管理
#PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"

# 一些自定义文件
FILES="files"

# 禁用的服务名称
#DISABLED_SERVICES="sshd"

make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES"
