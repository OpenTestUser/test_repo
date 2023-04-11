" https://vulncat.hpefod.com/en/weakness?kingdom=Input+Validation+and+Representation%3bSecurity+Features%3bErrors&q=abap
" The following code skips the call to method CL_ABAP_HMAC->UPDATE which will result in the creation of a hash based on no data:

DATA obj TYPE REF TO cl_abap_hmac.

TRY. 
    oref->do_something( ). 
    CATCH cx_application_error. 
ENDTRY.

" <yes> <report> ABAP_CRYPTO_BAD_HASH mnp5j9
CALL METHOD cl_abap_hmac=>get_instance
  EXPORTING
    if_key    = some_key
  RECEIVING
    ro_object = obj
  EXCEPTIONS
  	OTHERS       = 2.
CASE sy-subrc.
  WHEN 1.
  MESSAGE s148.
  WHEN 2.
  MESSAGE i007.
ENDCASE.


TRY.
" <yes> <report> ABAP_CRYPTO_BAD_HASH ggf571
cl_abap_message_digest=>calculate_hash_for_char( 
	EXPORTING
	   if_algorithm = sha1
	if_data = text
	IMPORTING
	ef_hashstring = hash).
CATCH cx_application_error. 
ENDTRY.

TRY.
" <yes> <report> ABAP_CRYPTO_BAD_HASH ggf571
cl_abap_message_digest=>calculate_hash_for_raw( 
	EXPORTING
	   if_algorithm = md5
	if_data = text
	IMPORTING
	ef_hashstring = hash ).
CATCH cx_application_error. 
ENDTRY.
TRY.
" <yes> <report> ABAP_CRYPTO_BAD_HASH ggf570
cl_abap_message_digest=>calculate_hash_for_char(
	EXPORTING
	   sadf = sdfsd
	if_data = text
	IMPORTING
	ef_hashstring = hash).
CATCH cx_application_error.
ENDTRY.