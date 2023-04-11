" https://vulncat.hpefod.com/en/weakness?kingdom=Input+Validation+and+Representation%3bSecurity+Features%3bErrors&q=abap

" <yes> <report> ABAP_CRYPTO_BAD_SEED q19409
s = cl_abap_random=>create( seed = 123 ).

TRY. 
" <yes> <report> ABAP_CRYPTO_BAD_RANDOM 164913 <yes> <report> ABAP_CRYPTO_BAD_SEED 171113
cl_abap_random_int=>create(
  exporting
    seed = 123
    min = 0
    max = 100
  receiving
    prng = o_rand
).
CATCH cx_application_error. 
ENDTRY.