" http://help-legacy.sap.com/abapdocu_702/en/abapsystem-call.htm
" https://blogs.sap.com/2013/03/06/a-word-about-call-system/
" http://stackoverflow.com/questions/40242248/does-abap-call-statement-set-sy-subrc-value

" CALL 'xxx' ID 'yyy' FIELD 'zzz'.

*https://blogs.sap.com/2013/03/06/a-word-about-call-system/
"0F1DE42E-E542-49AF-8ADB-2FF5F1A530D8

" <no> <report>
CALL 'C_SAPGPARAM' ID 'NAME'  FIELD 'SAPDBHOST'
                   ID 'VALUE' FIELD  dbserver.

SYSTEM-CALL ITAB_INFO TABLE itab1 OPCODE op 
                      PROTOCOL itab2.