*&---------------------------------------------------------------------*
*&      Form  selects
*&---------------------------------------------------------------------*
FORM db_selects.
  DATA lt_mseg TYPE TABLE OF mseg.


  SELECT *
    FROM mseg INTO TABLE lt_mseg.
  check sy-subrc eq 0.

" <no> <report> ABAP_NO_INITIAL_CHECK hhh2w0
  SELECT *
    FROM bseg
    INTO TABLE lt_bseg
    FOR ALL ENTRIES IN lt_bkpf
    WHERE bukrs = lt_bkpf-bukrs.
IF sy-subrc = 1.
  WRITE.
ENDIF.

*https://habrahabr.ru/post/262649/
  IF NOT lt_bkpf[] IS INITIAL.
" <no> <report> ABAP_NO_INITIAL_CHECK
    SELECT *
      FROM bseg
      INTO TABLE lt_bseg
      FOR ALL ENTRIES IN lt_bkpf
      WHERE augdt = lt_bkpf-budat.
  check sy-subrc eq 0.
  ENDIF.

  check not lt_bkpf[] is initial.
" <no> <report> ABAP_NO_INITIAL_CHECK hhh2w0
  SELECT *
      FROM bseg
      INTO TABLE lt_bseg
      FOR ALL ENTRIES IN lt_bkpf
      WHERE augdt = lt_bkpf-budat.
  check sy-subrc eq 0.

  IF lt_mat[] is not initial and lt_werks[] is not initial and gv_mat_get is initial.
" <no> <report> ABAP_NO_INITIAL_CHECK hhh2w0
      SELECT matnr, msehi, isocode, matkl
        FROM mara
        JOIN t006 on mara~meins eq t006~msehi
        INTO TABLE lt_mat
        FOR ALL ENTRIES IN lt_mat
        WHERE matnr eq lt_mat-matnr.
    check sy-subrc eq 0.
  ENDIF.
ENDFORM.