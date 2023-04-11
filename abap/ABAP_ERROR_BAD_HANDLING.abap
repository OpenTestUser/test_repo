" <no> <report> ABAP_ERROR_BAD_HANDLING ccs477
CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val.
" <no> <report> ABAP_ERROR_BAD_HANDLING ccs477
CALL FUNCTION 'ZTEST_EXC'
  CHANGING
    data_table = html_table.
" <no> <report> ABAP_ERROR_BAD_HANDLING ccs477
CALL FUNCTION 'ZTEST_EXC'
  IMPORTING
    e_summ   = gv_summ.
" <no> <report> ABAP_ERROR_BAD_HANDLING ccs477
CALL FUNCTION 'ZTEST_EXC'
  TABLES
    PARAMETERS     = l_parameter.


FORM call_method.
  DATA l_string TYPE string.
" <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
  CALL METHOD cl_gui_frontend_services=>get_sapgui_directory
    CHANGING
      sapgui_directory = l_string
    EXCEPTIONS
      only_display = 1
      no_authority = 2.
" <no> <report> ABAP_ERROR_BAD_HANDLING ttj3u9
  CALL METHOD cl_gui_frontend_services=>get_sapgui_directory
      CHANGING
        sapgui_directory = l_string.
ENDFORM. 

" <no> <report> ABAP_ERROR_BAD_HANDLING ccs477
CALL FUNCTION 'SWO_TEXT_FUNCTION_EXCEPTION'
  EXPORTING
    language  = sy-langu
    function  = lv_fun
    exception = lv_exc
  IMPORTING
      shorttext = lv_txt
  CHANGING
    data_table = html_table.

IF i_num_1 IS NOT SUPPLIED.
  MESSAGE e398 WITH lv_txt RAISING no_num_1.
ENDIF.

FORM call_function.
" <no> <report> ABAP_ERROR_BAD_HANDLING gu3779 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
  CALL FUNCTION 'MARA_AUTHORITY_CHECK'
    EXPORTING
      aktyp        = 'C'
    EXCEPTIONS
      only_display = 1
      no_authority = 2.
ENDFORM. 

CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val    
  IMPORTING
    e_summ   = gv_summ
  EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <no> <report> ABAP_ERROR_BAD_HANDLING zz3700
oref->do_something( 
  EXCEPTIONS application_error = 4 ). 
IF sy-subrc <> 0. 
  MESSAGE e398 WITH lv_txt RAISING no_num_1.
ENDIF.

TRY. 
    oref->do_something( ). 
    CATCH cx_application_error. 
      MESSAGE e398 WITH lv_txt RAISING no_num_1.
ENDTRY.

" <no> <report> ABAP_ERROR_BAD_HANDLING jj3359
CALL FUNCTION 'WV_KOMK_FILL_V'
       EXPORTING
            pi_i_spr   = pispr
            pi_vorga   = pispr-vorga
       IMPORTING
            pe_i_komk  = komk
       EXCEPTIONS
            no_authority = 1
" <no> <report> ABAP_ERROR_BAD_HANDLING pphh7f
            OTHERS     = 0.
CALL FUNCTION 'WV_KOMK_FILL_V'
       EXPORTING
            pi_i_spr   = pispr
            pi_vorga   = pispr-vorga
       IMPORTING
            pe_i_komk  = komk
       EXCEPTIONS
            no_authority = 1
" <no> <report> ABAP_ERROR_BAD_HANDLING pphh7f
            OTHERS     = 0.
check asdsad.
if asdas.
CALL FUNCTION 'WV_KOMK_FILL_V'
       EXPORTING
            pi_i_spr   = pispr
            pi_vorga   = pispr-vorga
       IMPORTING
            pe_i_komk  = komk
       EXCEPTIONS
            no_authority = 1
" <no> <report> ABAP_ERROR_BAD_HANDLING pphh7f
            OTHERS     = 0.
IF sy-subrc <> 0.
ENDIF.
endif.
CALL FUNCTION 'WV_KOMK_FILL_V'
       EXPORTING
            pi_i_spr   = pispr
            pi_vorga   = pispr-vorga
       IMPORTING
            pe_i_komk  = komk
       EXCEPTIONS
            no_authority = 1
" <no> <report> ABAP_ERROR_BAD_HANDLING pphh7f
            OTHERS     = 0.
IF sfd=dc.
MESSAGE e398 WITH lv_txt RAISING no_num_1.
ENDIF.
CALL FUNCTION 'WV_KOMK_FILL_V'
       EXPORTING
            pi_i_spr   = pispr
            pi_vorga   = pispr-vorga
       IMPORTING
            pe_i_komk  = komk
       EXCEPTIONS
            no_authority = 1
" <no> <report> ABAP_ERROR_BAD_HANDLING pphh7f
            OTHERS     = 0.
case a=b.
endcase.
