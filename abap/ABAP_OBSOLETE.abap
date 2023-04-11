" http://help-legacy.sap.com/abapdocu_702/en/abaploop_at_dbtab.htm
TABLES t100. 
" <no> <report> ABAP_OBSOLETE 
LOOP AT t100. 
ENDLOOP.
check sy-subrc eq 0.

" <yes> <report> ABAP_OBSOLETE jkwq89
LOOP. 
MODULE tab_out.
ENDMODULE.
ENDLOOP. 
check sy-subrc eq 0.

" <yes> <report> ABAP_OBSOLETE jkwq89
LOOP AT itab CURSOR top_line INTO wa. 
ENDLOOP. 
check sy-subrc eq 0.

" <no> <report> ABAP_OBSOLETE 
LOOP WITH CONTROL contrl. 
ENDLOOP. 
check sy-subrc eq 0.

" <no> <report> ABAP_OBSOLETE 
LOOP AT spfli_tab INTO spfli WITH CONTROL flight_tab. 
ENDLOOP. 
check sy-subrc eq 0.

" <no> <report> ABAP_OBSOLETE 
LOOP AT t_mara ASSIGNING lfs_mara.
  lfs_mara-ersda = sy-datum + 1.
ENDLOOP.
check sy-subrc eq 0.

" <no> <report> ABAP_OBSOLETE 
LOOP AT ct_objects INTO ls_object WHERE type = lif_defs=>gc_type-ref_d.
      DELETE ct_objects INDEX sy-tabix.
      APPEND ls_object TO lt_deltas.
ENDLOOP.
check sy-subrc eq 0.

" http://help-legacy.sap.com/abapdocu_702/en/abapmodify_dbtab_obsolete.htm
" <no> <report> ABAP_OBSOLETE mt3qe2
MODIFY db VERSION vers. 

" http://help-legacy.sap.com/abapdocu_702/en/abaprefresh_obsolete.htm
" <yes> <report> ABAP_OBSOLETE sa3q44
REFRESH itab FROM TABLE dbtab.

" http://help-legacy.sap.com/abapdocu_702/en/abapdelete_dbtab_obsolete.htm
" <yes> <report> ABAP_OBSOLETE smmq1q
DELETE dbtab VERSION vers. 