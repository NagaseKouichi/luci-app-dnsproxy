#
# Copyright (C) 2022 luci-app-dnsproxy
# Copyright (C) 2022 NagaseKouichi
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dnsproxy
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=NagaseKouichi

LUCI_TITLE:=LuCI support for DnsProxy
LUCI_DESCRIPTION:=LuCI Support for DnsProxy.
LUCI_DEPENDS:=+dnsproxy
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
