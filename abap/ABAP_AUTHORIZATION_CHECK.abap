" https://blogs.sap.com/2016/01/14/2016-recommendations-for-abap-code-security-what-to-do/
" https://help.sap.com/http.svc/rc/abapdocu_751_index_htm/7.51/en-US/abapcall_transaction_authority.htm
" https://blog.virtualforge.com/en/ten-golden-rules-for-abap-authorization-checks
" https://assets.cdn.sap.com/pdfjs/web/viewer.html?file=https://assets.cdn.sap.com/sapcom/docs/2015/07/e6441a8d-5b7c-0010-82c7-eda71af511fa.pdf#03_34044_TL_Securing_Remote_Function_Call_enUS.indd%3A.98532%3A1086

" <no> <report>
auth/rfc_authority_check  = 1.

" <yes> <report> ABAP_AUTHORIZATION_CHECK q12129
auth/rfc_authority_check  = 2.

"Always check the result of sy-subrc after you perform an AUTHORITY-CHECK. sy-subrc with value zero means authorization sufficient.
"https://blog.virtualforge.com/en/ten-golden-rules-for-abap-authorization-checks
" <no> <report>
AUTHORITY-CHECK OBJECT 'M_RECH_EKG'
         ID 'ACTVT' FIELD '02'
         ID 'EKGRP' FIELD 'ZZ'.
IF SY-SUBRC = 1.
ENDIF.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q17050
AUTHORITY-CHECK OBJECT 'M_RECH_EKG'
         ID 'ACTVT' FIELD '02'
         ID 'EKGRP' FIELD 'ZZ'.

" https://help.sap.com/http.svc/rc/abapdocu_751_index_htm/7.51/en-US/abapcall_transaction_standard.htm
" <yes> <report> ABAP_AUTHORIZATION_CHECK q18350
CALL TRANSACTION ta WITHOUT AUTHORITY-CHECK.
" http://help-legacy.sap.com/abapdocu_702/en/abapcall_transaction.htm
" <yes> <report> ABAP_AUTHORIZATION_CHECK q18350
CALL TRANSACTION 'FLIGHT_TA'.
" <no> <report>
CALL TRANSACTION 'FLIGHT_TA' WITH AUTHORITY-CHECK.

" https://blog.virtualforge.com/en/ten-golden-rules-for-abap-authorization-checks
" Do not use DUMMY values in important authorization fields like 'ACTVT'
" Avoid "*" values in authorization fields, as they force administrators to grant unnecessarily high privileges to users

" <yes> <report> ABAP_AUTHORIZATION_CHECK q17050
AUTHORITY-CHECK OBJECT 'S_DEVELOP'

" <yes> <report> ABAP_AUTHORIZATION_CHECK q15429
  ID 'DEVCLASS' FIELD '*'
  ID 'OBJTYPE'  FIELD 'PROG'
  ID 'OBJNAME'  FIELD lv_prog

" <no> <report>
  ID 'P_GROUP'  DUMMY
  ID 'ACTVT'    FIELD '03'.
  AUTHORITY-CHECK OBJECT 'S_DEVELOP'
" <yes> <report> ABAP_AUTHORIZATION_CHECK q15169
  ID 'ACTVT'  DUMMY
  ID 'ACTVT'    FIELD '03'.

IF sy-subrc = 0.
  READ REPORT lv_prog INTO lt_code.
ENDIF.

" ABAP_WORK row 303
" http://help-legacy.sap.com/abapdocu_702/en/abapeditor-call_for_report.htm
" <yes> <report> ABAP_AUTHORIZATION_CHECK hhu488 <yes> <report> ABAP_INJECTION_CODE q1114
EDITOR-CALL FOR REPORT prog.

"http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
"p. 16
" <no> <report> ABAP_ERROR_BAD_HANDLING gu3779 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'AUTHORITY_CHECK_ICF'
 EXPORTING
   userid = SY-UNAME
