" https://vulncat.hpefod.com/en/weakness?kingdom=Input+Validation+and+Representation%3bSecurity+Features%3bErrors&q=abap
" <yes> <report> ABAP_CRYPTO_BAD_RANDOM 145013
s = cl_abap_random=>create( seed = num ).

" <yes> <report> ABAP_CRYPTO_BAD_SEED q19409
s = cl_abap_random=>create( seed = 5 ).
TRY.
" <yes> <report> ABAP_CRYPTO_BAD_RANDOM 145213
s->int31( RECEIVING value = num2 ).
CATCH cx_application_error.
ENDTRY.

TRY.
       " <yes> <report> ABAP_CRYPTO_BAD_RANDOM 164913
       cl_abap_random_int=>create(
         exporting
           seed = some_seed
           min = 0
           max = 100
         receiving
           prng = o_rand
       ).
       CATCH cx_application_error.
ENDTRY.