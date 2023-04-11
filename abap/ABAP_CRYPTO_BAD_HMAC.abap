" https://vulncat.hpefod.com/en/weakness?kingdom=Input+Validation+and+Representation%3bSecurity+Features%3bErrors&q=abap
" The following code skips the call to method CL_ABAP_HMAC->UPDATE which will result in the creation of a hash based on no data:

DATA obj TYPE REF TO cl_abap_hmac.

" <yes> <report> ABAP_CRYPTO_BAD_HMAC ttp588 <yes> <report> ABAP_CRYPTO_BAD_HASH mnp5j9
CALL METHOD cl_abap_hmac=>get_instance( 'sha1' 'secret' ).

" <yes> <report> ABAP_CRYPTO_BAD_HMAC ttp588 <yes> <report> ABAP_CRYPTO_BAD_HASH mnp5j9
CALL METHOD cl_abap_hmac=>get_instance( 'md5' 'secret' ).

TRY. 
" <yes> <report> ABAP_CRYPTO_BAD_HMAC phf453
cl_abap_hmac=>calculate_hmac_for_char(
      EXPORTING
        if_algorithm     = 'SHA1'
        if_key           = lv_sign_key_x
        if_data          = lv_sign_string
      IMPORTING
        ef_hmacb64string = lv_hmac_result
    ).
    CATCH cx_application_error. 
ENDTRY.

" <yes> <report> ABAP_CRYPTO_BAD_HMAC zxp580
lo_hmac = cl_abap_hmac=>get_instance( if_algorithm = 'sha1' if_key = lw_key ).
" <yes> <report> ABAP_CRYPTO_BAD_HMAC phf454
cl_abap_hmac=>calculate_hmac_for_char(
      EXPORTING
        if_key           = lv_sign_key_x
        if_data          = lv_sign_string
      IMPORTING
        ef_hmacb64string = lv_hmac_result
    ).
try.
    CATCH cx_application_error.
endtry.
