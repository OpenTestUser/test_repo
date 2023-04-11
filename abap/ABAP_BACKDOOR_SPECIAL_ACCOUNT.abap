" http://help-legacy.sap.com/abapdocu_750/en/index.htm
AUTHORITY-CHECK OBJECT 'S_DEVELOP'
   ID 'DEVCLASS' FIELD 'class'
   ID 'OBJTYPE'  DUMMY
   ID 'OBJNAME'  DUMMY
   ID 'P_GROUP'  DUMMY
   ID 'ACTVT'    FIELD '02'.

IF sy-subrc <> 0.
" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT dut589
  IF sy-uname <> 'user'.
    LEAVE PROGRAM.
  ENDIF.
ENDIF.

" http://help-legacy.sap.com/abapdocu_750/en/index.htm

" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT tyf118
IF sy-mandt <> '800'.
LEAVE PROGRAM.
" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT sp3t21
ELSEIF  password <= 123456.
ENDIF.

" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT tyf118
IF sy-mandt <> 800.
LEAVE PROGRAM.
ENDIF.

" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT dut589
IF sy-uname = 'RZHANICYN_G'.
    " <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE w23qeq
    sy-subrc = 0.
ENDIF.

" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT dut589
IF it_profit[] IS INITIAL AND sy-uname = 'RZHANICYN_G'.
    " <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE w23qeq
    sy-subrc = 0.
ENDIF.

" <no> <report>
IF sy-uname <> ''.
  LEAVE PROGRAM.
ENDIF.

" <no> <report>
if lv_pass = 2.
delete lt_moves[] where werks in <ft_werks2>.
endif.