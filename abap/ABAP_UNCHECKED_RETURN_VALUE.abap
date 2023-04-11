" <no> <report> ABAP_ERROR_BAD_HANDLING jj3359  <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val
  IMPORTING
    e_summ   = gv_summ
  EXCEPTIONS
    error_message = 1
    others   = 2.

CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val
  IMPORTING
    e_summ   = gv_summ
  EXCEPTIONS
    error_message = 1
    others   = 2.
CASE sy-subrc.
  WHEN 0.
    MESSAGE s148.
  WHEN 1.
    MESSAGE i007.
ENDCASE.

METHOD abap.

    DATA: lt_source TYPE STANDARD TABLE OF abaptxt255.
" <no> <report> ABAP_ERROR_BAD_HANDLING jj3359 <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
    CALL FUNCTION 'RPY_PROGRAM_READ'
    EXPORTING
        program_name     = iv_name
        with_lowercase   = abap_true
    TABLES
        source_extended  = lt_source
    EXCEPTIONS
        cancelled        = 1
        not_found        = 2
        permission_error = 3
        OTHERS           = 4.
    ASSERT sy-subrc = 0. " todo, error handling

    CONCATENATE LINES OF lt_source
    INTO rv_abap
    SEPARATED BY cl_abap_char_utilities=>newline.

ENDMETHOD.

CALL FUNCTION 'ZTEST_EXC'
  EXPORTING
    i_num_2  = gv_val
  IMPORTING
    e_summ   = gv_summ
  EXCEPTIONS
    error_message = 1
    others   = 2.
IF sy-subrc = 1.
  WRITE.
ENDIF.

call function 'CHANGEDOCUMENT_PREPARE_POS'
       tables
            editpos = prepare
            i_cdpos = ycdpos
       exceptions
            others  = 1.
check sy-subrc eq 0.


FORM call_method.
  DATA: l_string TYPE string.
" <no> <report> ABAP_UNCHECKED_RETURN_VALUE hkf52w
  CALL METHOD cl_gui_frontend_services=>get_sapgui_directory
    CHANGING
      sapgui_directory = l_string
    EXCEPTIONS
    error_message = 1
    others   = 2.
ENDFORM.

TRY.
    oref->do_something( ).
    CATCH cx_application_error.
ENDTRY.

" <no> <report> ABAP_UNCHECKED_RETURN_VALUE jup00w
SELECT *
       FROM scustom
       WHERE mandt = @client
       INTO TABLE @DATA(customers2).

" <no> <report> ABAP_UNCHECKED_RETURN_VALUE kmf5cw
OPEN DATASET DSN FOR INPUT MESSAGE MSG.

" <no> <report> ABAP_UNCHECKED_RETURN_VALUE kmf5cw
READ TABLE <gt_table> INDEX <index_rows>-index INTO <gs_line>.
*          CHECK sy-subrc = 0.
" <no> <report> ABAP_UNCHECKED_RETURN_VALUE jjf5mm
          LOOP AT lt_fields ASSIGNING <fields> WHERE doit = 'X'.
            ASSIGN COMPONENT <fields>-alv_fieldname OF STRUCTURE <gs_line> TO <fs>.
*            CHECK sy-subrc = 0 AND <fs> IS ASSIGNED.
            IF <fields>-if_empty = 'X'.
              CHECK <fs> IS INITIAL.
            ENDIF.
            CASE 'X'.
              WHEN <fields>-const.
                <fs> = <fields>-value.
              WHEN <fields>-prog.
" <no> <report> ABAP_UNCHECKED_RETURN_VALUE kmf5cw
                READ TABLE gt_load_fields ASSIGNING <load_fields> WITH KEY field = <fields>-fieldname.
                IF sy-subrc = 0 AND
                  NOT <load_fields>-program_autofil IS INITIAL AND
                  NOT <load_fields>-perform_autofil IS INITIAL.
                  PERFORM (<load_fields>-perform_autofil)
                  IN PROGRAM (<load_fields>-program_autofil)
                      USING <load_fields>-field
                    CHANGING <gs_line>
                            IF FOUND.
                ENDIF.
            ENDCASE.
          ENDLOOP.