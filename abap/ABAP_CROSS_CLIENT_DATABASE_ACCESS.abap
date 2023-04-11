" http://help-legacy.sap.com/abapdocu_750/en/index.htm

SELECT SINGLE address
" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS zxf991
       FROM dbtab CLIENT SPECIFIED
       WHERE mandt = @sy-mandt AND
             name = some_name
       INTO TABLE mytab.
CHECK sy-subrc = 0.

SELECT *
" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS zxf990
       FROM scustom USING CLIENT @client
       INTO TABLE @DATA(customers1).
CHECK sy-subrc = 0.
SELECT *
" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS zxf991
       FROM scustom CLIENT SPECIFIED
       WHERE mandt = @client
       INTO TABLE @DATA(customers2).
CHECK sy-subrc = 0.
" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
a = execute_ddl(exe = sds).

" <no> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
execute_ddl(exe = 'sdc').

" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
execute_ddl(exe = sdc).

" <no> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
a->execute_ddl(exe ='sdc').

" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
a->execute_ddl(exe = sdc).

" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
execute_ddl->a(exe = sdc).

" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
a->execute_ddl->a(exe = sdc).

SELECT *
" <no> <report>
       FROM scustom CLIENT SPECIFIED
       WHERE mandt = '800' AND id = 'fdad'

       INTO TABLE @DATA(customers2).
CHECK sy-subrc = 0.
" <yes> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS zxf992
SELECT *
       FROM scustom CLIENT SPECIFIED
       INTO TABLE @DATA(customers2).
CHECK sy-subrc = 0.
SELECT *
" <no> <report>
       FROM scustom USING CLIENT '800'
       INTO TABLE @DATA(customers1).
CHECK sy-subrc = 0.
"Не парсится при DELETE и MODIFY!!!
DELETE sdvd
    FROM demo_expressions USING CLIENT '800'
    WHERE id = 'X'.
MODIFY afdsvf
    FROM demo_expressions USING CLIENT '800'
    WHERE id = 'X'.