" <yes> <report> ABAP_AUTHORIZATION_CHECK mp5435
   icf_field = 'SERVICE'
" <yes> <report> ABAP_AUTHORIZATION_CHECK myu434
   icf_value = '*'
  EXCEPTIONS
    USER_DONT_EXIST = 1
    ICF_NO_AUTHORITY = 2.

" <yes> <report> ABAP_AUTHORIZATION_CHECK pp5889
AUTHORITY-CHECK OBJECT 'S_DEVELOP' FOR USER user
ID 'ACTVT'    FIELD '03'.
IF sy-subrc = 0.
  READ REPORT lv_prog INTO lt_code.
ENDIF.
" <no> <report>
AUTHORITY-CHECK OBJECT 'S_DEVELOP' FOR USER 'user'
ID 'ACTVT'    FIELD '03'.
IF sy-subrc = 0.
  READ REPORT lv_prog INTO lt_code.
ENDIF.

" http://www.isaca.org/Groups/Professional-English/sap-applications/GroupDocuments/White%20Paper%20-%20Protecting%20SAP%20Systems%20from%20Cyber%20Attack.pdf
" p. 17
*INITIALIZATION.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q17050
AUTHORITY-CHECK OBJECT 'S_TCODE'
" <yes> <report> ABAP_AUTHORIZATION_CHECK q15429
ID 'TCD' FIELD '*'.

AUTHORITY-CHECK OBJECT 'S_TABU_DIS'
" <yes> <report> ABAP_AUTHORIZATION_CHECK q15429
ID 'DICBERCLS' FIELD '*'
ID 'ACTVT' FIELD '02'.
IF sy-subrc = 0.
  READ REPORT lv_prog INTO lt_code.
ENDIF.

" <yes> <report> ABAP_AUTHORIZATION_CHECK bn5331 <no> <report> ABAP_ERROR_BAD_HANDLING gu3779
CALL FUNCTION 'HR_READ_INFOTYPE_AUTHC_DISABLE'
.
" <no> <report> ABAP_AUTHORIZATION_CHECK
AUTHORITY-CHECK OBJECT 'ZFI_FINCOD'
                ID 'ZFINCODE' FIELD i_fincode
                ID 'ACTVT' FIELD '02'.

    IF sy-subrc IS INITIAL.
    ENDIF.

" <yes> <report> ABAP_AUTHORIZATION_CHECK bn9991 <no> <report> ABAP_ERROR_BAD_HANDLING gu3779
CALL FUNCTION 'RFC_PREPARE_DESTINATION'
  EXPORTING
    destination =                ld_destination
*   action =                     ld_action
    authority_check =            ''
*   destcopy =                   ld_destcopy
*   destlock =                   ld_destlock
  EXCEPTIONS
    AUTHORITY_NOT_AVAILABLE =    1
    DESTINATION_ALREADY_EXIST =    2
    .  "  RFC_PREPARE_DESTINATION

IF SY-SUBRC EQ 0.
  "All OK
ELSEIF SY-SUBRC EQ 1.
  "Add code for exception here
ELSEIF SY-SUBRC EQ 2.
  "Add code for exception here
ENDIF.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q12130 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w <no> <report> ABAP_ERROR_BAD_HANDLING gu3779
CALL FUNCTION 'TREX_EXT_EXECUTE_COMMAND'
  EXPORTING
   i_no_authority_check =       'X'
  IMPORTING
    e_return_code =              ld_e_return_code
    e_return_text =              ld_e_return_text
    e_lines =                    ld_e_lines
  EXCEPTIONS
    CONVERSION_ERROR =           1
    ERROR =                      2.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q12130 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w <no> <report> ABAP_ERROR_BAD_HANDLING gu3779
CALL FUNCTION 'TREX_EXT_EXECUTE_COMMAND'
  EXPORTING
    i_rfc_destination =          ld_i_rfc_destination
  IMPORTING
    e_return_code =              ld_e_return_code
    e_return_text =              ld_e_return_text
    e_lines =                    ld_e_lines
    i_no_authority_check =       'X'
  EXCEPTIONS
    CONVERSION_ERROR =           1
    ERROR =                      2.
