-- Copyright (C) 2022 luci-app-dnsproxy
-- Copyright (C) 2022 NagaseKouichi
-- Licensed to the public under the GNU General Public License v3.

local m, s, o


m = Map("dnsproxy", translate("DnsProxy"), translate("DnsProxy is a Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support."))

m:section(SimpleSection).template  = "dnsproxy/status"

s = m:section(NamedSection, "global", "dnsproxy ", translate("General Setting"))
s.anonymous   = true

o = s:option(Flag, "enabled", translate("Enable"))
o.rmempty     = false

o = s:option(Value, "listen_addr", translate("Listen Address"))
o.placeholder = "127.0.0.1"
o.default     = "127.0.0.1"
o.datatype    = "ipaddr"
o.rmempty     = false

o = s:option(Value, "listen_port", translate("Listen Port"))
o.placeholder = 10053
o.default     = 10053
o.datatype    = "port"
o.rmempty     = false

o = s:option(Flag, "all_servers", translate("Parallel Querie"), translate("If enabled, parallel queries to all configured upstream servers are enabled."))
o.rmempty     = false

o = s:option(Flag, "fastest_addr", translate("Return Fastest IP"), translate("Respond to A or AAAA requests only with the fastest IP address."))
o.rmempty     = false

o = s:option(Flag, "ipv6_disabled", translate("Disable Ipv6 Reply"))
o.rmempty     = false

s = m:section(NamedSection, "edns", "dnsproxy ", translate("EDNS Setting"))
s.anonymous   = true

o = s:option(Flag, "enabled", translate("Enable EDNS"))
o.rmempty     = false

o = s:option(Value, "dns64_prefix", translate("EDNS Client Address"), translate("Set this if your IP address is not a public IP."))
o.datatype    = "ipaddr"
o.rmempty     = true

s = m:section(NamedSection, "servers", "dnsproxy ", translate("DNS Server Setting"))
s.anonymous   = true

o = s:option(DynamicList, "upstream", translate("DNS Upstreams"), translate("DNS server Upstreams, support DoH, DoT, DoQ and DNSCrypt."))
o.rmempty     = false

o = s:option(DynamicList, "bootstrap", translate("Bootstrap DNS"), translate("Bootstrap DNS for DoH and DoT."))
o.rmempty     = true

o = s:option(DynamicList, "fallback", translate("Fallback DNS"), translate("Fallback resolvers to use when upstreams are unavailable."))
o.rmempty     = true

return m
