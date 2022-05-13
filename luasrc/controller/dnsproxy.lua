-- Copyright (C) 2022 luci-app-dnsproxy
-- Copyright (C) 2022 NagaseKouichi
-- Licensed to the public under the GNU General Public License v3.

module("luci.controller.dnsproxy", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/dnsproxy") then
		return
	end

	entry({"admin", "services", "dnsproxy"}, cbi("dnsproxy"), _("DnsProxy"), 60).dependent = true
	entry({"admin", "services", "dnsproxy", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e={}
	e.running=luci.sys.call("pidof dnsproxy >/dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end