"  <no> <report> ABAP_ERROR_BAD_HANDLING gu3779 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'TREX_EXT_EXECUTE_COMMAND'
  EXPORTING
    i_rfc_destination =          ld_i_rfc_destination
  IMPORTING
    e_return_code =              ld_e_return_code
    e_return_text =              ld_e_return_text
    e_lines =                    ld_e_lines
    i_no_authority_check =       sadsafdg
  EXCEPTIONS
    CONVERSION_ERROR =           1
    ERROR =                      2.
" <no> <report> ABAP_ERROR_BAD_HANDLING gu3779  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'WS_DOWNLOAD'
    EXPORTING
        NO_AUTH_CHECK                 = ' '
    IMPORTING
        FIELDLENGTH                    = dsv
    EXCEPTIONS
        FILE_OPEN_ERROR               = 1.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q12131 <no> <report> ABAP_ERROR_BAD_HANDLING gu3779  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'WS_DOWNLOAD'
    EXPORTING
        NO_AUTH_CHECK                 = 'X'
    IMPORTING
        FIELDLENGTH                    = dsv
    EXCEPTIONS
        FILE_OPEN_ERROR               = 1.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q12132 <no> <report> ABAP_ERROR_BAD_HANDLING gu3779  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'HR_ECM_READ_INFOTYPE'
  EXPORTING
    no_auth_check = 'X'
  IMPORTING
    is_ok =' '
  EXCEPTIONS
    FILE_OPEN_ERROR = 1.
" <no> <report> ABAP_ERROR_BAD_HANDLING gu3779  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'HR_ECM_READ_INFOTYPE'
  EXPORTING
    no_auth_check = ' '
  IMPORTING
    is_ok =' '
  EXCEPTIONS
    FILE_OPEN_ERROR = 1.
" <no> <report> ABAP_ERROR_BAD_HANDLING gu3779  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'BAPI_EMPLOYEE_GETDATA'
EXPORTING
  authority_check = 'X'
IMPORTING
    return =  sad
EXCEPTIONS
    FILE_OPEN_ERROR = 1.
" <yes> <report> ABAP_AUTHORIZATION_CHECK q12133 <no> <report> ABAP_ERROR_BAD_HANDLING gu3779  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'BAPI_EMPLOYEE_GETDATA'
EXPORTING
  authority_check = ' '
IMPORTING
    return =  sad
EXCEPTIONS
    FILE_OPEN_ERROR = 1.
case a.
WHEN 'FC02'.
AUTHORITY-CHECK OBJECT 'S_TCODE'
ID 'TCD' FIELD 'ZFI_VAT_CASTLING_OPT'.
IF sy-subrc <> 0.
MESSAGE i000(zfi) WITH 'Нет полномочий на настройки'(e03).
 ELSE.
 CALL TRANSACTION 'ZFI_VAT_CASTLING_OPT'.
ENDIF.

WHEN 'FC02'.
IF sy-subrc <> 0.
MESSAGE i000(zfi) WITH 'Нет полномочий на настройки'(e03).
 ELSE.
"<yes><report> ABAP_AUTHORIZATION_CHECK q18350
 CALL TRANSACTION 'ZFI_VAT_CASTLING_OPT123'.
ENDIF.

WHEN 'FC02'.
"<yes><report> ABAP_AUTHORIZATION_CHECK q17050
AUTHORITY-CHECK OBJECT 'S_TCODE'
ID 'TCD' FIELD 'ZFI_VAT_CASTLING_OPT1234'.
"<yes><report> ABAP_AUTHORIZATION_CHECK q18351
CALL TRANSACTION 'ZFI_VAT_CASTLING_OPT1234'.
endcase.

" <yes> <report> ABAP_AUTHORIZATION_CHECK jfhres
CALL FUNCTION 'RH_AUTHORITY_CHECK_OFF'.
