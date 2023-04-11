
" 50511E8C-A040-4910-BB88-A612B73C1E3E
IF sy-subrc <> 0.
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE w23qeq
  sy-subrc = 0.
ENDIF.

PROGRAM test_exceptions.
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE w23qeq
sy-subrc = 1.
" <no> <report>
sy-lstat = 5.

CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val
  IMPORTING
    e_summ   = gv_summ
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE qzz341
    sy-subrc = 1
  EXCEPTIONS
    error_message = 1
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE jzwq23
    sy-subrc = 1
    others   = 2.

IF sy-subrc = 1.
  WRITE.
ENDIF.
"  <no> <report> ABAP_ERROR_BAD_HANDLING jj3359 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val
  IMPORTING
    e_summ   = gv_summ
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE qzzq45
    sy-fodec = 1
  EXCEPTIONS
    error_message = 1
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE jzwq22
    sy-fleng = 1
    others   = 2.

PROGRAM test_exceptions.
" <yes> <report> ABAP_SYSTEM_FIELD_OVERWRITE w23qer
sy-tlopc = 10.