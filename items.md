- opcode:
```
  - QUERY		Queries received
```

- rcode:
```
  - NOERROR		reseived with no errors
  - SERVFAIL		SERVFAIL received
  - NXDOMAIN		NXDOMAIN received
  - REFUSED		REFUSED received
```

- qtype: and resqtype:
```
  - A
  - AAAA
  - ANY
  - AXFR
  - CNAME
  - DNSKEY
  - MX 
  - NS 
  - PTR 
  - RRSIG 
  - SOA 
  - SPF 
  - SRV 
  - TXT 
  - TYPE65
```

- nsstat:
```
  - Requestv4           IPv4 requests received
  - Response            responses sent
  - ReqEdns0            requests with EDNS(0) received
  - RespEDNS0           responses with EDNS(0) sent
  - ReqTCP              TCP requests received
  - RespEDNS0           responses with EDNS(0) sent
  - QrySuccess          queries resulted in successful answer
  - QryAuthAns          queries resulted in authoritative answer
  - QryNoauthAns        queries resulted in non authoritative answer
  - QryReferral         queries resulted in referral answer
  - QryNxrrset          queries resulted in nxrrset
  - QrySERVFAIL         queries resulted in SERVFAIL
  - QryNXDOMAIN         queries resulted in NXDOMAIN
  - QryRecursion        queries caused recursion
  - QryDuplicate        duplicate queries received
  - QryDropped          queries dropped
  - QryFailure          other query failures
  - RecursClients       recursing clients
  - QryUDP              UDP queries received
  - QryTCP              TCP queries received
  - Prefetch            queries triggered prefetch
```

- sockstat:
```
  - UDP4Open		UDP/IPv4 sockets opened
  - TCP4Open		TCP/IPv4 sockets opened
  - UDP4Close		UDP/IPv4 sockets closed
  - TCP4Close		TCP/IPv4 sockets closed
  - UDP4Conn		UDP/IPv4 connections established
  - TCP4Conn		TCP/IPv4 connections established
  - TCP4Accept		TCP/IPv4 connections accepted
  - UDP4Active		UDP/IPv4 sockets active
  - TCP4Active		TCP/IPv4 sockets active
```
