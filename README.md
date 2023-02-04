# Bind DNS Server plugin for zabbix agent

## Overview

Based on this:

https://github.com/zabbix/community-templates/tree/main/Applications/DNS/template_bind_stat/6.0

Redesigned to take into account the fact that with each request there is a call to the bind statistics TCP socket. This puts a lot of stress on bind. The socket generates very large output in XML format. But you don't always need all the parameters to work.

**How it works**

Created a script that runs as a cron job every 30 seconds.
This script pulls the socket once every 30 seconds, saves the output to an XML file and then cleans the output, reducing it by several tens of times.

Put script [get_bind_metrics_for_zabbix.sh](get_bind_metrics_for_zabbix.sh) in /etc/zabbix/ and set run it from cron onse every 30 seconds. [See example](crontab_root).

```
* * * * * /etc/zabbix/get_bind_metrics_for_zabbix.sh
* * * * * ( sleep 30; /etc/zabbix/get_bind_metrics_for_zabbix.sh )
```

Include statistics in named.conf:

```  
statistics-channels {  
 inet 127.0.0.1 port 8053 allow { 127.0.0.1; };  
 };
```

Put [bind.conf](bind.conf) in /etc/zabbix/zabbix_agent2.d/plugins.d/

```
UserParameter=bind.server[*],cat /tmp/bind_metrics.out | grep -A1 "/statistics/server/counters/counter/@name=$1$" | tail -1 | cut -d= -f2
UserParameter=bind.views[*],cat /tmp/bind_metrics.out | grep -A1 "/statistics/views/view/counters/counter/@name=$1$" | tail -1 | cut -d= -f2
```

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

[See items.md](items.md)

## Triggers

There are no triggers in this template.

