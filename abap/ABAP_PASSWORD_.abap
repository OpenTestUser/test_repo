CALL FUNCTION 'BAPI_BPARTNER_CHECKPASSWORD'
  EXPORTING
" <yes> <report> ABAP_PASSWORD_EMPTY bm3q34
  password = ''
  EXCEPTIONS
  only_display = 1
  others = 2.
IF SY-SUBRC EQ 0.
  "All OK
ENDIF.

CALL FUNCTION 'BAPI_BPARTNER_CHECKPASSWORD'
  EXPORTING
" <yes> <report> ABAP_PASSWORD_HARDCODED ja3q9r
  password = 'hardcoded'
  EXCEPTIONS
    only_display = 1
    others = 2.
IF SY-SUBRC EQ 0.
  "All OK
ENDIF.

" <yes> <report> ABAP_PASSWORD_EMPTY ty3q76
pwd = ''.
" <yes> <report> ABAP_PASSWORD_EMPTY ty3q76
password = space.
" <yes> <report> ABAP_PASSWORD_HARDCODED uu3q98
pswd = 'hardcoded'.
" <yes> <report> ABAP_PASSWORD_HARDCODED uu3q9t
pswd = 'hardc oded'.

" <yes> <report> ABAP_BACKDOOR_SPECIAL_ACCOUNT rh3q23
IF pswd = 'hardcoded'.
   	write 'This is hardcoded password'.
ELSE.
  write 'This is hardcoded password'.
ENDIF.

" http://www.se80.co.uk/sapfms/f/fieb/fieb_password_encrypt.htm
CALL FUNCTION 'FIEB_PASSWORD_ENCRYPT'
EXPORTING
" <yes> <report> ABAP_PASSWORD_HARDCODED tw3q34
IM_DECRYPTED_PASSWORD = 'pwd'
" <yes> <report> ABAP_PASSWORD_HARDCODED tw3q3t
IM_DECRYPTED_PASSWORD = 'pw d'
IMPORTING
" <yes> <report> ABAP_PASSWORD_HARDCODED rt3q1e
EX_ENCRYPTED_PASSWORD = 'enpwd'
" <yes> <report> ABAP_PASSWORD_HARDCODED rt3q1t
EX_ENCRYPTED_PASSWORD = 'en pwd'
EXCEPTIONS
  only_display = 1
  others = 2.
  IF SY-SUBRC EQ 0.
  "All OK
ENDIF.

CALL FUNCTION 'FIEB_PASSWORD_DECRYPT'
EXPORTING
" <yes> <report> ABAP_PASSWORD_HARDCODED tw3q34
IM_ENCRYPTED_PASSWORD = 'enpwd'
IMPORTING
" <yes> <report> ABAP_PASSWORD_HARDCODED rt3q1e
EX_DECRYPTED_PASSWORD = 'pwd'
EXCEPTIONS
  only_display = 1
  others = 2.
  IF SY-SUBRC EQ 0.
  "All OK
ENDIF.

CALL FUNCTION 'DEST_SET_PASSWORD'
  EXPORTING
   name =  some_name
" <yes> <report> ABAP_PASSWORD_HARDCODED ja3q9r
   password = 'hardcoded'
" <yes> <report> ABAP_PASSWORD_HARDCODED ja3q9t
   password = 'hardc oded'
  EXCEPTIONS
    UPDATE_FAILURE = 1
EXCEPTIONS
  only_display = 1
  others = 2.
  IF SY-SUBRC EQ 0.
  "All OK
ENDIF.

CALL FUNCTION 'DEST_SET_PASSWORD'
  EXPORTING
   name =  some_name
" <yes> <report> ABAP_PASSWORD_EMPTY bm3q34
   password = ''
  EXCEPTIONS
    UPDATE_FAILURE = 1
EXCEPTIONS
  only_display = 1
  others = 2.
  IF SY-SUBRC EQ 0.
  "All OK
ENDIF.

