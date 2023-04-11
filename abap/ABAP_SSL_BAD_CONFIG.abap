"https://archive.sap.com/discussions/thread/3204533
"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf


login/create_sso2_ticket = 0. 

login/accept_sso2_ticket = 0. 

login/ticketcache_entries_max = 1000. 

login/ticketcache_off = 0. 

" <yes> <report> ABAP_SSL_BAD_CONFIG zx3487
login/ticket_only_by_https = 0. 

icf/user_recheck = 0. 

http/security_session_timeout = 1800.

http/security_context_cache_size = 2500. 

rdisp/plugin_auto_logout = 1800. 

rdisp/autothtime = 60.
"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf

" <yes> <report> ABAP_SSL_BAD_CONFIG zu5557
icm/HTTPS/verify_client = 0.

"https://help.sap.com/erp2005_ehp_04/helpdata/en/48/9ab5d73e6d062be10000000a42189d/frameset.htm
icm/accept_forwarded_cert_via_http = TRUE.

"https://help.sap.com/erp2005_ehp_04/helpdata/en/48/9ab5d73e6d062be10000000a42189d/frameset.htm
" <yes> <report> ABAP_SSL_BAD_CONFIG klp788
icm/HTTPS/trust_client_with_issuer = '*'.
"https://help.sap.com/erp2005_ehp_04/helpdata/en/48/9ab5d73e6d062be10000000a42189d/frameset.htm
" <yes> <report> ABAP_SSL_BAD_CONFIG klp788
icm/HTTPS/trust_client_with_subject = '*'.

"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
"p. 10
wdisp/ssl_encrypt = 0.

"https://help.sap.com/saphelp_nw74/helpdata/en/48/ad76299eff35b7e10000000a42189d/frameset.htm
"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
"p. 13

" <yes> <report> ABAP_SSL_BAD_CONFIG wt1599
gw/rem_start = REMOTE_SHELL.
"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
"p. 13
" <yes> <report> ABAP_SSL_BAD_CONFIG nn7757
gw/monitor = 0.
"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
"p. 13
" <yes> <report> ABAP_SSL_BAD_CONFIG nff750
gw/accept_remote_trace_level = 1.
"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
"p. 13
" <yes> <report> ABAP_SSL_BAD_CONFIG nff750
rdisp/accept_remote_trace_level = 1.

" https://help.sap.com/saphelp_nw74/helpdata/en/77/6fb4308dbe40d6b6ac5903e95c2521/frameset.htm