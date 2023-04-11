" http://help-legacy.sap.com/abapdocu_702/en/abenkernel_methods.htm

CLASS cl_my_calculation IMPLEMENTATION. 
"... 
	METHOD div BY KERNEL MODULE xx_myDiv. 
	ENDMETHOD. 
"... 
ENDCLASS.

" http://help-legacy.sap.com/abapdocu_702/en/abapgenerate_report.htm
" <yes> <report> ABAP_BAD_FUNCTION q2f5j0
GENERATE REPORT prog.

" http://help-legacy.sap.com/abapdocu_702/en/abapread_report.htm
" http://help-legacy.sap.com/abapdocu_702/en/abapread_report_internal.htm
" <yes> <report> ABAP_BAD_FUNCTION wwf54n
READ REPORT prog INTO itab STATE I.
