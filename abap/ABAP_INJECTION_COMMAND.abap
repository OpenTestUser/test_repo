" <yes> <report> ABAP_INJECTION_COMMAND gt3q22
CALL 'SYSTEM' ID 'COMMAND' FIELD 'command{name}' ID 'TAB' FIELD TABL[].

" <yes> <report> ABAP_INJECTION_COMMAND gt3q22
CALL 'SYSTEM' ID 'COMMAND' FIELD 'make' ID 'TAB' FIELD TABL[].

" <no> <report>
CALL 'SYSTEM' ID 'COMMAND' FIELD 'c:/command'.

" <yes> <report> ABAP_INJECTION_COMMAND tt3qhd
CALL FUNCTION 'JOB_SUBMIT'
 EXPORTING
  commandname               = 'c_name{}'
    EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND ds3qh7
CALL FUNCTION 'JOB_SUBMIT'
 EXPORTING
  commandname               = NULL
  extpgm_name                = 'e_name{}smth'
 EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND ks8qsw
CALL FUNCTION 'WS_EXECUTE'
  EXPORTING  
    COMMANDLINE = 'C:/PRIV/{XLS}/DEMO.XLS'
 EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND ks8qsw
CALL FUNCTION 'WS_EXECUTE'
  EXPORTING  
    program  = 'C:\{BARCODE2}\BCIL.BAT'
 EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND ut3q99
CALL FUNCTION 'GUI_EXEC' 
  EXPORTING
    command = 'myprogram{}'
    parameter = 'someparams{}'
  IMPORTING
    returncode = ''
 EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND ut3q99
CALL FUNCTION 'GUI_RUN' 
  EXPORTING
    command = 'program{}'
    parameter = 'params{}'
  EXCEPTIONS
  no_authority = 1
    OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND nm8q58
CALL FUNCTION 'ftp_command' 
  EXPORTING
    command = 'program{}'
  EXCEPTIONS
  no_authority = 1
    OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND ht8q54
CALL FUNCTION 'FTP_COMMAND_LIST'
  TABLES
    commands =  'program{}'
  EXCEPTIONS
  no_authority = 1
    OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND dd8qww
CALL FUNCTION 'SXPG_COMMAND_EXECUTE'
 IMPORTING
    COMMANDNAME     = 'program{}'
  EXCEPTIONS
  no_authority = 1
    OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_INJECTION_COMMAND dd8qww
CALL FUNCTION 'SXPG_COMMAND_EXECUTE'
 IMPORTING
    ADDITIONAL_PARAMETERS = 'params{}'
  EXCEPTIONS
  no_authority = 1
    OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

*https://blogs.sap.com/2017/01/19/code-vulnerability-analyzer-checks/

" <no> <report> ABAP_UNCHECKED_RETURN_VALUE kmf5cw
OPEN DATASET file FOR OUTPUT IN BINARY MODE 
" <yes> <report> ABAP_INJECTION_COMMAND ss3q67 
                      FILTER bad_filter.

" <yes> <report> ABAP_INJECTION_COMMAND pd321w <no> <report> ABAP_ERROR_BAD_HANDLING ccs477
CALL FUNCTION 'RFC_ABAP_INSTALL_AND_RUN'
    destination p_dest
    EXPORTING
         MODE         = 'F'
         PROGRAMNAME  = p_prog
    IMPORTING
         ERRORMESSAGE =  sy-msgv1
     TABLES
          PROGRAM      = vit_source
          WRITES       = vit_output.


" <yes> <report> ABAP_INJECTION_COMMAND ku389w
GENERATE SUBROUTINE POOL itab NAME DATA(prog).