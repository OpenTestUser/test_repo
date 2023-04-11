"https://events.ccc.de/congress/2010/Fahrplan/attachments/1767_SAP_SECURITY-Ertunga_Arsal-Rootkits_and_Trojans-SLIDES.pdf
" p. 23
" <yes> <report> ABAP_INJECTION_SQL ty3q99 
SELECT (var_ColumName) FROM (var_TableName)
INTO TableB WHERE (var_WhereClause).
check sy-subrc eq 0.

SELECT ColumnA FROM TableA INTO TableB.
check sy-subrc eq 0.

" <no> <report> ABAP_CROSS_CLIENT_DATABASE_ACCESS tyu014
result = NEW cl_sql_statement( )->execute_query(
      'SELECT carrname ' &&
      'FROM scarr ' &&
      'WHERE carrid = ' && ''' && key && ''' ).

" <yes> <report> ABAP_INJECTION_SQL zer955
CALL 'C_DB_EXECUTE' ID 'STATLEN' FIELD lv_len ID 'STATTXT' FIELD lv_stmt
                    ID 'SQLERR'  FIELD lv_sqlerr.
