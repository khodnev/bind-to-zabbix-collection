#!/bin/bash

# =======================================================
# This script prepares data for zabbix_agent2.
# The script is run from cron once every 30 seconds. 
#
#   * * * * * /etc/zabbix/get_bind_metrics_for_zabbix.sh  
#   * * * * * ( sleep 30; /etc/zabbix/get_bind_metrics_for_zabbix.sh )  
#
# The script requires the following packages to be installed on the system
#
#   curl
#   xml2
#
# =======================================================
# (C) 2023 khodnev@gmail.com 
# https://github.com/khodnev/bind-to-zabbix-collection
# =======================================================

# =======================================================
# Here it is required to perform a quick access to the bind TCP 
# statistics socket so as not to create unnecessary load on the socket.
# =======================================================

curl http://127.0.0.1:8053 2>/dev/null >/tmp/bind_metrics.xml

# =======================================================
# Parsing XML and prepare data for zabbix_agent2. 
# This is so as not to parse a large amount of data every time.
# =======================================================

cat /tmp/bind_metrics.xml | xml2 | egrep "/statistics/server/counters/|/statistics/views/view/counters/" >/tmp/bind_metrics.out

# =======================================================
# The bind.conf plugin uses the following grep queries 
# from the zabbix template to zabbix_agent:
#
# bind.server  "/statistics/server/counters/counter/@name=$1$"
# bind.vievs   "/statistics/views/view/counters/counter/@name=$1$"
#
# And used next codes:
#
# opcode:
#   QUERY
#
# rcode:
#   NOERROR
#   SERVFAIL
#   NXDOMAIN
#   REFUSED
#
# qtype: and resqtype:
#   A
#   AAAA
#   ANY
#   AXFR
#   CNAME
#   DNSKEY
#   MX 
#   NS 
#   PTR 
#   RRSIG 
#   SOA 
#   SPF 
#   SRV 
#   TXT 
#   TYPE65
#
# nsstat:
#   Requestv4
#   Response
#   ReqEdns0
#   RespEDNS0
#   ReqTCP
#   RespEDNS0
#   QrySuccess
#   QryAuthAns
#   QryNoauthAns
#   QryReferral
#   QryNxrrset
#   QrySERVFAIL
#   QryNXDOMAIN
#   QryRecursion
#   QryDuplicate
#   QryDropped
#   QryFailure
#   RecursClients
#   QryUDP
#   QryTCP
#   Prefetch
#
# sockstat:
#   UDP4Open
#   TCP4Open
#   UDP4Close
#   TCP4Close
#   UDP4Conn
#   TCP4Conn
#   TCP4Accept
#   UDP4Active
#   TCP4Active
#
# =======================================================

