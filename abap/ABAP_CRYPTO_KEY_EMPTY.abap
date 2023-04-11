" https://vulncat.hpefod.com/en/weakness?kingdom=Input+Validation+and+Representation%3bSecurity+Features%3bErrors&q=abap&po=2
" <yes> <report> ABAP_CRYPTO_BAD_HASH mnp5j9  
CALL METHOD cl_abap_hmac=>get_instance
  EXPORTING
    if_algorithm = 'SHA3'
" <yes> <report> ABAP_CRYPTO_KEY_EMPTY fd3q72
    if_key       = space

" <yes> <report> ABAP_CRYPTO_KEY_EMPTY fd3q72
    if_key       = ''
  RECEIVING
    ro_object    = lo_hmac
  EXCEPTIONS
  no_authority = 1
  OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE. 

" <yes> <report> ABAP_CRYPTO_KEY_EMPTY fffq46
publictionKey = ''.

" <yes> <report> ABAP_CRYPTO_KEY_EMPTY fffq47
pencryptnonKey = ''.