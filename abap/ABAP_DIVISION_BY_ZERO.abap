*http://abap-blog.ru/osnovy-abap/obrabotka-osobyx-situacij-v-abap/
*https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abendivision_zero_guidl.htm
FORM math.
  DATA: l_tmp TYPE i.
" <yes> <report> ABAP_DIVISION_BY_ZERO qw22w0 
  l_tmp = l_tmp / 0.

  IF divisor <> 0. 
" <no> <report> ABAP_DIVISION_BY_ZERO qw22w0 
   result = dividend / divisor. 
  ELSE. 
     RAISE EXCEPTION TYPE cx_sy_zerodivide. 
  ENDIF.

PARAMETERS: number1 TYPE i,
            number2 TYPE i.
 
DATA result  TYPE p DECIMALS 2.
 
TRY.
" <no> <report> ABAP_DIVISION_BY_ZERO qw22w0 
    result = number1 / number2.
  CATCH cx_sy_zerodivide.
    number1 = 0.
    RETRY.
ENDTRY.
ENDFORM.

// <no> <report> ABAP_DIVISION_BY_ZERO qw22w0
DATA: g_r/cwm/screean TYPE c.