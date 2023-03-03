*&---------------------------------------------------------------------*
*& Include          ZHVL_UI5_ONBELLEK_TEMIZLE_F01
*&---------------------------------------------------------------------*
FORM start_of_selection.
  SUBMIT /ui2/page_cache_reset AND RETURN .
  listeye_ekle '/ui2/page_cache_reset'.

  SUBMIT /ui2/nwbc_delete_menu_cache AND RETURN
                                     EXPORTING LIST TO MEMORY .
  listeye_ekle '/ui2/nwbc_delete_menu_cache'.

  SUBMIT /ui2/invalidate_global_caches AND RETURN
                                       WITH gv_test EQ abap_false
                                       WITH gv_exe EQ abap_true
                                       EXPORTING LIST TO MEMORY.
  listeye_ekle '/ui2/invalidate_global_caches'.

  SUBMIT /ui2/invalidate_client_caches AND RETURN
                                       EXPORTING LIST TO MEMORY.
  listeye_ekle '/ui2/invalidate_client_caches' .

  SUBMIT /ui2/delete_cache_after_imp AND RETURN
                                     EXPORTING LIST TO MEMORY.
  listeye_ekle '/ui2/delete_cache_after_imp'.

  SUBMIT /ui2/delete_cache AND RETURN
                           WITH  p_user EQ '*'
                           WITH p_allcli EQ abap_true
                           EXPORTING LIST TO MEMORY.
  listeye_ekle '/ui2/delete_cache'.

  SUBMIT /ui2/chip_synchronize_cache AND RETURN.
  listeye_ekle '/ui2/chip_synchronize_cache'.

  SUBMIT /ui5/reset_cachebuster AND RETURN.
  listeye_ekle '/ui5/reset_cachebuster'.

  IF p_mem EQ abap_true.
    FREE MEMORY.
    listeye_ekle 'FREE MEMORY'.
  ENDIF.

  IF lines( gt_return ) GT 0.
    zhvl_bc_cl_salv_table=>factory(
      EXPORTING
        iv_list_display = abap_true
        iv_title        = 'Bilgilendirme!'
        iv_popup_type   = zhvl_bc_if_salv_popup_type=>medium
      CHANGING
        ct_table        = gt_return
    ).
  ENDIF.
ENDFORM.
