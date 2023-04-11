" http://help-legacy.sap.com/abapdocu_702/en/abennativesql.htm
" ABAP_WORK row 338
" <yes> <report> ABAP_BACKDOOR_HIDDEN_FUNCTIONALITY ddf588 
EXEC SQL.
  CREATE TABLE abap_docu_demo_mytab (
           val1 char(10) NOT NULL,
           val2 char(10) NOT NULL,
           PRIMARY KEY (val1)      ).
ENDEXEC.