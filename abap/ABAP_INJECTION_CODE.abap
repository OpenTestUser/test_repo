"<yes> <report> ABAP_INJECTION_CODE q1111
INSERT REPORT 'RM07DOCS_GENERATED' FROM g_t_code.
"<yes> <report> ABAP_INJECTION_CODE q1112
DELETE REPORT lv_zreport.
"<yes> <report> ABAP_INJECTION_CODE q1113
LOAD REPORT PF_PROGNAME PART 'INTI' INTO PT_RINTI.
"<yes> <report> ABAP_INJECTION_CODE q1117
EXPORT DYNPRO h f e m ID gs_dynpro_descr.
"<yes> <report> ABAP_INJECTION_CODE q1118
IMPORT DYNPRO ls_dhead lt_dfield lt_dflow lt_dmatch ID ls_dynp_id.