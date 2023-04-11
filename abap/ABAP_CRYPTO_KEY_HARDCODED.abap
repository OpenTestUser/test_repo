" https://vulncat.hpefod.com/en/weakness?kingdom=Input+Validation+and+Representation%3bSecurity+Features%3bErrors&q=abap&po=2

DATA: lo_hmac TYPE Ref To cl_abap_hmac,
             Input_string type string.
" <yes> <report> ABAP_CRYPTO_BAD_HASH mnp5j9
CALL METHOD cl_abap_hmac=>get_instance
  EXPORTING
    if_algorithm = 'SHA3'
" <yes> <report> ABAP_CRYPTO_KEY_HARDCODED hh3qgr
    if_key       = 'hardcoded'
    " <yes> <report> ABAP_CRYPTO_KEY_HARDCODED uufq69
    sdfkencryptionscsfvkeysacfv = 'dsccd'
    " <yes> <report> ABAP_CRYPTO_KEY_HARDCODED uufq66
    public_key = 'sdfds'
  RECEIVING
    ro_object    = lo_hmac
  EXCEPTIONS
    UPDATE_FAILURE = 1
    OTHERS       = 2.

CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE.

" <yes> <report> ABAP_CRYPTO_BAD_HASH mnp5j9
CALL METHOD cl_abap_hmac=>get_instance
  EXPORTING
    " <no> <report> ABAP_CRYPTO_KEY_HARDCODED uufq69
    priv_key = 'X'
    " <no> <report> ABAP_CRYPTO_KEY_HARDCODED uufq66
    public_key = ' '
  RECEIVING
    ro_object    = lo_hmac
  EXCEPTIONS
    UPDATE_FAILURE = 1
    OTHERS       = 2.

" <yes> <report> ABAP_CRYPTO_KEY_HARDCODED uufq69
encryptionKey = 'hardcoded'.
" <yes> <report> ABAP_CRYPTO_KEY_HARDCODED uufq66
sdfkesecnscsfvkeysacfv = 'dsccd'.

" <yes> <report> ABAP_CRYPTO_KEY_HARDCODED uufq75
IF sdfkencdrysecretptionscsfvkeysacfv = 'sdscfwe12'.
    dsf = 'saf'.
ELSE.
    dsf = 'saf'.
ENDIF.